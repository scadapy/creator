/*
 *  cs101_slave.c
 *
 *  Copyright 2017 MZ Automation GmbH
 *
 *  This file is part of lib60870-C
 *
 *  lib60870-C is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  lib60870-C is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with lib60870-C.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  See COPYING file for the complete license text.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "cs101_slave.h"
#include "buffer_frame.h"
#include "lib_memory.h"
#include "apl_types_internal.h"
#include "iec60870_slave.h"
#include "lib60870_config.h"
#include "lib60870_internal.h"
#include "serial_transceiver_ft_1_2.h"
#include "link_layer.h"
#include "cs101_queue.h"
#include "cs101_asdu_internal.h"

#if (CONFIG_USE_THREADS == 1)
#include "hal_thread.h"
#endif

struct sCS101_Slave
{
    CS101_InterrogationHandler interrogationHandler;
    void* interrogationHandlerParameter;

    CS101_CounterInterrogationHandler counterInterrogationHandler;
    void* counterInterrogationHandlerParameter;

    CS101_ReadHandler readHandler;
    void* readHandlerParameter;

    CS101_ClockSynchronizationHandler clockSyncHandler;
    void* clockSyncHandlerParameter;

    CS101_ResetProcessHandler resetProcessHandler;
    void* resetProcessHandlerParameter;

    CS101_DelayAcquisitionHandler delayAcquisitionHandler;
    void* delayAcquisitionHandlerParameter;

    CS101_ASDUHandler asduHandler;
    void* asduHandlerParameter;

    CS101_ResetCUHandler resetCUHandler;
    void* resetCUHandlerParameter;

    SerialTransceiverFT12 transceiver;

    LinkLayerSecondaryUnbalanced unbalancedLinkLayer;
    LinkLayerBalanced balancedLinkLayer;

    struct sLinkLayerParameters linkLayerParameters;

    struct sCS101_AppLayerParameters alParameters;

    struct sCS101_Queue userDataClass1Queue;

    struct sCS101_Queue userDataClass2Queue;

    struct sIMasterConnection iMasterConnection;

    IEC60870_LinkLayerMode linkLayerMode;

#if (CONFIG_USE_THREADS == 1)
    bool isRunning;
    Thread workerThread;
#endif
};

static void
handleASDU(CS101_Slave self, CS101_ASDU asdu);



/********************************************
 * ISecondaryApplicationLayer
 ********************************************/

static bool
IsClass1DataAvailable (void* parameter)
{
    CS101_Slave self = (CS101_Slave) parameter;

    return (CS101_Queue_isEmpty(&(self->userDataClass1Queue)) == false);
}

static Frame
GetClass1Data (void* parameter, Frame frame)
{
    CS101_Slave self = (CS101_Slave) parameter;

    CS101_Queue_lock(&(self->userDataClass1Queue));

    Frame userData = CS101_Queue_dequeue(&(self->userDataClass1Queue), frame);

    CS101_Queue_unlock(&(self->userDataClass1Queue));

    return userData;
}

static Frame
GetClass2Data (void* parameter, Frame frame)
{
    CS101_Slave self = (CS101_Slave) parameter;

    CS101_Queue_lock(&(self->userDataClass2Queue));

    Frame userData = CS101_Queue_dequeue(&(self->userDataClass2Queue), frame);

    CS101_Queue_unlock(&(self->userDataClass2Queue));

    return userData;
}

static bool
HandleReceivedData (void* parameter, uint8_t* msg, bool isBroadcast, int userDataStart, int userDataLength)
{
    CS101_Slave self = (CS101_Slave) parameter;

    CS101_ASDU asdu = CS101_ASDU_createFromBuffer(&(self->alParameters), msg + userDataStart, userDataLength);

    handleASDU(self, asdu);

    CS101_ASDU_destroy(asdu);

    return true;
}

static void
ResetCUReceived (void* parameter, bool onlyFCB)
{
    CS101_Slave self = (CS101_Slave) parameter;

    if (onlyFCB) {
        DEBUG_PRINT("CS101 slave: Reset FCB received\n");

    }
    else {
        DEBUG_PRINT("CS101 slave: Reset CU received\n");

        if (self->resetCUHandler)
            self->resetCUHandler(self->resetCUHandlerParameter);

    }
}

static struct sISecondaryApplicationLayer cs101UnbalancedAppLayerInterface = {
        IsClass1DataAvailable,
        GetClass1Data,
        GetClass2Data,
        HandleReceivedData,
        ResetCUReceived
};

/********************************************
 * END ISecondaryApplicationLayer
 ********************************************/

/********************************************
 * IBalancedApplicationLayer
 ********************************************/
static bool
IsClass2DataAvailable (void* parameter)
{
    CS101_Slave self = (CS101_Slave) parameter;

    return (CS101_Queue_isEmpty(&(self->userDataClass2Queue)) == false);
}

static Frame
IBalancedApplicationLayer_GetUserData (void* parameter, Frame frame)
{
    if (IsClass1DataAvailable(parameter))
        return GetClass1Data(parameter, frame);
    else if (IsClass2DataAvailable(parameter))
        return GetClass2Data(parameter, frame);
    else
        return NULL;
}

static bool
IBalancedApplicationLayer_HandleReceivedData (void* parameter, uint8_t* msg, bool isBroadcast, int userDataStart, int userDataLength)
{
    return HandleReceivedData(parameter, msg, isBroadcast, userDataStart, userDataLength);
}

static struct sIBalancedApplicationLayer cs101BalancedAppLayerInterface = {
    IBalancedApplicationLayer_GetUserData,
    IBalancedApplicationLayer_HandleReceivedData
};

/********************************************
 * END IBalancedApplicationLayer
 ********************************************/

/********************************************
 * IMasterConnection
 *******************************************/

static void
sendASDU(IMasterConnection self, CS101_ASDU asdu)
{
    CS101_Slave slave = (CS101_Slave) self->object;

    CS101_Slave_enqueueUserDataClass1(slave, asdu);
}

static void
sendACT_CON(IMasterConnection self, CS101_ASDU asdu, bool negative)
{
    CS101_ASDU_setCOT(asdu, CS101_COT_ACTIVATION_CON);
    CS101_ASDU_setNegative(asdu, negative);

    sendASDU(self, asdu);
}

static void
sendACT_TERM(IMasterConnection self, CS101_ASDU asdu)
{
    CS101_ASDU_setCOT(asdu, CS101_COT_ACTIVATION_TERMINATION);
    CS101_ASDU_setNegative(asdu, false);

    sendASDU(self, asdu);
}

static CS101_AppLayerParameters
getApplicationLayerParameters(IMasterConnection self)
{
    CS101_Slave slave = (CS101_Slave) self->object;

    return &(slave->alParameters);
}

/********************************************
 * END IMasterConnection
 *******************************************/

static struct sCS101_AppLayerParameters defaultAppLayerParameters = {
    /* .sizeOfTypeId =  */ 1,
    /* .sizeOfVSQ = */ 1,
    /* .sizeOfCOT = */ 2,
    /* .originatorAddress = */ 0,
    /* .sizeOfCA = */ 2,
    /* .sizeOfIOA = */ 3,
    /* .maxSizeOfASDU = */ 249
};

CS101_Slave
CS101_Slave_create(SerialPort serialPort, LinkLayerParameters llParameters, CS101_AppLayerParameters alParameters, IEC60870_LinkLayerMode linkLayerMode)
{
    CS101_Slave self = (CS101_Slave) GLOBAL_MALLOC(sizeof(struct sCS101_Slave));

    if (self != NULL) {

        self->asduHandler = NULL;
        self->interrogationHandler = NULL;
        self->counterInterrogationHandler = NULL;
        self->readHandler = NULL;
        self->clockSyncHandler = NULL;
        self->resetProcessHandler = NULL;
        self->delayAcquisitionHandler = NULL;
        self->resetCUHandler = NULL;

#if (CONFIG_USE_THREADS == 1)
        self->isRunning = false;
        self->workerThread = NULL;
#endif

        if (llParameters)
            self->linkLayerParameters = *llParameters;
        else {
            self->linkLayerParameters.addressLength = 1;
            self->linkLayerParameters.timeoutForAck = 200;
            self->linkLayerParameters.timeoutRepeat = 1000;
            self->linkLayerParameters.useSingleCharACK = true;
        }

        if (alParameters)
            self->alParameters = *alParameters;
        else {
            self->alParameters = defaultAppLayerParameters;
        }

        self->transceiver = SerialTransceiverFT12_create(serialPort,  &(self->linkLayerParameters));

        self->linkLayerMode = linkLayerMode;

        if (linkLayerMode == IEC60870_LINK_LAYER_UNBALANCED) {

            self->balancedLinkLayer = NULL;

            self->unbalancedLinkLayer = LinkLayerSecondaryUnbalanced_create(0, self->transceiver,
                    &(self->linkLayerParameters),
                    &cs101UnbalancedAppLayerInterface, self);

        }
        else {

            self->unbalancedLinkLayer = NULL;

            self->balancedLinkLayer = LinkLayerBalanced_create(0, self->transceiver,
                    &(self->linkLayerParameters),
                    &cs101BalancedAppLayerInterface, self);

        }

        self->iMasterConnection.sendASDU = sendASDU;
        self->iMasterConnection.sendACT_CON = sendACT_CON;
        self->iMasterConnection.sendACT_TERM = sendACT_TERM;
        self->iMasterConnection.getApplicationLayerParameters = getApplicationLayerParameters;
        self->iMasterConnection.object = self;

        CS101_Queue_initialize(&(self->userDataClass1Queue), CS101_MAX_QUEUE_SIZE);
        CS101_Queue_initialize(&(self->userDataClass2Queue), CS101_MAX_QUEUE_SIZE);
    }

    return self;
}

void
CS101_Slave_destroy(CS101_Slave self)
{
    if (self != NULL) {

        if (self->unbalancedLinkLayer)
            LinkLayerSecondaryUnbalanced_destroy(self->unbalancedLinkLayer);

        if (self->balancedLinkLayer)
            LinkLayerBalanced_destroy(self->balancedLinkLayer);

        SerialTransceiverFT12_destroy(self->transceiver);

        CS101_Queue_dispose(&(self->userDataClass1Queue));
        CS101_Queue_dispose(&(self->userDataClass2Queue));

        GLOBAL_FREEMEM(self);
    }
}

void
CS101_Slave_setIdleTimeout(CS101_Slave self, int timeoutInMs)
{
    if (self->linkLayerMode == IEC60870_LINK_LAYER_UNBALANCED)
        LinkLayerSecondaryUnbalanced_setIdleTimeout(self->unbalancedLinkLayer, timeoutInMs);
    else
        LinkLayerBalanced_setIdleTimeout(self->balancedLinkLayer, timeoutInMs);
}

void
CS101_Slave_setLinkLayerStateChanged(CS101_Slave self, IEC60870_LinkLayerStateChangedHandler handler, void* parameter)
{
    if (self->linkLayerMode == IEC60870_LINK_LAYER_UNBALANCED) {
        LinkLayerSecondaryUnbalanced_setStateChangeHandler(self->unbalancedLinkLayer, handler, parameter);
    }
    else {
        LinkLayerBalanced_setStateChangeHandler(self->balancedLinkLayer, handler, parameter);
    }
}

void
CS101_Slave_setLinkLayerAddress(CS101_Slave self, int address)
{
    if (self->linkLayerMode == IEC60870_LINK_LAYER_UNBALANCED)
        LinkLayerSecondaryUnbalanced_setAddress(self->unbalancedLinkLayer, address);
    else
        LinkLayerBalanced_setAddress(self->balancedLinkLayer, address);
}

void
CS101_Slave_setLinkLayerAddressOtherStation(CS101_Slave self, int address)
{
    if (self->balancedLinkLayer)
        LinkLayerBalanced_setOtherStationAddress(self->balancedLinkLayer, address);
}

bool
CS101_Slave_isClass1QueueFull(CS101_Slave self)
{
    return CS101_Queue_isFull(&(self->userDataClass1Queue));
}

void
CS101_Slave_enqueueUserDataClass1(CS101_Slave self, CS101_ASDU asdu)
{
    CS101_Queue_enqueue(&(self->userDataClass1Queue), asdu);
}


bool
CS101_Slave_isClass2QueueFull(CS101_Slave self)
{
    return CS101_Queue_isFull(&(self->userDataClass2Queue));
}

void
CS101_Slave_enqueueUserDataClass2(CS101_Slave self, CS101_ASDU asdu)
{
    CS101_Queue_enqueue(&(self->userDataClass2Queue), asdu);
}

void
CS101_Slave_flushQueues(CS101_Slave self)
{
    CS101_Queue_flush(&(self->userDataClass1Queue));
    CS101_Queue_flush(&(self->userDataClass2Queue));
}

void
CS101_Slave_run(CS101_Slave self)
{

    if (self->unbalancedLinkLayer)
        LinkLayerSecondaryUnbalanced_run(self->unbalancedLinkLayer);
    else
        LinkLayerBalanced_run(self->balancedLinkLayer);

    //TODO handle file transmission
}

#if (CONFIG_USE_THREADS == 1)
static void*
slaveMainThread(void* parameter)
{
    CS101_Slave self = (CS101_Slave) parameter;

    self->isRunning = true;

    while (self->isRunning) {
        CS101_Slave_run(self);
    }

    return NULL;
}
#endif /* (CONFIG_USE_THREADS == 1) */

void
CS101_Slave_start(CS101_Slave self)
{
#if (CONFIG_USE_THREADS == 1)
    if (self->workerThread == NULL) {
        self->workerThread = Thread_create(slaveMainThread, self, false);
        Thread_start(self->workerThread);
    }
#endif /* (CONFIG_USE_THREADS == 1) */
}

void
CS101_Slave_stop(CS101_Slave self)
{
#if (CONFIG_USE_THREADS == 1)
    if (self->isRunning) {
        self->isRunning = false;
        Thread_destroy(self->workerThread);
        self->workerThread = NULL;
    }
#endif /* (CONFIG_USE_THREADS == 1) */
}



CS101_AppLayerParameters
CS101_Slave_getAppLayerParameters(CS101_Slave self)
{
    return &(self->alParameters);
}

LinkLayerParameters
CS101_Slave_getLinkLayerParameters(CS101_Slave self)
{
    return &(self->linkLayerParameters);
}

void
CS101_Slave_setResetCUHandler(CS101_Slave self, CS101_ResetCUHandler handler, void* parameter)
{
    self->resetCUHandler = handler;
    self->resetCUHandlerParameter = parameter;
}

void
CS101_Slave_setInterrogationHandler(CS101_Slave self, CS101_InterrogationHandler handler, void*  parameter)
{
    self->interrogationHandler = handler;
    self->interrogationHandlerParameter = parameter;
}

void
CS101_Slave_setCounterInterrogationHandler(CS101_Slave self, CS101_CounterInterrogationHandler handler, void*  parameter)
{
    self->counterInterrogationHandler = handler;
    self->counterInterrogationHandlerParameter = parameter;
}

void
CS101_Slave_setReadHandler(CS101_Slave self, CS101_ReadHandler handler, void* parameter)
{
    self->readHandler = handler;
    self->readHandlerParameter = parameter;
}

void
CS101_Slave_setASDUHandler(CS101_Slave self, CS101_ASDUHandler handler, void* parameter)
{
    self->asduHandler = handler;
    self->asduHandlerParameter = parameter;
}

void
CS101_Slave_setClockSyncHandler(CS101_Slave self, CS101_ClockSynchronizationHandler handler, void* parameter)
{
    self->clockSyncHandler = handler;
    self->clockSyncHandlerParameter = parameter;
}

void
CS101_Slave_setResetProcessHandler(CS101_Slave self, CS101_ResetProcessHandler handler, void* parameter)
{
    self->resetProcessHandler = handler;
    self->resetProcessHandlerParameter = parameter;
}

void
CS101_Slave_setDelayAcquisitionHandler(CS101_Slave self, CS101_DelayAcquisitionHandler handler, void* parameter)
{
    self->delayAcquisitionHandler = handler;
    self->delayAcquisitionHandlerParameter = parameter;
}

static void
responseCOTUnknown(CS101_ASDU asdu, IMasterConnection self)
{
    DEBUG_PRINT("  with unknown COT\n");
    CS101_ASDU_setCOT(asdu, CS101_COT_UNKNOWN_COT);
    sendASDU(self, asdu);
}


/*
 * Handle received ASDUs
 *
 * Call the appropriate callbacks according to ASDU type and CoT
 */
static void
handleASDU(CS101_Slave self, CS101_ASDU asdu)
{
    bool messageHandled = false;

    uint8_t cot = CS101_ASDU_getCOT(asdu);

    switch (CS101_ASDU_getTypeID(asdu)) {

    case C_IC_NA_1: /* 100 - interrogation command */

        DEBUG_PRINT("Rcvd interrogation command C_IC_NA_1\n");

        if ((cot == CS101_COT_ACTIVATION) || (cot == CS101_COT_DEACTIVATION)) {
            if (self->interrogationHandler != NULL) {

                InterrogationCommand irc = (InterrogationCommand) CS101_ASDU_getElement(asdu, 0);

                if (self->interrogationHandler(self->interrogationHandlerParameter,
                        &(self->iMasterConnection), asdu, InterrogationCommand_getQOI(irc)))
                    messageHandled = true;

                InterrogationCommand_destroy(irc);
            }
        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;

    case C_CI_NA_1: /* 101 - counter interrogation command */

        DEBUG_PRINT("Rcvd counter interrogation command C_CI_NA_1\n");

        if ((cot == CS101_COT_ACTIVATION) || (cot == CS101_COT_DEACTIVATION)) {

            if (self->counterInterrogationHandler != NULL) {

                CounterInterrogationCommand cic = (CounterInterrogationCommand) CS101_ASDU_getElement(asdu, 0);


                if (self->counterInterrogationHandler(self->counterInterrogationHandlerParameter,
                        &(self->iMasterConnection), asdu, CounterInterrogationCommand_getQCC(cic)))
                    messageHandled = true;

                CounterInterrogationCommand_destroy(cic);
            }
        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;

    case C_RD_NA_1: /* 102 - read command */

        DEBUG_PRINT("Rcvd read command C_RD_NA_1\n");

        if (cot == CS101_COT_REQUEST) {
            if (self->readHandler != NULL) {
                ReadCommand rc = (ReadCommand) CS101_ASDU_getElement(asdu, 0);

                if (self->readHandler(self->readHandlerParameter,
                        &(self->iMasterConnection), asdu, InformationObject_getObjectAddress((InformationObject) rc)))
                    messageHandled = true;

                ReadCommand_destroy(rc);
            }
        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;

    case C_CS_NA_1: /* 103 - Clock synchronization command */

        DEBUG_PRINT("Rcvd clock sync command C_CS_NA_1\n");

        if (cot == CS101_COT_ACTIVATION) {

            if (self->clockSyncHandler != NULL) {

                ClockSynchronizationCommand csc = (ClockSynchronizationCommand) CS101_ASDU_getElement(asdu, 0);

                if (self->clockSyncHandler(self->clockSyncHandlerParameter,
                        &(self->iMasterConnection), asdu, ClockSynchronizationCommand_getTime(csc)))
                    messageHandled = true;

                ClockSynchronizationCommand_destroy(csc);
            }
        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;

    case C_TS_NA_1: /* 104 - test command */

        DEBUG_PRINT("Rcvd test command C_TS_NA_1\n");

        if (cot != CS101_COT_ACTIVATION)
            CS101_ASDU_setCOT(asdu, CS101_COT_UNKNOWN_COT);
        else
            CS101_ASDU_setCOT(asdu, CS101_COT_ACTIVATION_CON);

        CS101_Slave_enqueueUserDataClass1(self, asdu);

        messageHandled = true;

        break;

    case C_RP_NA_1: /* 105 - Reset process command */

        DEBUG_PRINT("Rcvd reset process command C_RP_NA_1\n");

        if (cot == CS101_COT_ACTIVATION) {

            if (self->resetProcessHandler != NULL) {
                ResetProcessCommand rpc = (ResetProcessCommand) CS101_ASDU_getElement(asdu, 0);

                if (self->resetProcessHandler(self->resetProcessHandlerParameter,
                        &(self->iMasterConnection), asdu, ResetProcessCommand_getQRP(rpc)))
                    messageHandled = true;

                ResetProcessCommand_destroy(rpc);
            }

        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;

    case C_CD_NA_1: /* 106 - Delay acquisition command */

        DEBUG_PRINT("Rcvd delay acquisition command C_CD_NA_1\n");

        if ((cot == CS101_COT_ACTIVATION) || (cot == CS101_COT_SPONTANEOUS)) {

            if (self->delayAcquisitionHandler != NULL) {
                DelayAcquisitionCommand dac = (DelayAcquisitionCommand) CS101_ASDU_getElement(asdu, 0);

                if (self->delayAcquisitionHandler(self->delayAcquisitionHandlerParameter,
                        &(self->iMasterConnection), asdu, DelayAcquisitionCommand_getDelay(dac)))
                    messageHandled = true;

                DelayAcquisitionCommand_destroy(dac);
            }
        }
        else
            responseCOTUnknown(asdu, &(self->iMasterConnection));

        break;


    default: /* no special handler available -> use default handler */
        break;
    }

    if ((messageHandled == false) && (self->asduHandler != NULL))
        if (self->asduHandler(self->asduHandlerParameter, &(self->iMasterConnection), asdu))
            messageHandled = true;

    if (messageHandled == false) {
        /* send error response */
        CS101_ASDU_setCOT(asdu, CS101_COT_UNKNOWN_TYPE_ID);
        CS101_Slave_enqueueUserDataClass1(self, asdu);
    }
}



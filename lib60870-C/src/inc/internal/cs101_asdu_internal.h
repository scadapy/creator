/*
 *  Copyright 2016, 2017 MZ Automation GmbH
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


#ifndef SRC_INC_INTERNAL_CS101_ASDU_INTERNAL_H_
#define SRC_INC_INTERNAL_CS101_ASDU_INTERNAL_H_

#include <stdbool.h>
#include <stdint.h>

#include "iec60870_common.h"
#include "information_objects_internal.h"
#include "apl_types_internal.h"
#include "lib_memory.h"
#include "lib60870_internal.h"

struct sCS101_ASDU {
    bool stackCreated;
    CS101_AppLayerParameters parameters;
    uint8_t* asdu;
    int asduHeaderLength;
    uint8_t* payload;
    int payloadSize;
};

typedef struct sCS101_StaticASDU* CS101_StaticASDU;

struct sCS101_StaticASDU {
    bool stackCreated;
    CS101_AppLayerParameters parameters;
    uint8_t* asdu;
    int asduHeaderLength;
    uint8_t* payload;
    int payloadSize;
    uint8_t encodedData[256];
};

/**
 * \brief create a new (read-only) instance
 *
 * NOTE: Do not try to append information objects to the instance!
 */
CS101_ASDU
CS101_ASDU_createFromBuffer(CS101_AppLayerParameters parameters, uint8_t* msg, int msgLength);

CS101_ASDU
CS101_ASDU_initializeStatic(CS101_StaticASDU self, CS101_AppLayerParameters parameters, bool isSequence, CS101_CauseOfTransmission cot, int oa, int ca,
        bool isTest, bool isNegative);

bool
CS101_ASDU_isStackCreated(CS101_ASDU self);

#endif /* SRC_INC_INTERNAL_CS101_ASDU_INTERNAL_H_ */

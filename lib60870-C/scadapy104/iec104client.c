#include "cs104_connection.h"
#include "hal_time.h"
#include "hal_thread.h"
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include "parson.h"
#include <malloc.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <time.h>

#define MAX_VALUE_ARRAY 100
/* connection*/
int conState=0;
/*singlepoint*/
int      countOfSinglePoint;
int     *SinglePointValue;
int     *SinglePointAddress;
char*    SinglePointVarname[MAX_VALUE_ARRAY];
char*    SinglePointVarType[MAX_VALUE_ARRAY];
char*    SinglePointAlias[MAX_VALUE_ARRAY];

/*set measureValue */
int      countOfMeasureValue;
float   *MeasureValue;
int     *MeasureAddress;
char*    MeasureVarname[MAX_VALUE_ARRAY];
char*    MeasureAlias[MAX_VALUE_ARRAY];
char*    MeasureVarType[MAX_VALUE_ARRAY];
/*udp iec settings*/
char*     UdpIp[2];
char*     IecIp[2];
int UdpPort,iecPort,DebugMode,TimeSync;
/*time*/
long int s_time;
struct tm *m_time;
char str_t[128]="";
struct sCP56Time2a newTime;
/*udp*/
int ssock;
int broadcastEnable;
int ret;
struct sockaddr_in broadcastAddr; 
char request[100];


static void connectionHandler (void* parameter, CS104_Connection connection, CS104_ConnectionEvent event)
{
    switch (event) {
     case CS104_CONNECTION_OPENED:
        printf("Connection established\n");
        conState=1;

        break;
     case CS104_CONNECTION_CLOSED:
        printf("Connection closed\n");
        conState=0;
        break;
     case CS104_CONNECTION_STARTDT_CON_RECEIVED:
      printf("Received STARTDT_CON\n");
       conState=1;

      break;
     case CS104_CONNECTION_STOPDT_CON_RECEIVED:
      printf("Received STOPDT_CON\n");
        conState=1;

           break;
    }
}
static bool asduReceivedHandler (void* parameter, int address, CS101_ASDU asdu)
{
     int i,z;
     
     ssock=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
     broadcastEnable=1;
     ret=setsockopt(ssock, SOL_SOCKET, SO_BROADCAST, &broadcastEnable, sizeof(broadcastEnable));
     memset(&broadcastAddr, 0, sizeof broadcastAddr);
     broadcastAddr.sin_family = AF_INET;
     inet_pton(AF_INET, UdpIp[0], &broadcastAddr.sin_addr); 
     broadcastAddr.sin_port = htons(UdpPort);
     /* printf("REC type: %s(%i) elements: %i\n",
            TypeID_toString(CS101_ASDU_getTypeID(asdu)),
            CS101_ASDU_getTypeID(asdu),
            CS101_ASDU_getNumberOfElements(asdu));
     */
     
/*  M_ME_NC_1 (13)  M_ME_TF_1 (36)*/
     if (CS101_ASDU_getTypeID(asdu) ==  M_ME_TF_1 || CS101_ASDU_getTypeID(asdu) == M_ME_NC_1)
    {
         i=0;
         for (i = 0; i < CS101_ASDU_getNumberOfElements(asdu); i++)
        {
            z=0;
             MeasuredValueShortWithCP56Time2a io = (MeasuredValueShortWithCP56Time2a) CS101_ASDU_getElement(asdu, i);   
            //  printf("Adr:%i val: %i\n", InformationObject_getObjectAddress((InformationObject) io), MeasuredValueScaled_getValue((MeasuredValueScaled) io));          
             for(z = 0; z < countOfMeasureValue;z++)
            {
                 if(MeasureAddress[z] == InformationObject_getObjectAddress((InformationObject) io))
                 {
                     sprintf(request,"{\"name\":\"%s\",\"data\":[%f]}",
                             MeasureVarname[z],
                             MeasuredValueShort_getValue((MeasuredValueShort) io));
                     sendto(ssock, request, strlen(request), 0, (struct sockaddr*)&broadcastAddr, sizeof broadcastAddr);                       
                     if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         printf("%s Var:%15s Type:%5s Alias:%15s Adr:%i val: %f %s(%i)\n",str_t, MeasureVarname[z],MeasureVarType[z],MeasureAlias[z],
                                             InformationObject_getObjectAddress((InformationObject) io),
                                             MeasuredValueShort_getValue((MeasuredValueShort) io),
                                             TypeID_toString(CS101_ASDU_getTypeID(asdu)),CS101_ASDU_getTypeID(asdu));
                    }
                 }
            }
             MeasuredValueShortWithCP56Time2a_destroy(io);   
        }
    }
/*M_ME_NB_1: type 11  Scaled*/
     else if (CS101_ASDU_getTypeID(asdu) ==  M_ME_NB_1)
    {
         i=0;
         for (i = 0; i < CS101_ASDU_getNumberOfElements(asdu); i++)
        {
            MeasuredValueScaledWithCP56Time2a io = (MeasuredValueScaledWithCP56Time2a) CS101_ASDU_getElement(asdu, i);
             for(z = 0; z < countOfMeasureValue;z++)
            {
                 if(MeasureAddress[z] == InformationObject_getObjectAddress((InformationObject) io) )
                {
                     sprintf(request,"{\"name\":\"%s\",\"data\":[%i]}",
                             MeasureVarname[z],
                             MeasuredValueScaled_getValue((MeasuredValueScaled) io) );
                     sendto(ssock, request, strlen(request), 0, (struct sockaddr*)&broadcastAddr, sizeof broadcastAddr);                        
                     if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         printf("%s Var:%15s Type:%5s Alias:%15s Adr:%i val: %i %s(%i)\n",str_t, MeasureVarname[z],MeasureVarType[z],MeasureAlias[z],
                                      InformationObject_getObjectAddress((InformationObject) io),
                                      MeasuredValueScaled_getValue((MeasuredValueScaled) io),
                                      TypeID_toString(CS101_ASDU_getTypeID(asdu)),CS101_ASDU_getTypeID(asdu));
                    }
                }                     
            }
            MeasuredValueScaledWithCP56Time2a_destroy(io);
        }
    }
/*M_SP_NA_1 <1>  M_SP_TB_1 <30> */
    else if (CS101_ASDU_getTypeID(asdu) == M_SP_TB_1 || CS101_ASDU_getTypeID(asdu)==M_SP_NA_1)
    {
         i=0;
         for (i = 0; i < CS101_ASDU_getNumberOfElements(asdu); i++)
        {
             SinglePointInformation io = (SinglePointInformation) CS101_ASDU_getElement(asdu, i);
             for(z = 0; z < countOfSinglePoint;z++)
            {            
                 if(SinglePointAddress[z] == InformationObject_getObjectAddress((InformationObject) io) )
                {   
                     sprintf(request,"{\"name\":\"%s\",\"data\":[%i]}",
                             SinglePointVarname[z],
                             SinglePointInformation_getValue((SinglePointInformation) io) );
                     sendto(ssock, request, strlen(request), 0, (struct sockaddr*)&broadcastAddr, sizeof broadcastAddr);                        

                    if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         printf("%s Var:%15s Type:%5s Alias:%15s Adr:%i val: %i %s(%i)\n",str_t, SinglePointVarname[z],SinglePointVarType[z],SinglePointAlias[z],
                                     InformationObject_getObjectAddress((InformationObject) io),
                                     SinglePointInformation_getValue((SinglePointInformation) io),
                                     TypeID_toString(CS101_ASDU_getTypeID(asdu)),CS101_ASDU_getTypeID(asdu));
                    
                    }
                }
            }
            SinglePointInformation_destroy(io);
        }
    }
     close(ssock);
     return true;
}
void LoadJsonFile(char *jfile)
{
     JSON_Value *root_value;
     JSON_Array *jArray;
     JSON_Object *jObj;
     int CountArrayJsonFile,i;
     root_value = json_parse_file(jfile);
     jArray = json_value_get_array(root_value);
     CountArrayJsonFile=json_array_get_count(jArray);
/* set SinglePoint */
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "SinglePoint.IecAddress")!=NULL)
        {
            countOfSinglePoint=countOfSinglePoint+1;
        }
    }
     SinglePointAddress      = (int *)malloc( countOfSinglePoint*sizeof(int) );
     SinglePointValue        = (int *)malloc( countOfSinglePoint*sizeof(int) );
     printf("\nLoaded File:             %s\n",jfile);        
     int ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "Client.UdpPort")!=NULL)
        {
         printf("Client UDP Port:         %s\n",json_object_dotget_string(jObj, "Client.UdpPort"));
         printf("Client UDP IP  :         %s\n",json_object_dotget_string(jObj, "Client.UdpIp"));
         printf("Client Iec Port:         %s\n",json_object_dotget_string(jObj, "Client.Iec104Port"));
         printf("Client Iec IP  :         %s\n",json_object_dotget_string(jObj, "Client.Iec104Ip"));
         printf("Client Debug   :         %s\n",json_object_dotget_string(jObj, "Client.Debug"));
         printf("Client TimeSync:         %s\n",json_object_dotget_string(jObj, "Client.TimeSync"));
         UdpIp[0]    =json_object_dotget_string(jObj, "Client.UdpIp");
         IecIp[0]    =json_object_dotget_string(jObj, "Client.Iec104Ip");
         UdpPort  =atoi(json_object_dotget_string(jObj, "Client.UdpPort"));
         iecPort  =atoi(json_object_dotget_string(jObj, "Client.Iec104Port"));
         DebugMode=atoi(json_object_dotget_string(jObj, "Client.Debug"));
         TimeSync=atoi(json_object_dotget_string(jObj, "Client.TimeSync"));
        }
    }
    
     printf("\nCount Singlepoints:      %d\n",countOfSinglePoint);   
     ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "SinglePoint.IecAddress")!=NULL)
        {
             printf("Variables SinglePoint:   %s:%s:%s:%s\n",
               json_object_dotget_string(jObj, "SinglePoint.VarName"),
               json_object_dotget_string(jObj, "SinglePoint.IecAddress"),
               json_object_dotget_string(jObj, "SinglePoint.Alias"),
               json_object_dotget_string(jObj, "SinglePoint.VarType"));
             SinglePointVarname[ii]     =json_object_dotget_string(jObj, "SinglePoint.VarName");
             SinglePointVarType[ii]     =json_object_dotget_string(jObj, "SinglePoint.VarType");
             SinglePointAddress[ii]     =atoi(json_object_dotget_string(jObj, "SinglePoint.IecAddress"));
             SinglePointAlias[ii]       =json_object_dotget_string(jObj, "SinglePoint.Alias");
             ii=ii+1;
        }
    }
/* mesure values*/
      for (i = 0; i < json_array_get_count(jArray); i++)
    {
        jObj = json_array_get_object(jArray, i);
        if(json_object_dotget_string(jObj, "MeasureValue.IecAddress")!=NULL)
        {
            countOfMeasureValue=countOfMeasureValue+1;
        }
    }
     printf("Count MeasuredValue:     %d\n",countOfMeasureValue);
     MeasureAddress      =(int *)malloc( countOfMeasureValue*sizeof(int) );
     MeasureValue        =(float *)malloc( countOfMeasureValue*sizeof(float) );

     ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "MeasureValue.VarName")!=NULL)
        {
         printf("Variables MeasuredValue: %s:%s:%s:%s\n",
               json_object_dotget_string(jObj, "MeasureValue.VarName"),
               json_object_dotget_string(jObj, "MeasureValue.IecAddress"),
               json_object_dotget_string(jObj, "MeasureValue.Alias"),
               json_object_dotget_string(jObj, "MeasureValue.VarType"));
         MeasureVarname[ii]     =json_object_dotget_string(jObj, "MeasureValue.VarName");
         MeasureAlias[ii]       =json_object_dotget_string(jObj, "MeasureValue.Alias");
         MeasureAddress[ii]     =atoi(json_object_dotget_string(jObj, "MeasureValue.IecAddress"));
         MeasureVarType[ii]     =json_object_dotget_string(jObj, "MeasureValue.VarType");
         //MeasureValue[ii]       =0;
         ii=ii+1;
        }
    }
}



int main(int argc, char** argv)
{
     const char* ip;
     uint16_t port;

     if(argc <= 1)
         {
           printf("\nStart client iec104:          v.2.9\n");     

           puts("\nUse syntax : client104.exe file.json\n"
         "==Json file structure like this:==\n"
         "[\n"
         " { \"Client\":\n"
         "     { \"UdpPort\"   :\"64002\",\n"
         "       \"UdpIp\"     :\"0.0.0.0\",\n"
         "       \"Iec104Port\":\"2402\",\n"
         "       \"Iec104Ip\"  :\"127.0.0.1\",\n"
         "       \"Debug\"     :\"1\",\n"
         "       \"TimeSync\"  :\"1\"\n"
         "     }\n"
         " },\n"
         " {\n"
         "  \"SinglePoint\":\n"
         "    {\n "
         "     \"VarType\":\"bool\",\n"
         "     \"VarName\":\"Discret\",\n"
         "     \"IecAddress\":\"101\",\n"
         "     \"Alias\":\"SomeNameOfSignal\"\n"
         "    }\n"
         " },\n"
         " {\n"
         "  \"MeasureValue\":\n"
         "    { \n"
         "     \"VarType\":\"int32(float or int)\",\n"
         "     \"VarName\":\"Analog\",\n"
         "     \"IecAddress\":\"101\",\n"
         "     \"Alias\":\"SomeNameOfSignal\"\n"
         "    }\n"
         " }\n"
         "]\n"
         "==UDP packet to send structure:==\n"
         "{ \"name\":\"VarName\",\"data\":[123] }\n");
         goto exit_program;
        }
         else
        {
             LoadJsonFile(argv[1]);
             ip=IecIp[0];        
             port=iecPort;
        }

     if(DebugMode==1) printf("\nStart client iec104:          v.2.9\n");     

TRY_CONNECT:
     if(DebugMode==1) printf("\nConnecting to: %s:%i\n", ip, port);
     CS104_Connection con = CS104_Connection_create(ip, port);
     CS104_Connection_setConnectionHandler(con, connectionHandler, NULL);
     CS104_Connection_setASDUReceivedHandler(con, asduReceivedHandler, NULL);

     if (CS104_Connection_connect(con))
    {
         if(DebugMode==1) printf("Connected!\n");
         CS104_Connection_sendStartDT(con);
         Thread_sleep(5000);
         if(DebugMode==1) printf("Send Interrogation Command\n");
         CS104_Connection_sendInterrogationCommand(con, CS101_COT_ACTIVATION, 1, IEC60870_QOI_STATION);
         Thread_sleep(5000);
         while(1)
        {
             if(conState==0)
            {
                 if(DebugMode==1) printf("Try to connect 1\n");
                 goto TRY_CONNECT;
            }
         CP56Time2a_createFromMsTimestamp(&newTime, Hal_getTimeInMs());
         if(DebugMode==1 & TimeSync==1)  printf("tsync-->\n");
         if(TimeSync==1)   CS104_Connection_sendClockSyncCommand(con, 1, &newTime);
         Thread_sleep(1000);
        }
     Thread_sleep(1000);
    }
     else
    {
         if(DebugMode==1) printf("Try to connect 2\n");
         goto TRY_CONNECT;
     }
    Thread_sleep(1000);
    CS104_Connection_destroy(con);
    printf("exit\n");
exit_program:
     exit(0);   
    
}



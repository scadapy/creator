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
#include <ncurses.h>

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
/*window*/
WINDOW *win;
int row,col,ist;

static void connectionHandler (void* parameter, CS104_Connection connection, CS104_ConnectionEvent event)
{
    switch (event) {
     case CS104_CONNECTION_OPENED:
     //   printf("Connection established\n");
        conState=1;

        break;
     case CS104_CONNECTION_CLOSED:
      //  printf("Connection closed\n");
        conState=0;
        break;
     case CS104_CONNECTION_STARTDT_CON_RECEIVED:
   //   printf("Received STARTDT_CON\n");
       conState=1;

      break;
     case CS104_CONNECTION_STOPDT_CON_RECEIVED:
   //   printf("Received STOPDT_CON\n");
        conState=1;

           break;
    }
}
static bool asduReceivedHandler (void* parameter, int address, CS101_ASDU asdu)
{
     int i,z;
/*  M_ME_NC_1: type 13  Short*/
     if (CS101_ASDU_getTypeID(asdu) ==  M_ME_NC_1)
    {
         i=0;
         for (i = 0; i < CS101_ASDU_getNumberOfElements(asdu); i++)
        {
            z=0;
             MeasuredValueShortWithCP56Time2a io = (MeasuredValueShortWithCP56Time2a) CS101_ASDU_getElement(asdu, i);             
             for(z = 0; z < countOfMeasureValue;z++)
            {
                 if(MeasureAddress[z] == InformationObject_getObjectAddress((InformationObject) io))
                 {
                     if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         wattroff(win,A_REVERSE);
                         mvwprintw(win,z+2,60, "%s:%15s %i=%f     ",str_t,MeasureAlias[z],
                                             InformationObject_getObjectAddress((InformationObject) io),
                                             MeasuredValueShort_getValue((MeasuredValueShort) io));
                         wrefresh(win);                   
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
                 if(MeasureAddress[z] == InformationObject_getObjectAddress((InformationObject) io))
                {
                     if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         wattroff(win,A_REVERSE);
                         mvwprintw(win,z+2,60, "%s:%15s %i=%i     ", str_t, MeasureAlias[z],
                                     InformationObject_getObjectAddress((InformationObject) io),
                                     MeasuredValueScaled_getValue((MeasuredValueScaled) io));
                         wrefresh(win);
                    }
                }                     
            }
            MeasuredValueScaledWithCP56Time2a_destroy(io);
        }
    }
/*M_SP_NA_1: type 1 */
    else if (CS101_ASDU_getTypeID(asdu) == M_SP_NA_1)
    {
         i=0;
         for (i = 0; i < CS101_ASDU_getNumberOfElements(asdu); i++)
        {
             SinglePointInformation io = (SinglePointInformation) CS101_ASDU_getElement(asdu, i);
             for(z = 0; z < countOfSinglePoint;z++)
            {            
                 if(SinglePointAddress[z] == InformationObject_getObjectAddress((InformationObject) io) )
                {   
                     if(DebugMode==1)
                    {
                         s_time = time (NULL);
                         m_time  = localtime (&s_time);
                         strftime (str_t, 128, "%d-%m-%Y %X", m_time);
                         if( SinglePointInformation_getValue((SinglePointInformation) io) == 0) wattron(win,A_REVERSE);
                         else wattroff(win,A_REVERSE);
                         mvwprintw(win,z+2,1, "%2i)%s:%10s %i=%i",z,str_t,SinglePointAlias[z],
                                       InformationObject_getObjectAddress((InformationObject) io),
                                       SinglePointInformation_getValue((SinglePointInformation) io));
                         wrefresh(win);
                    }
                }
            }
            SinglePointInformation_destroy(io);
        }
    }
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
     int ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "Client.UdpPort")!=NULL)
        {
         UdpIp[0]    =json_object_dotget_string(jObj, "Client.UdpIp");
         IecIp[0]    =json_object_dotget_string(jObj, "Client.Iec104Ip");
         UdpPort  =atoi(json_object_dotget_string(jObj, "Client.UdpPort"));
         iecPort  =atoi(json_object_dotget_string(jObj, "Client.Iec104Port"));
         DebugMode=atoi(json_object_dotget_string(jObj, "Client.Debug"));
         TimeSync=atoi(json_object_dotget_string(jObj, "Client.TimeSync"));
        }
    }
     ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "SinglePoint.IecAddress")!=NULL)
        {
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
     MeasureAddress      =(int *)malloc( countOfMeasureValue*sizeof(int) );
     MeasureValue        =(float *)malloc( countOfMeasureValue*sizeof(float) );

     ii=0;
     for (i = 0; i < json_array_get_count(jArray); i++)
    {
         jObj = json_array_get_object(jArray, i);
         if(json_object_dotget_string(jObj, "MeasureValue.VarName")!=NULL)
        {
         MeasureVarname[ii]     =json_object_dotget_string(jObj, "MeasureValue.VarName");
         MeasureAlias[ii]       =json_object_dotget_string(jObj, "MeasureValue.Alias");
         MeasureAddress[ii]     =atoi(json_object_dotget_string(jObj, "MeasureValue.IecAddress"));
         MeasureVarType[ii]     =json_object_dotget_string(jObj, "MeasureValue.VarType");
         ii=ii+1;
        }
    }
}



int main(int argc, char** argv)
{
     const char* ip;
     int cvar=0;
     uint16_t port;
     if(argc <= 1)
         {
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
         initscr();
         getmaxyx(stdscr,row,col);
         cbreak();
         refresh();
         win = newwin(row, col, 0, 0);
         box(win, 0, 0);
         mvwprintw(win, 0,(col/2)-20, "Client programm iec 60870-5-104 v2.8 ");
         wrefresh(win);
TRY_CONNECT:

     start_color();
//     init_pair(0,COLOR_BLACK,COLOR_RED);
//     init_pair(1,COLOR_RED,COLOR_BLACK);
        init_pair(1,  COLOR_RED,     COLOR_BLACK);
        init_pair(2,  COLOR_GREEN,   COLOR_BLACK);
        init_pair(3,  COLOR_YELLOW,  COLOR_BLACK);
        init_pair(4,  COLOR_BLUE,    COLOR_BLACK);
        init_pair(5,  COLOR_MAGENTA, COLOR_BLACK);
        init_pair(6,  COLOR_CYAN,    COLOR_BLACK);
        init_pair(7,  COLOR_BLUE,    COLOR_WHITE);
        init_pair(8,  COLOR_WHITE,   COLOR_RED);
        init_pair(9,  COLOR_BLACK,   COLOR_GREEN);
        init_pair(10, COLOR_BLUE,    COLOR_YELLOW);
        init_pair(11, COLOR_WHITE,   COLOR_BLUE);
        init_pair(12, COLOR_WHITE,   COLOR_MAGENTA);
        init_pair(13, COLOR_BLACK,   COLOR_CYAN);     
     
              
     mvwprintw(win,row -2,1, "Connecting to: %s:%i", ip, port);
     wrefresh(win);
     CS104_Connection con = CS104_Connection_create(ip, port);
     CS104_Connection_setConnectionHandler(con, connectionHandler, NULL);
     CS104_Connection_setASDUReceivedHandler(con, asduReceivedHandler, NULL);

     if (CS104_Connection_connect(con))
    {
         CS104_Connection_sendStartDT(con);
         if(DebugMode==1)   mvwprintw(win,row-2,1, "Send Interrogation Command                                  "); 
         CS104_Connection_sendInterrogationCommand(con, CS101_COT_ACTIVATION, 1, IEC60870_QOI_STATION);
         while(1)
        {
             wattroff(win,A_REVERSE);
             mvwprintw(win,row-2,1, "Connected!                                                             "); 
             wrefresh(win);
            
             if(conState==0)
            {
                 mvwprintw(win,row-2,35, "Try to connect in while ");
                 //wrefresh(win);
                 goto TRY_CONNECT;
            }
         CP56Time2a_createFromMsTimestamp(&newTime, Hal_getTimeInMs());
         if(TimeSync==1)   CS104_Connection_sendClockSyncCommand(con, 1, &newTime);
         Thread_sleep(1000);
        }
     Thread_sleep(1000);
    }
     else
    {
         if(cvar==0)
        { 
             wattron(win,COLOR_PAIR(1));
             mvwprintw(win,row-2,35, "Try to connect to server iec 104 "); 
             wattroff(win,COLOR_PAIR(1));  
             wrefresh(win);      
             cvar=1;
        }
         else
        { 
             wattron(win,COLOR_PAIR(8));
             mvwprintw(win,row-2,35, "Try to connect to server iec 104 "); 
             wattroff(win,COLOR_PAIR(8));
             wrefresh(win); 
             cvar=0;       
        }
         
         
         
         
         goto TRY_CONNECT;
     }
    Thread_sleep(1000);
    CS104_Connection_destroy(con);
    printf("exit\n");
      wrefresh(win);
         getch();
         endwin();

exit_program:
     exit(0);   
    
}



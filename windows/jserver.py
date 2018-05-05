# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.3.6  05.05.2018 
## JSON WEB server by Jack Maclov
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import sys
import time
import logging
import gc
import os
import threading
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import base64
import ssl
from datetime import datetime
from enum import Enum, IntEnum
import uuid
import socket
import struct
class S(BaseHTTPRequestHandler):
     def _set_response(self):
         self.send_response(200)
         self.send_header('Content-type','text/html')
         self.end_headers()
     def do_HEAD(self):
         self.send_response(200)
         self.send_header('Content-type', 'text/html')
         self.send_header('Access-Control-Allow-Origin', self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Methods','GET, OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','Authorization')
         self.send_header('Access-Control-Allow-Headers','X-Accept-Charset,X-Accept,Content-Type,Credentials')
         self.end_headers()
     def do_AUTHHEAD(self):
         self.send_response(401)
         self.send_header('WWW-Authenticate','Basic realm="Demo Realm"')
         self.send_header("Cache-Control", "no-cache")
         self.send_header('Content-type','application/json')
         self.send_header('Access-Control-Allow-Origin',self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Methods','GET, OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','Authorization')
         self.end_headers()
     def do_OPTIONS(self):
         self.send_response(200)
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Origin',self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Methods','GET,OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','origin, Authorization, accept')
         self.send_header('Content-type','application/json')
         self.end_headers()
     def do_GET(self):
         global key 
         if self.headers.get('Authorization') == None:
             self.do_AUTHHEAD()
             response = { 'success': False, 'error': 'No auth header received'}
             self.wfile.write(bytes(json.dumps(response), 'utf-8'))
         elif self.headers.get('Authorization') == 'Basic ' + str(key):
             resp=[]
             self.send_response(200)
             self.send_header('Allow','GET, OPTIONS')
             self.send_header("Cache-Control", "no-cache")
             self.send_header('Content-type','application/json')
             self.send_header('Access-Control-Allow-Origin', self.headers.get('Origin'))
             self.send_header('Access-Control-Allow-Credentials', 'true')
             self.send_header('Access-Control-Allow-Methods', 'GET, OPTIONS')
             self.send_header('Access-Control-Allow-Headers', 'X-Request, X-Requested-With')
             self.send_header("Access-Control-Allow-Headers", "Authorization")
             self.end_headers()
             req=str(self.path)[1:]
             if(req == "data" ):
                 try:
                     self.wfile.write(bytes(json.dumps(AllData), 'utf-8'))
                 except Exception as e:
                     print('get req data error',e)
             else:
                 response = { 'req error':'Invalid credentials'}
                 self.wfile.write(bytes(json.dumps(response), 'utf-8'))
                 print('error req')
         else:
             self.do_AUTHHEAD()
             response = { 'success': False, 'error': 'Invalid credentials'}
             self.wfile.write(bytes(json.dumps(response), 'utf-8'))
def set_auth( username, password):
         global key
         key = base64.b64encode(bytes('%s:%s' % (username, password), 'utf-8')).decode('ascii')
def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):
     try:
         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)
         if(x!=None):
             mVar=x 
         else:
             mVar=mVar
     except Exception as e:
         pass
     return(mVar)
def SelectData(getData):
     global T_7002
     global RH_7004
     global Td_7006
     global A_7008
     global MinT_7010
     global MaxT_7012
     global MinRH_7014
     global MaxRH_7016
     global MinTd_7018
     global MaxTd_7020
     global MinA_7022
     global MaxA_7024
     global SerialNumber_81
     global Freq_81
     global Aplus_81
     global Aminus_81
     global Rplus_81
     global Rminus_81
     global U1_81
     global SerialNumber_43
     global Aplus_43
     global Aminus_43
     global Gen_ON_OFF
     global Gen_Overload
     global Gen_Def
     global Gen_Fuel
     global Gen_Temp
     global Gen_Pression
     global AllData
     global T_7002
     global RH_7004
     global Td_7006
     global A_7008
     global MinT_7010
     global MaxT_7012
     global MinRH_7014
     global MaxRH_7016
     global MinTd_7018
     global MaxTd_7020
     global MinA_7022
     global MaxA_7024
     global SerialNumber_81
     global Freq_81
     global Aplus_81
     global Aminus_81
     global Rplus_81
     global Rminus_81
     global U1_81
     global SerialNumber_43
     global Aplus_43
     global Aminus_43
     global Gen_ON_OFF
     global Gen_Overload
     global Gen_Def
     global Gen_Fuel
     global Gen_Temp
     global Gen_Pression
     global AllData
     T_7002=setVariables(T_7002,getData,'TempSensor','T_7002','0','2','12','float','1')
     RH_7004=setVariables(RH_7004,getData,'TempSensor','RH_7004','2','2','12','float','1')
     Td_7006=setVariables(Td_7006,getData,'TempSensor','Td_7006','4','2','12','float','1')
     A_7008=setVariables(A_7008,getData,'TempSensor','A_7008','6','2','12','float','1')
     MinT_7010=setVariables(MinT_7010,getData,'TempSensor','MinT_7010','8','2','12','float','1')
     MaxT_7012=setVariables(MaxT_7012,getData,'TempSensor','MaxT_7012','10','2','12','float','1')
     MinRH_7014=setVariables(MinRH_7014,getData,'TempSensor','MinRH_7014','12','2','12','float','1')
     MaxRH_7016=setVariables(MaxRH_7016,getData,'TempSensor','MaxRH_7016','14','2','12','float','1')
     MinTd_7018=setVariables(MinTd_7018,getData,'TempSensor','MinTd_7018','16','2','12','float','1')
     MaxTd_7020=setVariables(MaxTd_7020,getData,'TempSensor','MaxTd_7020','18','2','12','float','1')
     MinA_7022=setVariables(MinA_7022,getData,'TempSensor','MinA_7022','20','2','12','float','1')
     MaxA_7024=setVariables(MaxA_7024,getData,'TempSensor','MaxA_7024','22','2','12','float','1')
     SerialNumber_81=setVariables(SerialNumber_81,getData,'merc_230_81','SerialNumber_81','0','1','1','string','1')
     Freq_81=setVariables(Freq_81,getData,'merc_230_81','Freq_81','1','1','1','integer','0.01')
     Aplus_81=setVariables(Aplus_81,getData,'merc_230_81','Aplus_81','2','1','1','integer','0.001')
     Aminus_81=setVariables(Aminus_81,getData,'merc_230_81','Aminus_81','3','1','1','integer','0.001')
     Rplus_81=setVariables(Rplus_81,getData,'merc_230_81','Rplus_81','4','1','1','integer','0.001')
     Rminus_81=setVariables(Rminus_81,getData,'merc_230_81','Rminus_81','5','1','1','integer','0.001')
     U1_81=setVariables(U1_81,getData,'merc_230_81','U1_81','22','1','1','integer','0.01')
     SerialNumber_43=setVariables(SerialNumber_43,getData,'merc_230_43','SerialNumber_43','0','1','1','string','1')
     Aplus_43=setVariables(Aplus_43,getData,'merc_230_43','Aplus_43','2','1','1','integer','0.001')
     Aminus_43=setVariables(Aminus_43,getData,'merc_230_43','Aminus_43','3','1','1','integer','0.001')
     Gen_ON_OFF=setVariables(Gen_ON_OFF,getData,'Generator_TC','Gen_ON_OFF','0','1','1','bool','1')
     Gen_Overload=setVariables(Gen_Overload,getData,'Generator_TC','Gen_Overload','1','1','1','bool','1')
     Gen_Def=setVariables(Gen_Def,getData,'Generator_TC','Gen_Def','2','1','1','bool','1')
     Gen_Fuel=setVariables(Gen_Fuel,getData,'Generator_TC','Gen_Fuel','3','1','1','bool','1')
     Gen_Temp=setVariables(Gen_Temp,getData,'Generator_TC','Gen_Temp','4','1','1','bool','1')
     Gen_Pression=setVariables(Gen_Pression,getData,'Generator_TC','Gen_Pression','5','1','1','bool','1')
#-----------------------------------------------------------------------------------
     AllData=[T_7002,RH_7004,Td_7006,A_7008,MinT_7010,MaxT_7012,MinRH_7014,MaxRH_7016,MinTd_7018,MaxTd_7020,MinA_7022,MaxA_7024,SerialNumber_81,Freq_81,Aplus_81,Aminus_81,Rplus_81,Rminus_81,U1_81,SerialNumber_43,Aplus_43,Aminus_43,Gen_ON_OFF,Gen_Overload,Gen_Def,Gen_Fuel,Gen_Temp,Gen_Pression,]
def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):
     varData=None
     if(getData.decode("utf-8").split(':')[0] == source):
         temp = getData.decode("utf-8").split(':')[1]
         if(temp!='Error'):
             temp = temp.replace("(", "").replace(")", "").replace(" ", "").split(',')
             if(dataType=='float'):
                 if(count=='2'): 
                     if(sequence=='12'):
                         temp2=(struct.unpack('f',struct.pack('i',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))
                         varData=temp2[0]
                     if(sequence=='21'):
                         temp2=(struct.unpack('f',struct.pack('i',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))
                         varData=temp2[0]
             if(dataType=='integer'):
                 if(count=='1'):
                     temp2=int(temp[int(address)])
                     varData=temp2
                 if(count=='2' and sequence=='12'):
                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])
                     varData=temp2
                 if(count=='2' and sequence=='21'):
                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) 
                     varData=temp2
             if(dataType=='bool'):
                     if(int(temp[int(address)]) > 0):
                         temp2=True
                     if(int(temp[int(address)]) == 0):
                         temp2=False
                     varData=temp2
             if(dataType=='string'):
                     temp2=temp[ int(address)]
                     varData=temp2
             try:
                 mult=int(multiply)
             except Exception as e:
                 mult=float(multiply)
             if(dataType=='integer' or dataType=='float'):
                 varData=varData*mult
             returnData={varName:varData}
             return returnData
         else:
             varData={varName:'Error'}
             return varData
     else:
         return None
def udpserv(i=1):
     global udpdata 
     try:
         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
         server_address = ('localhost', 64000)
         print('starting up on {} port {}'.format(*server_address))
         sock.bind(server_address)
         while True:
             data, address = sock.recvfrom(4096)
             udpdata=data
             SelectData(udpdata)
     except Exception as e:
         print(e)
def run(server_class=HTTPServer, handler_class=S, port=8080):
     server_address = (serverSlave, int(portSlave))
     httpd = server_class(server_address, handler_class)
     print('Starting httpd...\n')
     try:
         httpd.serve_forever()
     except Exception as e:
         print(e)
         pass
     httpd.server_close() 
if __name__ == "__main__": 
     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'')
     T_7002=''
     RH_7004=''
     Td_7006=''
     A_7008=''
     MinT_7010=''
     MaxT_7012=''
     MinRH_7014=''
     MaxRH_7016=''
     MinTd_7018=''
     MaxTd_7020=''
     MinA_7022=''
     MaxA_7024=''
     SerialNumber_81=''
     Freq_81=''
     Aplus_81=''
     Aminus_81=''
     Rplus_81=''
     Rminus_81=''
     U1_81=''
     SerialNumber_43=''
     Aplus_43=''
     Aminus_43=''
     Gen_ON_OFF=''
     Gen_Overload=''
     Gen_Def=''
     Gen_Fuel=''
     Gen_Temp=''
     Gen_Pression=''
     AllData=''
     try: 
         print( 'Starting web server...')
         serverSlave='127.0.0.1'
         portSlave='8080'
         timeOut=2 
         login='root'
         password='root'
         set_auth(login,password)
         modb = threading.Thread(target=udpserv,args=(1,)) 
         modb.daemon = True
         modb.start()
         run()
     except Exception as e:
         print(e)

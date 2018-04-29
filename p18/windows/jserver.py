# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.2.9  28.04.2018 
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
from dateutil import parser
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
     global AllData
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','T_7002','0','2','12','float','1')
         if(x!=None):
             T_7002=x
         else:
             T_7002=T_7002
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','RH_7004','2','2','12','float','1')
         if(x!=None):
             RH_7004=x
         else:
             RH_7004=RH_7004
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','Td_7006','4','2','12','float','1')
         if(x!=None):
             Td_7006=x
         else:
             Td_7006=Td_7006
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','A_7008','6','2','12','float','1')
         if(x!=None):
             A_7008=x
         else:
             A_7008=A_7008
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MinT_7010','8','2','12','float','1')
         if(x!=None):
             MinT_7010=x
         else:
             MinT_7010=MinT_7010
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MaxT_7012','10','2','12','float','1')
         if(x!=None):
             MaxT_7012=x
         else:
             MaxT_7012=MaxT_7012
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MinRH_7014','12','2','12','float','1')
         if(x!=None):
             MinRH_7014=x
         else:
             MinRH_7014=MinRH_7014
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MaxRH_7016','14','2','12','float','1')
         if(x!=None):
             MaxRH_7016=x
         else:
             MaxRH_7016=MaxRH_7016
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MinTd_7018','16','2','12','float','1')
         if(x!=None):
             MinTd_7018=x
         else:
             MinTd_7018=MinTd_7018
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MaxTd_7020','18','2','12','float','1')
         if(x!=None):
             MaxTd_7020=x
         else:
             MaxTd_7020=MaxTd_7020
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MinA_7022','20','2','12','float','1')
         if(x!=None):
             MinA_7022=x
         else:
             MinA_7022=MinA_7022
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'TempSensor','MaxA_7024','22','2','12','float','1')
         if(x!=None):
             MaxA_7024=x
         else:
             MaxA_7024=MaxA_7024
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','SerialNumber_81','0','1','1','string','1')
         if(x!=None):
             SerialNumber_81=x
         else:
             SerialNumber_81=SerialNumber_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','Freq_81','1','1','1','integer','0.01')
         if(x!=None):
             Freq_81=x
         else:
             Freq_81=Freq_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','Aplus_81','2','1','1','integer','0.001')
         if(x!=None):
             Aplus_81=x
         else:
             Aplus_81=Aplus_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','Aminus_81','3','1','1','integer','1')
         if(x!=None):
             Aminus_81=x
         else:
             Aminus_81=Aminus_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','Rplus_81','4','1','1','integer','1')
         if(x!=None):
             Rplus_81=x
         else:
             Rplus_81=Rplus_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','Rminus_81','5','1','1','integer','1')
         if(x!=None):
             Rminus_81=x
         else:
             Rminus_81=Rminus_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_81','U1_81','22','1','1','integer','0.01')
         if(x!=None):
             U1_81=x
         else:
             U1_81=U1_81
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_43','SerialNumber_43','0','1','1','string','1')
         if(x!=None):
             SerialNumber_43=x
         else:
             SerialNumber_43=SerialNumber_43
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_43','Aplus_43','2','1','1','integer','1')
         if(x!=None):
             Aplus_43=x
         else:
             Aplus_43=Aplus_43
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     try:
         x=getVariables(getData,'merc_230_43','Aminus_43','3','1','1','integer','1')
         if(x!=None):
             Aminus_43=x
         else:
             Aminus_43=Aminus_43
     except Exception as e:
         pass
#-----------------------------------------------------------------------------------
     AllData=[T_7002,RH_7004,Td_7006,A_7008,MinT_7010,MaxT_7012,MinRH_7014,MaxRH_7016,MinTd_7018,MaxTd_7020,MinA_7022,MaxA_7024,SerialNumber_81,Freq_81,Aplus_81,Aminus_81,Rplus_81,Rminus_81,U1_81,SerialNumber_43,Aplus_43,Aminus_43,]
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

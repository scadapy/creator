# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.5.3  14.07.2018 
## JSON WEB server by Jack Mas
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
     global WaterTemp
     global EngineOnOff
     global AllData
     global WaterTemp
     global EngineOnOff
     global AllData
     WaterTemp=setVariables(WaterTemp,getData,'WaterTemp','WaterTemp','0','1','1','integer','1')
     EngineOnOff=setVariables(EngineOnOff,getData,'EngineOnOff','EngineOnOff','0','1','1','bool','1')
#-----------------------------------------------------------------------------------
     AllData=[WaterTemp,EngineOnOff,]
def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):
     varData=None
     if(json.loads( getData.decode("utf-8") )['name'] == source):
         temp=json.loads( getData.decode("utf-8") )['data']
         if(temp!='Error'):
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
             if(dataType=='intSigned'):
                 if(count=='1'):
                     temp2=(int(temp[int(address)]) + 2**15) % 2**16 - 2**15
                     varData=temp2
                 if(count=='2' and sequence=='12'):
                     temp2= ((int(temp[int(address)])<<16) + int(temp[int(address)+1]) + 2**31) % 2**32 - 2**31
                     varData=temp2
                 if(count=='2' and sequence=='21'):
                     temp2= ((int(temp[int(address)+1])<<16) + int(temp[int(address)]) + 2**31) % 2**32 - 2**31 
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
     WaterTemp=''
     EngineOnOff=''
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

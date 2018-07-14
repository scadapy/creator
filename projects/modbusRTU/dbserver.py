# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.5.3  14.07.2018 
## DB Postgresql arch by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import postgresql
import schedule
import sys
import time
import gc
import os
import threading
from datetime import datetime
import socket
import struct
import json
def createDB(login,password,host,dbname):
     db=''
     try: 
         db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"") 
         print('Connection OK')
     except Exception as e:
         print('Not exist')
         try:
             db = postgresql.open("pq://"+login+":"+password+"@"+host) 
             db.execute('CREATE DATABASE '+dbname)
             print('Create database OK')
             db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"")
             try:
                 db.execute("CREATE TABLE  IF NOT EXISTS archiveData (varname varchar(80),date date,time time, varDataFI real, varDataStr varchar(200), varDataBool boolean)")
                 print('Create table OK')
             except Exception as e:
                 print(e)
         except Exception as e:
             print('Error to connect',e)
     return db
def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):
     try:
         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)
         if(x!=None and x[1]!='Error'):
             mVar=x 
         else:
             mVar=mVar
     except Exception as e:
         #
         pass
     return(mVar)
def SelectData(getData):
     global AllData
     AllData=[]
def startJob(t=1):
     schedule.every(1).minutes.do(job1min)
     schedule.every(5).minutes.do(job5min)
     schedule.every(15).minutes.do(job15min)
     schedule.every(30).minutes.do(job30min)
     schedule.every().hour.do(jobH)
     while 1: 
         schedule.run_pending()
         time.sleep(1)
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
             returnData=[varName,varData,dataType]
             return returnData
         else:
             varData=[varName,'ErrorVar',dataType]
             return varData
     else:
             return [varName,'Error',dataType]
def udpserv(i=1):
     global udpdata 
     try:
         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
         server_address = ('localhost', 64001)
         print('starting up on {} port {}'.format(*server_address))
         sock.bind(server_address)
         while True:
             data, address = sock.recvfrom(4096)
             udpdata=data
             SelectData(udpdata)
     except Exception as e:
         print(e)
def insData(putData):
     try:
         if(putData!=None and len(putData)>0):
             varName,varValue,varDataType=putData
             if(varValue!='Error' and varValue!=None  and varValue!='ErrorVar'):
                 if(varDataType == 'string'):
                     db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),'"+varName+"',"+str(varValue)+")")
                 if(varDataType == 'integer' or varDataType == 'float'):
                     db.execute("INSERT INTO archiveData (date,time,varname,varDataFI) VALUES (now(),now(),'"+varName+"',"+str(varValue)+")")
                 if(varDataType == 'bool'): 
                     db.execute("INSERT INTO archiveData (date,time,varname,varDataBool) VALUES (now(),now(),'"+varName+"',"+str(varValue)+")")
             if(varValue=='Error'  or varValue=='ErrorVar'):
                 db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),'"+varName+"','Error')")
     except Exception as e: 
         print(e)
         pass 
def job1min():
     pass
def job5min():
     pass
def job15min():
     pass
def job30min():
     pass
def jobH():
     pass
if __name__ == "__main__": 
     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'')
     AllData=''
     try: 
         print( 'Starting DB Postgresql server...')
         db=createDB("","","","scadapy")
         modb = threading.Thread(target=udpserv,args=(1,))
         modb.daemon = True
         modb.start()
         arch = threading.Thread(target=startJob,args=(1,))
         arch.daemon = True
         arch.start()
         arch.join()
         modb.join()
     except Exception as e:
         print(e)

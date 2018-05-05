# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.3.6  05.05.2018 
## DB Postgresql arch by Jack Maclov
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
     global T_7002
     global RH_7004
     global Td_7006
     global A_7008
     global MinT_7010
     global U1_81
     global Gen_ON_OFF
     global AllData
     T_7002=setVariables(T_7002,getData,'TempSensor','T_7002','0','2','12','float','1')
     RH_7004=setVariables(RH_7004,getData,'TempSensor','RH_7004','2','2','12','float','1')
     Td_7006=setVariables(Td_7006,getData,'TempSensor','Td_7006','4','2','12','float','1')
     A_7008=setVariables(A_7008,getData,'TempSensor','A_7008','6','2','12','float','1')
     MinT_7010=setVariables(MinT_7010,getData,'TempSensor','MinT_7010','8','2','12','float','1')
     U1_81=setVariables(U1_81,getData,'merc_230_81','U1_81','22','1','1','integer','0.01')
     Gen_ON_OFF=setVariables(Gen_ON_OFF,getData,'Generator_TC','Gen_ON_OFF','0','1','1','bool','1')
     AllData=[T_7002,RH_7004,Td_7006,A_7008,MinT_7010,U1_81,Gen_ON_OFF,]
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
     insData(T_7002)
     insData(U1_81)
     insData(Gen_ON_OFF)
     pass
def job5min():
     insData(RH_7004)
     pass
def job15min():
     insData(Td_7006)
     pass
def job30min():
     insData(A_7008)
     pass
def jobH():
     insData(MinT_7010)
     pass
if __name__ == "__main__": 
     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'')
     T_7002=['T_7002','Error','string']
     RH_7004=['RH_7004','Error','string']
     Td_7006=['Td_7006','Error','string']
     A_7008=['A_7008','Error','string']
     MinT_7010=['MinT_7010','Error','string']
     U1_81=['U1_81','Error','string']
     Gen_ON_OFF=['Gen_ON_OFF','Error','string']
     AllData=''
     try: 
         print( 'Starting DB Postgresql server...')
         db=createDB("postgres","999","localhost","scadapy")
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

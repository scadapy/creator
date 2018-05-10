# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.4.1  10.05.2018 
## vk client by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
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
import vk_api
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
     global U1_81
     global T_7002
     global AllData
     T_7002=setVariables(T_7002,getData,'TempSensor','T_7002','0','2','12','float','1')
     U1_81=setVariables(U1_81,getData,'merc_230_81','U1_81','22','1','1','integer','0.01')
     T_7002=setVariables(T_7002,getData,'TempSensor','T_7002','0','2','12','float','1')
     AllData=[T_7002,U1_81,T_7002,]
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
                     varData=str(temp2)
             if(dataType=='string'):
                     temp2=temp[ int(address)]
                     varData=temp2
             try:
                 mult=int(multiply)
             except Exception as e:
                 mult=float(multiply)
             if(dataType=='integer' or dataType=='float'):
                 varData=str(varData*mult)
             else:
                 varData=str(varData)
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
         server_address = ('localhost', 64002)
         print('starting up on {} port {}'.format(*server_address))
         sock.bind(server_address)
         while True:
             data, address = sock.recvfrom(4096)
             udpdata=data
             SelectData(udpdata)
     except Exception as e:
         print(e)
def sendMessage(user_id,putData,vklogin,vkpassword,message):
     vk = vk_api.VkApi(login = vklogin, password = vkpassword) 
     vk.auth() 
     nowTime=datetime.strftime(datetime.now(), "%d.%m.%Y %H:%M:%S")
     try:
         if(putData!=None and len(putData)>0):
             varName,varValue,varDataType=putData
             vk.method('messages.send', {'user_id':user_id,'message':nowTime+'\n'+message+':'+varValue }) 
     except Exception as e: 
         print(e)
         pass 
def job1min():
     pass
def job5min():
     sendMessage('394083837',T_7002,'eee','ttt','Значение: Температура')
     sendMessage('394083837',U1_81,'eee','ttt','Напряжение - №81 Ua')
     pass
def job15min():
     pass
def job30min():
     sendMessage('449545752',T_7002,'eee','ttt','Значение: Температура')
     pass
def jobH():
     pass
if __name__ == "__main__": 
     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'')
     T_7002=['T_7002','Error','string']
     U1_81=['U1_81','Error','string']
     T_7002=['T_7002','Error','string']
     AllData=''
     try: 
         print( 'Starting VK Client...')
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

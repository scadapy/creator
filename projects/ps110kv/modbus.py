# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.8.1  21.08.2018 
## Modbus Client by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import time
import modbus_tk
import modbus_tk.defines as cst
import modbus_tk.modbus_tcp as modbus_tcp
from modbus_tk import modbus_rtu
import serial
import gc
import socket
import threading
import json
import datetime
def Proc_4(f=1):
     startAdr=[]
     rangeAdr=[]
     rtuAddress=[]
     varname=[]
     timeOut=[]
     reg=[]
     unitCount=10
     for i in range(0,unitCount+1):
         rtuAddress.append(i)
         reg.append(i)
         startAdr.append(i)
         rangeAdr.append(i)
         varname.append(i)
         timeOut.append(i)
     try:
         master = modbus_tcp.TcpMaster(host='192.168.10.22', port=int('502'))
         master.set_timeout(2)
     except Exception as e:
          pass
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('DI_COIL_S1','1','READ_DISCRETE_INPUTS','0','11','0.5')
     x=1; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('I_S1','1','READ_INPUT_REGISTERS','0','11','0.5')
     x=2; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('DI_COIL_S2','1','READ_DISCRETE_INPUTS','11','11','0.5')
     x=3; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('I_S2','1','READ_INPUT_REGISTERS','11','11','0.5')
     x=4; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SW_110_T1','1','READ_DISCRETE_INPUTS','40','1','0.5')
     x=5; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SW_110_T2','1','READ_DISCRETE_INPUTS','41','1','0.5')
     x=6; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SMW_110','1','READ_DISCRETE_INPUTS','42','1','0.5')
     x=7; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SW_110_T1_I','1','READ_INPUT_REGISTERS','40','3','0.5')
     x=8; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SW_110_T1_U','1','READ_INPUT_REGISTERS','50','3','0.5')
     x=9; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('SW_110_T1_P','1','READ_INPUT_REGISTERS','60','3','0.5')
     while True:
         for i in range(0,unitCount):
             d   = int(datetime.datetime.today().strftime("%d"))
             mth = int(datetime.datetime.today().strftime("%m"))
             y   = int(datetime.datetime.today().strftime("%Y"))
             h   = int(datetime.datetime.today().strftime("%H"))
             m   = int(datetime.datetime.today().strftime("%M"))
             s   = int(datetime.datetime.today().strftime("%S"))
             try:
                 if(reg[i]=='READ_INPUT_REGISTERS'):   c=cst.READ_INPUT_REGISTERS
                 if(reg[i]=='READ_DISCRETE_INPUTS'):   c=cst.READ_DISCRETE_INPUTS
                 if(reg[i]=='READ_COILS'):             c=cst.READ_COILS
                 if(reg[i]=='READ_HOLDING_REGISTERS'): c=cst.READ_HOLDING_REGISTERS
                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )
                 sock_udp.sendto(       json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]}).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(    json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]} ).encode('utf-8'), server_address_udp_vk)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto(       json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(    json.dumps( {'s':[s],'m':[m],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp_vk)
                 master = modbus_tcp.TcpMaster(host='192.168.10.22', port=int('502'))
             time.sleep(float(timeOut[i]))
             gc.collect()
if __name__ == "__main__":
     try:
         try:
             print( 'UDP sender start')
             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
             server_address_udp = ('localhost', 64000)
             sock_udp_arch = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
             server_address_udp_arch = ('localhost', 64001)
             sock_udp_vk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
             server_address_udp_vk = ('localhost', 64002)
         except Exception as e:
             print('UDP fail ',e)
         print( 'Starting modbus client')
         time.sleep(1.0)
  ########################### treads block
         modb_4 = threading.Thread(target=Proc_4,args=(1,))
         modb_4.daemon = True
         modb_4.start()

         modb_4.join()

     except Exception as e:
         print(e)

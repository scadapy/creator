# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.5.3  14.07.2018 
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
def Proc_4(f=1):
     startAdr=[]
     rangeAdr=[]
     rtuAddress=[]
     varname=[]
     timeOut=[]
     reg=[]
     unitCount=7
     for i in range(0,unitCount+1):
         rtuAddress.append(i)
         reg.append(i)
         startAdr.append(i)
         rangeAdr.append(i)
         varname.append(i)
         timeOut.append(i)
     try:
         com=serial.Serial('/dev/ttyUSB0',19200, bytesize=8, parity='N', stopbits=1, xonxoff=0)
         master=modbus_rtu.RtuMaster(com)
         master.set_timeout(2)
     except Exception as e:
          pass
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('EngineOnOff','1','READ_DISCRETE_INPUTS','0','1','0.5')
     x=1; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('BoilerHeaterOnOff','1','READ_DISCRETE_INPUTS','1','1','0.5')
     x=2; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('WaterPump_1OnOff','1','READ_DISCRETE_INPUTS','2','1','0.5')
     x=3; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('WaterPump_2OnOff','1','READ_DISCRETE_INPUTS','3','1','0.5')
     x=4; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('WaterTemp','1','READ_INPUT_REGISTERS','0','2','0.5')
     x=5; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('EngineWaterTemp','1','READ_INPUT_REGISTERS','3','1','0.5')
     x=6; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('BoilerWaterTemp','1','READ_INPUT_REGISTERS','4','1','0.5')
     while True:
         for i in range(0,unitCount):
             try:
                 if(reg[i]=='READ_INPUT_REGISTERS'):   c=cst.READ_INPUT_REGISTERS
                 if(reg[i]=='READ_DISCRETE_INPUTS'):   c=cst.READ_DISCRETE_INPUTS
                 if(reg[i]=='READ_COILS'):             c=cst.READ_COILS
                 if(reg[i]=='READ_HOLDING_REGISTERS'): c=cst.READ_HOLDING_REGISTERS
                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )
                 sock_udp.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp_vk)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp_vk)

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

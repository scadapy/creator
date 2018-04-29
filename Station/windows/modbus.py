# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.2.9  28.04.2018 
## Modbus Client by Jack Maclov
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
def Proc_4(f=1):
     startAdr=[]
     rangeAdr=[]
     rtuAddress=[]
     varname=[]
     timeOut=[]
     reg=[]
     unitCount=1
     for i in range(0,unitCount+1):
         rtuAddress.append(i)
         reg.append(i)
         startAdr.append(i)
         rangeAdr.append(i)
         varname.append(i)
         timeOut.append(i)
     try:
         com=serial.Serial('com8',9600, bytesize=8, parity='N', stopbits=1, xonxoff=0)
         master=modbus_rtu.RtuMaster(com)
         master.set_timeout(2)
     except Exception as e:
          pass
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('TempSensor','247','READ_HOLDING_REGISTERS','7002','25','0.5')
     while True:
         for i in range(0,unitCount):
             try:
                 if(reg[i]=='READ_INPUT_REGISTERS'):   c=cst.READ_INPUT_REGISTERS
                 if(reg[i]=='READ_DISCRETE_INPUTS'):   c=cst.READ_DISCRETE_INPUTS
                 if(reg[i]=='READ_COILS'):             c=cst.READ_COILS
                 if(reg[i]=='READ_HOLDING_REGISTERS'): c=cst.READ_HOLDING_REGISTERS
                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )
                 sock_udp.sendto((varname[i]+":"+str(varNameData)).encode('utf-8'), server_address_udp)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto((varname[i]+":Error").encode('utf-8'), server_address_udp)

             time.sleep(float(timeOut[i]))
             gc.collect()
def Proc_5(f=1):
     startAdr=[]
     rangeAdr=[]
     rtuAddress=[]
     varname=[]
     timeOut=[]
     reg=[]
     unitCount=1
     for i in range(0,unitCount+1):
         rtuAddress.append(i)
         reg.append(i)
         startAdr.append(i)
         rangeAdr.append(i)
         varname.append(i)
         timeOut.append(i)
     try:
         master = modbus_tcp.TcpMaster(host='127.0.0.1', port=int('502'))
         master.set_timeout(2)
     except Exception as e:
          pass
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('Generator_TC','1','READ_DISCRETE_INPUTS','0','10','1')
     while True:
         for i in range(0,unitCount):
             try:
                 if(reg[i]=='READ_INPUT_REGISTERS'):   c=cst.READ_INPUT_REGISTERS
                 if(reg[i]=='READ_DISCRETE_INPUTS'):   c=cst.READ_DISCRETE_INPUTS
                 if(reg[i]=='READ_COILS'):             c=cst.READ_COILS
                 if(reg[i]=='READ_HOLDING_REGISTERS'): c=cst.READ_HOLDING_REGISTERS
                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )
                 sock_udp.sendto((varname[i]+":"+str(varNameData)).encode('utf-8'), server_address_udp)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto((varname[i]+":Error").encode('utf-8'), server_address_udp)
                 master = modbus_tcp.TcpMaster(host='127.0.0.1', port=int('502'))
             time.sleep(float(timeOut[i]))
             gc.collect()
if __name__ == "__main__":
     try:
         try:
             print( 'UDP sender start')
             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
             server_address_udp = ('localhost', 64000)
         except Exception as e:
             print('UDP fail ',e)
         print( 'Starting modbus client')
         time.sleep(1.0)
  ########################### treads block
         modb_4 = threading.Thread(target=Proc_4,args=(1,))
         modb_4.daemon = True
         modb_4.start()
         modb_5 = threading.Thread(target=Proc_5,args=(1,))
         modb_5.daemon = True
         modb_5.start()

         while True:
             pass
     except Exception as e:
         print(e)

# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.4.1  10.05.2018 
## Mercury client by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import time
import gc
import socket
import threading
import serial
import mercury as m
import json
def Proc_7(f=1):
     startAdr=[]
     rangeAdr=[]
     rtuAddress=[]
     varname=[]
     timeOut=[]
     reg=[]
     unitCount=2
     for i in range(0,unitCount+1):
         rtuAddress.append(i)
         reg.append(i)
         startAdr.append(i)
         rangeAdr.append(i)
         varname.append(i)
         timeOut.append(i)
     try:
         com=serial.Serial('com10',9600, timeout=2, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)
         time.sleep(2) 
     except Exception as e:
          pass
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('merc_230_43','43','0','0','000043','1')
     x=1; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('merc_230_81','81','0','0','000081','1')
     while True:
         for i in range(0,unitCount):   
             try:
                 varNameData=m.getDataFromCounter(rtuAddress[i],com,0)
                 sock_udp.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(  json.dumps( {'name':varname[i],'data':varNameData} ).encode('utf-8'), server_address_udp_vk)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(  json.dumps( {'name':varname[i],'data':'Error'} ).encode('utf-8'), server_address_udp_vk)
             time.sleep(float(timeOut[x]))
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
         print( 'Starting mercury client')
         time.sleep(1.0)
  ########################### treads block
         modb_7 = threading.Thread(target=Proc_7,args=(1,))
         modb_7.daemon = True
         modb_7.start()

         modb_7.join()

     except Exception as e:
         print(e)

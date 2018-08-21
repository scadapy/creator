# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.8.0  14.08.2018 
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
import datetime
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
         com=serial.Serial('com3',9600, timeout=2, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)
         time.sleep(2) 
     except Exception as e:
          pass
          
#################################################### ADDRESS          
     x=0; varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('merc_230','67','','','------','1')
     while True:
         for i in range(0,unitCount):   
             d   = int(datetime.datetime.today().strftime("%d"))
             mth = int(datetime.datetime.today().strftime("%m"))
             y   = int(datetime.datetime.today().strftime("%Y"))
             h   = int(datetime.datetime.today().strftime("%H"))
             mn   = int(datetime.datetime.today().strftime("%M"))
             s   = int(datetime.datetime.today().strftime("%S"))
             try:
                 varNameData=m.getDataFromCounter(rtuAddress[i],com,0)
                 if(varNameData=='Error'):
                     sock_udp.sendto(       json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':varNameData,'q':[100]} ).encode('utf-8'), server_address_udp)
                     sock_udp_arch.sendto(  json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':varNameData,'q':[100]} ).encode('utf-8'), server_address_udp_arch)
                     sock_udp_vk.sendto(    json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':varNameData,'q':[100]} ).encode('utf-8'), server_address_udp_vk)
                 else:
                     sock_udp.sendto(       json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]} ).encode('utf-8'), server_address_udp)
                     sock_udp_arch.sendto(  json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]} ).encode('utf-8'), server_address_udp_arch)
                     sock_udp_vk.sendto(    json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[1],'name':varname[i],'data':varNameData,'q':[0]} ).encode('utf-8'), server_address_udp_vk)
             except Exception as e:
                 varNameData=None
                 sock_udp.sendto(       json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp)
                 sock_udp_arch.sendto(  json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp_arch)
                 sock_udp_vk.sendto(    json.dumps( {'s':[s],'m':[mn],'h':[h],'y':[y],'mth':[mth],'d':[d],'con':[0],'name':varname[i],'data':'Error','q':[100]} ).encode('utf-8'), server_address_udp_vk)
             time.sleep(float(timeOut[i]))
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
         modb_5 = threading.Thread(target=Proc_5,args=(1,))
         modb_5.daemon = True
         modb_5.start()

         modb_5.join()

     except Exception as e:
         print(e)

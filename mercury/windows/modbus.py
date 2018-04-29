# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.3.1  29.04.2018 
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

         while True:
             pass
     except Exception as e:
         print(e)

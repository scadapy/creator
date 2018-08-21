# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.8.1  21.08.2018 
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


     except Exception as e:
         print(e)

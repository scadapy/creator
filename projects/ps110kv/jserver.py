# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.8.1  21.08.2018 
## JSON WEB server by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import sys
import time
import logging
import gc
import os
import threading
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import base64
import ssl
from datetime import datetime
from enum import Enum, IntEnum
import uuid
import socket
import struct
class S(BaseHTTPRequestHandler):
     def _set_response(self):
         self.send_response(200)
         self.send_header('Content-type','text/html')
         self.end_headers()
     def do_HEAD(self):
         self.send_response(200)
         self.send_header('Content-type', 'text/html')
         self.send_header('Access-Control-Allow-Origin', self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Methods','GET, OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','Authorization')
         self.send_header('Access-Control-Allow-Headers','X-Accept-Charset,X-Accept,Content-Type,Credentials')
         self.end_headers()
     def do_AUTHHEAD(self):
         self.send_response(401)
         self.send_header('WWW-Authenticate','Basic realm="Demo Realm"')
         self.send_header("Cache-Control", "no-cache")
         self.send_header('Content-type','application/json')
         self.send_header('Access-Control-Allow-Origin',self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Methods','GET, OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','Authorization')
         self.end_headers()
     def do_OPTIONS(self):
         self.send_response(200)
         self.send_header('Access-Control-Allow-Credentials','true')
         self.send_header('Access-Control-Allow-Origin',self.headers.get('Origin'))
         self.send_header('Access-Control-Allow-Methods','GET,OPTIONS')
         self.send_header('Access-Control-Allow-Headers','X-Request, X-Requested-With')
         self.send_header('Access-Control-Allow-Headers','origin, Authorization, accept')
         self.send_header('Content-type','application/json')
         self.end_headers()
     def do_GET(self):
         global key 
         if self.headers.get('Authorization') == None:
             self.do_AUTHHEAD()
             response = { 'success': False, 'error': 'No auth header received'}
             self.wfile.write(bytes(json.dumps(response), 'utf-8'))
         elif self.headers.get('Authorization') == 'Basic ' + str(key):
             resp=[]
             self.send_response(200)
             self.send_header('Allow','GET, OPTIONS')
             self.send_header("Cache-Control", "no-cache")
             self.send_header('Content-type','application/json')
             self.send_header('Access-Control-Allow-Origin', self.headers.get('Origin'))
             self.send_header('Access-Control-Allow-Credentials', 'true')
             self.send_header('Access-Control-Allow-Methods', 'GET, OPTIONS')
             self.send_header('Access-Control-Allow-Headers', 'X-Request, X-Requested-With')
             self.send_header("Access-Control-Allow-Headers", "Authorization")
             self.end_headers()
             req=str(self.path)[1:]
             if(req == "data" ):
                 try:
                     self.wfile.write(bytes(json.dumps(AllData), 'utf-8'))
                 except Exception as e:
                     print('get req data error',e)
             else:
                 response = { 'req error':'Invalid credentials'}
                 self.wfile.write(bytes(json.dumps(response), 'utf-8'))
                 print('error req')
         else:
             self.do_AUTHHEAD()
             response = { 'success': False, 'error': 'Invalid credentials'}
             self.wfile.write(bytes(json.dumps(response), 'utf-8'))
def set_auth( username, password):
         global key
         key = base64.b64encode(bytes('%s:%s' % (username, password), 'utf-8')).decode('ascii')
def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):
     try:
         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)
         if(x!=None):
             mVar=x 
         else:
             mVar=mVar
     except Exception as e:
         pass
     return(mVar)
def SelectData(getData):
     global Snp_VL_Kls_Uab
     global Snp_VL_Kls_Ubc
     global Snp_VL_Kls_Uca
     global Snp_VL_Kls_Ia
     global Snp_VL_Kls_Ib
     global Snp_VL_Kls_Ic
     global Snp_VL_Kls_Psum
     global Snp_VL_Mch_Uab
     global Snp_VL_Mch_Ubc
     global Snp_VL_Mch_Uca
     global Snp_VL_Mch_Ia
     global Snp_VL_Mch_Ib
     global Snp_VL_Mch_Ic
     global Snp_VL_Mch_Psum
     global Snp_c3_Ia
     global Snp_c3_Ib
     global Snp_c3_Ic
     global Snp_c3_Uab
     global Snp_c3_Ubc
     global Snp_c3_Uca
     global Snp_c3_Psum
     global Snp_c3_Ia_Level
     global Snp_c5_Ia
     global Snp_c7_Ia
     global Snp_c9_Ia
     global Snp_c11_Ia
     global Snp_c13_Ia
     global Snp_c15_Ia
     global Snp_c17_Ia
     global Snp_c21_Ia
     global Snp_c6_Ia
     global Snp_c8_Ia
     global Snp_c14_Ia
     global Snp_c16_Ia
     global Snp_c18_Ia
     global Snp_c20_Ia
     global Snp_c20_Ib
     global Snp_c20_Ic
     global Snp_c20_Uab
     global Snp_c20_Ubc
     global Snp_c20_Uca
     global Snp_c20_Psum
     global Snp_c20_Ia_Level
     global Snp_c3_RPV
     global Snp_c7_RPV
     global Snp_c5_RPV
     global Snp_c9_RPV
     global Snp_c11_RPV
     global Snp_c13_RPV
     global Snp_c15_RPV
     global Snp_c17_RPV
     global Snp_c21_RPV
     global Snp_c6_RPV
     global Snp_c8_RPV
     global Snp_c14_RPV
     global Snp_c16_RPV
     global Snp_c18_RPV
     global Snp_c20_RPV
     global Snp_EV_110_T1_RPV
     global Snp_EV_110_T2_RPV
     global Snp_SEV_110_RPV
     global Snp_T1_Ia
     global Snp_T1_Ib
     global Snp_T1_Ic
     global Snp_T1_Uab
     global Snp_T1_Ubc
     global Snp_T1_Uca
     global Snp_T1_P
     global Snp_T2_Ia
     global Snp_T2_Ib
     global Snp_T2_Ic
     global Snp_T2_Uab
     global Snp_T2_Ubc
     global Snp_T2_Uca
     global Snp_T2_P
     global AI_TEST
     global DI_TEST
     global AllData
     global Snp_VL_Kls_Uab
     global Snp_VL_Kls_Ubc
     global Snp_VL_Kls_Uca
     global Snp_VL_Kls_Ia
     global Snp_VL_Kls_Ib
     global Snp_VL_Kls_Ic
     global Snp_VL_Kls_Psum
     global Snp_VL_Mch_Uab
     global Snp_VL_Mch_Ubc
     global Snp_VL_Mch_Uca
     global Snp_VL_Mch_Ia
     global Snp_VL_Mch_Ib
     global Snp_VL_Mch_Ic
     global Snp_VL_Mch_Psum
     global Snp_c3_Ia
     global Snp_c3_Ib
     global Snp_c3_Ic
     global Snp_c3_Uab
     global Snp_c3_Ubc
     global Snp_c3_Uca
     global Snp_c3_Psum
     global Snp_c3_Ia_Level
     global Snp_c5_Ia
     global Snp_c7_Ia
     global Snp_c9_Ia
     global Snp_c11_Ia
     global Snp_c13_Ia
     global Snp_c15_Ia
     global Snp_c17_Ia
     global Snp_c21_Ia
     global Snp_c6_Ia
     global Snp_c8_Ia
     global Snp_c14_Ia
     global Snp_c16_Ia
     global Snp_c18_Ia
     global Snp_c20_Ia
     global Snp_c20_Ib
     global Snp_c20_Ic
     global Snp_c20_Uab
     global Snp_c20_Ubc
     global Snp_c20_Uca
     global Snp_c20_Psum
     global Snp_c20_Ia_Level
     global Snp_c3_RPV
     global Snp_c7_RPV
     global Snp_c5_RPV
     global Snp_c9_RPV
     global Snp_c11_RPV
     global Snp_c13_RPV
     global Snp_c15_RPV
     global Snp_c17_RPV
     global Snp_c21_RPV
     global Snp_c6_RPV
     global Snp_c8_RPV
     global Snp_c14_RPV
     global Snp_c16_RPV
     global Snp_c18_RPV
     global Snp_c20_RPV
     global Snp_EV_110_T1_RPV
     global Snp_EV_110_T2_RPV
     global Snp_SEV_110_RPV
     global Snp_T1_Ia
     global Snp_T1_Ib
     global Snp_T1_Ic
     global Snp_T1_Uab
     global Snp_T1_Ubc
     global Snp_T1_Uca
     global Snp_T1_P
     global Snp_T2_Ia
     global Snp_T2_Ib
     global Snp_T2_Ic
     global Snp_T2_Uab
     global Snp_T2_Ubc
     global Snp_T2_Uca
     global Snp_T2_P
     global AI_TEST
     global DI_TEST
     global AllData
     Snp_VL_Kls_Uab=setVariables(Snp_VL_Kls_Uab,getData,'Snp_VL_Kls_Uab','Snp_VL_Kls_Uab','0','1','1','float','1')
     Snp_VL_Kls_Ubc=setVariables(Snp_VL_Kls_Ubc,getData,'Snp_VL_Kls_Ubc','Snp_VL_Kls_Ubc','0','1','1','float','1')
     Snp_VL_Kls_Uca=setVariables(Snp_VL_Kls_Uca,getData,'Snp_VL_Kls_Uca','Snp_VL_Kls_Uca','0','1','1','float','1')
     Snp_VL_Kls_Ia=setVariables(Snp_VL_Kls_Ia,getData,'Snp_VL_Kls_Ia','Snp_VL_Kls_Ia','0','1','1','float','1')
     Snp_VL_Kls_Ib=setVariables(Snp_VL_Kls_Ib,getData,'Snp_VL_Kls_Ib','Snp_VL_Kls_Ib','0','1','1','float','1')
     Snp_VL_Kls_Ic=setVariables(Snp_VL_Kls_Ic,getData,'Snp_VL_Kls_Ic','Snp_VL_Kls_Ic','0','1','1','float','1')
     Snp_VL_Kls_Psum=setVariables(Snp_VL_Kls_Psum,getData,'Snp_VL_Kls_Psum','Snp_VL_Kls_Psum','0','1','1','float','0.001')
     Snp_VL_Mch_Uab=setVariables(Snp_VL_Mch_Uab,getData,'Snp_VL_Mch_Uab','Snp_VL_Mch_Uab','0','1','1','float','1')
     Snp_VL_Mch_Ubc=setVariables(Snp_VL_Mch_Ubc,getData,'Snp_VL_Mch_Ubc','Snp_VL_Mch_Ubc','0','1','1','float','1')
     Snp_VL_Mch_Uca=setVariables(Snp_VL_Mch_Uca,getData,'Snp_VL_Mch_Uca','Snp_VL_Mch_Uca','0','1','1','float','1')
     Snp_VL_Mch_Ia=setVariables(Snp_VL_Mch_Ia,getData,'Snp_VL_Mch_Ia','Snp_VL_Mch_Ia','0','1','1','float','1')
     Snp_VL_Mch_Ib=setVariables(Snp_VL_Mch_Ib,getData,'Snp_VL_Mch_Ib','Snp_VL_Mch_Ib','0','1','1','float','1')
     Snp_VL_Mch_Ic=setVariables(Snp_VL_Mch_Ic,getData,'Snp_VL_Mch_Ic','Snp_VL_Mch_Ic','0','1','1','float','1')
     Snp_VL_Mch_Psum=setVariables(Snp_VL_Mch_Psum,getData,'Snp_VL_Mch_Psum','Snp_VL_Mch_Psum','0','1','1','float','0.001')
     Snp_c3_Ia=setVariables(Snp_c3_Ia,getData,'Snp_c3_Ia','Snp_c3_Ia','0','1','1','float','1')
     Snp_c3_Ib=setVariables(Snp_c3_Ib,getData,'Snp_c3_Ib','Snp_c3_Ib','0','1','1','float','1')
     Snp_c3_Ic=setVariables(Snp_c3_Ic,getData,'Snp_c3_Ic','Snp_c3_Ic','0','1','1','float','1')
     Snp_c3_Uab=setVariables(Snp_c3_Uab,getData,'Snp_c3_Uab','Snp_c3_Uab','0','1','1','float','1')
     Snp_c3_Ubc=setVariables(Snp_c3_Ubc,getData,'Snp_c3_Ubc','Snp_c3_Ubc','0','1','1','float','1')
     Snp_c3_Uca=setVariables(Snp_c3_Uca,getData,'Snp_c3_Uca','Snp_c3_Uca','0','1','1','float','1')
     Snp_c3_Psum=setVariables(Snp_c3_Psum,getData,'Snp_c3_Psum','Snp_c3_Psum','0','1','1','float','1')
     Snp_c3_Ia_Level=setVariables(Snp_c3_Ia_Level,getData,'Snp_c3_Ia','Snp_c3_Ia_Level','0','1','1','float','1')
     Snp_c5_Ia=setVariables(Snp_c5_Ia,getData,'Snp_c5_Ia','Snp_c5_Ia','0','1','1','float','1')
     Snp_c7_Ia=setVariables(Snp_c7_Ia,getData,'Snp_c7_Ia','Snp_c7_Ia','0','1','1','float','1')
     Snp_c9_Ia=setVariables(Snp_c9_Ia,getData,'Snp_c9_Ia','Snp_c9_Ia','0','1','1','float','1')
     Snp_c11_Ia=setVariables(Snp_c11_Ia,getData,'Snp_c11_Ia','Snp_c11_Ia','0','1','1','float','1')
     Snp_c13_Ia=setVariables(Snp_c13_Ia,getData,'Snp_c13_Ia','Snp_c13_Ia','0','1','1','float','1')
     Snp_c15_Ia=setVariables(Snp_c15_Ia,getData,'Snp_c15_Ia','Snp_c15_Ia','0','1','1','float','1')
     Snp_c17_Ia=setVariables(Snp_c17_Ia,getData,'Snp_c17_Ia','Snp_c17_Ia','0','1','1','float','1')
     Snp_c21_Ia=setVariables(Snp_c21_Ia,getData,'Snp_c21_Ia','Snp_c21_Ia','0','1','1','float','1')
     Snp_c6_Ia=setVariables(Snp_c6_Ia,getData,'Snp_c6_Ia','Snp_c6_Ia','0','1','1','float','1')
     Snp_c8_Ia=setVariables(Snp_c8_Ia,getData,'Snp_c8_Ia','Snp_c8_Ia','0','1','1','float','1')
     Snp_c14_Ia=setVariables(Snp_c14_Ia,getData,'Snp_c14_Ia','Snp_c14_Ia','0','1','1','float','1')
     Snp_c16_Ia=setVariables(Snp_c16_Ia,getData,'Snp_c16_Ia','Snp_c16_Ia','0','1','1','float','1')
     Snp_c18_Ia=setVariables(Snp_c18_Ia,getData,'Snp_c18_Ia','Snp_c18_Ia','0','1','1','float','1')
     Snp_c20_Ia=setVariables(Snp_c20_Ia,getData,'Snp_c20_Ia','Snp_c20_Ia','0','1','1','float','1')
     Snp_c20_Ib=setVariables(Snp_c20_Ib,getData,'Snp_c20_Ib','Snp_c20_Ib','0','1','1','float','1')
     Snp_c20_Ic=setVariables(Snp_c20_Ic,getData,'Snp_c20_Ic','Snp_c20_Ic','0','1','1','float','1')
     Snp_c20_Uab=setVariables(Snp_c20_Uab,getData,'Snp_c20_Uab','Snp_c20_Uab','0','1','1','float','1')
     Snp_c20_Ubc=setVariables(Snp_c20_Ubc,getData,'Snp_c20_Ubc','Snp_c20_Ubc','0','1','1','float','1')
     Snp_c20_Uca=setVariables(Snp_c20_Uca,getData,'Snp_c20_Uca','Snp_c20_Uca','0','1','1','float','1')
     Snp_c20_Psum=setVariables(Snp_c20_Psum,getData,'Snp_c20_Psum','Snp_c20_Psum','0','1','1','float','1')
     Snp_c20_Ia_Level=setVariables(Snp_c20_Ia_Level,getData,'Snp_c20_Ia','Snp_c20_Ia_Level','0','1','1','float','1')
     Snp_c3_RPV=setVariables(Snp_c3_RPV,getData,'Snp_c3_RPV','Snp_c3_RPV','0','1','1','bool','1')
     Snp_c7_RPV=setVariables(Snp_c7_RPV,getData,'Snp_c7_RPV','Snp_c7_RPV','0','1','1','bool','1')
     Snp_c5_RPV=setVariables(Snp_c5_RPV,getData,'Snp_c5_RPV','Snp_c5_RPV','0','1','1','bool','1')
     Snp_c9_RPV=setVariables(Snp_c9_RPV,getData,'Snp_c9_RPV','Snp_c9_RPV','0','1','1','bool','1')
     Snp_c11_RPV=setVariables(Snp_c11_RPV,getData,'Snp_c11_RPV','Snp_c11_RPV','0','1','1','bool','1')
     Snp_c13_RPV=setVariables(Snp_c13_RPV,getData,'Snp_c13_RPV','Snp_c13_RPV','0','1','1','bool','1')
     Snp_c15_RPV=setVariables(Snp_c15_RPV,getData,'Snp_c15_RPV','Snp_c15_RPV','0','1','1','bool','1')
     Snp_c17_RPV=setVariables(Snp_c17_RPV,getData,'Snp_c17_RPV','Snp_c17_RPV','0','1','1','bool','1')
     Snp_c21_RPV=setVariables(Snp_c21_RPV,getData,'Snp_c21_RPV','Snp_c21_RPV','0','1','1','bool','1')
     Snp_c6_RPV=setVariables(Snp_c6_RPV,getData,'Snp_c6_RPV','Snp_c6_RPV','0','1','1','bool','1')
     Snp_c8_RPV=setVariables(Snp_c8_RPV,getData,'Snp_c8_RPV','Snp_c8_RPV','0','1','1','bool','1')
     Snp_c14_RPV=setVariables(Snp_c14_RPV,getData,'Snp_c14_RPV','Snp_c14_RPV','0','1','1','bool','1')
     Snp_c16_RPV=setVariables(Snp_c16_RPV,getData,'Snp_c16_RPV','Snp_c16_RPV','0','1','1','bool','1')
     Snp_c18_RPV=setVariables(Snp_c18_RPV,getData,'Snp_c18_RPV','Snp_c18_RPV','0','1','1','bool','1')
     Snp_c20_RPV=setVariables(Snp_c20_RPV,getData,'Snp_c20_RPV','Snp_c20_RPV','0','1','1','bool','1')
     Snp_EV_110_T1_RPV=setVariables(Snp_EV_110_T1_RPV,getData,'Snp_EV_110_T1_RPV','Snp_EV_110_T1_RPV','0','1','1','bool','1')
     Snp_EV_110_T2_RPV=setVariables(Snp_EV_110_T2_RPV,getData,'Snp_EV_110_T2_RPV','Snp_EV_110_T2_RPV','0','1','1','bool','1')
     Snp_SEV_110_RPV=setVariables(Snp_SEV_110_RPV,getData,'Snp_SEV_110_RPV','Snp_SEV_110_RPV','0','1','1','bool','1')
     Snp_T1_Ia=setVariables(Snp_T1_Ia,getData,'Snp_T1_Ia','Snp_T1_Ia','0','1','1','float','1')
     Snp_T1_Ib=setVariables(Snp_T1_Ib,getData,'Snp_T1_Ib','Snp_T1_Ib','0','1','1','float','1')
     Snp_T1_Ic=setVariables(Snp_T1_Ic,getData,'Snp_T1_Ic','Snp_T1_Ic','0','1','1','float','1')
     Snp_T1_Uab=setVariables(Snp_T1_Uab,getData,'Snp_T1_Uab','Snp_T1_Uab','0','1','1','float','1')
     Snp_T1_Ubc=setVariables(Snp_T1_Ubc,getData,'Snp_T1_Ubc','Snp_T1_Ubc','0','1','1','float','1')
     Snp_T1_Uca=setVariables(Snp_T1_Uca,getData,'Snp_T1_Uca','Snp_T1_Uca','0','1','1','float','1')
     Snp_T1_P=setVariables(Snp_T1_P,getData,'Snp_T1_P','Snp_T1_P','0','1','1','float','0.001')
     Snp_T2_Ia=setVariables(Snp_T2_Ia,getData,'Snp_T2_Ia','Snp_T2_Ia','0','1','1','float','1')
     Snp_T2_Ib=setVariables(Snp_T2_Ib,getData,'Snp_T2_Ib','Snp_T2_Ib','0','1','1','float','1')
     Snp_T2_Ic=setVariables(Snp_T2_Ic,getData,'Snp_T2_Ic','Snp_T2_Ic','0','1','1','float','1')
     Snp_T2_Uab=setVariables(Snp_T2_Uab,getData,'Snp_T2_Uab','Snp_T2_Uab','0','1','1','float','1')
     Snp_T2_Ubc=setVariables(Snp_T2_Ubc,getData,'Snp_T2_Ubc','Snp_T2_Ubc','0','1','1','float','1')
     Snp_T2_Uca=setVariables(Snp_T2_Uca,getData,'Snp_T2_Uca','Snp_T2_Uca','0','1','1','float','1')
     Snp_T2_P=setVariables(Snp_T2_P,getData,'Snp_T2_P','Snp_T2_P','0','1','1','float','0.001')
#-----------------------------------------------------------------------------------
     AllData=[Snp_VL_Kls_Uab,Snp_VL_Kls_Ubc,Snp_VL_Kls_Uca,Snp_VL_Kls_Ia,Snp_VL_Kls_Ib,Snp_VL_Kls_Ic,Snp_VL_Kls_Psum,Snp_VL_Mch_Uab,Snp_VL_Mch_Ubc,Snp_VL_Mch_Uca,Snp_VL_Mch_Ia,Snp_VL_Mch_Ib,Snp_VL_Mch_Ic,Snp_VL_Mch_Psum,Snp_c3_Ia,Snp_c3_Ib,Snp_c3_Ic,Snp_c3_Uab,Snp_c3_Ubc,Snp_c3_Uca,Snp_c3_Psum,Snp_c3_Ia_Level,Snp_c5_Ia,Snp_c7_Ia,Snp_c9_Ia,Snp_c11_Ia,Snp_c13_Ia,Snp_c15_Ia,Snp_c17_Ia,Snp_c21_Ia,Snp_c6_Ia,Snp_c8_Ia,Snp_c14_Ia,Snp_c16_Ia,Snp_c18_Ia,Snp_c20_Ia,Snp_c20_Ib,Snp_c20_Ic,Snp_c20_Uab,Snp_c20_Ubc,Snp_c20_Uca,Snp_c20_Psum,Snp_c20_Ia_Level,Snp_c3_RPV,Snp_c7_RPV,Snp_c5_RPV,Snp_c9_RPV,Snp_c11_RPV,Snp_c13_RPV,Snp_c15_RPV,Snp_c17_RPV,Snp_c21_RPV,Snp_c6_RPV,Snp_c8_RPV,Snp_c14_RPV,Snp_c16_RPV,Snp_c18_RPV,Snp_c20_RPV,Snp_EV_110_T1_RPV,Snp_EV_110_T2_RPV,Snp_SEV_110_RPV,Snp_T1_Ia,Snp_T1_Ib,Snp_T1_Ic,Snp_T1_Uab,Snp_T1_Ubc,Snp_T1_Uca,Snp_T1_P,Snp_T2_Ia,Snp_T2_Ib,Snp_T2_Ic,Snp_T2_Uab,Snp_T2_Ubc,Snp_T2_Uca,Snp_T2_P,]
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
             if(dataType=='intSigned'):
                 if(count=='1'):
                     temp2=(int(temp[int(address)]) + 2**15) % 2**16 - 2**15
                     varData=temp2
                 if(count=='2' and sequence=='12'):
                     temp2= ((int(temp[int(address)])<<16) + int(temp[int(address)+1]) + 2**31) % 2**32 - 2**31
                     varData=temp2
                 if(count=='2' and sequence=='21'):
                     temp2= ((int(temp[int(address)+1])<<16) + int(temp[int(address)]) + 2**31) % 2**32 - 2**31 
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
             returnData={varName:varData}
             return returnData
         else:
             varData={varName:'Error'}
             return varData
     else:
         return None
def udpserv(i=1):
     global udpdata 
     try:
         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
         server_address = ('localhost', 64000)
         print('starting up on {} port {}'.format(*server_address))
         sock.bind(server_address)
         while True:
             data, address = sock.recvfrom(4096)
             udpdata=data
             SelectData(udpdata)
     except Exception as e:
         print(e)
def run(server_class=HTTPServer, handler_class=S, port=8080):
     server_address = (serverSlave, int(portSlave))
     httpd = server_class(server_address, handler_class)
     print('Starting httpd...\n')
     try:
         httpd.serve_forever()
     except Exception as e:
         print(e)
         pass
     httpd.server_close() 
if __name__ == "__main__": 
     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'')
     Snp_VL_Kls_Uab=''
     Snp_VL_Kls_Ubc=''
     Snp_VL_Kls_Uca=''
     Snp_VL_Kls_Ia=''
     Snp_VL_Kls_Ib=''
     Snp_VL_Kls_Ic=''
     Snp_VL_Kls_Psum=''
     Snp_VL_Mch_Uab=''
     Snp_VL_Mch_Ubc=''
     Snp_VL_Mch_Uca=''
     Snp_VL_Mch_Ia=''
     Snp_VL_Mch_Ib=''
     Snp_VL_Mch_Ic=''
     Snp_VL_Mch_Psum=''
     Snp_c3_Ia=''
     Snp_c3_Ib=''
     Snp_c3_Ic=''
     Snp_c3_Uab=''
     Snp_c3_Ubc=''
     Snp_c3_Uca=''
     Snp_c3_Psum=''
     Snp_c3_Ia_Level=''
     Snp_c5_Ia=''
     Snp_c7_Ia=''
     Snp_c9_Ia=''
     Snp_c11_Ia=''
     Snp_c13_Ia=''
     Snp_c15_Ia=''
     Snp_c17_Ia=''
     Snp_c21_Ia=''
     Snp_c6_Ia=''
     Snp_c8_Ia=''
     Snp_c14_Ia=''
     Snp_c16_Ia=''
     Snp_c18_Ia=''
     Snp_c20_Ia=''
     Snp_c20_Ib=''
     Snp_c20_Ic=''
     Snp_c20_Uab=''
     Snp_c20_Ubc=''
     Snp_c20_Uca=''
     Snp_c20_Psum=''
     Snp_c20_Ia_Level=''
     Snp_c3_RPV=''
     Snp_c7_RPV=''
     Snp_c5_RPV=''
     Snp_c9_RPV=''
     Snp_c11_RPV=''
     Snp_c13_RPV=''
     Snp_c15_RPV=''
     Snp_c17_RPV=''
     Snp_c21_RPV=''
     Snp_c6_RPV=''
     Snp_c8_RPV=''
     Snp_c14_RPV=''
     Snp_c16_RPV=''
     Snp_c18_RPV=''
     Snp_c20_RPV=''
     Snp_EV_110_T1_RPV=''
     Snp_EV_110_T2_RPV=''
     Snp_SEV_110_RPV=''
     Snp_T1_Ia=''
     Snp_T1_Ib=''
     Snp_T1_Ic=''
     Snp_T1_Uab=''
     Snp_T1_Ubc=''
     Snp_T1_Uca=''
     Snp_T1_P=''
     Snp_T2_Ia=''
     Snp_T2_Ib=''
     Snp_T2_Ic=''
     Snp_T2_Uab=''
     Snp_T2_Ubc=''
     Snp_T2_Uca=''
     Snp_T2_P=''
     AI_TEST=''
     DI_TEST=''
     AllData=''
     try: 
         print( 'Starting web server...')
         serverSlave='127.0.0.1'
         portSlave='8080'
         timeOut=2 
         login='root'
         password='root'
         set_auth(login,password)
         modb = threading.Thread(target=udpserv,args=(1,)) 
         modb.daemon = True
         modb.start()
         run()
     except Exception as e:
         print(e)

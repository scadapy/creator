# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.8.1  21.08.2018 
## UDP server Tk-inter by Jack Mas
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import sys
import os
import time
import datetime
import gc
from tkinter import *
import json
from datetime import datetime
from enum import Enum, IntEnum
import uuid
import socket
import struct
import threading
def PBarC(nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient):
     c = Canvas(root,width=widgLen,height=widgHigh,bg=canvasColor, highlightthickness=0, relief='ridge')
     c.place(x=x, y=y)
     ar=c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient
     if(orient=='pbHorizontal'):
         PBar(ar)
     if(orient=='pbVertical'):
         PBar(ar)
     return [c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient]
def PBar(arrayData):
     c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient=arrayData 
     c.delete("all")
     if(orient=='pbHorizontal'):
         if(nowValue > maxValue): nowValue=maxValue-1 
         devValue=float(widgLen) / float(maxValue)
         mesureValue = devValue * nowValue
         c.create_rectangle(0,0,int(mesureValue),widgHigh,fill=barColor,outline=barColor)
         c.create_text(widgLen/2 -10,widgHigh-9,font="Arial 12",anchor="w",justify=CENTER,fill='black',text=str(nowValue)) 
     if(orient=='pbVertical'):
         if(nowValue > maxValue): nowValue=maxValue-1
         devValue=float(widgHigh) / float(maxValue)
         mesureValue = devValue * nowValue
         c.create_rectangle(widgLen,widgHigh,0,widgHigh-int(mesureValue),fill=barColor,outline=barColor)
def TEditObject(x,y,w,h,fontName,colorName,fillName,valueVar):
     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline=fillName)
     aiFig=canv.create_text(x+5,y+(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)
     return aiFig
def TLabelObject(x,y,w,h,fontName,colorName,fillName,valueVar):
     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline=fillName)
     aiFig=canv.create_text(x,y+(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)
def TStaticTextObject(x,y,w,h,fontName,colorName,fillName,valueVar):
     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline='black')
     aiFig=canv.create_text(x+5,y+h-(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)
def TDiscretObject(x,y,w,h,fillName):
     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName)
     return diFig
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
     AllData=[Snp_VL_Kls_Uab,Snp_VL_Kls_Ubc,Snp_VL_Kls_Uca,Snp_VL_Kls_Ia,Snp_VL_Kls_Ib,Snp_VL_Kls_Ic,Snp_VL_Kls_Psum,Snp_VL_Mch_Uab,Snp_VL_Mch_Ubc,Snp_VL_Mch_Uca,Snp_VL_Mch_Ia,Snp_VL_Mch_Ib,Snp_VL_Mch_Ic,Snp_VL_Mch_Psum,Snp_c3_Ia,Snp_c3_Ib,Snp_c3_Ic,Snp_c3_Uab,Snp_c3_Ubc,Snp_c3_Uca,Snp_c3_Psum,Snp_c3_Ia_Level,Snp_c5_Ia,Snp_c7_Ia,Snp_c9_Ia,Snp_c11_Ia,Snp_c13_Ia,Snp_c15_Ia,Snp_c17_Ia,Snp_c21_Ia,Snp_c6_Ia,Snp_c8_Ia,Snp_c14_Ia,Snp_c16_Ia,Snp_c18_Ia,Snp_c20_Ia,Snp_c20_Ib,Snp_c20_Ic,Snp_c20_Uab,Snp_c20_Ubc,Snp_c20_Uca,Snp_c20_Psum,Snp_c20_Ia_Level,Snp_c3_RPV,Snp_c7_RPV,Snp_c5_RPV,Snp_c9_RPV,Snp_c11_RPV,Snp_c13_RPV,Snp_c15_RPV,Snp_c17_RPV,Snp_c21_RPV,Snp_c6_RPV,Snp_c8_RPV,Snp_c14_RPV,Snp_c16_RPV,Snp_c18_RPV,Snp_c20_RPV,Snp_EV_110_T1_RPV,Snp_EV_110_T2_RPV,Snp_SEV_110_RPV,Snp_T1_Ia,Snp_T1_Ib,Snp_T1_Ic,Snp_T1_Uab,Snp_T1_Ubc,Snp_T1_Uca,Snp_T1_P,Snp_T2_Ia,Snp_T2_Ib,Snp_T2_Ic,Snp_T2_Uab,Snp_T2_Ubc,Snp_T2_Uca,Snp_T2_P,]
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
#-----------------------------------------------------------------------------------
def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):
     varData=None
     if(json.loads( getData.decode("utf-8") )['name'] == source):
         temp=json.loads( getData.decode("utf-8") )['data']
         if(temp!='Error'):
             if(dataType=='float'):
                 if(count=='1'):
                     temp2=temp[int(address)]
                     varData=round(float(temp2),2) 
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
                         temp2=1
                     if(int(temp[int(address)]) == 0):
                         temp2=0
                     varData=temp2
             if(dataType=='string'):
                     temp2=temp[ int(address)]
                     varData=temp2
             try:
                 mult=int(multiply)
             except Exception as e:
                 mult=float(multiply)
             if(dataType=='integer' or dataType=='float'):
                 varData=round(varData*mult,2)
             returnData=varData
             return returnData
         else:
             varData='Error'
             return varData
     else:
         return None
def initDI(diName,diHandle):
     if(diName==0): 
          canv.itemconfig(diHandle,fill="lime")
     else:
          canv.itemconfig(diHandle,fill="red") 
def setDI(getData):
     try:
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c3_RPV,hSnp_c3_RPV)
                 else: 
                     canv.itemconfig(hSnp_c3_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c7_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c7_RPV,hSnp_c7_RPV)
                 else: 
                     canv.itemconfig(hSnp_c7_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c5_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c5_RPV,hSnp_c5_RPV)
                 else: 
                     canv.itemconfig(hSnp_c5_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c9_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c9_RPV,hSnp_c9_RPV)
                 else: 
                     canv.itemconfig(hSnp_c9_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c11_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c11_RPV,hSnp_c11_RPV)
                 else: 
                     canv.itemconfig(hSnp_c11_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c13_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c13_RPV,hSnp_c13_RPV)
                 else: 
                     canv.itemconfig(hSnp_c13_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c15_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c15_RPV,hSnp_c15_RPV)
                 else: 
                     canv.itemconfig(hSnp_c15_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c17_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c17_RPV,hSnp_c17_RPV)
                 else: 
                     canv.itemconfig(hSnp_c17_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c21_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c21_RPV,hSnp_c21_RPV)
                 else: 
                     canv.itemconfig(hSnp_c21_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c6_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c6_RPV,hSnp_c6_RPV)
                 else: 
                     canv.itemconfig(hSnp_c6_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c8_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c8_RPV,hSnp_c8_RPV)
                 else: 
                     canv.itemconfig(hSnp_c8_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c14_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c14_RPV,hSnp_c14_RPV)
                 else: 
                     canv.itemconfig(hSnp_c14_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c16_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c16_RPV,hSnp_c16_RPV)
                 else: 
                     canv.itemconfig(hSnp_c16_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c18_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c18_RPV,hSnp_c18_RPV)
                 else: 
                     canv.itemconfig(hSnp_c18_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_c20_RPV,hSnp_c20_RPV)
                 else: 
                     canv.itemconfig(hSnp_c20_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_EV_110_T1_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_EV_110_T1_RPV,hSnp_EV_110_T1_RPV)
                 else: 
                     canv.itemconfig(hSnp_EV_110_T1_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_EV_110_T2_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_EV_110_T2_RPV,hSnp_EV_110_T2_RPV)
                 else: 
                     canv.itemconfig(hSnp_EV_110_T2_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_SEV_110_RPV'):
             try:
                 if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                     initDI(Snp_SEV_110_RPV,hSnp_SEV_110_RPV)
                 else: 
                     canv.itemconfig(hSnp_SEV_110_RPV,fill="yellow")
                 pass
             except Exception as e:
                pass
         pass
     except Exception as e:
         pass
def setAI(getData):
     try:
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Uab,text=Snp_VL_Kls_Uab)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Ubc,text=Snp_VL_Kls_Ubc)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Uca,text=Snp_VL_Kls_Uca)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Ia,text=Snp_VL_Kls_Ia)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Ib,text=Snp_VL_Kls_Ib)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Ic,text=Snp_VL_Kls_Ic)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Psum'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Kls_Psum,text=Snp_VL_Kls_Psum)
                  else: 
                         canv.itemconfig(hSnp_VL_Kls_Psum,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Uab,text=Snp_VL_Mch_Uab)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Ubc,text=Snp_VL_Mch_Ubc)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Uca,text=Snp_VL_Mch_Uca)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Ia,text=Snp_VL_Mch_Ia)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Ib,text=Snp_VL_Mch_Ib)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Ic,text=Snp_VL_Mch_Ic)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Psum'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_VL_Mch_Psum,text=Snp_VL_Mch_Psum)
                  else: 
                         canv.itemconfig(hSnp_VL_Mch_Psum,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Ia,text=Snp_c3_Ia)
                  else: 
                         canv.itemconfig(hSnp_c3_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Ib,text=Snp_c3_Ib)
                  else: 
                         canv.itemconfig(hSnp_c3_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Ic,text=Snp_c3_Ic)
                  else: 
                         canv.itemconfig(hSnp_c3_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Uab,text=Snp_c3_Uab)
                  else: 
                         canv.itemconfig(hSnp_c3_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Ubc,text=Snp_c3_Ubc)
                  else: 
                         canv.itemconfig(hSnp_c3_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Uca,text=Snp_c3_Uca)
                  else: 
                         canv.itemconfig(hSnp_c3_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Psum'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Psum,text=Snp_c3_Psum)
                  else: 
                         canv.itemconfig(hSnp_c3_Psum,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c3_Ia_Level,text=Snp_c3_Ia_Level)
                  else: 
                         canv.itemconfig(hSnp_c3_Ia_Level,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c5_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c5_Ia,text=Snp_c5_Ia)
                  else: 
                         canv.itemconfig(hSnp_c5_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c7_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c7_Ia,text=Snp_c7_Ia)
                  else: 
                         canv.itemconfig(hSnp_c7_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c9_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c9_Ia,text=Snp_c9_Ia)
                  else: 
                         canv.itemconfig(hSnp_c9_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c11_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c11_Ia,text=Snp_c11_Ia)
                  else: 
                         canv.itemconfig(hSnp_c11_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c13_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c13_Ia,text=Snp_c13_Ia)
                  else: 
                         canv.itemconfig(hSnp_c13_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c15_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c15_Ia,text=Snp_c15_Ia)
                  else: 
                         canv.itemconfig(hSnp_c15_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c17_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c17_Ia,text=Snp_c17_Ia)
                  else: 
                         canv.itemconfig(hSnp_c17_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c21_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c21_Ia,text=Snp_c21_Ia)
                  else: 
                         canv.itemconfig(hSnp_c21_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c6_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c6_Ia,text=Snp_c6_Ia)
                  else: 
                         canv.itemconfig(hSnp_c6_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c8_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c8_Ia,text=Snp_c8_Ia)
                  else: 
                         canv.itemconfig(hSnp_c8_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c14_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c14_Ia,text=Snp_c14_Ia)
                  else: 
                         canv.itemconfig(hSnp_c14_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c16_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c16_Ia,text=Snp_c16_Ia)
                  else: 
                         canv.itemconfig(hSnp_c16_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c18_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c18_Ia,text=Snp_c18_Ia)
                  else: 
                         canv.itemconfig(hSnp_c18_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Ia,text=Snp_c20_Ia)
                  else: 
                         canv.itemconfig(hSnp_c20_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Ib,text=Snp_c20_Ib)
                  else: 
                         canv.itemconfig(hSnp_c20_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Ic,text=Snp_c20_Ic)
                  else: 
                         canv.itemconfig(hSnp_c20_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Uab,text=Snp_c20_Uab)
                  else: 
                         canv.itemconfig(hSnp_c20_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Ubc,text=Snp_c20_Ubc)
                  else: 
                         canv.itemconfig(hSnp_c20_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Uca,text=Snp_c20_Uca)
                  else: 
                         canv.itemconfig(hSnp_c20_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Psum'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Psum,text=Snp_c20_Psum)
                  else: 
                         canv.itemconfig(hSnp_c20_Psum,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_c20_Ia_Level,text=Snp_c20_Ia_Level)
                  else: 
                         canv.itemconfig(hSnp_c20_Ia_Level,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Ia,text=Snp_T1_Ia)
                  else: 
                         canv.itemconfig(hSnp_T1_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Ib,text=Snp_T1_Ib)
                  else: 
                         canv.itemconfig(hSnp_T1_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Ic,text=Snp_T1_Ic)
                  else: 
                         canv.itemconfig(hSnp_T1_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Uab,text=Snp_T1_Uab)
                  else: 
                         canv.itemconfig(hSnp_T1_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Ubc,text=Snp_T1_Ubc)
                  else: 
                         canv.itemconfig(hSnp_T1_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_Uca,text=Snp_T1_Uca)
                  else: 
                         canv.itemconfig(hSnp_T1_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_P'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T1_P,text=Snp_T1_P)
                  else: 
                         canv.itemconfig(hSnp_T1_P,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ia'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Ia,text=Snp_T2_Ia)
                  else: 
                         canv.itemconfig(hSnp_T2_Ia,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ib'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Ib,text=Snp_T2_Ib)
                  else: 
                         canv.itemconfig(hSnp_T2_Ib,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ic'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Ic,text=Snp_T2_Ic)
                  else: 
                         canv.itemconfig(hSnp_T2_Ic,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Uab'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Uab,text=Snp_T2_Uab)
                  else: 
                         canv.itemconfig(hSnp_T2_Uab,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ubc'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Ubc,text=Snp_T2_Ubc)
                  else: 
                         canv.itemconfig(hSnp_T2_Ubc,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Uca'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_Uca,text=Snp_T2_Uca)
                  else: 
                         canv.itemconfig(hSnp_T2_Uca,text='---')
                  pass
             except Exception as e:
                 pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_P'):
             try:
                  if(json.loads(getData.decode("utf-8") )['con'][0]==1 or json.loads(getData.decode("utf-8") )['q'][0]==0 ):
                         canv.itemconfig(hSnp_T2_P,text=Snp_T2_P)
                  else: 
                         canv.itemconfig(hSnp_T2_P,text='---')
                  pass
             except Exception as e:
                 pass
         pass
     except Exception as e:
         pass
def setPBarMeter(getData):
     try:
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Uab'):
              try:
                   mSnp_VL_Kls_Uab[1]=Snp_VL_Kls_Uab
                   PBar(mSnp_VL_Kls_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ubc'):
              try:
                   mSnp_VL_Kls_Ubc[1]=Snp_VL_Kls_Ubc
                   PBar(mSnp_VL_Kls_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Uca'):
              try:
                   mSnp_VL_Kls_Uca[1]=Snp_VL_Kls_Uca
                   PBar(mSnp_VL_Kls_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ia'):
              try:
                   mSnp_VL_Kls_Ia[1]=Snp_VL_Kls_Ia
                   PBar(mSnp_VL_Kls_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ib'):
              try:
                   mSnp_VL_Kls_Ib[1]=Snp_VL_Kls_Ib
                   PBar(mSnp_VL_Kls_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Ic'):
              try:
                   mSnp_VL_Kls_Ic[1]=Snp_VL_Kls_Ic
                   PBar(mSnp_VL_Kls_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Kls_Psum'):
              try:
                   mSnp_VL_Kls_Psum[1]=Snp_VL_Kls_Psum
                   PBar(mSnp_VL_Kls_Psum)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Uab'):
              try:
                   mSnp_VL_Mch_Uab[1]=Snp_VL_Mch_Uab
                   PBar(mSnp_VL_Mch_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ubc'):
              try:
                   mSnp_VL_Mch_Ubc[1]=Snp_VL_Mch_Ubc
                   PBar(mSnp_VL_Mch_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Uca'):
              try:
                   mSnp_VL_Mch_Uca[1]=Snp_VL_Mch_Uca
                   PBar(mSnp_VL_Mch_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ia'):
              try:
                   mSnp_VL_Mch_Ia[1]=Snp_VL_Mch_Ia
                   PBar(mSnp_VL_Mch_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ib'):
              try:
                   mSnp_VL_Mch_Ib[1]=Snp_VL_Mch_Ib
                   PBar(mSnp_VL_Mch_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Ic'):
              try:
                   mSnp_VL_Mch_Ic[1]=Snp_VL_Mch_Ic
                   PBar(mSnp_VL_Mch_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_VL_Mch_Psum'):
              try:
                   mSnp_VL_Mch_Psum[1]=Snp_VL_Mch_Psum
                   PBar(mSnp_VL_Mch_Psum)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ia'):
              try:
                   mSnp_c3_Ia[1]=Snp_c3_Ia
                   PBar(mSnp_c3_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ib'):
              try:
                   mSnp_c3_Ib[1]=Snp_c3_Ib
                   PBar(mSnp_c3_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ic'):
              try:
                   mSnp_c3_Ic[1]=Snp_c3_Ic
                   PBar(mSnp_c3_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Uab'):
              try:
                   mSnp_c3_Uab[1]=Snp_c3_Uab
                   PBar(mSnp_c3_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ubc'):
              try:
                   mSnp_c3_Ubc[1]=Snp_c3_Ubc
                   PBar(mSnp_c3_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Uca'):
              try:
                   mSnp_c3_Uca[1]=Snp_c3_Uca
                   PBar(mSnp_c3_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Psum'):
              try:
                   mSnp_c3_Psum[1]=Snp_c3_Psum
                   PBar(mSnp_c3_Psum)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c3_Ia'):
              try:
                   mSnp_c3_Ia_Level[1]=Snp_c3_Ia_Level
                   PBar(mSnp_c3_Ia_Level)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c5_Ia'):
              try:
                   mSnp_c5_Ia[1]=Snp_c5_Ia
                   PBar(mSnp_c5_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c7_Ia'):
              try:
                   mSnp_c7_Ia[1]=Snp_c7_Ia
                   PBar(mSnp_c7_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c9_Ia'):
              try:
                   mSnp_c9_Ia[1]=Snp_c9_Ia
                   PBar(mSnp_c9_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c11_Ia'):
              try:
                   mSnp_c11_Ia[1]=Snp_c11_Ia
                   PBar(mSnp_c11_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c13_Ia'):
              try:
                   mSnp_c13_Ia[1]=Snp_c13_Ia
                   PBar(mSnp_c13_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c15_Ia'):
              try:
                   mSnp_c15_Ia[1]=Snp_c15_Ia
                   PBar(mSnp_c15_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c17_Ia'):
              try:
                   mSnp_c17_Ia[1]=Snp_c17_Ia
                   PBar(mSnp_c17_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c21_Ia'):
              try:
                   mSnp_c21_Ia[1]=Snp_c21_Ia
                   PBar(mSnp_c21_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c6_Ia'):
              try:
                   mSnp_c6_Ia[1]=Snp_c6_Ia
                   PBar(mSnp_c6_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c8_Ia'):
              try:
                   mSnp_c8_Ia[1]=Snp_c8_Ia
                   PBar(mSnp_c8_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c14_Ia'):
              try:
                   mSnp_c14_Ia[1]=Snp_c14_Ia
                   PBar(mSnp_c14_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c16_Ia'):
              try:
                   mSnp_c16_Ia[1]=Snp_c16_Ia
                   PBar(mSnp_c16_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c18_Ia'):
              try:
                   mSnp_c18_Ia[1]=Snp_c18_Ia
                   PBar(mSnp_c18_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ia'):
              try:
                   mSnp_c20_Ia[1]=Snp_c20_Ia
                   PBar(mSnp_c20_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ib'):
              try:
                   mSnp_c20_Ib[1]=Snp_c20_Ib
                   PBar(mSnp_c20_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ic'):
              try:
                   mSnp_c20_Ic[1]=Snp_c20_Ic
                   PBar(mSnp_c20_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Uab'):
              try:
                   mSnp_c20_Uab[1]=Snp_c20_Uab
                   PBar(mSnp_c20_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ubc'):
              try:
                   mSnp_c20_Ubc[1]=Snp_c20_Ubc
                   PBar(mSnp_c20_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Uca'):
              try:
                   mSnp_c20_Uca[1]=Snp_c20_Uca
                   PBar(mSnp_c20_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Psum'):
              try:
                   mSnp_c20_Psum[1]=Snp_c20_Psum
                   PBar(mSnp_c20_Psum)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_c20_Ia'):
              try:
                   mSnp_c20_Ia_Level[1]=Snp_c20_Ia_Level
                   PBar(mSnp_c20_Ia_Level)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ia'):
              try:
                   mSnp_T1_Ia[1]=Snp_T1_Ia
                   PBar(mSnp_T1_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ib'):
              try:
                   mSnp_T1_Ib[1]=Snp_T1_Ib
                   PBar(mSnp_T1_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ic'):
              try:
                   mSnp_T1_Ic[1]=Snp_T1_Ic
                   PBar(mSnp_T1_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Uab'):
              try:
                   mSnp_T1_Uab[1]=Snp_T1_Uab
                   PBar(mSnp_T1_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Ubc'):
              try:
                   mSnp_T1_Ubc[1]=Snp_T1_Ubc
                   PBar(mSnp_T1_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_Uca'):
              try:
                   mSnp_T1_Uca[1]=Snp_T1_Uca
                   PBar(mSnp_T1_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T1_P'):
              try:
                   mSnp_T1_P[1]=Snp_T1_P
                   PBar(mSnp_T1_P)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ia'):
              try:
                   mSnp_T2_Ia[1]=Snp_T2_Ia
                   PBar(mSnp_T2_Ia)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ib'):
              try:
                   mSnp_T2_Ib[1]=Snp_T2_Ib
                   PBar(mSnp_T2_Ib)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ic'):
              try:
                   mSnp_T2_Ic[1]=Snp_T2_Ic
                   PBar(mSnp_T2_Ic)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Uab'):
              try:
                   mSnp_T2_Uab[1]=Snp_T2_Uab
                   PBar(mSnp_T2_Uab)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Ubc'):
              try:
                   mSnp_T2_Ubc[1]=Snp_T2_Ubc
                   PBar(mSnp_T2_Ubc)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_Uca'):
              try:
                   mSnp_T2_Uca[1]=Snp_T2_Uca
                   PBar(mSnp_T2_Uca)
                   pass
              except Exception as e:
                   pass
         if(json.loads(getData.decode("utf-8") )['name'] == 'Snp_T2_P'):
              try:
                   mSnp_T2_P[1]=Snp_T2_P
                   PBar(mSnp_T2_P)
                   pass
              except Exception as e:
                   pass
         pass
     except Exception as e:
         pass
def udpserv(i=1):
     global udpdata 
     try:
         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
         server_address = ('127.0.0.1',64000)
         print('starting up on {} port {}'.format(*server_address))
         sock.bind(server_address)
         while True:
             data, address = sock.recvfrom(4096)
             udpdata=data
             print('Get ',udpdata)
             try:
                 SelectData(udpdata)
                 setDI(udpdata)
                 setAI(udpdata)
                 setPBarMeter(udpdata)
             except Exception as e:
                 print(e)
                 pass
     except Exception as e:
         print(e)
if __name__ == "__main__":
     root = Tk()
     root.title("ScadaPy Creator v.3.8.1  Snp-110") 
     if(os.name=='nt'): root.state("zoomed")  
     else:  root.state("normal")
     root["bg"] = "white" 
     canv = Canvas(root,width='1600',height='900',bg="#505050",bd=0, highlightthickness=0, relief='ridge')
     canv.place(x=0, y=0)
     try: 
         im = PhotoImage(file='C:\\scadapy\\381\\github\\projects\\ps110kv\\sinop2.png')
         canv.create_image(1, 1,anchor=NW, image=im) 
     except:  
         pass 
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
     hSnp_VL_Mch_Ia=TEditObject(389,45,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Ib=TEditObject(389,72,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Ic=TEditObject(389,99,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Uca=TEditObject(389,180,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Psum=TEditObject(389,207,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Ubc=TEditObject(389,153,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Mch_Uab=TEditObject(389,126,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Uca=TEditObject(1554,180,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Ubc=TEditObject(1554,153,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Uab=TEditObject(1554,126,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Ic=TEditObject(1554,99,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Ib=TEditObject(1554,72,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Ia=TEditObject(1554,45,100,23,"Arial 15","#141414","white","---")
     hSnp_VL_Kls_Psum=TEditObject(1554,207,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_Ia=TEditObject(315,396,100,23,"Arial 15","black","white","---")
     hSnp_T1_Ib=TEditObject(315,423,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_Ic=TEditObject(315,450,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_Uca=TEditObject(315,531,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_P=TEditObject(315,558,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_Ubc=TEditObject(315,504,100,23,"Arial 15","#141414","white","---")
     hSnp_T1_Uab=TEditObject(315,477,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Ia=TEditObject(1662,389,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Ib=TEditObject(1662,416,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Ic=TEditObject(1662,443,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Uca=TEditObject(1662,524,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_P=TEditObject(1662,551,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Ubc=TEditObject(1662,497,100,23,"Arial 15","#141414","white","---")
     hSnp_T2_Uab=TEditObject(1662,470,100,23,"Arial 15","#141414","white","---")
     hSnp_c5_Ia=TEditObject(279,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c7_Ia=TEditObject(357,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c9_Ia=TEditObject(435,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c11_Ia=TEditObject(514,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c13_Ia=TEditObject(599,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c15_Ia=TEditObject(677,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c17_Ia=TEditObject(755,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c21_Ia=TEditObject(891,780,30,16,"Arial 10","white","#505050","---")
     hSnp_c3_Ia=TEditObject(478,590,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Ib=TEditObject(478,609,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Ic=TEditObject(478,628,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Uab=TEditObject(478,647,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Ubc=TEditObject(478,666,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Uca=TEditObject(478,685,50,16,"Arial 10","#141414","white","---")
     hSnp_c3_Psum=TEditObject(478,704,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Ia=TEditObject(1475,591,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Ib=TEditObject(1475,610,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Ic=TEditObject(1475,629,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Uab=TEditObject(1475,648,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Ubc=TEditObject(1475,667,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Uca=TEditObject(1475,686,50,16,"Arial 10","#141414","white","---")
     hSnp_c20_Psum=TEditObject(1475,705,50,16,"Arial 10","#141414","white","---")
     TLabelObject(806,27,230,40,"Arial -30","#E4B409","#505050","ПС  110/10 кВ ")
     TStaticTextObject(286,206,100,25,"Arial 14","#141414","white","    P мВт")
     TStaticTextObject(286,179,100,25,"Arial 14","#141414","white","   Uca kB")
     TStaticTextObject(286,152,100,25,"Arial 14","#141414","white","   Ubc kB")
     TStaticTextObject(286,125,100,25,"Arial 14","#141414","white","   Uab kB")
     TStaticTextObject(286,44,100,25,"Arial 14","#141414","white","     Ia A")
     TStaticTextObject(286,98,100,25,"Arial 14","#141414","white","     Ic A")
     TStaticTextObject(286,71,100,25,"Arial 14","#141414","white","     Ib A")
     TStaticTextObject(1450,44,100,25,"Arial 14","#141414","white","     Ia A")
     TStaticTextObject(1450,71,100,25,"Arial 14","#141414","white","     Ib A")
     TStaticTextObject(1450,98,100,25,"Arial 14","#141414","white","     Ic A")
     TStaticTextObject(1450,125,100,25,"Arial 14","#141414","white","   Uab kB")
     TStaticTextObject(1450,152,100,25,"Arial 14","#141414","white","   Ubc kB")
     TStaticTextObject(1450,179,100,25,"Arial 14","#141414","white","   Uca kB")
     TStaticTextObject(1450,206,100,25,"Arial 14","#141414","white","    P мВт")
     TStaticTextObject(212,557,100,25,"Arial 14","#141414","white","    P мВт")
     TStaticTextObject(212,530,100,25,"Arial 14","#141414","white","   Uca kB")
     TStaticTextObject(212,503,100,25,"Arial 14","#141414","white","   Ubc kB")
     TStaticTextObject(212,476,100,25,"Arial 14","#141414","white","   Uab kB")
     TStaticTextObject(212,395,100,25,"Arial 14","#141414","white","     Ia A")
     TStaticTextObject(212,449,100,25,"Arial 14","#141414","white","     Ic A")
     TStaticTextObject(212,422,100,25,"Arial 14","#141414","white","     Ib A")
     TStaticTextObject(1559,550,100,25,"Arial 14","#141414","white","    P мВт")
     TStaticTextObject(1559,523,100,25,"Arial 14","#141414","white","   Uca kB")
     TStaticTextObject(1559,496,100,25,"Arial 14","#141414","white","   Ubc kB")
     TStaticTextObject(1559,469,100,25,"Arial 14","#141414","white","   Uab kB")
     TStaticTextObject(1559,388,100,25,"Arial 14","#141414","white","     Ia A")
     TStaticTextObject(1559,442,100,25,"Arial 14","#141414","white","     Ic A")
     TStaticTextObject(1559,415,100,25,"Arial 14","#141414","white","     Ib A")
     TStaticTextObject(427,589,50,18,"Arial 10","#141414","white","   Ia A")
     TStaticTextObject(427,608,50,18,"Arial 10","#141414","white","   Ib A")
     TStaticTextObject(427,627,50,18,"Arial 10","#141414","white","   Ic A")
     TStaticTextObject(427,646,50,18,"Arial 10","#141414","white","Uab kV")
     TStaticTextObject(427,684,50,18,"Arial 10","#141414","white","Uca kV")
     TStaticTextObject(427,703,50,18,"Arial 10","#141414","white","P mW")
     TStaticTextObject(427,665,50,18,"Arial 10","#141414","white","Ubc kV")
     TStaticTextObject(1424,590,50,18,"Arial 10","#141414","white","   Ia A")
     TStaticTextObject(1424,609,50,18,"Arial 10","#141414","white","   Ib A")
     TStaticTextObject(1424,628,50,18,"Arial 10","#141414","white","   Ic A")
     TStaticTextObject(1424,647,50,18,"Arial 10","#141414","white","Uab kV")
     TStaticTextObject(1424,685,50,18,"Arial 10","#141414","white","Uca kV")
     TStaticTextObject(1424,704,50,18,"Arial 10","#141414","white","P mW")
     TStaticTextObject(1424,666,50,18,"Arial 10","#141414","white","Ubc kV")
     hSnp_EV_110_T1_RPV=TDiscretObject(619,499,30,30,"yellow")
     hSnp_SEV_110_RPV=TDiscretObject(966,260,30,30,"yellow")
     hSnp_EV_110_T2_RPV=TDiscretObject(1314,497,30,30,"yellow")
     hSnp_c5_RPV=TDiscretObject(258,839,30,30,"yellow")
     hSnp_c3_RPV=TDiscretObject(180,839,30,30,"yellow")
     hSnp_c7_RPV=TDiscretObject(338,839,30,30,"yellow")
     hSnp_c9_RPV=TDiscretObject(417,839,30,30,"yellow")
     hSnp_c11_RPV=TDiscretObject(498,839,30,30,"yellow")
     hSnp_c17_RPV=TDiscretObject(737,838,30,30,"yellow")
     hSnp_c15_RPV=TDiscretObject(658,838,30,30,"yellow")
     hDI_25=TDiscretObject(807,838,30,30,"yellow")
     hSnp_c21_RPV=TDiscretObject(871,838,30,30,"yellow")
     hSnp_c6_RPV=TDiscretObject(1159,835,30,30,"yellow")
     hSnp_c13_RPV=TDiscretObject(579,839,30,30,"yellow")
     hSnp_c8_RPV=TDiscretObject(1233,835,30,30,"yellow")
     hSnp_c14_RPV=TDiscretObject(1467,835,30,30,"yellow")
     hSnp_c16_RPV=TDiscretObject(1545,835,30,30,"yellow")
     hSnp_c18_RPV=TDiscretObject(1623,835,30,30,"yellow")
     hSnp_c20_RPV=TDiscretObject(1701,835,30,30,"yellow")
     AllData=''
     try: 
         print( 'Starting tkinter server...')
         modb = threading.Thread(target=udpserv,args=(1,)) 
         modb.daemon = True
         modb.start()
     except Exception as e:
         print(e)
     global hendl
     hendl=False
     root.mainloop()

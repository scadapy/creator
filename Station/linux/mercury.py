# -*- coding: utf-8 -*-
###########################################################################
## Python code generated with ScadaPy Creator v.3.3.1  29-4-18 
## Mercury lib by Jack Maclov
## http://scadapy.ln-group.ru/
##
## PLEASE DO ALL YOU NEED THIS FILE!
########################################################################### 
import serial
import binascii
import time
a=''  
auchCRCHi = [
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,
0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,
0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
0x40]
auchCRCLo = [
0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,
0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,
0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,
0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,
0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,
0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,
0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,
0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,
0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,
0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,
0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,
0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,
0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,
0x40]
def crc16Lo(data) :
    uchCRCHi = 0xFF   # high byte of CRC initialized
    uchCRCLo = 0xFF   # low byte of CRC initialized
    uIndex   = 0x0000 # will index into CRC lookup table
    for ch in data :
        uIndex   = uchCRCLo ^ ch
        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]
        uchCRCHi = auchCRCLo[uIndex]
    return (uchCRCLo)
def crc16Hi(data) :
    uchCRCHi = 0xFF   # high byte of CRC initialized
    uchCRCLo = 0xFF   # low byte of CRC initialized
    uIndex   = 0x0000 # will index into CRC lookup table
    for ch in data :
        uIndex   = uchCRCLo ^ ch
        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]
        uchCRCHi = auchCRCLo[uIndex]
    return (uchCRCHi)
def sndOpCh(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01]
         ser.write([ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01 , crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(4)
         if(reqString[0] == int(netAdr) ):
             ret = 1
         else: 
             ret = 0
     except Exception as e:
         print ('cndOpCh',e)
         ret=0      
     return ret
def getEn0(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x05,0x00,0x00]
         ser.write([ int(netAdr),0x05,0x00,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(19)
         if(reqString[0] == int(netAdr) ):
             Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   
             Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  
             Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  
             Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  
         else:
             Aplus  = 'Error'   
             Aminus = 'Error'  
             Rplus  = 'Error'  
             Rminus = 'Error'  
     except Exception as e:
         print ('getEn0- ',e)
     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF
def getEn1(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x05,0x00,0x01]
         ser.write([ int(netAdr),0x05,0x00,0x01, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(19)
         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   
         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  
         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  
         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  
     except Exception as e:
         print ('getEn1- ',e) 
     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF
def getEn2(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x05,0x00,0x02]
         ser.write([ int(netAdr),0x05,0x00,0x02, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(19)
         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   
         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  
         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  
         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  
     except Exception as e:
         print ('getEn2- ',e) 
     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF
def getEn3(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x05,0x00,0x03]
         ser.write([ int(netAdr),0x05,0x00,0x03, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(19)
         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   
         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  
         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  
         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  
     except Exception as e:
         print ('getEn3- ',e) 
     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF
def getEn4(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x05,0x00,0x04]
         ser.write([ int(netAdr),0x05,0x00,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(19)
         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   
         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  
         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  
         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  
     except Exception as e:
         print ('getEn4- ',e) 
     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF
def getConnect(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush() 
         dataIn = [ int(netAdr), 0x00]
         ser.write([ int(netAdr), 0x00 , crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(4)
         if(reqString[0] == int(netAdr) ):
             ret = 1
         else: 
             ret = 0
     except Exception as e:
         ret=0
     return ret
def getU(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x08,0x16,0x11]
         ser.write([ int(netAdr),0x08,0x16,0x11, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(12)
         U1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  
         U2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  
         U3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  
     except Exception as e:
         print ('getU- ',e)   
     return U1,U2,U3
def getI(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x08,0x16,0x21]
         ser.write([ int(netAdr),0x08,0x16,0x21, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(12)
         I1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  
         I2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  
         I3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  
     except Exception as e:
         print ('getI- ',e)   
     return I1,I2,I3
def getP(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x08,0x16,0x00]
         ser.write([ int(netAdr),0x08,0x16,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(15)
         bt1=str(bin(reqString[1]))[2:].zfill(8) 
         bt4=str(bin(reqString[4]))[2:].zfill(8) 
         bt7=str(bin(reqString[7]))[2:].zfill(8) 
         bt10=str(bin(reqString[10]))[2:].zfill(8) 
         P  = int(reqString[3]<<8) + int(reqString[2])
         if( bt1[1] == '1'): P = P        #   0x40
         if( bt1[0] == '1'): P = P * -1   #   0x80 
         P1  = int(reqString[6]<<8) + int(reqString[5])
         if( bt4[1] == '1'): P1 = P1        #   0x40
         if( bt4[0] == '1'): P1 = P1 * -1   #   0x80 
         P2  = int(reqString[9]<<8) + int(reqString[8])
         if( bt7[1] == '1'): P2 = P2        #   0x40
         if( bt7[0] == '1'): P2 = P2 * -1   #   0x80 
         P3  = int(reqString[12]<<8) + int(reqString[11])
         if( bt10[1] == '1'): P3 = P3        #   0x40
         if( bt10[0] == '1'): P3 = P3 * -1   #   0x80 
     except Exception as e:
         print ('getP- ',e)   
     return P,P1,P2,P3
def getPS(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn =  [ int(netAdr),0x08,0x16,0x08]
         ser.write([ int(netAdr),0x08,0x16,0x08, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(15)
         bt1=str(bin(reqString[1]))[2:].zfill(8) 
         bt4=str(bin(reqString[4]))[2:].zfill(8) 
         bt7=str(bin(reqString[7]))[2:].zfill(8) 
         bt10=str(bin(reqString[10]))[2:].zfill(8) 
         P  = int(reqString[3]<<8) + int(reqString[2])
         if( bt1[1] == '1'): P = P        #   0x40
         if( bt1[0] == '1'): P = P * -1   #   0x80 
         P1  = int(reqString[6]<<8) + int(reqString[5])
         if( bt4[1] == '1'): P1 = P1        #   0x40
         if( bt4[0] == '1'): P1 = P1 * -1   #   0x80 
         P2  = int(reqString[9]<<8) + int(reqString[8]) 
         if( bt7[1] == '1'): P2 = P2        #   0x40
         if( bt7[0] == '1'): P2 = P2 * -1   #   0x80 
         P3  = int(reqString[12]<<8) + int(reqString[11])
         if( bt10[1] == '1'): P3 = P3        #   0x40
         if( bt10[0] == '1'): P3 = P3 * -1   #   0x80 
     except Exception as e:
         print ('getPS- ',e)  
     return P,P1,P2,P3
def getPQ(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn =  [ int(netAdr),0x08,0x16,0x04]
         ser.write([ int(netAdr),0x08,0x16,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(15)
         bt1=str(bin(reqString[1]))[2:].zfill(8) 
         bt4=str(bin(reqString[4]))[2:].zfill(8) 
         bt7=str(bin(reqString[7]))[2:].zfill(8) 
         bt10=str(bin(reqString[10]))[2:].zfill(8) 
         P  = int(reqString[3]<<8) + int(reqString[2])
         if( bt1[1] == '1'): P = P        #   0x40
         if( bt1[0] == '1'): P = P * -1   #   0x80 
         P1  = int(reqString[6]<<8) + int(reqString[5])
         if( bt4[1] == '1'): P1 = P1        #   0x40
         if( bt4[0] == '1'): P1 = P1 * -1   #   0x80 
         P2  = int(reqString[9]<<8) + int(reqString[8]) 
         if( bt7[1] == '1'): P2 = P2        #   0x40
         if( bt7[0] == '1'): P2 = P2 * -1   #   0x80 
         P3  = int(reqString[12]<<8) + int(reqString[11])
         if( bt10[1] == '1'): P3 = P3        #   0x40
         if( bt10[0] == '1'): P3 = P3 * -1   #   0x80 
     except Exception as e:
         print ('getPQ- ',e)  
     return P,P1,P2,P3
def getCosF(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn =  [ int(netAdr),0x08,0x16,0x30]
         ser.write([ int(netAdr),0x08,0x16,0x30, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(15)
         bt1=str(bin(reqString[1]))[2:].zfill(8) 
         bt4=str(bin(reqString[4]))[2:].zfill(8) 
         bt7=str(bin(reqString[7]))[2:].zfill(8) 
         bt10=str(bin(reqString[10]))[2:].zfill(8) 
         P  = int(reqString[3]<<8) + int(reqString[2])
         if( bt1[1] == '1'): P = P        #   0x40
         if( bt1[0] == '1'): P = P * -1   #   0x80 
         P1  = int(reqString[6]<<8) + int(reqString[5])
         if( bt4[1] == '1'): P1 = P1        #   0x40
         if( bt4[0] == '1'): P1 = P1 * -1   #   0x80 
         P2  = int(reqString[9]<<8) + int(reqString[8]) 
         if( bt7[1] == '1'): P2 = P2        #   0x40
         if( bt7[0] == '1'): P2 = P2 * -1   #   0x80 
         P3  = int(reqString[12]<<8) + int(reqString[11])
         if( bt10[1] == '1'): P3 = P3        #   0x40
         if( bt10[0] == '1'): P3 = P3 * -1   #   0x80 
     except Exception as e:
         print ('getCosF- ',e)
     return P,P1,P2,P3
def getAngle(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn =  [ int(netAdr),0x08,0x16,0x51]
         ser.write([ int(netAdr),0x08,0x16,0x51, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(12)
         A1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2]) 
         A2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5]) 
         A3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8]) 
     except Exception as e:
         print ('getAng- ',e) 
     return A1^0xFFFFFF,A2^0xFFFFFF,A3^0xFFFFFF,
def getFreq(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()
         dataIn = [ int(netAdr),0x08,0x16,0x40]
         ser.write([ int(netAdr),0x08,0x16,0x40, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(6)
         if(reqString[0] == int(netAdr) ):
             f  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  
         else:
             f='Error'
     except Exception as e:
         print ('getFreq- ',e)
     return f
def getSN(netAdr,ser):
     try:
         ser.flushInput()
         ser.flush()        
         dataIn = [ int(netAdr),0x08,0x00]
         ser.write([ int(netAdr),0x08,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])
         reqString= ser.read(6)
         sn1 = str(reqString[1]).zfill(2) 
         sn2 = str(reqString[2]).zfill(2) 
         sn3 = str(reqString[3]).zfill(2) 
         sn4 = str(reqString[4]).zfill(2) 
     except Exception as e:
         print ('getSN',e)    
     return sn1+sn2+sn3+sn4
def getDataFromCounter(netAdr,serialPort,DEBUG):
     serialPort.flushInput()
     serialPort.flush()
     data=''   
     try:
         getConn=getConnect(netAdr,serialPort)
         if(getConn == 1):
             time.sleep(0.2)
             openChannel=sndOpCh(netAdr,serialPort)
             if(openChannel == 1):
                 time.sleep(0.2) 
                 sn1 = getSN(netAdr,serialPort)
                 time.sleep(0.2) 
                 freq=getFreq(netAdr,serialPort)
                 time.sleep(0.1) 
                 Aplus,Aminus,Rplus,Rminus = getEn0(netAdr,serialPort)
                 time.sleep(0.1) 
                 Aplus1,Aminus1,Rplus1,Rminus1 = getEn1(netAdr,serialPort)
                 time.sleep(0.1) 
                 Aplus2,Aminus2,Rplus2,Rminus2 = getEn2(netAdr,serialPort)
                 time.sleep(0.1) 
                 Aplus3,Aminus3,Rplus3,Rminus3 = getEn3(netAdr,serialPort)
                 time.sleep(0.1)
                 Aplus4,Aminus4,Rplus4,Rminus4 = getEn4(netAdr,serialPort)
                 time.sleep(0.1)
                 U1,U2,U3 = getU(netAdr,serialPort)
                 time.sleep(0.1)
                 I1,I2,I3 = getI(netAdr,serialPort)
                 time.sleep(0.1)
                 P,P1,P2,P3 = getP(netAdr,serialPort)
                 time.sleep(0.1)
                 PS,PS1,PS2,PS3 = getPS(netAdr,serialPort)
                 time.sleep(0.1)
                 PQ,PQ1,PQ2,PQ3 = getPQ(netAdr,serialPort)
                 time.sleep(0.1)
                 cosF,cosF1,cosF2,cosF3 = getCosF(netAdr,serialPort)
                 time.sleep(0.1)
                 Angle1,Angle2,Angle3 = getAngle(netAdr,serialPort)
                 data=sn1,freq,Aplus,Aminus,Rplus,Rminus,Aplus1,Aminus1,Rplus1,Rminus1,Aplus2,Aminus2,Rplus2,Rminus2,Aplus3,Aminus3,Rplus3,Rminus3,Aplus4,Aminus4,Rplus4,Rminus4,U1,U2,U3,I1,I2,I3,P,P1,P2,P3,PS,PS1,PS2,PS3,PQ,PQ1,PQ2,PQ3,cosF,cosF1,cosF2,cosF3,Angle1,Angle2,Angle3
             else:
                 data='Error'
         else:
             data='Error'
     except Exception as e:
         data='Error'
     return data

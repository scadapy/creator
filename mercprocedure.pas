unit MercProcedure;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Grids, Buttons, Interfaces;


procedure MercuryClientSave();
procedure MercuryLibSave();

implementation
 uses  scadapy;


procedure MercuryClientSave();
var
  rowCount,i,j,z: integer;
  mThread,mThreadJoin:string;
begin
  scadapy.MainFrame.MemoSave.Clear;
  scadapy.MainFrame.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
  scadapy.MainFrame.MemoSave.Lines.Add('###########################################################################');
  scadapy.MainFrame.MemoSave.Lines.Add('## Python code generated with '+scadapy.Version+' '+ DateToStr(Date())+' ');
  scadapy.MainFrame.MemoSave.Lines.Add('## Mercury client by Jack Mas');
  scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  scadapy.MainFrame.MemoSave.Lines.Add('##');
  scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
  scadapy.MainFrame.MemoSave.Lines.Add('import time');
  scadapy.MainFrame.MemoSave.Lines.Add('import gc');
  scadapy.MainFrame.MemoSave.Lines.Add('import socket');
  scadapy.MainFrame.MemoSave.Lines.Add('import threading');
  scadapy.MainFrame.MemoSave.Lines.Add('import serial');
  scadapy.MainFrame.MemoSave.Lines.Add('import mercury as m');
  scadapy.MainFrame.MemoSave.Lines.Add('import json');
  mThread:='';
  mThreadJoin:='';
  rowCount:=scadapy.MainFrame.MainTree.Items.Count;
  try
     begin
       for i:=1 to RowCount do
       begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 1) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) then
            begin
                 scadapy.MainFrame.MemoSave.Lines.Add('def Proc_'+i.ToString+'(f=1):');
                 mThread:=mThread+'         modb_'+i.ToString+' = threading.Thread(target=Proc_'+i.ToString+',args=(1,))'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.daemon = True'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.start()'+#13#10;
                 mThreadJoin:=mThreadJoin+'         modb_'+i.ToString+'.join()'+#13#10;
                 scadapy.MainFrame.MemoSave.Lines.Add('     startAdr=[]');
                 scadapy.MainFrame.MemoSave.Lines.Add('     rangeAdr=[]');
                 scadapy.MainFrame.MemoSave.Lines.Add('     rtuAddress=[]');
                 scadapy.MainFrame.MemoSave.Lines.Add('     varname=[]');
                 scadapy.MainFrame.MemoSave.Lines.Add('     timeOut=[]');
                 scadapy.MainFrame.MemoSave.Lines.Add('     reg=[]');
                 z:=0;
                 for j:=1 to Length(  MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                             end;
                                        end;

                 scadapy.MainFrame.MemoSave.Lines.Add('     unitCount='+z.ToString);

           end;
        end;
  scadapy.MainFrame.MemoSave.Lines.Add('     for i in range(0,unitCount+1):');
  scadapy.MainFrame.MemoSave.Lines.Add('         rtuAddress.append(i)');
  scadapy.MainFrame.MemoSave.Lines.Add('         reg.append(i)');
  scadapy.MainFrame.MemoSave.Lines.Add('         startAdr.append(i)');
  scadapy.MainFrame.MemoSave.Lines.Add('         rangeAdr.append(i)');
  scadapy.MainFrame.MemoSave.Lines.Add('         varname.append(i)');
  scadapy.MainFrame.MemoSave.Lines.Add('         timeOut.append(i)');
  if (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   scadapy.MainFrame.MemoSave.Lines.Add('# tcp settings');
                   end;
                 if (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     try:');
                   scadapy.MainFrame.MemoSave.Lines.Add('         com=serial.Serial('''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+
                   MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', timeout=2, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)');
                   scadapy.MainFrame.MemoSave.Lines.Add('         time.sleep(2) ');
                   scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
                   scadapy.MainFrame.MemoSave.Lines.Add('          pass');
                   end;
    for j:=1 to Length(  MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                           if( Length( MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                             begin

                              scadapy.MainFrame.MemoSave.Lines.Add('     x='+(j-1).ToString()+'; '+
                              'varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+''','''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+''','''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][3]+''','''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][4]+''','''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+''','''+
                              MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+''')');

                             end;
                        end;
  scadapy.MainFrame.MemoSave.Lines.Add('     while True:');
  scadapy.MainFrame.MemoSave.Lines.Add('         for i in range(0,unitCount):   ');
  scadapy.MainFrame.MemoSave.Lines.Add('             try:');
  scadapy.MainFrame.MemoSave.Lines.Add('                 varNameData=m.getDataFromCounter(rtuAddress[i],com,0)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_arch)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_vk)');
  scadapy.MainFrame.MemoSave.Lines.Add('             except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('                 varNameData=None');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_arch)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_vk)');
  scadapy.MainFrame.MemoSave.Lines.Add('             time.sleep(float(timeOut[x]))');
  scadapy.MainFrame.MemoSave.Lines.Add('if __name__ == "__main__":');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         try:');
  scadapy.MainFrame.MemoSave.Lines.Add('             print( ''UDP sender start'')');
  scadapy.MainFrame.MemoSave.Lines.Add('             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  scadapy.MainFrame.MemoSave.Lines.Add('             server_address_udp = (''localhost'', 64000)');
  scadapy.MainFrame.MemoSave.Lines.Add('             sock_udp_arch = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  scadapy.MainFrame.MemoSave.Lines.Add('             server_address_udp_arch = (''localhost'', 64001)');
  scadapy.MainFrame.MemoSave.Lines.Add('             sock_udp_vk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  scadapy.MainFrame.MemoSave.Lines.Add('             server_address_udp_vk = (''localhost'', 64002)');
  scadapy.MainFrame.MemoSave.Lines.Add('         except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('             print(''UDP fail '',e)');
  scadapy.MainFrame.MemoSave.Lines.Add('         print( ''Starting mercury client'')');
  scadapy.MainFrame.MemoSave.Lines.Add('         time.sleep(1.0)');
  scadapy.MainFrame.MemoSave.Lines.Add('  ########################### treads block');
  scadapy.MainFrame.MemoSave.Lines.Add(mThread);
  scadapy.MainFrame.MemoSave.Lines.Add(mThreadJoin);
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
  end;
  except
  end;
  try
    scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'mclient.py');
  except
    ShowMessage('Error to save');
  end;
end;









procedure MercuryLibSave();

begin
  scadapy.MainFrame.MemoSave.Clear;
  scadapy.MainFrame.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
  scadapy.MainFrame.MemoSave.Lines.Add('###########################################################################');
  scadapy.MainFrame.MemoSave.Lines.Add('## Python code generated with '+scadapy.Version+' '+ DateToStr(Date())+' ');
  scadapy.MainFrame.MemoSave.Lines.Add('## Mercury lib by Jack Mas');
  scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  scadapy.MainFrame.MemoSave.Lines.Add('##');
  scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
  scadapy.MainFrame.MemoSave.Lines.Add('import serial');
  scadapy.MainFrame.MemoSave.Lines.Add('import binascii');
  scadapy.MainFrame.MemoSave.Lines.Add('import time');
  scadapy.MainFrame.MemoSave.Lines.Add('a=''''  ');
  scadapy.MainFrame.MemoSave.Lines.Add('auchCRCHi = [');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  scadapy.MainFrame.MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  scadapy.MainFrame.MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  scadapy.MainFrame.MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  scadapy.MainFrame.MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40]');
  scadapy.MainFrame.MemoSave.Lines.Add('auchCRCLo = [');
  scadapy.MainFrame.MemoSave.Lines.Add('0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,');
  scadapy.MainFrame.MemoSave.Lines.Add('0x40]');
  scadapy.MainFrame.MemoSave.Lines.Add('def crc16Lo(data) :');
  scadapy.MainFrame.MemoSave.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  scadapy.MainFrame.MemoSave.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  scadapy.MainFrame.MemoSave.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  scadapy.MainFrame.MemoSave.Lines.Add('    for ch in data :');
  scadapy.MainFrame.MemoSave.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  scadapy.MainFrame.MemoSave.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  scadapy.MainFrame.MemoSave.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  scadapy.MainFrame.MemoSave.Lines.Add('    return (uchCRCLo)');
  scadapy.MainFrame.MemoSave.Lines.Add('def crc16Hi(data) :');
  scadapy.MainFrame.MemoSave.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  scadapy.MainFrame.MemoSave.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  scadapy.MainFrame.MemoSave.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  scadapy.MainFrame.MemoSave.Lines.Add('    for ch in data :');
  scadapy.MainFrame.MemoSave.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  scadapy.MainFrame.MemoSave.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  scadapy.MainFrame.MemoSave.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  scadapy.MainFrame.MemoSave.Lines.Add('    return (uchCRCHi)');
  scadapy.MainFrame.MemoSave.Lines.Add('def sndOpCh(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(4)');
  scadapy.MainFrame.MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  scadapy.MainFrame.MemoSave.Lines.Add('             ret = 1');
  scadapy.MainFrame.MemoSave.Lines.Add('         else: ');
  scadapy.MainFrame.MemoSave.Lines.Add('             ret = 0');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''cndOpCh'',e)');
  scadapy.MainFrame.MemoSave.Lines.Add('         ret=0      ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return ret');
  scadapy.MainFrame.MemoSave.Lines.Add('def getEn0(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x00]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(19)');
  scadapy.MainFrame.MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  scadapy.MainFrame.MemoSave.Lines.Add('             Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         else:');
  scadapy.MainFrame.MemoSave.Lines.Add('             Aplus  = ''Error''   ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Aminus = ''Error''  ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Rplus  = ''Error''  ');
  scadapy.MainFrame.MemoSave.Lines.Add('             Rminus = ''Error''  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getEn0- '',e)');
  scadapy.MainFrame.MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  scadapy.MainFrame.MemoSave.Lines.Add('def getEn1(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x01]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x01, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(19)');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getEn1- '',e) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  scadapy.MainFrame.MemoSave.Lines.Add('def getEn2(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x02]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x02, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(19)');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getEn2- '',e) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  scadapy.MainFrame.MemoSave.Lines.Add('def getEn3(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x03]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x03, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(19)');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getEn3- '',e) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  scadapy.MainFrame.MemoSave.Lines.Add('def getEn4(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x04]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(19)');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getEn4- '',e) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  scadapy.MainFrame.MemoSave.Lines.Add('def getConnect(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush() ');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr), 0x00]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr), 0x00 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(4)');
  scadapy.MainFrame.MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  scadapy.MainFrame.MemoSave.Lines.Add('             ret = 1');
  scadapy.MainFrame.MemoSave.Lines.Add('         else: ');
  scadapy.MainFrame.MemoSave.Lines.Add('             ret = 0');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ret=0');
  scadapy.MainFrame.MemoSave.Lines.Add('     return ret');
  scadapy.MainFrame.MemoSave.Lines.Add('def getU(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x11]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x11, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(12)');
  scadapy.MainFrame.MemoSave.Lines.Add('         U1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         U2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         U3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getU- '',e)   ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return U1,U2,U3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getI(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x21]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x21, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(12)');
  scadapy.MainFrame.MemoSave.Lines.Add('         I1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         I2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         I3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getI- '',e)   ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return I1,I2,I3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getP(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x00]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(15)');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getP- '',e)   ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return P,P1,P2,P3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getPS(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x08]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x08, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(15)');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getPS- '',e)  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return P,P1,P2,P3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getPQ(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x04]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(15)');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getPQ- '',e)  ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return P,P1,P2,P3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getCosF(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x30]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x30, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(15)');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  scadapy.MainFrame.MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getCosF- '',e)');
  scadapy.MainFrame.MemoSave.Lines.Add('     return P,P1,P2,P3');
  scadapy.MainFrame.MemoSave.Lines.Add('def getAngle(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x51]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x51, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(12)');
  scadapy.MainFrame.MemoSave.Lines.Add('         A1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         A2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         A3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8]) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getAng- '',e) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return A1^0xFFFFFF,A2^0xFFFFFF,A3^0xFFFFFF,');
  scadapy.MainFrame.MemoSave.Lines.Add('def getFreq(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x40]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x40, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(6)');
  scadapy.MainFrame.MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  scadapy.MainFrame.MemoSave.Lines.Add('             f  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  scadapy.MainFrame.MemoSave.Lines.Add('         else:');
  scadapy.MainFrame.MemoSave.Lines.Add('             f=''Error''');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getFreq- '',e)');
  scadapy.MainFrame.MemoSave.Lines.Add('     return f');
  scadapy.MainFrame.MemoSave.Lines.Add('def getSN(netAdr,ser):');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.flush()        ');
  scadapy.MainFrame.MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x00]');
  scadapy.MainFrame.MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  scadapy.MainFrame.MemoSave.Lines.Add('         reqString= ser.read(6)');
  scadapy.MainFrame.MemoSave.Lines.Add('         sn1 = str(reqString[1]).zfill(2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         sn2 = str(reqString[2]).zfill(2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         sn3 = str(reqString[3]).zfill(2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('         sn4 = str(reqString[4]).zfill(2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         print (''getSN'',e)    ');
  scadapy.MainFrame.MemoSave.Lines.Add('     return sn1+sn2+sn3+sn4');
  scadapy.MainFrame.MemoSave.Lines.Add('def getDataFromCounter(netAdr,serialPort,DEBUG):');
  scadapy.MainFrame.MemoSave.Lines.Add('     serialPort.flushInput()');
  scadapy.MainFrame.MemoSave.Lines.Add('     serialPort.flush()');
  scadapy.MainFrame.MemoSave.Lines.Add('     data=''''   ');
  scadapy.MainFrame.MemoSave.Lines.Add('     try:');
  scadapy.MainFrame.MemoSave.Lines.Add('         getConn=getConnect(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('         if(getConn == 1):');
  scadapy.MainFrame.MemoSave.Lines.Add('             time.sleep(0.2)');
  scadapy.MainFrame.MemoSave.Lines.Add('             openChannel=sndOpCh(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('             if(openChannel == 1):');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 sn1 = getSN(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.2) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 freq=getFreq(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Aplus,Aminus,Rplus,Rminus = getEn0(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Aplus1,Aminus1,Rplus1,Rminus1 = getEn1(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Aplus2,Aminus2,Rplus2,Rminus2 = getEn2(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1) ');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Aplus3,Aminus3,Rplus3,Rminus3 = getEn3(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Aplus4,Aminus4,Rplus4,Rminus4 = getEn4(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 U1,U2,U3 = getU(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 I1,I2,I3 = getI(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 P,P1,P2,P3 = getP(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 PS,PS1,PS2,PS3 = getPS(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 PQ,PQ1,PQ2,PQ3 = getPQ(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 cosF,cosF1,cosF2,cosF3 = getCosF(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 time.sleep(0.1)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 Angle1,Angle2,Angle3 = getAngle(netAdr,serialPort)');
  scadapy.MainFrame.MemoSave.Lines.Add('                 data=sn1,freq,Aplus,Aminus,Rplus,Rminus,Aplus1,Aminus1,Rplus1,Rminus1,Aplus2,Aminus2,Rplus2,Rminus2,Aplus3,Aminus3,Rplus3,Rminus3,Aplus4,Aminus4,Rplus4,Rminus4,U1,U2,U3,I1,I2,I3,P,P1,P2,P3,PS,PS1,PS2,PS3,PQ,PQ1,PQ2,PQ3,cosF,cosF1,cosF2,cosF3,Angle1,Angle2,Angle3');
  scadapy.MainFrame.MemoSave.Lines.Add('             else:');
  scadapy.MainFrame.MemoSave.Lines.Add('                 data=''Error''');
  scadapy.MainFrame.MemoSave.Lines.Add('         else:');
  scadapy.MainFrame.MemoSave.Lines.Add('             data=''Error''');
  scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
  scadapy.MainFrame.MemoSave.Lines.Add('         data=''Error''');
  scadapy.MainFrame.MemoSave.Lines.Add('     return data');
  try
    scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'mercury.py');
  except
    ShowMessage('Error to save');
  end;

end;









end.


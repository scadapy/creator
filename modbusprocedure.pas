unit ModbusProcedure;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces;

procedure ModbusPySave();

implementation
uses  scadapy;

procedure ModbusPySave();
var
  rowCount,i,j,z: integer;
  insText,mThread,mThreadJoin:String;
begin
        mThread:='';
        mThreadJoin:='';
        rowCount:=scadapy.MainFrame.MainTree.Items.Count;
        scadapy.MainFrame.MemoSave.Clear;
        scadapy.MainFrame.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        scadapy.MainFrame.MemoSave.Lines.Add('###########################################################################');
        scadapy.MainFrame.MemoSave.Lines.Add('## Python code generated with '+scadapy.Version+' '+ DateToStr(Date())+' ');
        scadapy.MainFrame.MemoSave.Lines.Add('## Modbus Client by Jack Mas');
        scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        scadapy.MainFrame.MemoSave.Lines.Add('##');
        scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
        scadapy.MainFrame.MemoSave.Lines.Add('import time');
        scadapy.MainFrame.MemoSave.Lines.Add('import modbus_tk');
        scadapy.MainFrame.MemoSave.Lines.Add('import modbus_tk.defines as cst');
        scadapy.MainFrame.MemoSave.Lines.Add('import modbus_tk.modbus_tcp as modbus_tcp');
        scadapy.MainFrame.MemoSave.Lines.Add('from modbus_tk import modbus_rtu');
        scadapy.MainFrame.MemoSave.Lines.Add('import serial');
        scadapy.MainFrame.MemoSave.Lines.Add('import gc');
        scadapy.MainFrame.MemoSave.Lines.Add('import socket');
        scadapy.MainFrame.MemoSave.Lines.Add('import threading');
        scadapy.MainFrame.MemoSave.Lines.Add('import json');
        try
        for i:=1 to RowCount do
         begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 0) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) then
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
                 scadapy.MainFrame.MemoSave.Lines.Add('     for i in range(0,unitCount+1):');
                 scadapy.MainFrame.MemoSave.Lines.Add('         rtuAddress.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('         reg.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('         startAdr.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('         rangeAdr.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('         varname.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('         timeOut.append(i)');
                 scadapy.MainFrame.MemoSave.Lines.Add('     try:');
                 if (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   scadapy.MainFrame.MemoSave.Lines.Add('         master = modbus_tcp.TcpMaster(host='''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM+
                   ''', port=int('''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))');
                   insText:='                 master = modbus_tcp.TcpMaster(host='''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM+
                   ''', port=int('''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))';
                   end;
                 if (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   scadapy.MainFrame.MemoSave.Lines.Add('         com=serial.Serial('''+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+
                   MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', bytesize=8, parity=''N'', stopbits=1, xonxoff=0)');
                   scadapy.MainFrame.MemoSave.Lines.Add('         master=modbus_rtu.RtuMaster(com)');
                   end;
                 scadapy.MainFrame.MemoSave.Lines.Add('         master.set_timeout(2)');
                 scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
                 scadapy.MainFrame.MemoSave.Lines.Add('          pass');
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
                 scadapy.MainFrame.MemoSave.Lines.Add('         for i in range(0,unitCount):');
                 scadapy.MainFrame.MemoSave.Lines.Add('             try:');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 if(reg[i]==''READ_INPUT_REGISTERS''):   c=cst.READ_INPUT_REGISTERS');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 if(reg[i]==''READ_DISCRETE_INPUTS''):   c=cst.READ_DISCRETE_INPUTS');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 if(reg[i]==''READ_COILS''):             c=cst.READ_COILS');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 if(reg[i]==''READ_HOLDING_REGISTERS''): c=cst.READ_HOLDING_REGISTERS');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp)');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_arch)');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_vk)');
                 scadapy.MainFrame.MemoSave.Lines.Add('             except Exception as e:');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 varNameData=None');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp)');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_arch)');
                 scadapy.MainFrame.MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_vk)');
                 scadapy.MainFrame.MemoSave.Lines.Add(insText);
                 scadapy.MainFrame.MemoSave.Lines.Add('             time.sleep(float(timeOut[i]))');
                 scadapy.MainFrame.MemoSave.Lines.Add('             gc.collect()');
             end;
       end;
       except

       end;

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
 scadapy.MainFrame.MemoSave.Lines.Add('         print( ''Starting modbus client'')');
 scadapy.MainFrame.MemoSave.Lines.Add('         time.sleep(1.0)');
 scadapy.MainFrame.MemoSave.Lines.Add('  ########################### treads block');
 scadapy.MainFrame.MemoSave.Lines.Add(mThread);
 scadapy.MainFrame.MemoSave.Lines.Add(mThreadJoin);
 scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
 scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
   try
     scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'modbus.py');
   except
      ShowMessage('Error to save');
   end;
end;









end.


unit VkProcedure;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Grids, Buttons, Interfaces;

procedure VkClientSave();

implementation
uses  scadapy;

procedure VkClientSave();
var
  rowCount,j,rowCount3,j3: integer;
  AllData,VarValue:String;
begin
        AllData:='';
        rowCount:=scadapy.MainFrame.MainTree.Items.Count;
        scadapy.MainFrame.MemoSave.Clear;
        scadapy.MainFrame.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        scadapy.MainFrame.MemoSave.Lines.Add('###########################################################################');
        scadapy.MainFrame.MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        scadapy.MainFrame.MemoSave.Lines.Add('## vk client by Jack Mas');
        scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        scadapy.MainFrame.MemoSave.Lines.Add('##');
        scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
        scadapy.MainFrame.MemoSave.Lines.Add('import schedule');
        scadapy.MainFrame.MemoSave.Lines.Add('import sys');
        scadapy.MainFrame.MemoSave.Lines.Add('import time');
        scadapy.MainFrame.MemoSave.Lines.Add('import gc');
        scadapy.MainFrame.MemoSave.Lines.Add('import os');
        scadapy.MainFrame.MemoSave.Lines.Add('import threading');
        scadapy.MainFrame.MemoSave.Lines.Add('from datetime import datetime');
        scadapy.MainFrame.MemoSave.Lines.Add('import socket');
        scadapy.MainFrame.MemoSave.Lines.Add('import struct');
        scadapy.MainFrame.MemoSave.Lines.Add('import json');
        scadapy.MainFrame.MemoSave.Lines.Add('import vk_api');
        scadapy.MainFrame.MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
        scadapy.MainFrame.MemoSave.Lines.Add('         if(x!=None and x[1]!=''Error''):');
        scadapy.MainFrame.MemoSave.Lines.Add('             mVar=x ');
        scadapy.MainFrame.MemoSave.Lines.Add('         else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             mVar=mVar');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         #');
        scadapy.MainFrame.MemoSave.Lines.Add('         pass');
        scadapy.MainFrame.MemoSave.Lines.Add('     return(mVar)');

        scadapy.MainFrame.MemoSave.Lines.Add('def SelectData(getData):');
        try

        rowCount3:=scadapy.MainFrame.GVKTree.RowCount;
        for j3:=1 to rowCount3-1 do
           begin
              VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
              rowCount:=scadapy.MainFrame.GVarTree.RowCount;
              for j:=1 to rowCount-1 do
                begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                     begin
                       scadapy.MainFrame.MemoSave.Lines.Add('     global '+scadapy.MainFrame.GVarTree.Cells[2, j]);
                     end;
                end;

           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     global AllData');
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
                begin
                    if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                     begin
                        scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=setVariables('+scadapy.MainFrame.GVarTree.Cells[2, j]+
                        ',getData,'''+scadapy.MainFrame.GVarTree.Cells[1, j]+''','''+scadapy.MainFrame.GVarTree.Cells[2, j]+''','''+scadapy.MainFrame.GVarTree.Cells[3, j]+
                        ''','''+scadapy.MainFrame.GVarTree.Cells[4, j]+''','''+scadapy.MainFrame.GVarTree.Cells[5, j]+''','''+scadapy.MainFrame.GVarTree.Cells[6, j]+
                        ''','''+scadapy.MainFrame.GVarTree.Cells[7,j]+''')');
                        AllData:=AllData+scadapy.MainFrame.GVarTree.Cells[2, j]+','
                     end;
                end;
        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 1: ' + E.Message);

        end;

        scadapy.MainFrame.MemoSave.Lines.Add('     AllData=['+AllData+']');
        scadapy.MainFrame.MemoSave.Lines.Add('def startJob(t=1):');
        scadapy.MainFrame.MemoSave.Lines.Add('     schedule.every(1).minutes.do(job1min)');
        scadapy.MainFrame.MemoSave.Lines.Add('     schedule.every(5).minutes.do(job5min)');
        scadapy.MainFrame.MemoSave.Lines.Add('     schedule.every(15).minutes.do(job15min)');
        scadapy.MainFrame.MemoSave.Lines.Add('     schedule.every(30).minutes.do(job30min)');
        scadapy.MainFrame.MemoSave.Lines.Add('     schedule.every().hour.do(jobH)');
        scadapy.MainFrame.MemoSave.Lines.Add('     while 1: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         schedule.run_pending()');
        scadapy.MainFrame.MemoSave.Lines.Add('         time.sleep(1)');
        scadapy.MainFrame.MemoSave.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        scadapy.MainFrame.MemoSave.Lines.Add('     varData=None');
        scadapy.MainFrame.MemoSave.Lines.Add('     if(json.loads( getData.decode("utf-8") )[''name''] == source):');
        scadapy.MainFrame.MemoSave.Lines.Add('         temp=json.loads( getData.decode("utf-8") )[''data'']');
        scadapy.MainFrame.MemoSave.Lines.Add('         if(temp!=''Error''):');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''float''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''2''): ');
        scadapy.MainFrame.MemoSave.Lines.Add('                     if(sequence==''12''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        scadapy.MainFrame.MemoSave.Lines.Add('                         varData=temp2[0]');
        scadapy.MainFrame.MemoSave.Lines.Add('                     if(sequence==''21''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        scadapy.MainFrame.MemoSave.Lines.Add('                         varData=temp2[0]');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''integer''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''1''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2=int(temp[int(address)])');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''bool''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        scadapy.MainFrame.MemoSave.Lines.Add('                         temp2=True');
        scadapy.MainFrame.MemoSave.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        scadapy.MainFrame.MemoSave.Lines.Add('                         temp2=False');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=str(temp2)');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''string''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('             try:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 mult=int(multiply)');
        scadapy.MainFrame.MemoSave.Lines.Add('             except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 mult=float(multiply)');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 varData=str(varData*mult)');
        scadapy.MainFrame.MemoSave.Lines.Add('             else:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 varData=str(varData)');
        scadapy.MainFrame.MemoSave.Lines.Add('             returnData=[varName,varData,dataType]');
        scadapy.MainFrame.MemoSave.Lines.Add('             return returnData');
        scadapy.MainFrame.MemoSave.Lines.Add('         else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             varData=[varName,''ErrorVar'',dataType]');
        scadapy.MainFrame.MemoSave.Lines.Add('             return varData');
        scadapy.MainFrame.MemoSave.Lines.Add('     else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             return [varName,''Error'',dataType]');
        scadapy.MainFrame.MemoSave.Lines.Add('def udpserv(i=1):');
        scadapy.MainFrame.MemoSave.Lines.Add('     global udpdata ');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        scadapy.MainFrame.MemoSave.Lines.Add('         server_address = (''localhost'', 64002)');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        scadapy.MainFrame.MemoSave.Lines.Add('         sock.bind(server_address)');
        scadapy.MainFrame.MemoSave.Lines.Add('         while True:');
        scadapy.MainFrame.MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        scadapy.MainFrame.MemoSave.Lines.Add('             udpdata=data');
        scadapy.MainFrame.MemoSave.Lines.Add('             SelectData(udpdata)');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('def sendMessage(user_id,putData,vklogin,vkpassword,message):');
        scadapy.MainFrame.MemoSave.Lines.Add('     vk = vk_api.VkApi(login = vklogin, password = vkpassword) ');
        scadapy.MainFrame.MemoSave.Lines.Add('     vk.auth() ');
        scadapy.MainFrame.MemoSave.Lines.Add('     nowTime=datetime.strftime(datetime.now(), "%d.%m.%Y %H:%M:%S")');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         if(putData!=None and len(putData)>0):');
        scadapy.MainFrame.MemoSave.Lines.Add('             varName,varValue,varDataType=putData');
        scadapy.MainFrame.MemoSave.Lines.Add('             vk.method(''messages.send'', {''user_id'':user_id,''message'':nowTime+''\n''+message+'':''+varValue }) ');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('         pass ');
        scadapy.MainFrame.MemoSave.Lines.Add('def job1min():');

        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
            //   try
               begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( scadapy.MainFrame.GVKTree.Cells[4, j3] = '1')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     sendMessage('''+scadapy.MainFrame.GVKTree.Cells[3, j3]+''','+scadapy.MainFrame.GVarTree.Cells[2, j]+','''+
                         scadapy.VkLogin+''','''+scadapy.VkPassword+''','''+scadapy.MainFrame.GVKTree.Cells[2, j3]+scadapy.MainFrame.GVKTree.Cells[1, j3]+''')');
                   end;
              end;
        //     except
        //   on E: Exception do
        //   ShowMessage('222: ' + E.Message);
        //
        //end;


        end;

        scadapy.MainFrame.MemoSave.Lines.Add('     pass');
        scadapy.MainFrame.MemoSave.Lines.Add('def job5min():');
        try
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( scadapy.MainFrame.GVKTree.Cells[4, j3] = '5')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     sendMessage('''+scadapy.MainFrame.GVKTree.Cells[3, j3]+''','+scadapy.MainFrame.GVarTree.Cells[2, j]+','''+
                         scadapy.VkLogin+''','''+scadapy.VkPassword+''','''+scadapy.MainFrame.GVKTree.Cells[2, j3]+scadapy.MainFrame.GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 3: ' + E.Message);

        end;

        scadapy.MainFrame.MemoSave.Lines.Add('     pass');
        scadapy.MainFrame.MemoSave.Lines.Add('def job15min():');
        try
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( scadapy.MainFrame.GVKTree.Cells[4, j3] = '15')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     sendMessage('''+scadapy.MainFrame.GVKTree.Cells[3, j3]+''','+scadapy.MainFrame.GVarTree.Cells[2, j]+','''+
                         scadapy.VkLogin+''','''+scadapy.VkPassword+''','''+scadapy.MainFrame.GVKTree.Cells[2, j3]+scadapy.MainFrame.GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
         except
           on E: Exception do
           ShowMessage('An exception was raised 4: ' + E.Message);

        end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');
        scadapy.MainFrame.MemoSave.Lines.Add('def job30min():');
         for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( scadapy.MainFrame.GVKTree.Cells[4, j3] = '30')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     sendMessage('''+scadapy.MainFrame.GVKTree.Cells[3, j3]+''','+scadapy.MainFrame.GVarTree.Cells[2, j]+','''+
                         scadapy.VkLogin+''','''+scadapy.VkPassword+''','''+scadapy.MainFrame.GVKTree.Cells[2, j3]+scadapy.MainFrame.GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');

        scadapy.MainFrame.MemoSave.Lines.Add('def jobH():');
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( scadapy.MainFrame.GVKTree.Cells[4, j3] = '60')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     sendMessage('''+scadapy.MainFrame.GVKTree.Cells[3, j3]+''','+scadapy.MainFrame.GVarTree.Cells[2, j]+','''+
                         scadapy.VkLogin+''','''+scadapy.VkPassword+''','''+scadapy.MainFrame.GVKTree.Cells[2, j3]+scadapy.MainFrame.GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');
        scadapy.MainFrame.MemoSave.Lines.Add('if __name__ == "__main__": ');
        scadapy.MainFrame.MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        try
        for j3:=0 to rowCount3-1 do
        begin
        VarValue:= scadapy.MainFrame.GVKTree.Cells[1, j3];
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (scadapy.MainFrame.GVarTree.Cells[8, j]=VarValue) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=['''+scadapy.MainFrame.GVarTree.Cells[2, j]+''',''Error'',''string'']');
           end;
        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 5: ' + E.Message);

        end;

        scadapy.MainFrame.MemoSave.Lines.Add('     AllData=''''');
        scadapy.MainFrame.MemoSave.Lines.Add('     try: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         print( ''Starting VK Client...'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,))');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb.daemon = True');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb.start()');
        scadapy.MainFrame.MemoSave.Lines.Add('         arch = threading.Thread(target=startJob,args=(1,))');
        scadapy.MainFrame.MemoSave.Lines.Add('         arch.daemon = True');
        scadapy.MainFrame.MemoSave.Lines.Add('         arch.start()');
        scadapy.MainFrame.MemoSave.Lines.Add('         arch.join()');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb.join()');

        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        try
            scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'vkclient.py');
          except
             ShowMessage('Error to save');
          end;


end;











end.


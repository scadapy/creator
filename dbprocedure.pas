unit DbProcedure;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces;

procedure DbArchSave();

implementation
uses  scadapy;

procedure DbArchSave();
var
  rowCount,j: integer;
  AllData:String;
begin
        AllData:='';
        rowCount:=scadapy.MainFrame.MainTree.Items.Count;
        scadapy.MainFrame.MemoSave.Clear;
        scadapy.MainFrame.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        scadapy.MainFrame.MemoSave.Lines.Add('###########################################################################');
        scadapy.MainFrame.MemoSave.Lines.Add('## Python code generated with '+scadapy.Version+' '+ DateToStr(Date())+' ');
        scadapy.MainFrame.MemoSave.Lines.Add('## DB Postgresql arch by Jack Mas');
        scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        scadapy.MainFrame.MemoSave.Lines.Add('##');
        scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
        scadapy.MainFrame.MemoSave.Lines.Add('import postgresql');
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

       scadapy.MainFrame.MemoSave.Lines.Add('def createDB(login,password,host,dbname):');
       scadapy.MainFrame.MemoSave.Lines.Add('     db=''''');
       scadapy.MainFrame.MemoSave.Lines.Add('     try: ');
       scadapy.MainFrame.MemoSave.Lines.Add('         db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"") ');
       scadapy.MainFrame.MemoSave.Lines.Add('         print(''Connection OK'')');
       scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
       scadapy.MainFrame.MemoSave.Lines.Add('         print(''Not exist'')');
       scadapy.MainFrame.MemoSave.Lines.Add('         try:');
       scadapy.MainFrame.MemoSave.Lines.Add('             db = postgresql.open("pq://"+login+":"+password+"@"+host) ');
       scadapy.MainFrame.MemoSave.Lines.Add('             db.execute(''CREATE DATABASE ''+dbname)');
       scadapy.MainFrame.MemoSave.Lines.Add('             print(''Create database OK'')');
       scadapy.MainFrame.MemoSave.Lines.Add('             db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"")');
       scadapy.MainFrame.MemoSave.Lines.Add('             try:');
       scadapy.MainFrame.MemoSave.Lines.Add('                 db.execute("CREATE TABLE  IF NOT EXISTS archiveData (varname varchar(80),date date,time time, varDataFI real, varDataStr varchar(200), varDataBool boolean)")');
       scadapy.MainFrame.MemoSave.Lines.Add('                 print(''Create table OK'')');
       scadapy.MainFrame.MemoSave.Lines.Add('             except Exception as e:');
       scadapy.MainFrame.MemoSave.Lines.Add('                 print(e)');
       scadapy.MainFrame.MemoSave.Lines.Add('         except Exception as e:');
       scadapy.MainFrame.MemoSave.Lines.Add('             print(''Error to connect'',e)');
       scadapy.MainFrame.MemoSave.Lines.Add('     return db');
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
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[9, j])>0) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     global '+scadapy.MainFrame.GVarTree.Cells[2, j]);
           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     global AllData');

        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  and (Length(scadapy.MainFrame.GVarTree.Cells[9, j])>0) then
                begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=setVariables('+scadapy.MainFrame.GVarTree.Cells[2, j]+
                   ',getData,'''+scadapy.MainFrame.GVarTree.Cells[1, j]+''','''+scadapy.MainFrame.GVarTree.Cells[2, j]+''','''+scadapy.MainFrame.GVarTree.Cells[3, j]+
                   ''','''+scadapy.MainFrame.GVarTree.Cells[4, j]+''','''+scadapy.MainFrame.GVarTree.Cells[5, j]+''','''+scadapy.MainFrame.GVarTree.Cells[6, j]+''','''+
                   scadapy.MainFrame.GVarTree.Cells[7,j]+''')');
                AllData:=AllData+scadapy.MainFrame.GVarTree.Cells[2, j]+','
                end;
          end;
        //scadapy.MainFrame.MemoSave.Lines.Add('#-----------------------------------------------------------------------------------');

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
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''string''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('             try:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 mult=int(multiply)');
        scadapy.MainFrame.MemoSave.Lines.Add('             except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 mult=float(multiply)');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 varData=varData*mult');
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
        scadapy.MainFrame.MemoSave.Lines.Add('         server_address = (''localhost'', 64001)');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        scadapy.MainFrame.MemoSave.Lines.Add('         sock.bind(server_address)');
        scadapy.MainFrame.MemoSave.Lines.Add('         while True:');
        scadapy.MainFrame.MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        scadapy.MainFrame.MemoSave.Lines.Add('             udpdata=data');
        scadapy.MainFrame.MemoSave.Lines.Add('             SelectData(udpdata)');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('def insData(putData):');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         if(putData!=None and len(putData)>0):');
        scadapy.MainFrame.MemoSave.Lines.Add('             varName,varValue,varDataType=putData');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(varValue!=''Error'' and varValue!=None  and varValue!=''ErrorVar''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(varDataType == ''string''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(varDataType == ''integer'' or varDataType == ''float''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataFI) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(varDataType == ''bool''): ');
        scadapy.MainFrame.MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataBool) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(varValue==''Error''  or varValue==''ErrorVar''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),''"+varName+"'',''Error'')")');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('         pass ');
        scadapy.MainFrame.MemoSave.Lines.Add('def job1min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) then
                begin
                   if( scadapy.MainFrame.GVarTree.Cells[9, j] = '1')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     insData('+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                end;
          end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');

        scadapy.MainFrame.MemoSave.Lines.Add('def job5min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) then
                begin
                   if( scadapy.MainFrame.GVarTree.Cells[9, j] = '5')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     insData('+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                end;
          end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');

        scadapy.MainFrame.MemoSave.Lines.Add('def job15min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) then
                begin
                   if( scadapy.MainFrame.GVarTree.Cells[9, j] = '15')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     insData('+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                end;
          end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');

        scadapy.MainFrame.MemoSave.Lines.Add('def job30min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) then
                begin
                   if( scadapy.MainFrame.GVarTree.Cells[9, j] = '30')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     insData('+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                end;
          end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');

         scadapy.MainFrame.MemoSave.Lines.Add('def jobH():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0) then
                begin
                   if( scadapy.MainFrame.GVarTree.Cells[9, j] = '60')  then
                         scadapy.MainFrame.MemoSave.Lines.Add('     insData('+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                end;
          end;
        scadapy.MainFrame.MemoSave.Lines.Add('     pass');
        scadapy.MainFrame.MemoSave.Lines.Add('if __name__ == "__main__": ');
        scadapy.MainFrame.MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0)  and (Length(scadapy.MainFrame.GVarTree.Cells[9, j])>0) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=['''+scadapy.MainFrame.GVarTree.Cells[2, j]+''',''Error'',''string'']');
           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     AllData=''''');
        scadapy.MainFrame.MemoSave.Lines.Add('     try: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         print( ''Starting DB Postgresql server...'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         db=createDB("'+scadapy.MainFrame.EDBLogin.Text+'","'+scadapy.MainFrame.EDBPassword.Text+'","'+scadapy.MainFrame.EDBhost.Text+'","scadapy")');
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
            scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'dbserver.py');
          except
             ShowMessage('Error to save');
          end;


end;













end.


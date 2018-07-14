unit JsonProcedure;

{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces;

procedure JserverPySave();
procedure FileHtmlSave();
implementation
uses  scadapy;





procedure JserverPySave();
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
        scadapy.MainFrame.MemoSave.Lines.Add('## JSON WEB server by Jack Mas');
        scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        scadapy.MainFrame.MemoSave.Lines.Add('##');
        scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### ');
        scadapy.MainFrame.MemoSave.Lines.Add('import sys');
        scadapy.MainFrame.MemoSave.Lines.Add('import time');
        scadapy.MainFrame.MemoSave.Lines.Add('import logging');
        scadapy.MainFrame.MemoSave.Lines.Add('import gc');
        scadapy.MainFrame.MemoSave.Lines.Add('import os');
        scadapy.MainFrame.MemoSave.Lines.Add('import threading');
        scadapy.MainFrame.MemoSave.Lines.Add('from http.server import BaseHTTPRequestHandler, HTTPServer');
        scadapy.MainFrame.MemoSave.Lines.Add('import json');
        scadapy.MainFrame.MemoSave.Lines.Add('import base64');
        scadapy.MainFrame.MemoSave.Lines.Add('import ssl');
        scadapy.MainFrame.MemoSave.Lines.Add('from datetime import datetime');
        scadapy.MainFrame.MemoSave.Lines.Add('from enum import Enum, IntEnum');
        scadapy.MainFrame.MemoSave.Lines.Add('import uuid');
        scadapy.MainFrame.MemoSave.Lines.Add('import socket');
        scadapy.MainFrame.MemoSave.Lines.Add('import struct');
        scadapy.MainFrame.MemoSave.Lines.Add('class S(BaseHTTPRequestHandler):');
        scadapy.MainFrame.MemoSave.Lines.Add('     def _set_response(self):');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_response(200)');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Content-type'',''text/html'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.end_headers()');
        scadapy.MainFrame.MemoSave.Lines.Add('     def do_HEAD(self):');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_response(200)');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Content-type'', ''text/html'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Accept-Charset,X-Accept,Content-Type,Credentials'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.end_headers()');
        scadapy.MainFrame.MemoSave.Lines.Add('     def do_AUTHHEAD(self):');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_response(401)');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''WWW-Authenticate'',''Basic realm="Demo Realm"'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header("Cache-Control", "no-cache")');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.end_headers()');
        scadapy.MainFrame.MemoSave.Lines.Add('     def do_OPTIONS(self):');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_response(200)');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET,OPTIONS'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''origin, Authorization, accept'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         self.end_headers()');
        scadapy.MainFrame.MemoSave.Lines.Add('     def do_GET(self):');
        scadapy.MainFrame.MemoSave.Lines.Add('         global key ');
        scadapy.MainFrame.MemoSave.Lines.Add('         if self.headers.get(''Authorization'') == None:');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.do_AUTHHEAD()');
        scadapy.MainFrame.MemoSave.Lines.Add('             response = { ''success'': False, ''error'': ''No auth header received''}');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        scadapy.MainFrame.MemoSave.Lines.Add('         elif self.headers.get(''Authorization'') == ''Basic '' + str(key):');
        scadapy.MainFrame.MemoSave.Lines.Add('             resp=[]');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_response(200)');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Allow'',''GET, OPTIONS'')');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header("Cache-Control", "no-cache")');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Content-type'',''application/json'')');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Credentials'', ''true'')');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Methods'', ''GET, OPTIONS'')');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Headers'', ''X-Request, X-Requested-With'')');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.send_header("Access-Control-Allow-Headers", "Authorization")');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.end_headers()');
        scadapy.MainFrame.MemoSave.Lines.Add('             req=str(self.path)[1:]');
        scadapy.MainFrame.MemoSave.Lines.Add('             if(req == "data" ):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 try:');
        scadapy.MainFrame.MemoSave.Lines.Add('                     self.wfile.write(bytes(json.dumps(AllData), ''utf-8''))');
        scadapy.MainFrame.MemoSave.Lines.Add('                 except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('                     print(''get req data error'',e)');
        scadapy.MainFrame.MemoSave.Lines.Add('             else:');
        scadapy.MainFrame.MemoSave.Lines.Add('                 response = { ''req error'':''Invalid credentials''}');
        scadapy.MainFrame.MemoSave.Lines.Add('                 self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        scadapy.MainFrame.MemoSave.Lines.Add('                 print(''error req'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.do_AUTHHEAD()');
        scadapy.MainFrame.MemoSave.Lines.Add('             response = { ''success'': False, ''error'': ''Invalid credentials''}');
        scadapy.MainFrame.MemoSave.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        scadapy.MainFrame.MemoSave.Lines.Add('def set_auth( username, password):');
        scadapy.MainFrame.MemoSave.Lines.Add('         global key');
        scadapy.MainFrame.MemoSave.Lines.Add('         key = base64.b64encode(bytes(''%s:%s'' % (username, password), ''utf-8'')).decode(''ascii'')');
        scadapy.MainFrame.MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
        scadapy.MainFrame.MemoSave.Lines.Add('         if(x!=None):');
        scadapy.MainFrame.MemoSave.Lines.Add('             mVar=x ');
        scadapy.MainFrame.MemoSave.Lines.Add('         else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             mVar=mVar');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         pass');
        scadapy.MainFrame.MemoSave.Lines.Add('     return(mVar)');
        scadapy.MainFrame.MemoSave.Lines.Add('def SelectData(getData):');
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     global '+scadapy.MainFrame.GVarTree.Cells[2, j]);
           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     global AllData');
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     global '+scadapy.MainFrame.GVarTree.Cells[2, j]);
           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     global AllData');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  then
                begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=setVariables('+scadapy.MainFrame.GVarTree.Cells[2, j]+',getData,'''+scadapy.MainFrame.GVarTree.Cells[1, j]+''','''+scadapy.MainFrame.GVarTree.Cells[2, j]+''','''+scadapy.MainFrame.GVarTree.Cells[3, j]+''','''+scadapy.MainFrame.GVarTree.Cells[4, j]+''','''+scadapy.MainFrame.GVarTree.Cells[5, j]+''','''+scadapy.MainFrame.GVarTree.Cells[6, j]+''','''+scadapy.MainFrame.GVarTree.Cells[7,j]+''')');
                AllData:=AllData+scadapy.MainFrame.GVarTree.Cells[2, j]+','
                end;
          end;

        scadapy.MainFrame.MemoSave.Lines.Add('#-----------------------------------------------------------------------------------');
        scadapy.MainFrame.MemoSave.Lines.Add('     AllData=['+AllData+']');
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

        scadapy.MainFrame.MemoSave.Lines.Add('             if(dataType==''intSigned''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''1''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2=(int(temp[int(address)]) + 2**15) % 2**16 - 2**15');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2= ((int(temp[int(address)])<<16) + int(temp[int(address)+1]) + 2**31) % 2**32 - 2**31');
        scadapy.MainFrame.MemoSave.Lines.Add('                     varData=temp2');
        scadapy.MainFrame.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        scadapy.MainFrame.MemoSave.Lines.Add('                     temp2= ((int(temp[int(address)+1])<<16) + int(temp[int(address)]) + 2**31) % 2**32 - 2**31 ');
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
        scadapy.MainFrame.MemoSave.Lines.Add('             returnData={varName:varData}');
        scadapy.MainFrame.MemoSave.Lines.Add('             return returnData');
        scadapy.MainFrame.MemoSave.Lines.Add('         else:');
        scadapy.MainFrame.MemoSave.Lines.Add('             varData={varName:''Error''}');
        scadapy.MainFrame.MemoSave.Lines.Add('             return varData');
        scadapy.MainFrame.MemoSave.Lines.Add('     else:');
        scadapy.MainFrame.MemoSave.Lines.Add('         return None');
        scadapy.MainFrame.MemoSave.Lines.Add('def udpserv(i=1):');
        scadapy.MainFrame.MemoSave.Lines.Add('     global udpdata ');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        scadapy.MainFrame.MemoSave.Lines.Add('         server_address = (''localhost'', 64000)');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        scadapy.MainFrame.MemoSave.Lines.Add('         sock.bind(server_address)');
        scadapy.MainFrame.MemoSave.Lines.Add('         while True:');
        scadapy.MainFrame.MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        scadapy.MainFrame.MemoSave.Lines.Add('             udpdata=data');
        scadapy.MainFrame.MemoSave.Lines.Add('             SelectData(udpdata)');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('def run(server_class=HTTPServer, handler_class=S, port=8080):');
        scadapy.MainFrame.MemoSave.Lines.Add('     server_address = (serverSlave, int(portSlave))');
        scadapy.MainFrame.MemoSave.Lines.Add('     httpd = server_class(server_address, handler_class)');
        scadapy.MainFrame.MemoSave.Lines.Add('     print(''Starting httpd...\n'')');
        scadapy.MainFrame.MemoSave.Lines.Add('     try:');
        scadapy.MainFrame.MemoSave.Lines.Add('         httpd.serve_forever()');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        scadapy.MainFrame.MemoSave.Lines.Add('         pass');
        scadapy.MainFrame.MemoSave.Lines.Add('     httpd.server_close() ');
        scadapy.MainFrame.MemoSave.Lines.Add('if __name__ == "__main__": ');
        scadapy.MainFrame.MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   scadapy.MainFrame.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=''''');
           end;
        scadapy.MainFrame.MemoSave.Lines.Add('     AllData=''''');
        scadapy.MainFrame.MemoSave.Lines.Add('     try: ');
        scadapy.MainFrame.MemoSave.Lines.Add('         print( ''Starting web server...'')');
        scadapy.MainFrame.MemoSave.Lines.Add('         serverSlave=''127.0.0.1''');
        scadapy.MainFrame.MemoSave.Lines.Add('         portSlave=''8080''');
        scadapy.MainFrame.MemoSave.Lines.Add('         timeOut=2 ');
        scadapy.MainFrame.MemoSave.Lines.Add('         login=''root''');
        scadapy.MainFrame.MemoSave.Lines.Add('         password=''root''');
        scadapy.MainFrame.MemoSave.Lines.Add('         set_auth(login,password)');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,)) ');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb.daemon = True');
        scadapy.MainFrame.MemoSave.Lines.Add('         modb.start()');
        scadapy.MainFrame.MemoSave.Lines.Add('         run()');
        scadapy.MainFrame.MemoSave.Lines.Add('     except Exception as e:');
        scadapy.MainFrame.MemoSave.Lines.Add('         print(e)');
        try
            scadapy.MainFrame.MemoSave.Lines.SaveToFile(ProjectPath+'jserver.py');
          except
             ShowMessage('Error to save');
          end;
end;


procedure FileHtmlSave();
var
  rowCount,j: integer;
begin
  scadapy.MainFrame.MemoSave.Clear;
  scadapy.MainFrame.MemoSave.Lines.Add('<!--###########################################################################');
  scadapy.MainFrame.MemoSave.Lines.Add('## Html code generated with '+Version+' '+ DateToStr(Date())+' ');
  scadapy.MainFrame.MemoSave.Lines.Add('## Html Client by Jack Mas');
  scadapy.MainFrame.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  scadapy.MainFrame.MemoSave.Lines.Add('##');
  scadapy.MainFrame.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  scadapy.MainFrame.MemoSave.Lines.Add('########################################################################### -->');
  scadapy.MainFrame.MemoSave.Lines.Add('<!DOCTYPE html>');
  scadapy.MainFrame.MemoSave.Lines.Add('<meta http-equiv="content-type" content="text/html; charset=utf-8">');
  scadapy.MainFrame.MemoSave.Lines.Add('<meta charset="utf-8">');
  scadapy.MainFrame.MemoSave.Lines.Add('<title>ScadaPy Html client</title>');
  scadapy.MainFrame.MemoSave.Lines.Add('<script type="text/javascript">');
  scadapy.MainFrame.MemoSave.Lines.Add('var Host="http://127.0.0.1:8080/data";');
  scadapy.MainFrame.MemoSave.Lines.Add('var Login=''root'';');
  scadapy.MainFrame.MemoSave.Lines.Add('var Password=''root'';');
  scadapy.MainFrame.MemoSave.Lines.Add('var resp="0";');
   rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   begin
                   scadapy.MainFrame.MemoSave.Lines.Add('var '+scadapy.MainFrame.GVarTree.Cells[2, j]+';');
                   scadapy.MainFrame.MemoSave.Lines.Add('var Alias_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'='''+scadapy.MainFrame.GVarTree.Cells[8, j]+''';');
                   end;

           end;
  scadapy.MainFrame.MemoSave.Lines.Add('function init()  {   setInterval(function(){ getData();}, 1000); }');
  scadapy.MainFrame.MemoSave.Lines.Add('function getData() {');
  scadapy.MainFrame.MemoSave.Lines.Add('if (window.XMLHttpRequest) {  xmlhttp=new XMLHttpRequest();                        }');
  scadapy.MainFrame.MemoSave.Lines.Add('else                       {  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");      }');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.open("GET",Host,true);');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.setRequestHeader("Authorization", "Basic " + btoa(Login+":"+Password));');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.withCredentials = true;');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.send(null);');
  scadapy.MainFrame.MemoSave.Lines.Add('xmlhttp.onreadystatechange=function()   {');
  scadapy.MainFrame.MemoSave.Lines.Add('if (xmlhttp.readyState==4 && xmlhttp.status==200) {');
  scadapy.MainFrame.MemoSave.Lines.Add('resp= xmlhttp.responseText;');
  scadapy.MainFrame.MemoSave.Lines.Add('parseResp=JSON.parse(resp);');
  scadapy.MainFrame.MemoSave.Lines.Add('document.getElementById("recv").innerHTML=resp;');
  rowCount:=scadapy.MainFrame.GVarTree.RowCount;
       for j:=1 to rowCount-1 do
           begin
            if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                  begin
                     scadapy.MainFrame.MemoSave.Lines.Add('try      { document.getElementById("'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").innerHTML=Alias_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'+'': ''+ parseResp['+(j-1).ToString+'].'+scadapy.MainFrame.GVarTree.Cells[2, j]+'; }');
                     scadapy.MainFrame.MemoSave.Lines.Add('catch(e) { document.getElementById("'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").innerHTML=Alias_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'+'': 0''; }');
                     if(scadapy.MainFrame.GVarTree.Cells[6, j] = 'bool') then
                       begin
                        scadapy.MainFrame.MemoSave.Lines.Add('try {');
                        scadapy.MainFrame.MemoSave.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+scadapy.MainFrame.GVarTree.Cells[2, j]+';');
                        scadapy.MainFrame.MemoSave.Lines.Add('if(parseResp['+(j-1).ToString+'].'+scadapy.MainFrame.GVarTree.Cells[2, j]+' == true) { document.getElementById("i1").contentDocument.getElementById("REC_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").setAttribute("fill", "red"); }');
                        scadapy.MainFrame.MemoSave.Lines.Add('else { document.getElementById("i1").contentDocument.getElementById("REC_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").setAttribute("fill", "green"); }');
                        scadapy.MainFrame.MemoSave.Lines.Add('} catch(e) {');
                        scadapy.MainFrame.MemoSave.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").textContent=0; }');
                       end
                     else
                       begin
 scadapy.MainFrame.MemoSave.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+scadapy.MainFrame.GVarTree.Cells[2, j]+'.toFixed(3); }');
 scadapy.MainFrame.MemoSave.Lines.Add('catch(e) {');
 scadapy.MainFrame.MemoSave.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+scadapy.MainFrame.GVarTree.Cells[2, j]+'; }');
 scadapy.MainFrame.MemoSave.Lines.Add('catch(e) { document.getElementById("i1").contentDocument.getElementById("SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'").textContent=0; }');
 scadapy.MainFrame.MemoSave.Lines.Add('         }');
                       end;
                  end;
          end;
  scadapy.MainFrame.MemoSave.Lines.Add('}  }  }');
  scadapy.MainFrame.MemoSave.Lines.Add('</script>');
  scadapy.MainFrame.MemoSave.Lines.Add('<body onload="init()" style="background-color:white" >');
  scadapy.MainFrame.MemoSave.Lines.Add('<span id="recv"></span><br>');
         for j:=1 to rowCount-1 do
           begin
            if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                  begin
                     scadapy.MainFrame.MemoSave.Lines.Add('<span id="'+scadapy.MainFrame.GVarTree.Cells[2, j]+'"></span><br>');
                  end;
          end;
         scadapy.MainFrame.MemoSave.Lines.Add('<br><br><iframe id="i1" width="800" height="'+(j*35).ToString+'"  src="./image.svg" ></iframe>');
         scadapy.MainFrame.MemoSave.Lines.Add('</body></html>');
    try
            scadapy.MainFrame.MemoSave.Lines.SaveToFile(ProjectPath+'jclient.html');
          except
             ShowMessage('Error to save');
          end;
          scadapy.MainFrame.MemoSave.Clear;
          scadapy.MainFrame.MemoSave.Lines.Add('<svg xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><text x="0"  y="15">SVG image</text>');
          for j:=1 to rowCount-1 do
            begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   begin
                       scadapy.MainFrame.MemoSave.Lines.Add('<text x="40"  y="'+(j*35).ToString+'">'+scadapy.MainFrame.GVarTree.Cells[6, j]+'</text>');
                       scadapy.MainFrame.MemoSave.Lines.Add('<text x="130"  y="'+(j*35).ToString+'">'+scadapy.MainFrame.GVarTree.Cells[8, j]+'</text>');
                       scadapy.MainFrame.MemoSave.Lines.Add('<text id="SVG_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'" x="400"  y="'+(j*35).ToString+'">value</text>');
                       scadapy.MainFrame.MemoSave.Lines.Add('<rect id="REC_'+scadapy.MainFrame.GVarTree.Cells[2, j]+'" x="10" y="'+(j*35-15).ToString+'" width="20" height="20" fill="red"/>');
                   end;
           end;
                      scadapy.MainFrame.MemoSave.Lines.Add('</svg>');

                      try
                              scadapy.MainFrame.MemoSave.Lines.SaveToFile(ProjectPath+'image.svg');
                            except
                               ShowMessage('Error to save');
                            end;


end;

end.















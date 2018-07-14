unit cmdprocedure;

{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces,
  process, LCLProc,XMLRead ,dom;

procedure RunCmd(comEx: string);
procedure StartCommand(pyfile: string);
procedure StartMonitor();
procedure StartHtmlClient();
procedure SaveStartStopSh();
procedure StartSh();
procedure StopSh();
procedure Start104Client();
procedure Start104server();

implementation
uses  scadapy;


 procedure StopSh();
  begin
         {$IFDEF Windows}
               //  RunCmd(scadapy.PathToPythonWindows+' '+scadapy.ProjectPath+''+pyfile+'"');
         {$ENDIF Windows}
         {$IFDEF Unix}
            RunCmd(scadapy.PathToTerminalLinux + ' "'+scadapy.PathToPythonLinux+' '+scadapy.ProjectPath+'stop.sh"');
         {$ENDIF Unix}


  end;


 procedure StartSh();
 begin
        {$IFDEF Windows}
              //  RunCmd(scadapy.PathToPythonWindows+' '+scadapy.ProjectPath+''+pyfile+'"');
        {$ENDIF Windows}
        {$IFDEF Unix}
           RunCmd(scadapy.PathToTerminalLinux + ' "'+scadapy.PathToPythonLinux+' '+scadapy.ProjectPath+'start.sh"');
        {$ENDIF Unix}


 end;

 procedure SaveStartStopSh();
 begin
          {$IFDEF Windows}
            //RunCmdCommand(PathToPythonWindows+' '+PathToProject+'udpmonitor.py"');
          {$ENDIF Windows}
          {$IFDEF Unix}
          scadapy.MainFrame.MemoSave.Clear;
          scadapy.MainFrame.MemoSave.Lines.Add('#!/bin/sh');
          scadapy.MainFrame.MemoSave.Lines.Add('echo ''Start python scripts''');
          scadapy.MainFrame.MemoSave.Lines.Add('nohup python3 '+scadapy.ProjectPath+'modbus.py 1>/dev/null 2>/dev/null &');
          scadapy.MainFrame.MemoSave.Lines.Add('echo $! > '+scadapy.ProjectPath+'modbus.pid');
          scadapy.MainFrame.MemoSave.Lines.Add('nohup python3 '+scadapy.ProjectPath+'mclient.py 1>/dev/null 2>/dev/null &');
          scadapy.MainFrame.MemoSave.Lines.Add('echo $! > '+scadapy.ProjectPath+'mclient.pid');
          scadapy.MainFrame.MemoSave.Lines.Add('nohup python3 '+scadapy.ProjectPath+'jserver.py 1>/dev/null 2>/dev/null &');
          scadapy.MainFrame.MemoSave.Lines.Add('echo $! > '+scadapy.ProjectPath+'jserver.pid');
          scadapy.MainFrame.MemoSave.Lines.Add('nohup python3 '+scadapy.ProjectPath+'dbserver.py 1>/dev/null 2>/dev/null &');
          scadapy.MainFrame.MemoSave.Lines.Add('echo $! > '+scadapy.ProjectPath+'dbserver.pid');
          scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'start.sh' );
          scadapy.MainFrame.MemoSave.Clear;
          scadapy.MainFrame.MemoSave.Lines.Add('#!/bin/sh');
          scadapy.MainFrame.MemoSave.Lines.Add('echo ''Stop python scripts''');
          scadapy.MainFrame.MemoSave.Lines.Add('kill -9 `cat '+scadapy.ProjectPath+'modbus.pid`');
          scadapy.MainFrame.MemoSave.Lines.Add('kill -9 `cat '+scadapy.ProjectPath+'mclient.pid`');
          scadapy.MainFrame.MemoSave.Lines.Add('kill -9 `cat '+scadapy.ProjectPath+'jserver.pid`');
          scadapy.MainFrame.MemoSave.Lines.Add('kill -9 `cat '+scadapy.ProjectPath+'dbserver.pid`');
          scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'stop.sh' );
          try
              RunCmd('chmod 777 '+scadapy.ProjectPath+'start.sh');
              RunCmd('chmod 777 '+scadapy.ProjectPath+'stop.sh');
          except
              ShowMessage('Scripts chmod error');
          end;
         {$ENDIF Unix}
 end;

 procedure StartHtmlClient();
 var
   AProcess     : TProcess;
 begin
        try
           AProcess := TProcess.Create(nil);
          {$IFDEF Windows}
               AProcess.Executable := '"'+scadapy.PathToBrowserWindows+'" '+scadapy.ProjectPath+'jclient.html' ;
          {$ENDIF Windows}
          {$IFDEF Unix}
              AProcess.Executable := scadapy.PathToBrowserLinux;
              AProcess.Parameters.Add(scadapy.ProjectPath+'jclient.html');
          {$ENDIF Unix}
            AProcess.Execute;
        except
            on E: Exception do
            ShowMessage('An exception was raised: ' + E.Message);

        end;

 end;


  procedure Start104Client();
 var
   AProcess     : TProcess;
begin
      try
        AProcess := TProcess.Create(nil);
       {$IFDEF Windows}
           AProcess.Executable := 'cmd.exe' ;
           AProcess.Parameters.DelimitedText :='/c "'+ExtractFileDir(Application.ExeName)+'\iec104\client\iec104client.exe '+scadapy.ProjectPath+'iec104client.json"';
           //ShowMessage(ExtractFileDir(Application.ExeName));
       {$ENDIF Windows}
       {$IFDEF Unix}
       AProcess.CommandLine :=scadapy.PathToTerminalLinux + ' "'+ExtractFileDir(Application.ExeName)+'/iec104/client/iec104client '+scadapy.ProjectPath+'iec104client.json'+'"';
                 AProcess.Options := AProcess.Options;// + [poWaitOnExit];
       {$ENDIF Unix}
           AProcess.Execute;
           AProcess.Free;
     except
           ShowMessage('Не возможно выполнить команду');
     end;
 end;

procedure Start104server();
   var
     AProcess     : TProcess;
  begin
        try
          AProcess := TProcess.Create(nil);
         {$IFDEF Windows}
             AProcess.Executable := 'cmd.exe' ;
             AProcess.Parameters.DelimitedText :='/c "'+ExtractFileDir(Application.ExeName)+'\iec104\server\iec104server.exe '+scadapy.ProjectPath+'iec104server.json"';

         {$ENDIF Windows}
         {$IFDEF Unix}
             AProcess.CommandLine :=scadapy.PathToTerminalLinux + ' "'+ExtractFileDir(Application.ExeName)+'/iec104/server/iec104server '+scadapy.ProjectPath+'iec104server.json'+'"';
             AProcess.Options := AProcess.Options;// + [poWaitOnExit];
         {$ENDIF Unix}
             AProcess.Execute;
             AProcess.Free;
       except
             ShowMessage('Не возможно выполнить команду');
       end;
   end;

 procedure StartMonitor();
 begin
      scadapy.MainFrame.MemoSave.Clear;
      scadapy.MainFrame.MemoSave.Lines.Add('import socket');
      scadapy.MainFrame.MemoSave.Lines.Add('import sys');
      scadapy.MainFrame.MemoSave.Lines.Add('import time');
      scadapy.MainFrame.MemoSave.Lines.Add('sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
      scadapy.MainFrame.MemoSave.Lines.Add('server_address = (''localhost'', 64000)');
      scadapy.MainFrame.MemoSave.Lines.Add('print(''starting up on {} port {}''.format(*server_address))');
      scadapy.MainFrame.MemoSave.Lines.Add('sock.bind(server_address)');
      scadapy.MainFrame.MemoSave.Lines.Add('while True:');
      scadapy.MainFrame.MemoSave.Lines.Add('    data, address = sock.recvfrom(4096)');
      scadapy.MainFrame.MemoSave.Lines.Add('    print(data)');
      scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+ 'udpmonitor.py' );
     {$IFDEF Windows}
      StartCommand('udpmonitor.py');
     {$ENDIF Windows}
     {$IFDEF Unix}
      //RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+PathToProject+'udpmonitor.py'+'"');
     StartCommand('udpmonitor.py');
      {$ENDIF Unix}
 end;

procedure StartCommand(pyfile: string);
begin


       {$IFDEF Windows}
          RunCmd(scadapy.PathToPythonWindows+' '+scadapy.ProjectPath+''+pyfile+'"');
       {$ENDIF Windows}
       {$IFDEF Unix}
        RunCmd(scadapy.PathToTerminalLinux + ' "'+scadapy.PathToPythonLinux+' '+scadapy.ProjectPath+''+pyfile+'"');
       {$ENDIF Unix}
 end;











 procedure RunCmd(comEx: string);
var
  AProcess     : TProcess;
begin
      try
        AProcess := TProcess.Create(nil);
       {$IFDEF Windows}
           AProcess.Executable := 'cmd.exe' ;
           AProcess.Parameters.DelimitedText :='/c "'+comEx;
       {$ENDIF Windows}
       {$IFDEF Unix}
           AProcess.CommandLine :=comEx;
           AProcess.Options := AProcess.Options;// + [poWaitOnExit];
       {$ENDIF Unix}
           AProcess.Execute;
           AProcess.Free;
     except
           ShowMessage('Не возможно выполнить команду');
     end;
end;









end.


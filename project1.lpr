program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, scadapy, VkProcedure, MercProcedure, ModbusProcedure, DbProcedure,
  jsonprocedure, xmlprocedure, cmdprocedure
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainFrame, MainFrame);
  Application.Run;
end.


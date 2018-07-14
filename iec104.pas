unit iec104;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces;

procedure clientSave();
procedure serverSave();

implementation
uses  scadapy;

procedure clientSave();
var
  rowCount,i,j,z: integer;
  insText,mThread,mThreadJoin:String;
begin
          rowCount:=scadapy.MainFrame.MainTree.Items.Count;
          scadapy.MainFrame.MemoSave.Clear;
          try
           for i:=1 to RowCount do
           begin
            if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 2) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) then
              begin
                   scadapy.MainFrame.MemoSave.Lines.Add('[');
                   scadapy.MainFrame.MemoSave.Lines.Add('{ "Client":');
                   scadapy.MainFrame.MemoSave.Lines.Add('    { "UdpPort"   :"'+scadapy.MainFrame.Eudpport.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "UdpIp"     :"'+scadapy.MainFrame.Eudpip.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Iec104Port":"'+scadapy.MainFrame.Eiec104port.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Iec104Ip"  :"'+scadapy.MainFrame.Eiec104ip.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Debug"     :"'+scadapy.MainFrame.Edebug.Text+'",');
                   if( scadapy.MainFrame.CheckDebug.Checked = True) then
                      scadapy.MainFrame.MemoSave.Lines.Add('      "TimeSync"  :"1" ');
                   if( scadapy.MainFrame.CheckDebug.Checked = False) then
                      scadapy.MainFrame.MemoSave.Lines.Add('      "TimeSync"  :"0" ');
                   scadapy.MainFrame.MemoSave.Lines.Add('     }');
                   scadapy.MainFrame.MemoSave.Lines.Add('}');

                   for j:=1 to Length(  MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                          begin
                             if( Length( MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                               begin
                                   scadapy.MainFrame.MemoSave.Lines.Add(',');
                                   if(MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6] = 'bool') then
                                    begin
                                     scadapy.MainFrame.MemoSave.Lines.Add('{ "SinglePoint": ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('  {');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "VarName"   : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "IecAddress": "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "Alias"     : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "VarType"   : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'" ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('  }');
                                     scadapy.MainFrame.MemoSave.Lines.Add('}');
                                    end
                                   else
                                    begin
                                   scadapy.MainFrame.MemoSave.Lines.Add('{ "MeasureValue": ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('  {');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "VarName"   : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "IecAddress": "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "Alias"     : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "VarType"   : "'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'" ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('  }');
                                   scadapy.MainFrame.MemoSave.Lines.Add('}');

                                   end;

                               end;
                          end;
                    scadapy.MainFrame.MemoSave.Lines.Add(']');

               end;
         end;
         except

         end;

     try
       scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'iec104client.json');
     except
        ShowMessage('Error to save');
     end;
 end;



 
procedure serverSave();
var
  rowCount,i,j,z: integer;
  insText,mThread,mThreadJoin:String;
begin
          rowCount:=scadapy.MainFrame.Giec104server.RowCount;
          scadapy.MainFrame.MemoSave.Clear;
          try
                   scadapy.MainFrame.MemoSave.Lines.Add('[');
                   scadapy.MainFrame.MemoSave.Lines.Add('{ "Server":');
                   scadapy.MainFrame.MemoSave.Lines.Add('    { "UdpPort"   :"'+scadapy.MainFrame.Eiec104serverUDPport.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "UdpIp"     :"'+scadapy.MainFrame.Eiec104serverUDPIP.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Iec104Port":"'+scadapy.MainFrame.Eiec104serverPort.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Iec104Ip"  :"'+scadapy.MainFrame.Eiec104serverIP.Text+'",');
                   scadapy.MainFrame.MemoSave.Lines.Add('      "Debug"     :"'+scadapy.MainFrame.Eiec104serverDebug.Text+'"');
                   scadapy.MainFrame.MemoSave.Lines.Add('     }');
                   scadapy.MainFrame.MemoSave.Lines.Add('}');
           for i:=1 to rowCount-1 do
           begin

                      if(Length(scadapy.MainFrame.Giec104server.Cells[1, i]) > 0) then
                       begin
                                   scadapy.MainFrame.MemoSave.Lines.Add(',');
                                   if(scadapy.MainFrame.Giec104server.Cells[6, i] = 'bool') then
                                    begin
                                     scadapy.MainFrame.MemoSave.Lines.Add('{ "SinglePoint": ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('  {');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "VarName"     : "'+scadapy.MainFrame.Giec104server.Cells[1, i]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "IecAddress"  : "'+scadapy.MainFrame.Giec104server.Cells[3, i]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "OffSet"      : "'+scadapy.MainFrame.Giec104server.Cells[7, i]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "ByteCount"   : "'+scadapy.MainFrame.Giec104server.Cells[4, i]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "ByteSequence": "'+scadapy.MainFrame.Giec104server.Cells[5, i]+'", ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('    "VarType"     : "'+scadapy.MainFrame.Giec104server.Cells[6, i]+'" ');
                                     scadapy.MainFrame.MemoSave.Lines.Add('  }');
                                     scadapy.MainFrame.MemoSave.Lines.Add('}');
                                    end
                                   else
                                    begin
                                   scadapy.MainFrame.MemoSave.Lines.Add('{ "MeasureValue": ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('  {');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "VarName"     : "'+scadapy.MainFrame.Giec104server.Cells[1, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "IecAddress"  : "'+scadapy.MainFrame.Giec104server.Cells[3, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "OffSet"      : "'+scadapy.MainFrame.Giec104server.Cells[7, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "ByteCount"   : "'+scadapy.MainFrame.Giec104server.Cells[4, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "ByteSequence": "'+scadapy.MainFrame.Giec104server.Cells[5, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "Koef"        : "'+scadapy.MainFrame.Giec104server.Cells[8, i]+'", ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('    "VarType"     : "'+scadapy.MainFrame.Giec104server.Cells[6, i]+'" ');
                                   scadapy.MainFrame.MemoSave.Lines.Add('  }');
                                   scadapy.MainFrame.MemoSave.Lines.Add('}');
                                   end;

                      end;
            end;
                    scadapy.MainFrame.MemoSave.Lines.Add(']');
         except
           ShowMessage('Error to save');
         end;
     try
       scadapy.MainFrame.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'iec104server.json');
     except
        ShowMessage('Error to save');
     end;
 end;






end.


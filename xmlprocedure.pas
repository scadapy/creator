unit xmlprocedure;

{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls,  Buttons, Interfaces,
  process, LCLProc,XMLRead ,dom;


procedure LoadFromXMLfile(filename: String);
procedure LoadFromXMLVK(filename: String);
procedure SaveXMLConfig();
procedure OpenDBXMLfile(fileName: string);
procedure OpenVkXMLfile(fileName: string);

implementation
uses  scadapy;

procedure OpenVkXMLfile(fileName: string);
var
       Child: TDOMNode;
       Doc : TXMLDocument;
       j,i: Integer;
begin
 try
    ReadXMLFile(Doc,fileName );
    Child := Doc.DocumentElement.FindNode('VkConfig');
    while Assigned(Child) do
    begin
       with Child.ChildNodes do
           try
              for j := 0 to (Count - 1) do
                 begin
                        for i := 0 to 1 do
                        begin
                               if (Item[j].Attributes.Item[i].NodeName = 'VkLogin') then
                               begin
                                   scadapy.VkLogin:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EVKLogin.Text:=scadapy.VkLogin;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'VkPassword') then
                               begin
                                   scadapy.VkPassword:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EVKPassword.Text:=scadapy.VkPassword;
                               end;
                        end;
                  end;

           finally
                 Free;
             end;
             Child := Child.NextSibling;
    end;
  finally
    Doc.Free;
  end;
end;

procedure SaveXMLConfig();
var
  rowCount,i,j,rowCountVk: integer;
begin
rowCount:=scadapy.MainFrame.MainTree.Items.Count;
scadapy.MainFrame.MemoSave.Clear;
scadapy.MainFrame.MemoSave.Lines.Add('<?xml version="1.0"?>');
scadapy.MainFrame.MemoSave.Lines.Add('<Config xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
/////////////////
scadapy.MainFrame.MemoSave.Lines.Add(' <VkVariables>');
rowCountVk:= scadapy.MainFrame.GVKTree.RowCount-1;
       for i:=1 to RowCountVk do
       begin
            if   (Length(scadapy.MainFrame.GVKTree.Cells[1, i]) > 0) and
                 (Length(scadapy.MainFrame.GVKTree.Cells[4, i]) > 0) and
                 (Length(scadapy.MainFrame.GVKTree.Cells[3, i]) > 0)  then
                begin
                    scadapy.MainFrame.MemoSave.Lines.Add('    <VkPoint Id="'+i.ToString+'" VkVar="'+scadapy.MainFrame.GVKTree.Cells[1, i]+'" '+
                                        'VkMessage="'+scadapy.MainFrame.GVKTree.Cells[2, i]+'" VkId="'+scadapy.MainFrame.GVKTree.Cells[3, i]+
                    '" VkTime="'+scadapy.MainFrame.GVKTree.Cells[4, i]+'" >'+scadapy.MainFrame.GVarTree.Cells[3, i]+'</VkPoint>');
                end;
       end;
       scadapy.MainFrame.MemoSave.Lines.Add(' </VkVariables>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <VkConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add('     <Cnf VkLogin="'+scadapy.MainFrame.EVKLogin.Text+'" VkPassword="'+scadapy.MainFrame.EVKPassword.Text+'"></Cnf>');
       scadapy.MainFrame.MemoSave.Lines.Add(' </VkConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <DbConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add('     <Cnf DbHost="'+scadapy.MainFrame.EDBhost.Text+'" DbPort="'+scadapy.MainFrame.EDBPort.Text+'" DbLogin="'+
       scadapy.MainFrame.EDBLogin.Text+'" DbPassword="'+scadapy.MainFrame.EDBPassword.Text+'"></Cnf>');
       scadapy.MainFrame.MemoSave.Lines.Add(' </DbConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <ProjectConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add('     <Config ProjectName="'+scadapy.MainFrame.EProjectName.Text+'" ProjectPath="'+scadapy.MainFrame.EProjectPath.Text+
       '" PathToPythonWindows="'+scadapy.MainFrame.EWindowsPythonPath.Text+'" PathToBrowserWindows="'+scadapy.MainFrame.EWindowsBrowser.Text+
'" PathToTerminalLinux="'+scadapy.MainFrame.ELinuxTerminal.Text+'" PathToBrowserLinux="'+scadapy.MainFrame.ELinuxBrowser.Text+'" PathToPythonLinux="'+scadapy.MainFrame.ELinuxPythonPath.Text+'"></Config>');
       scadapy.MainFrame.MemoSave.Lines.Add(' </ProjectConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <ModbusConfig>');
       try
       for i:=1 to RowCount do
       begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 0) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) then
            begin
                 scadapy.MainFrame.MemoSave.Lines.Add('     <PortModbus ParentIndex="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index.ToString+'" ItemIndex="'+
                 scadapy.MainFrame.MainTree.Items.Item[i-1].Index.ToString+
                 '" Level="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ProtocolType+
                 '"  Mtype="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM +
                 '" port_speed="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ scadapy.MainFrame.MainTree.Items.Item[i-1].Text+'">'+
                 scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index.ToString);

                        for j:=1 to Length(  MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                            if( Length(MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                              begin
                               scadapy.MainFrame.MemoSave.Lines.Add('          <VariableModbus id="'+j.ToString+'" VarName="'+
                                MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                               '" RtuAddress="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" RegName="'+
                                MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                               '" RegAddress="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" RegOffset="'+
                                MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                               '" TimeOut="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableModbus>');
                              end;
                        end;
                 scadapy.MainFrame.MemoSave.Lines.Add('     </PortModbus>');

             end;
       end;
       except
       end;
       scadapy.MainFrame.MemoSave.Lines.Add(' </ModbusConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <MercuryConfig>');
       for i:=1 to RowCount do
       begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 1) and  (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) then
            begin
                scadapy.MainFrame.MemoSave.Lines.Add('     <PortMercury ParentIndex="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index.ToString+
                '" ItemIndex="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Index.ToString+
             '" Level="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ProtocolType+
             '" Mtype="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+
             MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.TCP_COM +
             '" port_speed="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ scadapy.MainFrame.MainTree.Items.Item[i-1].Text+'">'+
             scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index.ToString);
                for j:=1 to Length(  MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                begin
                  if( Length(MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                     begin
                       scadapy.MainFrame.MemoSave.Lines.Add('          <VariableMercury id="'+j.ToString+'" VarName="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                       '" Serial_Number="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" Empty1="'+
                       MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                       '" Empty2="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" Net_Address="'+
                       MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                       '" TimeOut="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableMercury>');
                     end;
                end;
         scadapy.MainFrame.MemoSave.Lines.Add('     </PortMercury>');
            end;
       end;
       scadapy.MainFrame.MemoSave.Lines.Add(' </MercuryConfig>');
       scadapy.MainFrame.MemoSave.Lines.Add(' <Variables>');
       rowCount:= scadapy.MainFrame.GVarTree.RowCount-1;
       for i:=1 to RowCount do
       begin
            if  (Length(scadapy.MainFrame.GVarTree.Cells[1, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[2, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[3, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[4, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[5, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[6, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[7, i]) > 0) then
                begin
                    scadapy.MainFrame.MemoSave.Lines.Add('    <VarPoint Id="'+i.ToString+'" VarName="'+scadapy.MainFrame.GVarTree.Cells[1, i]+'" '+
                                        'Alias="'+scadapy.MainFrame.GVarTree.Cells[2, i]+'" Address="'+scadapy.MainFrame.GVarTree.Cells[3, i]+
                    '" ByteCount="'+scadapy.MainFrame.GVarTree.Cells[4, i]+'" ByteRoute="'+scadapy.MainFrame.GVarTree.Cells[5, i]+'" VarType="'+scadapy.MainFrame.GVarTree.Cells[6, i]+
                    '" Manage="'+scadapy.MainFrame.GVarTree.Cells[7, i]+'" '+' VarAlias="'+scadapy.MainFrame.GVarTree.Cells[8, i]+'"  DbArch="'+scadapy.MainFrame.GVarTree.Cells[9, i]+'" >'+
                    scadapy.MainFrame.GVarTree.Cells[1, i]+'</VarPoint>');
                end;
       end;
       scadapy.MainFrame.MemoSave.Lines.Add(' </Variables>');
       scadapy.MainFrame.MemoSave.Lines.Add('</Config>');
       scadapy.MainFrame.MemoSave.Lines.SaveToFile( scadapy.FullProjectFilePath );
end;


procedure LoadFromXMLVK(filename: String);
var
       Child: TDOMNode;
       Doc : TXMLDocument;
       j,i: Integer;
begin
 try
    ReadXMLFile(Doc,filename );
    Child := Doc.DocumentElement.FindNode('VkVariables');
    begin
       with Child.ChildNodes do
           try
              for j := 0 to (Count - 1) do
                 begin
                     scadapy.MainFrame.GVKTree.RowCount:=Count+2;
                        for i := 0 to 4 do
                        begin
                           scadapy.MainFrame.GVKTree.Cells[0, j+1]:= (j+1).ToString;
                           if (Item[j].Attributes.Item[i].NodeName = 'VkVar') then       scadapy.MainFrame.GVKTree.Cells[1, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkMessage') then   scadapy.MainFrame.GVKTree.Cells[2, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkId') then        scadapy.MainFrame.GVKTree.Cells[3, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkTime') then      scadapy.MainFrame.GVKTree.Cells[4, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                        end;
                  end;
           finally
                 Free;
           end;
       Child := Child.NextSibling;
    end;
  finally
    Doc.Free;
  end;
end;




procedure OpenDBXMLfile(fileName: string);
var
       Child: TDOMNode;
       Doc : TXMLDocument;
       j,i: Integer;
begin
 try
    ReadXMLFile(Doc,fileName );
    Child := Doc.DocumentElement.FindNode('DbConfig');
    while Assigned(Child) do
    begin
       with Child.ChildNodes do
           try
              for j := 0 to (Count - 1) do
                 begin
                        for i := 0 to 3 do
                        begin
                             if (Item[j].Attributes.Item[i].NodeName = 'DbHost') then
                               begin
                                   scadapy.DbHost:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EDBhost.Text:=scadapy.DbHost;
                               end;
                            if (Item[j].Attributes.Item[i].NodeName = 'DbPort') then
                               begin
                                   scadapy.DbPort:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EDBPort.Text:=scadapy.DbPort;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'DbLogin') then
                               begin
                                   scadapy.DbLogin:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EDBLogin.Text:=scadapy.DbLogin;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'DbPassword') then
                               begin
                                   scadapy.DbPassword:=String(Item[j].Attributes.Item[i].NodeValue);
                                   scadapy.MainFrame.EDBPassword.Text:=scadapy.DbPassword;
                               end;
                        end;
                  end;
              // except
              //     On E :Exception do begin
              //     ShowMessage(E.Message);
              //
              //end;
           finally
                 Free;
             end;
             Child := Child.NextSibling;
    end;
  finally
    Doc.Free;
  end;
end;








procedure LoadFromXMLfile(filename: String);
var
       Child: TDOMNode;
       Doc : TXMLDocument;
       j,i,z: Integer;
       Node,Modbus,Rec: TTreeNode;
       DataRec:  MStructure;
begin
 try
    ReadXMLFile(Doc,filename );
///////////////modbus
    Child := Doc.DocumentElement.FindNode('ModbusConfig');
    begin
       with Child.ChildNodes do
           try
            Node := scadapy.MainFrame.MainTree.Items.Item[1];
            Modbus:= scadapy.MainFrame.MainTree.items.AddChild(Node,'Modbus');
               for j := 0 to (Count - 1) do
                 begin
                  New(DataRec);
                  DataRec^.ProtocolType:='';
                  DataRec^.ChanalType  :='';
                  DataRec^.PORT_SPEED := '';
                  DataRec^.TCP_COM := '';

                    for i := 0 to 7 do
                        begin
                           if (Item[j].Attributes.Item[i].NodeName = 'Protocol') then    DataRec^.ProtocolType:=String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Mtype') then       DataRec^.ChanalType  :=String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'tcp_com') then     DataRec^.TCP_COM :=    String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'port_speed') then  DataRec^.PORT_SPEED := String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'name') then        Rec:=scadapy.MainFrame.MainTree.items.AddChild(Modbus, String(Item[j].Attributes.Item[i].NodeValue));
                        end;
                          SetLength(DataRec^.StringData,Item[j].ChildNodes.Count+1,7);
                          for z := 1 to (Item[j].ChildNodes.Count - 1) do
                             begin
                                for i := 0 to 6 do
                                begin
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarName')    then  DataRec^.StringData[z][1]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'RtuAddress') then  DataRec^.StringData[z][2]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'RegName')    then  DataRec^.StringData[z][3]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'RegAddress') then  DataRec^.StringData[z][4]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'RegOffset')  then  DataRec^.StringData[z][5]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'TimeOut')    then  DataRec^.StringData[z][6]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                end;
                             end;
                    Rec.Data:= DataRec;
                 end;
           finally
                 Free;
            end;
             Child := Child.NextSibling;
    end;
///////////////mercury
        Child := Doc.DocumentElement.FindNode('MercuryConfig');
        begin
           with Child.ChildNodes do
               try
                Node := scadapy.MainFrame.MainTree.Items.Item[1];
                Modbus:= scadapy.MainFrame.MainTree.items.AddChild(Node,'Меркурий-230');
                   for j := 0 to (Count - 1) do
                     begin
                      New(DataRec);
                      DataRec^.ProtocolType:='';
                      DataRec^.ChanalType  :='';
                      DataRec^.PORT_SPEED := '';
                      DataRec^.TCP_COM := '';
                        for i := 0 to 7 do
                            begin
                               if (Item[j].Attributes.Item[i].NodeName = 'Protocol') then    DataRec^.ProtocolType:=String(Item[j].Attributes.Item[i].NodeValue);
                               if (Item[j].Attributes.Item[i].NodeName = 'Mtype') then       DataRec^.ChanalType  :=String(Item[j].Attributes.Item[i].NodeValue);
                               if (Item[j].Attributes.Item[i].NodeName = 'tcp_com') then     DataRec^.TCP_COM :=    String(Item[j].Attributes.Item[i].NodeValue);
                               if (Item[j].Attributes.Item[i].NodeName = 'port_speed') then  DataRec^.PORT_SPEED := String(Item[j].Attributes.Item[i].NodeValue);
                               if (Item[j].Attributes.Item[i].NodeName = 'name') then        Rec:=scadapy.MainFrame.MainTree.items.AddChild(Modbus, String(Item[j].Attributes.Item[i].NodeValue));
                            end;

                          SetLength(DataRec^.StringData,Item[j].ChildNodes.Count+1,7);
                          for z := 1 to (Item[j].ChildNodes.Count - 1) do
                             begin
                                for i := 0 to 6 do
                                begin
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarName')    then  DataRec^.StringData[z][1]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Serial_Number') then  DataRec^.StringData[z][2]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Empty1')    then  DataRec^.StringData[z][3]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Empty2') then  DataRec^.StringData[z][4]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Net_Address')  then  DataRec^.StringData[z][5]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'TimeOut')    then  DataRec^.StringData[z][6]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                end;
                             end;
                        Rec.Data:= DataRec;
                   end;
               finally
                     Free;
                end;
                 Child := Child.NextSibling;
        end;
   Child := Doc.DocumentElement.FindNode('Variables');
    begin
       with Child.ChildNodes do
           try
              for j := 0 to (Count - 1) do
                 begin
                     scadapy.MainFrame.GVarTree.RowCount:=Count+2;
                        for i := 0 to 9 do
                        begin
                           scadapy.MainFrame.GVarTree.Cells[0, j+1]:= (j+1).ToString;
                           if (Item[j].Attributes.Item[i].NodeName = 'VarName') then       scadapy.MainFrame.GVarTree.Cells[1, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Alias') then         scadapy.MainFrame.GVarTree.Cells[2, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Address') then       scadapy.MainFrame.GVarTree.Cells[3, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteCount') then     scadapy.MainFrame.GVarTree.Cells[4, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteRoute') then     scadapy.MainFrame.GVarTree.Cells[5, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarType') then       scadapy.MainFrame.GVarTree.Cells[6, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Manage') then        scadapy.MainFrame.GVarTree.Cells[7, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarAlias') then      scadapy.MainFrame.GVarTree.Cells[8, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'DbArch') then        scadapy.MainFrame.GVarTree.Cells[9, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);

                         //  scadapy.MainFrame.MemoSave.Lines.Add(String(Item[j].Attributes.Item[i].NodeValue));
                        end;
                  end;
           finally
                 Free;
           end;
       Child := Child.NextSibling;
    end;
  finally
    Doc.Free;
  end;
end;

end.


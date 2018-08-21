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
uses  scadapy,editor;

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
  rowCount,i,j,rowCountVk,rowCountIecServer: integer;
  Dcheck,orient: string;
begin
rowCount:=scadapy.MainFrame.MainTree.Items.Count;
scadapy.MainFrame.MemoSave.Clear;
scadapy.MainFrame.MemoSave.Lines.Add('<?xml version="1.0"?>');
scadapy.MainFrame.MemoSave.Lines.Add('<Config xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');



//////////////////
      scadapy.MainFrame.MemoSave.Lines.Add(' <Layout>');
                 scadapy.MainFrame.MemoSave.Lines.Add('    <Lconf    UdpPort="'+
                 editor.EditorForm.UDPPORT.Text+              '"  UdpIp="'+
                 editor.EditorForm.UDPIP.Text+                '" Image="'+
                 editor.EditorForm.ImageName+                 '" CanvasColor="'+
                 ColorToString(editor.EditorForm.MainCanvas.Color)+'" Height="'+
                 editor.EditorForm.MainCanvas.Height.ToString+'" Width="'+
                 editor.EditorForm.MainCanvas.Width.ToString+ '" >');


                 for i:=0 to 999 do
                 if(editor.EditorForm.EditObject[i]<>nil) and
                   (editor.EditorForm.EditObject[i].Visible=True) then
                 begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     <Lvar  ObjectType="EditObject"'+
                   ' ObjectName="' + editor.EditorForm.EditObject[i].Name+'"'+
                   ' Caption="'    + editor.EditorForm.EditObject[i].Caption+'"'+
                   ' Left="'       + editor.EditorForm.EditObject[i].Left.ToString+'"'+
                   ' Top="'        + editor.EditorForm.EditObject[i].Top.ToString+'"'+
                   ' Max=""'       +
                   ' Orient=""'    +
                   ' Width="'      + editor.EditorForm.EditObject[i].Width.ToString+'"'+
                   ' Height="'     + editor.EditorForm.EditObject[i].Height.ToString+'"'+
                   ' FontName="'   + editor.EditorForm.EditObject[i].Font.Name+'"'+
                   ' FontSize="'   + editor.EditorForm.EditObject[i].Font.Size.ToString +'"'+
                   ' FontColor="'  + ColorToString(editor.EditorForm.EditObject[i].Font.Color)+'"'+
                   ' ObjectColor="'+ ColorToString(editor.EditorForm.EditObject[i].Color)+'"'+
                   ' ObjectText="' + editor.EditorForm.EditObject[i].Text+'">-</Lvar>');
                 end;


                 for i:=0 to 999 do
                 if(editor.EditorForm.PBarObject[i]<>nil) and
                   (editor.EditorForm.PBarObject[i].Visible=True) then
                 begin

                    case editor.EditorForm.PBarObject[i].Orientation of
                       pbVertical      : orient := 'pbVertical';
                       pbHorizontal    : orient := 'pbHorizontal';
                    else
                       orient := 'pbHorizontal';
                    end;


                   scadapy.MainFrame.MemoSave.Lines.Add('     <Lvar  ObjectType="PBarObject"'+
                   ' ObjectName="' + editor.EditorForm.PBarObject[i].Name+'"'+
                   ' Max="'        + editor.EditorForm.PBarObject[i].Max.ToString+'"'+
                   ' Orient="'     + orient+'"'+
                   ' Left="'       + editor.EditorForm.PBarObject[i].Left.ToString+'"'+
                   ' Top="'        + editor.EditorForm.PBarObject[i].Top.ToString+'"'+
                   ' Width="'      + editor.EditorForm.PBarObject[i].Width.ToString+'"'+
                   ' Height="'     + editor.EditorForm.PBarObject[i].Height.ToString+'"'+
                   ' FontName="'   + editor.EditorForm.PBarObject[i].Font.Name+'"'+
                   ' ObjectText=""'+
                   ' Caption=""'   +
                   ' FontSize=""'  +
                   ' FontColor="'  + ColorToString(editor.EditorForm.PBarObject[i].Font.Color)+'"'+
                   ' ObjectColor="'+ ColorToString(editor.EditorForm.PBarObject[i].Color)+'"'+
                   '>-</Lvar>');
                 end;


                 for i:=0 to 999 do
                 if(editor.EditorForm.LabelObject[i]<>nil) and
                   (editor.EditorForm.LabelObject[i].Visible=True) then
                 begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     <Lvar  ObjectType="LabelObject"'+
                   ' ObjectName="' + editor.EditorForm.LabelObject[i].Name+'"'+
                   ' Caption="'    + editor.EditorForm.LabelObject[i].Caption+'"'+
                   ' Left="'       + editor.EditorForm.LabelObject[i].Left.ToString+'"'+
                   ' Top="'        + editor.EditorForm.LabelObject[i].Top.ToString+'"'+
                   ' Width="'      + editor.EditorForm.LabelObject[i].Width.ToString+'"'+
                   ' Height="'     + editor.EditorForm.LabelObject[i].Height.ToString+'"'+
                   ' FontName="'   + editor.EditorForm.LabelObject[i].Font.Name+'"'+
                   ' FontSize="'   + editor.EditorForm.LabelObject[i].Font.Size.ToString +'"'+
                   ' FontColor="'  + ColorToString(editor.EditorForm.LabelObject[i].Font.Color)+'"'+
                   ' ObjectColor="'+ ColorToString(editor.EditorForm.LabelObject[i].Color)+'"'+
                   ' Orient=""'    +
                   ' ObjectText=""' +
                   ' Max=""' +

                   '>-</Lvar>');
                 end;


                  for i:=0 to 999 do
                 if(editor.EditorForm.StaticTextObject[i]<>nil) and
                   (editor.EditorForm.StaticTextObject[i].Visible=True) then
                 begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     <Lvar  ObjectType="StaticTextObject"'+
                   ' ObjectName="' + editor.EditorForm.StaticTextObject[i].Name+'"'+
                   ' Caption="'    + editor.EditorForm.StaticTextObject[i].Caption+'"'+
                   ' Left="'       + editor.EditorForm.StaticTextObject[i].Left.ToString+'"'+
                   ' Top="'        + editor.EditorForm.StaticTextObject[i].Top.ToString+'"'+
                   ' Width="'      + editor.EditorForm.StaticTextObject[i].Width.ToString+'"'+
                   ' Height="'     + editor.EditorForm.StaticTextObject[i].Height.ToString+'"'+
                   ' FontName="'   + editor.EditorForm.StaticTextObject[i].Font.Name+'"'+
                   ' FontSize="'   + editor.EditorForm.StaticTextObject[i].Font.Size.ToString +'"'+
                   ' FontColor="'  + ColorToString(editor.EditorForm.StaticTextObject[i].Font.Color)+'"'+
                   ' Orient=""'    +
                   ' ObjectColor="'+ ColorToString(editor.EditorForm.StaticTextObject[i].Color)+'"'+
                   ' ObjectText=""' +
                   ' Max=""' +

                   '>-</Lvar>');
                 end;



                 for i:=0 to 999 do
                 if(editor.EditorForm.DiscretObject[i]<>nil) and
                   (editor.EditorForm.DiscretObject[i].Visible=True) then
                 begin
                   scadapy.MainFrame.MemoSave.Lines.Add('     <Lvar  ObjectType="DiscretObject"'+
                   ' ObjectName="' + editor.EditorForm.DiscretObject[i].Name+'"'+
                   ' Caption="'    + editor.EditorForm.DiscretObject[i].Caption+'"'+
                   ' Left="'       + editor.EditorForm.DiscretObject[i].Left.ToString+'"'+
                   ' Top="'        + editor.EditorForm.DiscretObject[i].Top.ToString+'"'+
                   ' Width="'      + editor.EditorForm.DiscretObject[i].Width.ToString+'"'+
                   ' Height="'     + editor.EditorForm.DiscretObject[i].Height.ToString+'"'+
                   ' ObjectColor="'+ ColorToString(editor.EditorForm.DiscretObject[i].Color)+'"'+
                   ' ObjectText=""'+
                   ' FontColor=""'  +
                   ' FontName=""'   +
                   ' FontSize=""'   +
                   ' Max=""'   +
                   ' Orient=""'    +

                   '>-</Lvar>');

                 end;


                    scadapy.MainFrame.MemoSave.Lines.Add('    </Lconf>');
                    scadapy.MainFrame.MemoSave.Lines.Add(' </Layout>');

//////////////////







//////////////////
      scadapy.MainFrame.MemoSave.Lines.Add(' <iec104server>');
                 if(scadapy.MainFrame.CheckDebug.Checked = True) then Dcheck:='1';
                 if(scadapy.MainFrame.CheckDebug.Checked = False) then Dcheck:='0';
                 scadapy.MainFrame.MemoSave.Lines.Add('    <PortIec104server   UdpPort="'+scadapy.MainFrame.Eiec104serverUDPport.Text+
                 '"  UdpIp="'+scadapy.MainFrame.Eiec104serverUDPIP.Text+
                 '" Iec104Port="'+scadapy.MainFrame.Eiec104serverPort.Text+
                 '" Iec104Ip="'+scadapy.MainFrame.Eiec104serverIP.Text+
                 '" Debug="'+scadapy.MainFrame.Eiec104serverDebug.Text+'"  >');



                 rowCountIecServer:= scadapy.MainFrame.Giec104server.RowCount-1;
                 for i:=1 to rowCountIecServer do
                 begin
                  if   (Length(scadapy.MainFrame.Giec104server.Cells[1, i]) > 0) and
                       (Length(scadapy.MainFrame.Giec104server.Cells[4, i]) > 0) and
                       (Length(scadapy.MainFrame.Giec104server.Cells[3, i]) > 0)  then
                   begin
                        scadapy.MainFrame.MemoSave.Lines.Add('          <VariableIec104 id="'+i.ToString+
                        '" VarName="'+scadapy.MainFrame.Giec104server.Cells[1, i]+
                        '" Alias="'+ scadapy.MainFrame.Giec104server.Cells[2, i]+
                        '" IecAddress="'+scadapy.MainFrame.Giec104server.Cells[3, i]+
                        '" ByteCount="'+scadapy.MainFrame.Giec104server.Cells[4, i]+
                        '" ByteSequence="'+scadapy.MainFrame.Giec104server.Cells[5, i]+
                        '" VarType="'+scadapy.MainFrame.Giec104server.Cells[6, i]+
                        '" OffSet="'+scadapy.MainFrame.Giec104server.Cells[7, i]+
                        '" Koef="'+scadapy.MainFrame.Giec104server.Cells[8, i]+
                        '">-</VariableIec104>');
                   end;
                end;
                    scadapy.MainFrame.MemoSave.Lines.Add('    </PortIec104server>');
         scadapy.MainFrame.MemoSave.Lines.Add(' </iec104server>');

//////////////////
      scadapy.MainFrame.MemoSave.Lines.Add(' <iec104client>');

      for i:=1 to RowCount do
      begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 2) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) and
              (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data) <> nil)   then
                begin
                 if(scadapy.MainFrame.CheckDebug.Checked = True) then Dcheck:='1';
                 if(scadapy.MainFrame.CheckDebug.Checked = False) then Dcheck:='0';
                 scadapy.MainFrame.MemoSave.Lines.Add('    <PortIec104client  name="'+scadapy.MainFrame.MainTree.Items.Item[i-1].Text+
                 '" UdpPort="'+scadapy.MainFrame.Eudpport.Text+'"  UdpIp="'+scadapy.MainFrame.Eudpip.Text+
                 '" Iec104Port="'+scadapy.MainFrame.Eiec104port.Text+'" Iec104Ip="'+scadapy.MainFrame.Eiec104ip.Text+
                 '" Debug="'+scadapy.MainFrame.Edebug.Text+'" TimeSync="'+Dcheck+'"  >');

                 for j:=0 to Length(MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData)-1 do
                 begin
                     if( Length(MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                       begin
                        scadapy.MainFrame.MemoSave.Lines.Add('          <VariableIec104 id="'+j.ToString+'" VarName="'+
                         MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                        '" IecAddress="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" Alias="'+
                         MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                        '" VarType="'+MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'">-</VariableIec104>');

                       end;
                 end;
                scadapy.MainFrame.MemoSave.Lines.Add('    </PortIec104client>');
                end;
     end;
       scadapy.MainFrame.MemoSave.Lines.Add(' </iec104client>');

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
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 0) and (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2) and
              (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data) <> nil)   then
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
       try
       for i:=1 to RowCount do
       begin
          if (scadapy.MainFrame.MainTree.Items.Item[i-1].Parent.Index = 1) and  (scadapy.MainFrame.MainTree.Items.Item[i-1].Level=2)  and
               (MStructure(scadapy.MainFrame.MainTree.Items.Item[i-1].Data) <> nil)
               then
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
       except
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
       j,i,z,cnt: Integer;
       Node,Modbus,Rec: TTreeNode;
       DataRec:  MStructure;
       LayoutObjects:array[0..15] of String;
begin
 try
    ReadXMLFile(Doc,filename );
///////////////modbus
    Child := Doc.DocumentElement.FindNode('ModbusConfig');
    begin
       with Child.ChildNodes do
           try
            Node := scadapy.MainFrame.MainTree.Items.Item[1];
            Modbus:= scadapy.MainFrame.MainTree.items.AddChild(Node,'Client Modbus');
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
               except on E: Exception do
                      begin
                      ShowMessage('Error load modb: ' + E.Message);
                      Free;
                      end;
            end;
             Child := Child.NextSibling;
    end;
///////////////mercury
        Child := Doc.DocumentElement.FindNode('MercuryConfig');
        begin
           with Child.ChildNodes do
               try
                Node := scadapy.MainFrame.MainTree.Items.Item[1];
                Modbus:= scadapy.MainFrame.MainTree.items.AddChild(Node,'Client Меркурий-230');
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
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarName')       then  DataRec^.StringData[z][1]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Serial_Number') then  DataRec^.StringData[z][2]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Empty1')        then  DataRec^.StringData[z][3]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Empty2')        then  DataRec^.StringData[z][4]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Net_Address')   then  DataRec^.StringData[z][5]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'TimeOut')       then  DataRec^.StringData[z][6]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                end;
                             end;
                        Rec.Data:= DataRec;
                   end;
               except on E: Exception do
                      begin
                      ShowMessage('Error load merc: ' + E.Message);
                      Free;
                      end;
                end;
                 Child := Child.NextSibling;
        end;
//////////////////////
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
           except on E: Exception do
                  begin
                  ShowMessage('Error load var: ' + E.Message);
                  Free;
                  end;
           end;
       Child := Child.NextSibling;
    end;

///////////////iec104client
            Child := Doc.DocumentElement.FindNode('iec104client');
            begin
               with Child.ChildNodes do
                   try
                    Node := scadapy.MainFrame.MainTree.Items.Item[1];
                    Modbus:= scadapy.MainFrame.MainTree.items.AddChild(Node,'Client IEC60870-5-104');
                       for j := 0 to (Count - 1) do
                         begin
                          New(DataRec);
                             for i := 0 to 6 do
                                begin
                                   if (Item[j].Attributes.Item[i].NodeName = 'UdpPort')    then    scadapy.MainFrame.Eudpport.Text       :=String(Item[j].Attributes.Item[i].NodeValue);
                                   if (Item[j].Attributes.Item[i].NodeName = 'UdpIp')      then    scadapy.MainFrame.Eudpip.Text         :=String(Item[j].Attributes.Item[i].NodeValue);
                                   if (Item[j].Attributes.Item[i].NodeName = 'Iec104Port') then    scadapy.MainFrame.Eiec104port.Text    :=String(Item[j].Attributes.Item[i].NodeValue);
                                   if (Item[j].Attributes.Item[i].NodeName = 'Iec104Ip')   then    scadapy.MainFrame.Eiec104ip.Text      :=String(Item[j].Attributes.Item[i].NodeValue);
                                   if (Item[j].Attributes.Item[i].NodeName = 'Debug')      then    scadapy.MainFrame.Edebug.Text         :=String(Item[j].Attributes.Item[i].NodeValue);
                                   if (Item[j].Attributes.Item[i].NodeName = 'TimeSync')   then
                                     begin
                                     if( String(Item[j].Attributes.Item[i].NodeValue) = '0' ) then       scadapy.MainFrame.CheckDebug.Checked := False;
                                     if( String(Item[j].Attributes.Item[i].NodeValue) = '1' ) then       scadapy.MainFrame.CheckDebug.Checked := True;
                                     end;

                                   if (Item[j].Attributes.Item[i].NodeName = 'name')       then    Rec:=scadapy.MainFrame.MainTree.items.AddChild(Modbus, String(Item[j].Attributes.Item[i].NodeValue));

                                end;

                             SetLength(DataRec^.StringData,Item[j].ChildNodes.Count+1,7);
                              for z := 0 to (Item[j].ChildNodes.Count - 1) do
                                 begin
                                    for i := 0 to 4 do
                                    begin
                                   // scadapy.MainFrame.Memo1.Lines.Add(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                    if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarName')       then  DataRec^.StringData[z+1][1]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                    if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'IecAddress')    then  DataRec^.StringData[z+1][2]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                    if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Alias')         then  DataRec^.StringData[z+1][5]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                    if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarType')       then  DataRec^.StringData[z+1][6]:= Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue ;
                                    end;
                                 end;
                            Rec.Data:= DataRec;
                       end;
                   except on E: Exception do
                         begin
                         ShowMessage('Error load iec: ' + E.Message);
                         Free;
                         end;
                    end;
                     Child := Child.NextSibling;
            end;


///////////////iec104server
                        Child := Doc.DocumentElement.FindNode('iec104server');
                        begin
                           with Child.ChildNodes do
                               try
                                  for j := 0 to (Count - 1) do
                                     begin

                                         for i := 0 to 4 do
                                            begin
                                               if (Item[j].Attributes.Item[i].NodeName = 'UdpPort')    then    scadapy.MainFrame.Eiec104serverUDPport.Text  :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'UdpIp')      then    scadapy.MainFrame.Eiec104serverUDPIP.Text    :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'Iec104Port') then    scadapy.MainFrame.Eiec104serverPort.Text     :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'Iec104Ip')   then    scadapy.MainFrame.Eiec104serverIP.Text       :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'Debug')      then    scadapy.MainFrame.Eiec104serverDebug.Text    :=String(Item[j].Attributes.Item[i].NodeValue);
                                            end;

                                                scadapy.MainFrame.Giec104server.RowCount:=Item[j].ChildNodes.Count+1;

                                          for z := 0 to (Item[j].ChildNodes.Count - 1) do
                                             begin
                                                for i := 0 to 8 do
                                                  begin
                                                     scadapy.MainFrame.Giec104server.Cells[0, z+1]:= (z+1).ToString;
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarName')       then
                                                      scadapy.MainFrame.Giec104server.Cells[1, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Alias')       then
                                                      scadapy.MainFrame.Giec104server.Cells[2, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'IecAddress')       then
                                                      scadapy.MainFrame.Giec104server.Cells[3, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ByteCount')       then
                                                      scadapy.MainFrame.Giec104server.Cells[4, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ByteSequence')       then
                                                      scadapy.MainFrame.Giec104server.Cells[5, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'VarType')       then
                                                      scadapy.MainFrame.Giec104server.Cells[6, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'OffSet')       then
                                                      scadapy.MainFrame.Giec104server.Cells[7, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Koef')       then
                                                      scadapy.MainFrame.Giec104server.Cells[8, z+1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);

                                                  end;
                                             end;

                                   end;
                               except on E: Exception do
                                      begin
                                      ShowMessage('Error load iecserv: ' + E.Message);
                                      Free;
                                      end;
                                end;
                                 Child := Child.NextSibling;
                        end;





 ///////////////layout
                       try
                       for cnt:=0 to 999 do
                       begin
                        if ( editor.EditorForm.PBarObject[cnt]<>nil)       then   editor.EditorForm.PBarObject[cnt].Free;
                        if ( editor.EditorForm.EditObject[cnt]<>nil)       then   editor.EditorForm.EditObject[cnt].Free;
                        if ( editor.EditorForm.LabelObject[cnt]<>nil)      then   editor.EditorForm.LabelObject[cnt].Free;
                        if ( editor.EditorForm.DiscretObject[cnt]<>nil)    then   editor.EditorForm.DiscretObject[cnt].Free;
                        if ( editor.EditorForm.StaticTextObject[cnt]<>nil) then   editor.EditorForm.StaticTextObject[cnt].Free;

                       end;

                       except //on E: Exception do
                              //begin
                              //ShowMessage('Error load free cnt: ' + E.Message);
                            //   Free;
                              //end;
                        end;

                        Child := Doc.DocumentElement.FindNode('Layout');
                        begin
                           with Child.ChildNodes do
                               try
                                  for j := 0 to (Count - 1) do
                                     begin

                                         for i := 0 to 5 do
                                            begin
                                               if (Item[j].Attributes.Item[i].NodeName = 'UdpPort')     then
                                                editor.EditorForm.UDPPORT.Text  :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'UdpIp')       then
                                                editor.EditorForm.UDPIP.Text    :=String(Item[j].Attributes.Item[i].NodeValue);
                                               if (Item[j].Attributes.Item[i].NodeName = 'Image')       then
                                                begin
                                                  if(   String(Item[j].Attributes.Item[i].NodeValue).Length   > 3 ) then
                                                       begin
                                                         try
                                                           editor.EditorForm.MainCanvas.Picture.LoadFromFile(String(Item[j].Attributes.Item[i].NodeValue));
                                                           editor.EditorForm.ImageName:=String(Item[j].Attributes.Item[i].NodeValue);
                                                         except
                                                           editor.EditorForm.ImageName:='';
                                                           showmessage('Image Path Error')
                                                         end;
                                                       end;
                                                end;
                                               if (Item[j].Attributes.Item[i].NodeName = 'CanvasColor') then
                                                begin
                                                     editor.EditorForm.MainCanvas.Color := StringToColor(String(Item[j].Attributes.Item[i].NodeValue) );
                                                     editor.EditorForm.MainCanvas.Canvas.Brush.Color:=StringToColor(String(Item[j].Attributes.Item[i].NodeValue) );
                                                     editor.EditorForm.MainCanvas.Canvas.FillRect(editor.EditorForm.MainCanvas.Canvas.ClipRect);
                                                end;
                                               if (Item[j].Attributes.Item[i].NodeName = 'Height')      then
                                                editor.EditorForm.MainCanvas.Height      :=StrToInt(String(Item[j].Attributes.Item[i].NodeValue));
                                               if (Item[j].Attributes.Item[i].NodeName = 'Width')       then
                                                editor.EditorForm.MainCanvas.Width       :=StrToInt(String(Item[j].Attributes.Item[i].NodeValue));

                                            end;
                                          for z := 0 to (Item[j].ChildNodes.Count - 1) do
                                             begin

                                                for i := 0 to 13 do
                                                  begin
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ObjectType')       then
                                                      LayoutObjects[0]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ObjectName')       then
                                                      LayoutObjects[1]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Caption')       then
                                                      LayoutObjects[2]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Left')       then
                                                      LayoutObjects[3]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Top')       then
                                                      LayoutObjects[4]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Max')       then
                                                      LayoutObjects[5]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Orient')       then
                                                      LayoutObjects[6]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Width')       then
                                                      LayoutObjects[7]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'Height')       then
                                                      LayoutObjects[8]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'FontName')       then
                                                      LayoutObjects[9]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'FontSize')       then
                                                      LayoutObjects[10]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'FontColor')       then
                                                      LayoutObjects[11]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ObjectColor')       then
                                                      LayoutObjects[12]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                     if(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeName = 'ObjectText')       then
                                                      LayoutObjects[13]:= String(Item[j].ChildNodes.Item[z].Attributes.Item[i].NodeValue);
                                                  end;
                                                      //// edit
                                                      if(LayoutObjects[0]='EditObject') then
                                                       begin
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray]:=TEdit.Create(editor.EditorForm);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Parent:=editor.EditorForm;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Name:='Ed_'+editor.EditorForm.EditArray.ToString;
                                                         // editor.EditorForm.EditObject[editor.EditorForm.EditArray].Caption:=LayoutObjects[2];
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Left:=StrToInt(LayoutObjects[3]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Top:=StrToInt(LayoutObjects[4]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Width:=StrToInt(LayoutObjects[7]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Height:=StrToInt(LayoutObjects[8]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Font.Name:=LayoutObjects[9];
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Font.Size:=StrToInt(LayoutObjects[10]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Font.Color:=StringToColor(LayoutObjects[11]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Color:=StringToColor(LayoutObjects[12]);
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Text:=LayoutObjects[13];
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Cursor:=crHandPoint;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].ReadOnly:=True;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].BorderStyle:=bsNone;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].PopupMenu:=editor.EditorForm.ObjectMenu;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].ShowHint:=True;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].Hint:=editor.EditorForm.EditObject[editor.EditorForm.EditArray].Text;
                                                          editor.EditorForm.EditObject[editor.EditorForm.EditArray].OnClick := @editor.EditorForm.ObjectTEditClicked;
                                                          editor.EditorForm.EditArray:=editor.EditorForm.EditArray+1;
                                                       end;
                                                      /// label
                                                       if(LayoutObjects[0]='LabelObject') then
                                                       begin
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray]:=TLabel.Create(editor.EditorForm);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Parent:=editor.EditorForm;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Name:='Lb_'+editor.EditorForm.LabelArray.ToString;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Caption:=LayoutObjects[2];
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Left:=StrToInt(LayoutObjects[3]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Top:=StrToInt(LayoutObjects[4]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Width:=StrToInt(LayoutObjects[7]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Height:=StrToInt(LayoutObjects[8]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Font.Name:=LayoutObjects[9];
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Font.Size:=StrToInt(LayoutObjects[10]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Font.Color:=StringToColor(LayoutObjects[11]);
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Color:=StringToColor(LayoutObjects[12]);
                                                     //     editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Text:=LayoutObjects[13];
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Cursor:=crHandPoint;
                                                      //    editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].ReadOnly:=True;
                                                     //     editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].BorderStyle:=bsNone;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].PopupMenu:=editor.EditorForm.ObjectMenu;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].ShowHint:=True;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Hint:=editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].Caption;
                                                          editor.EditorForm.LabelObject[editor.EditorForm.LabelArray].OnClick := @editor.EditorForm.ObjectTLabelClicked;
                                                          editor.EditorForm.LabelArray:=editor.EditorForm.LabelArray+1;
                                                       end;

                                                       //// StaticText
                                                       if(LayoutObjects[0]='StaticTextObject') then
                                                        begin
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray]:=TStaticText.Create(editor.EditorForm);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Parent:=editor.EditorForm;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Name:='St_'+editor.EditorForm.StaticTextArray.ToString;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Caption:=LayoutObjects[2];
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Left:=StrToInt(LayoutObjects[3]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Top:=StrToInt(LayoutObjects[4]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Width:=StrToInt(LayoutObjects[7]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Height:=StrToInt(LayoutObjects[8]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Font.Name:=LayoutObjects[9];
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Font.Size:=StrToInt(LayoutObjects[10]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Font.Color:=StringToColor(LayoutObjects[11]);
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Transparent:=False;

                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Color:=StringToColor(LayoutObjects[12]);
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Text:=LayoutObjects[13];
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Cursor:=crHandPoint;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].ReadOnly:=True;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].BorderStyle:=bsNone;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].PopupMenu:=editor.EditorForm.ObjectMenu;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].ShowHint:=True;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Hint:=editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Caption;
                                                           editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].OnClick := @editor.EditorForm.ObjectTStaticTextClicked;
                                                           editor.EditorForm.StaticTextArray:=editor.EditorForm.StaticTextArray+1;
                                                        end;

                                                       //// Discret
                                                       if(LayoutObjects[0]='DiscretObject') then
                                                        begin
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray]:=TFlowPanel.Create(editor.EditorForm);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Parent:=editor.EditorForm;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Name:='DIi_'+editor.EditorForm.DiscretArray.ToString;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Caption:=LayoutObjects[2];
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Left:=StrToInt(LayoutObjects[3]);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Top:=StrToInt(LayoutObjects[4]);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Width:=StrToInt(LayoutObjects[7]);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Height:=StrToInt(LayoutObjects[8]);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Font.Name:=LayoutObjects[9];
                                                        //   editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Font.Size:=StrToInt(LayoutObjects[10]);
                                                          // editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Font.Color:=StringToColor(LayoutObjects[11]);
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Color:=StringToColor(LayoutObjects[12]);
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Text:=LayoutObjects[13];
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Cursor:=crHandPoint;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].ReadOnly:=True;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].BorderStyle:=bsNone;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].PopupMenu:=editor.EditorForm.ObjectMenu;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].ShowHint:=True;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Hint:=editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Caption;
                                                           editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].OnClick := @editor.EditorForm.ObjectTDiscretClicked;
                                                           editor.EditorForm.DiscretArray:=editor.EditorForm.DiscretArray+1;
                                                        end;

                                                       //// PBar
                                                       if(LayoutObjects[0]='PBarObject') then
                                                        begin

                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray]:=TProgressBar.Create(editor.EditorForm);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Parent:=editor.EditorForm;
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Name:=LayoutObjects[1];
                                                         //  editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Caption:=LayoutObjects[2];
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Left:=StrToInt(LayoutObjects[3]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Top:=StrToInt(LayoutObjects[4]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Max:=StrToInt(LayoutObjects[5]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Position:=10;

                                                           if( LayoutObjects[6]='pbVertical') then
                                                               editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Orientation:=pbVertical
                                                           else
                                                                editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Orientation:=pbHorizontal;

                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Width:=StrToInt(LayoutObjects[7]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Height:=StrToInt(LayoutObjects[8]);
                                                         //  editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Font.Name:=LayoutObjects[9];
                                                        //   editor.EditorForm.DiscretObject[editor.EditorForm.DiscretArray].Font.Size:=StrToInt(LayoutObjects[10]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Font.Color:=StringToColor(LayoutObjects[11]);
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Color:=StringToColor(LayoutObjects[12]);
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].Text:=LayoutObjects[13];
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Cursor:=crHandPoint;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].ReadOnly:=True;
                                                          // editor.EditorForm.StaticTextObject[editor.EditorForm.StaticTextArray].BorderStyle:=bsNone;
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].PopupMenu:=editor.EditorForm.ObjectMenu;
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].ShowHint:=True;
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Hint:=editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].Name;
                                                           editor.EditorForm.PBarObject[editor.EditorForm.PBarArray].OnClick := @editor.EditorForm.ObjectTPBarClicked;
                                                           editor.EditorForm.PBarArray:=editor.EditorForm.PBarArray+1;
                                                        end;

                                             end;

                                   end;
                               except on E: Exception do
                                      begin
                                      ShowMessage('Error load lay: ' + E.Message);
                                      Free;
                                      end;
                                end;
                                 Child := Child.NextSibling;
                        end;


 except on E: Exception do
        begin
        ShowMessage('Error load final: ' + E.Message);
        Doc.Free;

        end;
  end;
end;

end.


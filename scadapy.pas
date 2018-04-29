unit scadapy;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,  Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Grids, Buttons, Interfaces,
  process, LCLProc,XMLRead ,dom;

type


  { TMainFrame }

  TMainFrame = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MainTree: TTreeView;
    FileItem: TMenuItem;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel13: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupMenu1: TPopupMenu;
    Process1: TProcess;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    VarTree: TTreeView;



    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button2Click(Sender: TObject);

    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure MainTreeClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;var CanSelect: Boolean);
    procedure StringGrid1SelectEditor(Sender: TObject; aCol, aRow: Integer;var Editor: TWinControl);
    procedure StringGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure StringGrid2DragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectEditor(Sender: TObject; aCol, aRow: Integer;
      var Editor: TWinControl);
    procedure StringGrid4SelectEditor(Sender: TObject; aCol, aRow: Integer;
      var Editor: TWinControl);
    procedure TabSheet2Show(Sender: TObject);
    procedure VarTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
    procedure VarTreeMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);


  private
   procedure SaveToFileModbusPy();
   procedure OpenProject();
   procedure SaveAsProject();
   procedure CreateProject();
   procedure RunCmdCommand(comEx: string);
   procedure SaveXML2();
   procedure OpenProjectXML(fileName: string);
   procedure LoadVarTree();
   procedure SaveTreeData();
   procedure LoadFromFileXML(filename: String);
   procedure XML2Tree(tree: TTreeView; XMLDoc: TXMLDocument);
   procedure Monitor();
   procedure SaveToFileJserverPy();
   procedure SaveToFileHtml();
   procedure MercuryLib();
   procedure MercuryClient();
  public

  end;
  type

  TModbusStructure = record
    ProtocolType: string;
    ChanalType: string;
    TCP_COM: string;
    PORT_SPEED: string;
    StringData: array of array of string;
  end;
 MStructure = ^TModbusStructure;

var
  MainFrame: TMainFrame;
  PathToProject: String;
  ProjectFile: String;
  PathToPythonWindows: String;
  ProjectName: String;
  ProjectPath: String;
  PathToPythonLinux: String;
  PathToBrowserWindows: String;
  PathToBrowserLinux: String;
  PathToTerminalLinux: String;
  FileToSave: String;
  Version: String;
  ArRow: integer;
  SourceCol, SourceRow: integer;
  FullProjectFilePath: String;
implementation

{$R *.lfm}

{ TMainFrame }

procedure TMainFrame.FormCreate(Sender: TObject);
begin
       Version:='ScadaPy Creator v.3.3.1 ';
       MainFrame.Caption:=Version;


       PathToProject:=ExtractFilePath(Application.ExeName);
       Panel1.Align:=alClient;
       Panel7.Align:=alClient;

       StringGrid1.Clear;
       StringGrid1.ColCount:=7;
       StringGrid1.RowCount:=2;

       StringGrid1.Cells[0,0] := '№';
       StringGrid1.Cells[1,0] := 'Name';
       StringGrid1.Cells[2,0] := 'RTU address';
       StringGrid1.Cells[3,0] := 'REG name';
       StringGrid1.Cells[4,0] := 'REG address';
       StringGrid1.Cells[5,0] := 'REG offset';
       StringGrid1.Cells[6,0] := 'TimeOut';

       StringGrid1.ColWidths[0]:=30;
       StringGrid1.ColWidths[1]:=200;
       StringGrid1.ColWidths[2]:=80;
       StringGrid1.ColWidths[3]:=200;
       StringGrid1.ColWidths[4]:=200;
       StringGrid1.ColWidths[5]:=70;
       StringGrid1.ColWidths[6]:=70;






//////////////////////////////////////////////////////
       StringGrid2.Clear;
       StringGrid2.ColCount:=9;
       StringGrid2.RowCount:=2;
       StringGrid2.Cells[0,0] := '№';
       StringGrid2.Cells[1,0] := 'Источник';
       StringGrid2.Cells[2,0] := 'Название переменной';
       StringGrid2.Cells[3,0] := 'Адрес';
       StringGrid2.Cells[4,0] := 'Количество байт';
       StringGrid2.Cells[5,0] := 'Порядок байт';
       StringGrid2.Cells[6,0] := 'Тип данных';
       StringGrid2.Cells[7,0] := 'Множитель';
       StringGrid2.Cells[8,0] := 'Псевдоним';

       StringGrid2.ColWidths[0]:=30;
       StringGrid2.ColWidths[1]:=200;
       StringGrid2.ColWidths[2]:=200;
       StringGrid2.ColWidths[3]:=80;
       StringGrid2.ColWidths[4]:=120;
       StringGrid2.ColWidths[5]:=100;
       StringGrid2.ColWidths[6]:=100;
       StringGrid2.ColWidths[7]:=70;
       StringGrid2.ColWidths[8]:=200;



end;



procedure TMainFrame.Button2Click(Sender: TObject);
begin

end;

procedure TMainFrame.BitBtn2Click(Sender: TObject);
begin
    Monitor();
end;

procedure TMainFrame.BitBtn3Click(Sender: TObject);
begin

      ProjectName:=Edit4.Text;
      ProjectPath:=Edit6.Text;
      PathToPythonWindows:=Edit5.Text;
      PathToBrowserWindows:=Edit7.Text;
      PathToTerminalLinux:=Edit8.Text;
      PathToBrowserLinux:=Edit9.Text;
      PathToPythonLinux:=Edit10.Text;
      MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
      try
        SaveTreeData();
      except

      end;
      SaveXML2();
      try
        begin
         SaveToFileModbusPy();
         SaveToFileJserverPy();
         SaveToFileHtml();
         MercuryLib();
         MercuryClient();
       end;
      except

      end;

end;

procedure TMainFrame.BitBtn4Click(Sender: TObject);
begin
  CreateProject();
end;

procedure TMainFrame.BitBtn5Click(Sender: TObject);
begin
    StringGrid1.RowCount:=StringGrid1.RowCount + 1 ;

end;

procedure TMainFrame.BitBtn6Click(Sender: TObject);
begin
 SaveToFileModbusPy();
 SaveToFileJserverPy();
 SaveToFileHtml();
 MercuryLib();
 MercuryClient();
end;

procedure TMainFrame.BitBtn7Click(Sender: TObject);
begin
       {$IFDEF Windows}
          RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
       {$ENDIF Windows}
       {$IFDEF Unix}
        RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'modbus.py'+'"');
       {$ENDIF Unix}
end;

procedure TMainFrame.BitBtn8Click(Sender: TObject);
begin
      StringGrid2.RowCount:=StringGrid2.RowCount + 1 ;
end;

procedure TMainFrame.BitBtn9Click(Sender: TObject);
begin
      StringGrid2.DeleteRow(ArRow);
end;

procedure TMainFrame.Button1Click(Sender: TObject);
begin

end;



procedure TMainFrame.BitBtn1Click(Sender: TObject);
begin
   OpenProject();
    LoadVarTree();
end;

procedure TMainFrame.BitBtn10Click(Sender: TObject);
begin
  {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'jserver.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
  RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'jserver.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.BitBtn11Click(Sender: TObject);
var
  AProcess     : TProcess;
begin
       try
          AProcess := TProcess.Create(nil);
         {$IFDEF Windows}
              AProcess.Executable := '"'+PathToBrowserWindows+'" '+ProjectPath+'jclient.html' ;
         {$ENDIF Windows}
         {$IFDEF Unix}
             AProcess.Executable := PathToBrowserLinux;
             AProcess.Parameters.Add(ProjectPath+'jclient.html');
         {$ENDIF Unix}
           AProcess.Execute;
       except
           on E: Exception do
           ShowMessage('An exception was raised: ' + E.Message);

       end;

end;

procedure TMainFrame.BitBtn12Click(Sender: TObject);
begin
  {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'mclient.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
     RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'mclient.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.ComboBox1Select(Sender: TObject);
begin

end;

procedure TMainFrame.ComboBox2Select(Sender: TObject);
begin

end;

procedure TMainFrame.MainTreeClick(Sender: TObject);
var  parId, childId,i,j: integer;

begin
  try
     if (MainTree.SelectionVisible=True)   then
     begin
     Edit1.Clear;
     Edit2.Clear;
     if MainTree.Selected.Selected = True then
         Edit3.Text:=MainTree.Selected.Text;

     parId:=StrToInt(MainTree.Selected.Parent.Index.ToString());
     childId:=StrToInt(MainTree.Selected.Index.ToString());
     if(MainTree.Selected.Level=2) and (parId=0)   then
          begin
              StringGrid1.Clear;
              StringGrid1.ColCount:=7;
              StringGrid1.RowCount:=2;
              StringGrid1.ColWidths[0]:=30;
              StringGrid1.ColWidths[1]:=200;
              StringGrid1.ColWidths[2]:=80;
              StringGrid1.ColWidths[3]:=200;
              StringGrid1.ColWidths[4]:=200;
              StringGrid1.ColWidths[5]:=70;
              StringGrid1.ColWidths[6]:=70;
              StringGrid1.Cells[0,0] := '№';
              StringGrid1.Cells[1,0] := 'Name';
              StringGrid1.Cells[2,0] := 'RTU address';
              StringGrid1.Cells[3,0] := 'REG name';
              StringGrid1.Cells[4,0] := 'REG address';
              StringGrid1.Cells[5,0] := 'REG offset';
              StringGrid1.Cells[6,0] := 'TimeOut';
                if (MStructure(MainTree.Selected.Data)<>nil) then
                begin
                   Combobox1.ItemIndex:=MStructure(MainTree.Selected.Data)^.ProtocolType.ToInteger;
                   Combobox2.ItemIndex:=MStructure(MainTree.Selected.Data)^.ChanalType.ToInteger;
                   Edit1.Text:=MStructure(MainTree.Selected.Data)^.TCP_COM;
                   Edit2.Text:=MStructure(MainTree.Selected.Data)^.PORT_SPEED;
                   i:=Length(MStructure(MainTree.Selected.Data)^.StringData);
                   StringGrid1.RowCount:=i+1;
                   for j:=1 to i-1 do
                   begin
                      StringGrid1.Cells[0, j]:=j.ToString ;
                      StringGrid1.Cells[1, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][1]  ;
                      StringGrid1.Cells[2, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][2]  ;
                      StringGrid1.Cells[3, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][3]  ;
                      StringGrid1.Cells[4, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][4]  ;
                      StringGrid1.Cells[5, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][5]  ;
                      StringGrid1.Cells[6, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][6]  ;
                  end;
              end;
          end;


      if   (MainTree.Selected.Level=2) and (parId=1)  then
      begin
           StringGrid1.Clear;
           StringGrid1.RowCount:=2;
           StringGrid1.ColWidths[0]:=30;
           StringGrid1.ColWidths[1]:=200;
           StringGrid1.ColWidths[2]:=120;
           StringGrid1.ColWidths[3]:=70;
           StringGrid1.ColWidths[4]:=70;
           StringGrid1.ColWidths[5]:=70;
           StringGrid1.ColWidths[6]:=70;
           StringGrid1.Cells[0,0] := '№';
           StringGrid1.Cells[1,0] := 'Name';
           StringGrid1.Cells[2,0] := 'Net Address';
           StringGrid1.Cells[3,0] := 'Empty';
           StringGrid1.Cells[4,0] := 'Empty';
           StringGrid1.Cells[5,0] := 'Serial Number';
           StringGrid1.Cells[6,0] := 'TimeOut';
             if (MStructure(MainTree.Selected.Data)<>nil) then
             begin
                Combobox1.ItemIndex:=MStructure(MainTree.Selected.Data)^.ProtocolType.ToInteger;
                Combobox2.ItemIndex:=MStructure(MainTree.Selected.Data)^.ChanalType.ToInteger;
                Edit1.Text:=MStructure(MainTree.Selected.Data)^.TCP_COM;
                Edit2.Text:=MStructure(MainTree.Selected.Data)^.PORT_SPEED;
                i:=Length(MStructure(MainTree.Selected.Data)^.StringData);
                StringGrid1.RowCount:=i+1;
                for j:=1 to i-1 do
                begin
                   StringGrid1.Cells[0, j]:=j.ToString ;
                   StringGrid1.Cells[1, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][1]  ;
                   StringGrid1.Cells[2, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][2]  ;
                   StringGrid1.Cells[3, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][3]  ;
                   StringGrid1.Cells[4, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][4]  ;
                   StringGrid1.Cells[5, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][5]  ;
                   StringGrid1.Cells[6, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][6]  ;
               end;
           end;
       end;

      end;
  except
     ShowMessage('Error');
  end;

end;

procedure TMainFrame.MenuItem10Click(Sender: TObject);
begin


end;

procedure TMainFrame.MenuItem11Click(Sender: TObject);
begin
  Monitor();
end;

procedure TMainFrame.MenuItem12Click(Sender: TObject);
begin
         {$IFDEF Windows}
           RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
        {$ENDIF Windows}
        {$IFDEF Unix}
          RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'modbus.py'+'"');
       {$ENDIF Unix}

end;

procedure TMainFrame.MenuItem13Click(Sender: TObject);
begin
  {$IFDEF Windows}
       RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'mclient.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
       RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'mclient.py'+'"');
   {$ENDIF Unix}
end;

procedure TMainFrame.MenuItem14Click(Sender: TObject);
begin
   SaveToFileModbusPy();
end;

procedure TMainFrame.MenuItem15Click(Sender: TObject);
begin
   MercuryLib();
   MercuryClient();
end;

procedure TMainFrame.MenuItem16Click(Sender: TObject);
begin
   SaveToFileJserverPy();
   SaveToFileHtml();
end;

procedure TMainFrame.MenuItem17Click(Sender: TObject);
var
  AProcess     : TProcess;
begin
       try
          AProcess := TProcess.Create(nil);
         {$IFDEF Windows}
              AProcess.Executable := '"'+PathToBrowserWindows+'" '+ProjectPath+'jclient.html' ;
         {$ENDIF Windows}
         {$IFDEF Unix}
             AProcess.Executable := PathToBrowserLinux;
             AProcess.Parameters.Add(ProjectPath+'jclient.html');
         {$ENDIF Unix}
           AProcess.Execute;
       except
           on E: Exception do
           ShowMessage('An exception was raised: ' + E.Message);

       end;

end;

procedure TMainFrame.MenuItem2Click(Sender: TObject);
begin
   OpenProject();
    LoadVarTree();
end;


procedure TMainFrame.MenuItem3Click(Sender: TObject);
begin
 SaveAsProject();
 SaveXML2();
end;

procedure TMainFrame.MenuItem4Click(Sender: TObject);
begin
      ProjectName:=Edit4.Text;
      ProjectPath:=Edit6.Text;
      PathToPythonWindows:=Edit5.Text;
      PathToBrowserWindows:=Edit7.Text;
      PathToTerminalLinux:=Edit8.Text;
      PathToBrowserLinux:=Edit9.Text;
      PathToPythonLinux:=Edit10.Text;



      MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
      SaveXML2();
      //LoadVarTree();
end;

procedure TMainFrame.MenuItem5Click(Sender: TObject);
begin
     CreateProject();
     SaveXML2();
end;

procedure TMainFrame.MenuItem6Click(Sender: TObject);
begin
  {$IFDEF Windows}
      RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'jserver.py"');
   {$ENDIF Windows}
   {$IFDEF Unix}
      RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'jserver.py'+'"');
  {$ENDIF Unix}

end;


procedure TMainFrame.Monitor();
begin
 Memo1.Clear;
     Memo1.Lines.Add('import socket');
     Memo1.Lines.Add('import sys');
     Memo1.Lines.Add('import time');
     Memo1.Lines.Add('sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
     Memo1.Lines.Add('server_address = (''localhost'', 64000)');
     Memo1.Lines.Add('print(''starting up on {} port {}''.format(*server_address))');
     Memo1.Lines.Add('sock.bind(server_address)');
     Memo1.Lines.Add('while True:');
     Memo1.Lines.Add('    data, address = sock.recvfrom(4096)');
     Memo1.Lines.Add('    print(data)');
     Memo1.Lines.SaveToFile(PathToProject+ 'udpmonitor.py' );
    {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+PathToProject+'udpmonitor.py"');
    {$ENDIF Windows}
    {$IFDEF Unix}
     RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+PathToProject+'udpmonitor.py'+'"');
     {$ENDIF Unix}
end;
procedure TMainFrame.MenuItem7Click(Sender: TObject);
var
 // Node: TTreeNode;
  DataRec:  MStructure;
begin

        if MainTree.Selected.Selected = True then
         Edit3.Text:=MainTree.Selected.Text;
    if( (StrToInt(MainTree.Selected.Index.ToString())=0 ) and
        (StrToInt(MainTree.Selected.Parent.Index.ToString())=1) ) then
    begin
         MainTree.items.AddChild(MainTree.Selected,'Название порта modbus');
              StringGrid1.Clear;
              StringGrid1.RowCount:=2;
              StringGrid1.ColWidths[0]:=30;
              StringGrid1.ColWidths[1]:=200;
              StringGrid1.ColWidths[2]:=80;
              StringGrid1.ColWidths[3]:=200;
              StringGrid1.ColWidths[4]:=200;
              StringGrid1.ColWidths[5]:=70;
              StringGrid1.ColWidths[6]:=70;
              StringGrid1.Cells[0,0] := '№';
              StringGrid1.Cells[1,0] := 'Name';
              StringGrid1.Cells[2,0] := 'RTU address';
              StringGrid1.Cells[3,0] := 'REG name';
              StringGrid1.Cells[4,0] := 'REG address';
              StringGrid1.Cells[5,0] := 'REG offset';
              StringGrid1.Cells[6,0] := 'TimeOut';



     end;
    if( (StrToInt(MainTree.Selected.Index.ToString())=1 ) and
        (StrToInt(MainTree.Selected.Parent.Index.ToString())=1) ) then
    begin
         MainTree.items.AddChild(MainTree.Selected,'Название порта Меркурий-230');
     end;

    New(DataRec);
    DataRec^.TCP_COM := '';
    DataRec^.PORT_SPEED := '';
    MainTree.Selected.Data := DataRec;


end;

procedure TMainFrame.MenuItem8Click(Sender: TObject);
begin
  if(MainTree.Selected.Level=2) then
      MainTree.Selected.Delete;
end;

procedure TMainFrame.MenuItem9Click(Sender: TObject);
begin
      SaveToFileModbusPy();
end;

procedure TMainFrame.SpeedButton1Click(Sender: TObject);
begin
    SaveTreeData();
end;

procedure TMainFrame.StringGrid1SelectCell(Sender: TObject; aCol,aRow: Integer; var CanSelect: Boolean);
begin
  ArRow:=ARow;
end;

procedure TMainFrame.StringGrid1SelectEditor(Sender: TObject; aCol,
  aRow: Integer; var Editor: TWinControl);

begin
   if aCol=3 then
   begin
        Editor := StringGrid1.EditorByStyle(cbsPickList);
        TCustomComboBox(Editor).Items.CommaText := 'READ_INPUT_REGISTERS,READ_DISCRETE_INPUTS,READ_COILS,READ_HOLDING_REGISTERS';
   end;

end;

procedure TMainFrame.StringGrid2DragDrop(Sender, Source: TObject; X, Y: Integer  );
var
  DestCol, DestRow: Integer;
begin

   if Source is TTreeView then
     begin

          StringGrid2.RowCount:=StringGrid2.RowCount+1;
          StringGrid2.MouseToCell(X, Y, DestCol, DestRow);
          StringGrid2.Cells[DestCol,DestRow]:=VarTree.Selected.Text;
          StringGrid2.Cells[3,DestRow]:='0';
          StringGrid2.Cells[4,DestRow]:='1';
          StringGrid2.Cells[7,DestRow]:='1';

     end;
end;

procedure TMainFrame.StringGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := true;
end;

procedure TMainFrame.StringGrid2SelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
    ArRow:=ARow;
end;

procedure TMainFrame.StringGrid2SelectEditor(Sender: TObject; aCol,
  aRow: Integer; var Editor: TWinControl);
begin
   if aCol=5 then
   begin
        Editor := StringGrid2.EditorByStyle(cbsPickList);
        TCustomComboBox(Editor).Items.CommaText := '1,12,21';
   end;
   if aCol=6 then
      begin
           Editor := StringGrid2.EditorByStyle(cbsPickList);
           TCustomComboBox(Editor).Items.CommaText := 'integer,float,string,bool';
      end;
end;

procedure TMainFrame.StringGrid4SelectEditor(Sender: TObject; aCol,
  aRow: Integer; var Editor: TWinControl);
begin
   if aCol=4 then
     begin
          Editor := StringGrid2.EditorByStyle(cbsPickList);
          TCustomComboBox(Editor).Items.CommaText := 'READ_INPUT_REGISTERS,READ_DISCRETE_INPUTS,READ_COILS,READ_HOLDING_REGISTERS';
     end;

end;


procedure TMainFrame.TabSheet2Show(Sender: TObject);
begin
  LoadVarTree();
end;

procedure TMainFrame.VarTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.VarTreeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbLeft then
      VarTree.BeginDrag(true);

end;



procedure TMainFrame.SaveToFileModbusPy();
var
  rowCount,i,j,z: integer;
  //DataRec:MStructure;
  insText,mThread:String;


begin
        mThread:='';
        rowCount:=MainTree.Items.Count;
        Memo1.Clear;
        Memo1.Lines.Add('# -*- coding: utf-8 -*-');
        Memo1.Lines.Add('###########################################################################');
        Memo1.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        Memo1.Lines.Add('## Modbus Client by Jack Maclov');
        Memo1.Lines.Add('## http://scadapy.ln-group.ru/');
        Memo1.Lines.Add('##');
        Memo1.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        Memo1.Lines.Add('########################################################################### ');
        Memo1.Lines.Add('import time');
        Memo1.Lines.Add('import modbus_tk');
        Memo1.Lines.Add('import modbus_tk.defines as cst');
        Memo1.Lines.Add('import modbus_tk.modbus_tcp as modbus_tcp');
        Memo1.Lines.Add('from modbus_tk import modbus_rtu');
        Memo1.Lines.Add('import serial');
        Memo1.Lines.Add('import gc');
        Memo1.Lines.Add('import socket');
        Memo1.Lines.Add('import threading');

       try
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 0) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 Memo1.Lines.Add('def Proc_'+i.ToString+'(f=1):');
                 mThread:=mThread+'         modb_'+i.ToString+' = threading.Thread(target=Proc_'+i.ToString+',args=(1,))'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.daemon = True'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.start()'+#13#10;
                 Memo1.Lines.Add('     startAdr=[]');
                 Memo1.Lines.Add('     rangeAdr=[]');
                 Memo1.Lines.Add('     rtuAddress=[]');
                 Memo1.Lines.Add('     varname=[]');
                 Memo1.Lines.Add('     timeOut=[]');
                 Memo1.Lines.Add('     reg=[]');
                 z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                             end;
                                        end;

                 Memo1.Lines.Add('     unitCount='+z.ToString);
                 Memo1.Lines.Add('     for i in range(0,unitCount+1):');
                 Memo1.Lines.Add('         rtuAddress.append(i)');
                 Memo1.Lines.Add('         reg.append(i)');
                 Memo1.Lines.Add('         startAdr.append(i)');
                 Memo1.Lines.Add('         rangeAdr.append(i)');
                 Memo1.Lines.Add('         varname.append(i)');
                 Memo1.Lines.Add('         timeOut.append(i)');
                 Memo1.Lines.Add('     try:');
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   Memo1.Lines.Add('         master = modbus_tcp.TcpMaster(host='''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''', port=int('''+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))');
                   insText:='                 master = modbus_tcp.TcpMaster(host='''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''', port=int('''+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))';
                   end;
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   Memo1.Lines.Add('         com=serial.Serial('''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', bytesize=8, parity=''N'', stopbits=1, xonxoff=0)');
                   Memo1.Lines.Add('         master=modbus_rtu.RtuMaster(com)');
                 //  insText:='                 master=modbus_rtu.RtuMaster(com)';
                   end;
                 Memo1.Lines.Add('         master.set_timeout(2)');
                 Memo1.Lines.Add('     except Exception as e:');
                 Memo1.Lines.Add('          pass');
              //   z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                             begin
                           //   z:=z+1;
                              Memo1.Lines.Add('     x='+(j-1).ToString()+'; '+
                           'varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+''')');

                             end;
                        end;
               //  Memo1.Lines.Add('     unitCount='+z.ToString);
                 Memo1.Lines.Add('     while True:');
                 Memo1.Lines.Add('         for i in range(0,unitCount):');
                 Memo1.Lines.Add('             try:');
                 Memo1.Lines.Add('                 if(reg[i]==''READ_INPUT_REGISTERS''):   c=cst.READ_INPUT_REGISTERS');
                 Memo1.Lines.Add('                 if(reg[i]==''READ_DISCRETE_INPUTS''):   c=cst.READ_DISCRETE_INPUTS');
                 Memo1.Lines.Add('                 if(reg[i]==''READ_COILS''):             c=cst.READ_COILS');
                 Memo1.Lines.Add('                 if(reg[i]==''READ_HOLDING_REGISTERS''): c=cst.READ_HOLDING_REGISTERS');

                 Memo1.Lines.Add('                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )');
                 Memo1.Lines.Add('                 sock_udp.sendto((varname[i]+":"+str(varNameData)).encode(''utf-8''), server_address_udp)');
                 Memo1.Lines.Add('             except Exception as e:');
                 Memo1.Lines.Add('                 varNameData=None');
                 Memo1.Lines.Add('                 sock_udp.sendto((varname[i]+":Error").encode(''utf-8''), server_address_udp)');
                 Memo1.Lines.Add(insText);
                 Memo1.Lines.Add('             time.sleep(float(timeOut[i]))');
                 Memo1.Lines.Add('             gc.collect()');
             end;
       end;
       except

       end;

 Memo1.Lines.Add('if __name__ == "__main__":');
 Memo1.Lines.Add('     try:');
 Memo1.Lines.Add('         try:');
 Memo1.Lines.Add('             print( ''UDP sender start'')');
 Memo1.Lines.Add('             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
 Memo1.Lines.Add('             server_address_udp = (''localhost'', 64000)');
 Memo1.Lines.Add('         except Exception as e:');
 Memo1.Lines.Add('             print(''UDP fail '',e)');
 Memo1.Lines.Add('         print( ''Starting modbus client'')');
 Memo1.Lines.Add('         time.sleep(1.0)');

 Memo1.Lines.Add('  ########################### treads block');
 Memo1.Lines.Add(mThread);
 Memo1.Lines.Add('         while True:');
 Memo1.Lines.Add('             pass');
 Memo1.Lines.Add('     except Exception as e:');
 Memo1.Lines.Add('         print(e)');

   try
     Memo1.Lines.SaveToFile(ProjectPath+'modbus.py');
   except
      ShowMessage('Error to save');
   end;
end;


procedure TMainFrame.OpenProject();

var
  filename: string;
begin
    try
     begin
       OpenDialog1.Title := 'Open project ScadaPy ';
       OpenDialog1.Filter := 'ScadaPy project|*.xml' ;
       if OpenDialog1.Execute then
       begin
             filename := OpenDialog1.Filename;
             ProjectFile := filename;
             FullProjectFilePath:=OpenDialog1.FileName;
       end;
       MainTree.Items.Clear;
       MainTree.Items.AddFirst(nil,'Конфигурация проекта');
       MainTree.Items.Add(nil,'Протоколы');
       OpenProjectXML(filename);
       LoadFromFileXML(filename);
       MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
     end;
    except
        ShowMessage('Project not opened');
    end;
end;

procedure TMainFrame.SaveAsProject();
begin
   try
     begin
      SaveDialog1.Title := 'Save new project ScadaPy ';
      SaveDialog1.Filter := 'ScadaPy project|*.xml' ;
      if SaveDialog1.Execute and (Length(SaveDialog1.FileName)>0) then
      try
      begin
          ProjectName:=Edit4.Text;
          ProjectPath:=SaveDialog1.InitialDir;
          Edit6.Text:=SaveDialog1.InitialDir;
          FullProjectFilePath:=SaveDialog1.FileName;
          PathToPythonWindows:=Edit5.Text;
          PathToBrowserWindows:=Edit7.Text;
          PathToTerminalLinux:=Edit8.Text;
          PathToBrowserLinux:=Edit9.Text;
          PathToPythonLinux:=Edit10.Text;


          ProjectFile:=SaveDialog1.Filename;
          SaveXML2();
          MainFrame.Caption:=Version+ ProjectName +' file '+  ProjectFile;
      end;
      except
       ShowMessage('Project not saved');
      end;
    end;
   except
       ShowMessage('Project not saved');
   end;
end;
procedure TMainFrame.CreateProject();
var
  Node:  TTreeNode;
begin
  try
      SaveDialog1.Title := 'Create new project ScadaPy ';
      SaveDialog1.Filter := 'ScadaPy project|*.xml' ;
      if SaveDialog1.Execute then
      begin
          if Length(Edit4.Text) < 1 then
          begin
             ProjectName:='NewProject';
              Edit4.Text:='NewProject';
          end;

          ProjectPath:=SaveDialog1.InitialDir;
          Edit6.Text:=SaveDialog1.InitialDir;
          FullProjectFilePath:=SaveDialog1.FileName;

          if Length(Edit5.Text) < 1 then
          begin
             PathToPythonWindows:='c:\Python35\python.exe';
             Edit5.Text:='c:\Python35\python.exe';
          end;

             PathToBrowserWindows:='c:\Program Files\Internet Explorer\iexplore';
             Edit7.Text:='c:\Program Files\Internet Explorer\iexplore';

          if Length(Edit8.Text) < 1 then
          begin
             PathToTerminalLinux:='xfce4-terminal --geometry=100x20 -e';
             Edit8.Text:='xfce4-terminal --geometry=100x20 -e';

          end;
          if Length(Edit9.Text) < 1 then
          begin
             PathToBrowserLinux:='firefox';
             Edit9.Text:='firefox';

          end;
          if Length(Edit10.Text) < 1 then
          begin
             PathToPythonLinux:='python3';
             Edit10.Text:='python3';

          end;
           MainTree.Items.Clear;

           MainTree.Items.AddFirst(nil,'Конфигурация проекта');
           Node:=MainTree.Items.Add(nil,'Протоколы');
           MainTree.Items.AddChild(Node,'Modbus');
           MainTree.Items.AddChild(Node,'Меркурий-230');


           SaveXML2();

      end;
   except
       ShowMessage('Project not created');
   end;
end;

procedure TMainFrame.RunCmdCommand(comEx: string);
var
  AProcess     : TProcess;
begin
      try
          //ShellExecute(0,nil, PChar('cmd'),PChar('/c '+PathToPython.Trim()+' '+ProjectPath+ProjectName+'_mtcp.py'),nil,1);
        AProcess := TProcess.Create(nil);
       {$IFDEF Windows}
           AProcess.Executable := 'cmd.exe' ;
           AProcess.Parameters.DelimitedText :='/c "'+comEx;
       {$ENDIF Windows}

       {$IFDEF Unix}

           AProcess.CommandLine :=comEx;
           AProcess.Options := AProcess.Options + [poWaitOnExit];
       {$ENDIF Unix}
           AProcess.Execute;
     except
           ShowMessage('Не возможно выполнить команду');
     end;
end;


procedure TMainFrame.OpenProjectXML(fileName: string);
var
       Child: TDOMNode;
       Doc : TXMLDocument;
       j,i: Integer;
begin
 try
    ReadXMLFile(Doc,fileName );
    Child := Doc.DocumentElement.FindNode('ProjectConfig');
    while Assigned(Child) do
    begin
       with Child.ChildNodes do
           try
              for j := 0 to (Count - 1) do
                 begin
                        for i := 0 to 6 do
                        begin

                           if (Item[j].Attributes.Item[i].NodeName = 'ProjectName') then
                               begin
                                   ProjectName:=String(Item[j].Attributes.Item[i].NodeValue);
                                   Edit4.Text:=ProjectName;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'ProjectPath') then
                               begin
                                  ProjectPath:=String(Item[j].Attributes.Item[i].NodeValue);
                                  Edit6.Text:=ProjectPath;
                               end;

                           if (Item[j].Attributes.Item[i].NodeName = 'PathToPythonWindows') then
                               begin
                                  PathToPythonWindows:=String(Item[j].Attributes.Item[i].NodeValue);
                                  Edit5.Text:=PathToPythonWindows;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToBrowserWindows') then
                               begin
                                   PathToBrowserWindows:=String(Item[j].Attributes.Item[i].NodeValue);
                                   Edit7.Text:=PathToBrowserWindows;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToTerminalLinux') then
                                begin
                                   PathToTerminalLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   Edit8.Text:=PathToTerminalLinux;
                                end;

                           if (Item[j].Attributes.Item[i].NodeName = 'PathToBrowserLinux') then
                               begin
                                   PathToBrowserLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   Edit9.Text:=PathToBrowserLinux;
                              end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToPythonLinux') then
                               begin
                                   PathToPythonLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   Edit10.Text:=PathToPythonLinux;
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
procedure TMainFrame.LoadVarTree();
var
  Node,ParentNode: TTreeNode;
  i,j,z,rowCount: integer;

begin
       VarTree.Items.Clear;
       ParentNode:=VarTree.items.add(nil,'Список Переменных');
       Node:=VarTree.items.add(ParentNode, 'Modbus');
       rowCount:=MainTree.Items.Count;
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 0) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                              VarTree.items.AddChild(Node,MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]);
                                             end;
                                        end;
            end;
       end;
       Node:=VarTree.items.add(ParentNode, 'Mercury-230');
       for i:=1 to RowCount do
             begin
                if (MainTree.Items.Item[i-1].Parent.Index = 1) and (MainTree.Items.Item[i-1].Level=2) then
                  begin
                       z:=0;
                       for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                              begin
                                                 if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                                   begin
                                                    z:=z+1;
                                                    VarTree.items.AddChild(Node,MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]);
                                                   end;
                                              end;
                   end;
               end;

end;
procedure TMainFrame.SaveXML2();
var
  rowCount,i,j: integer;
  //DataRec:MStructure;
begin
rowCount:=MainTree.Items.Count;
Memo1.Clear;
Memo1.Lines.Add('<?xml version="1.0"?>');
Memo1.Lines.Add('<Config xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
Memo1.Lines.Add(' <ProjectConfig>');
Memo1.Lines.Add('     <Config ProjectName="'+Edit4.Text+'" ProjectPath="'+Edit6.Text+'" PathToPythonWindows="'+Edit5.Text+'" PathToBrowserWindows="'+Edit7.Text+
'" PathToTerminalLinux="'+Edit8.Text+'" PathToBrowserLinux="'+Edit9.Text+'" PathToPythonLinux="'+Edit10.Text+'"></Config>');
Memo1.Lines.Add(' </ProjectConfig>');
Memo1.Lines.Add(' <ModbusConfig>');
       try
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 0) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 Memo1.Lines.Add('     <PortModbus ParentIndex="'+MainTree.Items.Item[i-1].Parent.Index.ToString+'" ItemIndex="'+MainTree.Items.Item[i-1].Index.ToString+
                 '" Level="'+MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(MainTree.Items.Item[i-1].Data)^.ProtocolType+
                 '"  Mtype="'+MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM +
                 '" port_speed="'+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ MainTree.Items.Item[i-1].Text+'">'+MainTree.Items.Item[i-1].Parent.Index.ToString);

                        for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                            if( Length(MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                              begin
                               Memo1.Lines.Add('          <VariableModbus id="'+j.ToString+'" VarName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                               '" RtuAddress="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" RegName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                               '" RegAddress="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" RegOffset="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                               '" TimeOut="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableModbus>');
                              end;
                        end;
                 Memo1.Lines.Add('     </PortModbus>');

             end;
       end;
       except

       end;
       Memo1.Lines.Add(' </ModbusConfig>');
       Memo1.Lines.Add(' <MercuryConfig>');
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 1) and  (MainTree.Items.Item[i-1].Level=2) then
            begin
                Memo1.Lines.Add('     <PortMercury ParentIndex="'+MainTree.Items.Item[i-1].Parent.Index.ToString+'" ItemIndex="'+MainTree.Items.Item[i-1].Index.ToString+
             '" Level="'+MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(MainTree.Items.Item[i-1].Data)^.ProtocolType+
             '" Mtype="'+MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM +
             '" port_speed="'+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ MainTree.Items.Item[i-1].Text+'">'+MainTree.Items.Item[i-1].Parent.Index.ToString);
                for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                begin
                  if( Length(MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                     begin
                       Memo1.Lines.Add('          <VariableMercury id="'+j.ToString+'" VarName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                       '" Serial_Number="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" Empty1="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                       '" Empty2="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" Net_Address="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                       '" TimeOut="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableMercury>');
                     end;
                end;
         Memo1.Lines.Add('     </PortMercury>');
            end;
       end;
Memo1.Lines.Add(' </MercuryConfig>');
Memo1.Lines.Add(' <Variables>');
rowCount:= StringGrid2.RowCount-1;
       for i:=1 to RowCount do
       begin
            if  (Length(StringGrid2.Cells[1, i]) > 0) and
                (Length(StringGrid2.Cells[2, i]) > 0) and
                (Length(StringGrid2.Cells[3, i]) > 0) and
                (Length(StringGrid2.Cells[4, i]) > 0) and
                (Length(StringGrid2.Cells[5, i]) > 0) and
                (Length(StringGrid2.Cells[6, i]) > 0) and
                (Length(StringGrid2.Cells[7, i]) > 0) then
                begin
                    Memo1.Lines.Add('    <VarPoint Id="'+i.ToString+'" VarName="'+StringGrid2.Cells[1, i]+'" '+
                                        'Alias="'+StringGrid2.Cells[2, i]+'" Address="'+StringGrid2.Cells[3, i]+
                    '" ByteCount="'+StringGrid2.Cells[4, i]+'" ByteRoute="'+StringGrid2.Cells[5, i]+'" VarType="'+StringGrid2.Cells[6, i]+
                    '" Manage="'+StringGrid2.Cells[7, i]+'" '+' VarAlias="'+StringGrid2.Cells[8, i]+'" >'+StringGrid2.Cells[1, i]+'</VarPoint>');
                end;
       end;
Memo1.Lines.Add(' </Variables>');
Memo1.Lines.Add('</Config>');
Memo1.Lines.SaveToFile( FullProjectFilePath );

end;


procedure TMainFrame.SaveTreeData();
var
DataRec:MStructure;
i,j:integer;

begin
    New(DataRec);
    DataRec^.ProtocolType:=ComboBox1.ItemIndex.ToString;
    DataRec^.ChanalType  :=ComboBox2.ItemIndex.ToString;
    DataRec^.TCP_COM     := Edit1.Text;
    DataRec^.PORT_SPEED  := Edit2.Text;
    i:=StringGrid1.RowCount;

    for j:=1 to i-1 do
    begin
         if  (Length(StringGrid1.Cells[1, j]) > 0) and
             (Length(StringGrid1.Cells[2, j]) > 0) and
            // (Length(StringGrid1.Cells[3, j]) > 0) and
            // (Length(StringGrid1.Cells[4, j]) > 0) and
             (Length(StringGrid1.Cells[5, j]) > 0) and
             (Length(StringGrid1.Cells[6, j]) > 0) then
             begin
                SetLength(DataRec^.StringData,j+1,7);
                DataRec^.StringData[j][1]:= StringGrid1.Cells[1, j] ;
                DataRec^.StringData[j][2]:= StringGrid1.Cells[2, j] ;
                DataRec^.StringData[j][3]:= StringGrid1.Cells[3, j] ;
                DataRec^.StringData[j][4]:= StringGrid1.Cells[4, j] ;
                DataRec^.StringData[j][5]:= StringGrid1.Cells[5, j] ;
                DataRec^.StringData[j][6]:= StringGrid1.Cells[6, j] ;
             end;

    end;
    MainTree.Selected.Data := DataRec;

end;

procedure TMainFrame.LoadFromFileXML(filename: String);
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
            Node := MainTree.Items.Item[1];
            Modbus:= MainTree.items.AddChild(Node,'Modbus');
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
                           if (Item[j].Attributes.Item[i].NodeName = 'name') then        Rec:=MainTree.items.AddChild(Modbus, String(Item[j].Attributes.Item[i].NodeValue));
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
                Node := MainTree.Items.Item[1];
                Modbus:= MainTree.items.AddChild(Node,'Меркурий-230');
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
                               if (Item[j].Attributes.Item[i].NodeName = 'name') then        Rec:=MainTree.items.AddChild(Modbus, String(Item[j].Attributes.Item[i].NodeValue));
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
                     StringGrid2.RowCount:=Count+2;
                        for i := 0 to 8 do
                        begin
                           StringGrid2.Cells[0, j+1]:= (j+1).ToString;
                           if (Item[j].Attributes.Item[i].NodeName = 'VarName') then       StringGrid2.Cells[1, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Alias') then         StringGrid2.Cells[2, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Address') then       StringGrid2.Cells[3, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteCount') then     StringGrid2.Cells[4, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteRoute') then     StringGrid2.Cells[5, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarType') then       StringGrid2.Cells[6, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Manage') then        StringGrid2.Cells[7, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarAlias') then      StringGrid2.Cells[8, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           Memo1.Lines.Add(String(Item[j].Attributes.Item[i].NodeValue));
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



procedure TMainFrame.XML2Tree(tree: TTreeView; XMLDoc: TXMLDocument);
var
  iNode: TDOMNode;

  procedure ProcessNode(Node: TDOMNode; TreeNode: TTreeNode);
  var
    cNode: TDOMNode;
    s: string;
  begin
    if Node = nil then Exit; // выходим, если достигнут конец документа

    // добавляем узел в дерево
    if Node.HasAttributes and (Node.Attributes.Length>0) then
      s:=Node.Attributes.Item[0].NodeName
     // Node.Attributes[0].
    else
      s:='';
    TreeNode := tree.Items.AddChild(TreeNode, s);

    // переходим к дочернему узлу
    cNode := Node.FirstChild;

    // проходим по всем дочерним узлам
    while cNode <> nil do
    begin
      ProcessNode(cNode, TreeNode);
      cNode := cNode.NextSibling;
    end;
  end;

begin
  iNode := XMLDoc.DocumentElement.FirstChild;
  while iNode <> nil do
  begin
    ProcessNode(iNode, nil); // Рекурсия
    iNode := iNode.NextSibling;
  end;
end;
procedure TMainFrame.SaveToFileJserverPy();
var
  rowCount,j: integer;
  AllData:String;
begin
        AllData:='';
        rowCount:=MainTree.Items.Count;
        Memo1.Clear;
        Memo1.Lines.Add('# -*- coding: utf-8 -*-');
        Memo1.Lines.Add('###########################################################################');
        Memo1.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        Memo1.Lines.Add('## JSON WEB server by Jack Maclov');
        Memo1.Lines.Add('## http://scadapy.ln-group.ru/');
        Memo1.Lines.Add('##');
        Memo1.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        Memo1.Lines.Add('########################################################################### ');

        Memo1.Lines.Add('import sys');
        Memo1.Lines.Add('import time');
        Memo1.Lines.Add('import logging');
        Memo1.Lines.Add('import gc');
        Memo1.Lines.Add('import os');
        Memo1.Lines.Add('import threading');
        Memo1.Lines.Add('from http.server import BaseHTTPRequestHandler, HTTPServer');
        Memo1.Lines.Add('import json');
        Memo1.Lines.Add('import base64');
        Memo1.Lines.Add('import ssl');
      //  Memo1.Lines.Add('from dateutil import parser');
        Memo1.Lines.Add('from datetime import datetime');
        Memo1.Lines.Add('from enum import Enum, IntEnum');
        Memo1.Lines.Add('import uuid');
        Memo1.Lines.Add('import socket');
        Memo1.Lines.Add('import struct');
        Memo1.Lines.Add('class S(BaseHTTPRequestHandler):');
        Memo1.Lines.Add('     def _set_response(self):');
        Memo1.Lines.Add('         self.send_response(200)');
        Memo1.Lines.Add('         self.send_header(''Content-type'',''text/html'')');
        Memo1.Lines.Add('         self.end_headers()');

        Memo1.Lines.Add('     def do_HEAD(self):');
        Memo1.Lines.Add('         self.send_response(200)');
        Memo1.Lines.Add('         self.send_header(''Content-type'', ''text/html'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Accept-Charset,X-Accept,Content-Type,Credentials'')');
        Memo1.Lines.Add('         self.end_headers()');

        Memo1.Lines.Add('     def do_AUTHHEAD(self):');
        Memo1.Lines.Add('         self.send_response(401)');
        Memo1.Lines.Add('         self.send_header(''WWW-Authenticate'',''Basic realm="Demo Realm"'')');
        Memo1.Lines.Add('         self.send_header("Cache-Control", "no-cache")');
        Memo1.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        Memo1.Lines.Add('         self.end_headers()');

        Memo1.Lines.Add('     def do_OPTIONS(self):');
        Memo1.Lines.Add('         self.send_response(200)');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET,OPTIONS'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        Memo1.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''origin, Authorization, accept'')');
        Memo1.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        Memo1.Lines.Add('         self.end_headers()');
        Memo1.Lines.Add('     def do_GET(self):');
        Memo1.Lines.Add('         global key ');
        Memo1.Lines.Add('         if self.headers.get(''Authorization'') == None:');
        Memo1.Lines.Add('             self.do_AUTHHEAD()');
        Memo1.Lines.Add('             response = { ''success'': False, ''error'': ''No auth header received''}');
        Memo1.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        Memo1.Lines.Add('         elif self.headers.get(''Authorization'') == ''Basic '' + str(key):');
        Memo1.Lines.Add('             resp=[]');
        Memo1.Lines.Add('             self.send_response(200)');
        Memo1.Lines.Add('             self.send_header(''Allow'',''GET, OPTIONS'')');
        Memo1.Lines.Add('             self.send_header("Cache-Control", "no-cache")');
        Memo1.Lines.Add('             self.send_header(''Content-type'',''application/json'')');
        Memo1.Lines.Add('             self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        Memo1.Lines.Add('             self.send_header(''Access-Control-Allow-Credentials'', ''true'')');
        Memo1.Lines.Add('             self.send_header(''Access-Control-Allow-Methods'', ''GET, OPTIONS'')');
        Memo1.Lines.Add('             self.send_header(''Access-Control-Allow-Headers'', ''X-Request, X-Requested-With'')');
        Memo1.Lines.Add('             self.send_header("Access-Control-Allow-Headers", "Authorization")');
        Memo1.Lines.Add('             self.end_headers()');
        Memo1.Lines.Add('             req=str(self.path)[1:]');
        Memo1.Lines.Add('             if(req == "data" ):');
        Memo1.Lines.Add('                 try:');
        Memo1.Lines.Add('                     self.wfile.write(bytes(json.dumps(AllData), ''utf-8''))');
        Memo1.Lines.Add('                 except Exception as e:');
        Memo1.Lines.Add('                     print(''get req data error'',e)');
        Memo1.Lines.Add('             else:');
        Memo1.Lines.Add('                 response = { ''req error'':''Invalid credentials''}');
        Memo1.Lines.Add('                 self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        Memo1.Lines.Add('                 print(''error req'')');
        Memo1.Lines.Add('         else:');
        Memo1.Lines.Add('             self.do_AUTHHEAD()');
        Memo1.Lines.Add('             response = { ''success'': False, ''error'': ''Invalid credentials''}');
        Memo1.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');

        Memo1.Lines.Add('def set_auth( username, password):');
        Memo1.Lines.Add('         global key');
        Memo1.Lines.Add('         key = base64.b64encode(bytes(''%s:%s'' % (username, password), ''utf-8'')).decode(''ascii'')');

        Memo1.Lines.Add('def SelectData(getData):');
        rowCount:=StringGrid2.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(StringGrid2.Cells[2, j])>0) then
                   Memo1.Lines.Add('     global '+StringGrid2.Cells[2, j]);
           end;
        Memo1.Lines.Add('     global AllData');

        for j:=1 to rowCount-1 do
          begin
              if(Length(StringGrid2.Cells[2, j])>0) and (Length(StringGrid2.Cells[1, j])>0) then
                begin
                Memo1.Lines.Add('#-----------------------------------------------------------------------------------');
                Memo1.Lines.Add('     try:');
                Memo1.Lines.Add('         x=getVariables(getData,'''+StringGrid2.Cells[1, j]+''','''+StringGrid2.Cells[2, j]+''','''+StringGrid2.Cells[3, j]+''','''+StringGrid2.Cells[4, j]+''','''+StringGrid2.Cells[5, j]+''','''+StringGrid2.Cells[6, j]+''','''+StringGrid2.Cells[7,j]+''')');
                Memo1.Lines.Add('         if(x!=None):');
                Memo1.Lines.Add('             '+StringGrid2.Cells[2, j]+'=x');
                Memo1.Lines.Add('         else:');
                Memo1.Lines.Add('             '+StringGrid2.Cells[2, j]+'='+StringGrid2.Cells[2, j]+'');
                Memo1.Lines.Add('     except Exception as e:');
                Memo1.Lines.Add('         pass');


                AllData:=AllData+StringGrid2.Cells[2, j]+','
                end;
          end;
        Memo1.Lines.Add('#-----------------------------------------------------------------------------------');
        Memo1.Lines.Add('     AllData=['+AllData+']');
        Memo1.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        Memo1.Lines.Add('     varData=None');
        Memo1.Lines.Add('     if(getData.decode("utf-8").split('':'')[0] == source):');
        Memo1.Lines.Add('         temp = getData.decode("utf-8").split('':'')[1]');
        Memo1.Lines.Add('         if(temp!=''Error''):');
        Memo1.Lines.Add('             temp = temp.replace("(", "").replace(")", "").replace(" ", "").split('','')');
        Memo1.Lines.Add('             if(dataType==''float''):');
        Memo1.Lines.Add('                 if(count==''2''): ');
        Memo1.Lines.Add('                     if(sequence==''12''):');
        Memo1.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        Memo1.Lines.Add('                         varData=temp2[0]');
        Memo1.Lines.Add('                     if(sequence==''21''):');
        Memo1.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        Memo1.Lines.Add('                         varData=temp2[0]');
        Memo1.Lines.Add('             if(dataType==''integer''):');
        Memo1.Lines.Add('                 if(count==''1''):');
        Memo1.Lines.Add('                     temp2=int(temp[int(address)])');
        Memo1.Lines.Add('                     varData=temp2');
        Memo1.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        Memo1.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        Memo1.Lines.Add('                     varData=temp2');
        Memo1.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        Memo1.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        Memo1.Lines.Add('                     varData=temp2');
        Memo1.Lines.Add('             if(dataType==''bool''):');
        Memo1.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        Memo1.Lines.Add('                         temp2=True');
        Memo1.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        Memo1.Lines.Add('                         temp2=False');
        Memo1.Lines.Add('                     varData=temp2');
        Memo1.Lines.Add('             if(dataType==''string''):');
        Memo1.Lines.Add('                     temp2=temp[ int(address)]');
        Memo1.Lines.Add('                     varData=temp2');
        Memo1.Lines.Add('             try:');
        Memo1.Lines.Add('                 mult=int(multiply)');
        Memo1.Lines.Add('             except Exception as e:');
        Memo1.Lines.Add('                 mult=float(multiply)');
        Memo1.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        Memo1.Lines.Add('                 varData=varData*mult');


        Memo1.Lines.Add('             returnData={varName:varData}');
        Memo1.Lines.Add('             return returnData');
        Memo1.Lines.Add('         else:');
        Memo1.Lines.Add('             varData={varName:''Error''}');
        Memo1.Lines.Add('             return varData');

        Memo1.Lines.Add('     else:');
        Memo1.Lines.Add('         return None');

        Memo1.Lines.Add('def udpserv(i=1):');
        Memo1.Lines.Add('     global udpdata ');
        Memo1.Lines.Add('     try:');
        Memo1.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        Memo1.Lines.Add('         server_address = (''localhost'', 64000)');
        Memo1.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        Memo1.Lines.Add('         sock.bind(server_address)');
        Memo1.Lines.Add('         while True:');
        Memo1.Lines.Add('             data, address = sock.recvfrom(4096)');
        Memo1.Lines.Add('             udpdata=data');
        Memo1.Lines.Add('             SelectData(udpdata)');
        Memo1.Lines.Add('     except Exception as e:');
        Memo1.Lines.Add('         print(e)');

        Memo1.Lines.Add('def run(server_class=HTTPServer, handler_class=S, port=8080):');
        Memo1.Lines.Add('     server_address = (serverSlave, int(portSlave))');
        Memo1.Lines.Add('     httpd = server_class(server_address, handler_class)');
        Memo1.Lines.Add('     print(''Starting httpd...\n'')');
        Memo1.Lines.Add('     try:');
        Memo1.Lines.Add('         httpd.serve_forever()');
        Memo1.Lines.Add('     except Exception as e:');
        Memo1.Lines.Add('         print(e)');
        Memo1.Lines.Add('         pass');
        Memo1.Lines.Add('     httpd.server_close() ');



        Memo1.Lines.Add('if __name__ == "__main__": ');
        Memo1.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        rowCount:=StringGrid2.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(StringGrid2.Cells[2, j])>0) then
                   Memo1.Lines.Add('     '+StringGrid2.Cells[2, j]+'=''''');
           end;

        Memo1.Lines.Add('     AllData=''''');
        Memo1.Lines.Add('     try: ');
        Memo1.Lines.Add('         print( ''Starting web server...'')');
        Memo1.Lines.Add('         serverSlave=''127.0.0.1''');
        Memo1.Lines.Add('         portSlave=''8080''');
        Memo1.Lines.Add('         timeOut=2 ');
        Memo1.Lines.Add('         login=''root''');
        Memo1.Lines.Add('         password=''root''');
        Memo1.Lines.Add('         set_auth(login,password)');

        Memo1.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,)) ');
        Memo1.Lines.Add('         modb.daemon = True');
        Memo1.Lines.Add('         modb.start()');
        Memo1.Lines.Add('         run()');
        Memo1.Lines.Add('     except Exception as e:');

        Memo1.Lines.Add('         print(e)');



        try
            Memo1.Lines.SaveToFile(ProjectPath+'jserver.py');
          except
             ShowMessage('Error to save');
          end;


end;


procedure TMainFrame.SaveToFileHtml();
var
  rowCount,j: integer;
begin
  Memo1.Clear;
  Memo1.Lines.Add('<!--###########################################################################');
  Memo1.Lines.Add('## Html code generated with '+Version+' '+ DateToStr(Date())+' ');
  Memo1.Lines.Add('## Html Client by Jack Maclov');
  Memo1.Lines.Add('## http://scadapy.ln-group.ru/');
  Memo1.Lines.Add('##');
  Memo1.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  Memo1.Lines.Add('########################################################################### -->');
  Memo1.Lines.Add('<!DOCTYPE html>');
  Memo1.Lines.Add('<meta http-equiv="content-type" content="text/html; charset=utf-8">');
  Memo1.Lines.Add('<meta charset="utf-8">');
  Memo1.Lines.Add('<title>ScadaPy Html client</title>');
  Memo1.Lines.Add('<script type="text/javascript">');
  Memo1.Lines.Add('var Host="http://127.0.0.1:8080/data";');
  Memo1.Lines.Add('var Login=''root'';');
  Memo1.Lines.Add('var Password=''root'';');
  Memo1.Lines.Add('var resp="0";');
   rowCount:=StringGrid2.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(StringGrid2.Cells[2, j])>0) then
                   begin
                   Memo1.Lines.Add('var '+StringGrid2.Cells[2, j]+';');
                   Memo1.Lines.Add('var Alias_'+StringGrid2.Cells[2, j]+'='''+StringGrid2.Cells[8, j]+''';');
                   end;

           end;
  Memo1.Lines.Add('function init()  {   setInterval(function(){ getData();}, 1000); }');
  Memo1.Lines.Add('function getData() {');
  Memo1.Lines.Add('if (window.XMLHttpRequest) {  xmlhttp=new XMLHttpRequest();                        }');
  Memo1.Lines.Add('else                       {  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");      }');
  Memo1.Lines.Add('xmlhttp.open("GET",Host,true);');
  Memo1.Lines.Add('xmlhttp.setRequestHeader("Authorization", "Basic " + btoa(Login+":"+Password));');
  Memo1.Lines.Add('xmlhttp.withCredentials = true;');
  Memo1.Lines.Add('xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");');
  Memo1.Lines.Add('xmlhttp.send(null);');
  Memo1.Lines.Add('xmlhttp.onreadystatechange=function()   {');
  Memo1.Lines.Add('if (xmlhttp.readyState==4 && xmlhttp.status==200) {');
  Memo1.Lines.Add('resp= xmlhttp.responseText;');
  Memo1.Lines.Add('parseResp=JSON.parse(resp);');
  Memo1.Lines.Add('document.getElementById("recv").innerHTML=resp;');
  rowCount:=StringGrid2.RowCount;
       for j:=1 to rowCount-1 do
           begin
            if(Length(StringGrid2.Cells[2, j])>0) then
                  begin

                     Memo1.Lines.Add('try      { document.getElementById("'+StringGrid2.Cells[2, j]+'").innerHTML=Alias_'+StringGrid2.Cells[2, j]+'+'': ''+ parseResp['+(j-1).ToString+'].'+StringGrid2.Cells[2, j]+'; }');
                     Memo1.Lines.Add('catch(e) { document.getElementById("'+StringGrid2.Cells[2, j]+'").innerHTML=Alias_'+StringGrid2.Cells[2, j]+'+'': 0''; }');

                     if(StringGrid2.Cells[6, j] = 'bool') then
                       begin
                        Memo1.Lines.Add('try {');
                        Memo1.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+StringGrid2.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+StringGrid2.Cells[2, j]+';');
                        Memo1.Lines.Add('if(parseResp['+(j-1).ToString+'].'+StringGrid2.Cells[2, j]+' == true) { document.getElementById("i1").contentDocument.getElementById("REC_'+StringGrid2.Cells[2, j]+'").setAttribute("fill", "red"); }');
                        Memo1.Lines.Add('else { document.getElementById("i1").contentDocument.getElementById("REC_'+StringGrid2.Cells[2, j]+'").setAttribute("fill", "green"); }');
                        Memo1.Lines.Add('} catch(e) {');
                        Memo1.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+StringGrid2.Cells[2, j]+'").textContent=0; }');

                       end
                     else
                       begin
 Memo1.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+StringGrid2.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+StringGrid2.Cells[2, j]+'.toFixed(3); }');


 Memo1.Lines.Add('catch(e) {');
 Memo1.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+StringGrid2.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+StringGrid2.Cells[2, j]+'; }');
 Memo1.Lines.Add('catch(e) { document.getElementById("i1").contentDocument.getElementById("SVG_'+StringGrid2.Cells[2, j]+'").textContent=0; }');
 Memo1.Lines.Add('         }');


                       end;
                  end;
          end;

  Memo1.Lines.Add('}  }  }');
  Memo1.Lines.Add('</script>');
  Memo1.Lines.Add('<body onload="init()" style="background-color:white" >');
  Memo1.Lines.Add('<span id="recv"></span><br>');
         for j:=1 to rowCount-1 do
           begin
            if(Length(StringGrid2.Cells[2, j])>0) then
                  begin
                     Memo1.Lines.Add('<span id="'+StringGrid2.Cells[2, j]+'"></span><br>');
                  end;
          end;
         Memo1.Lines.Add('<br><br><iframe id="i1" width="800" height="'+(j*35).ToString+'"  src="./image.svg" ></iframe>');
         Memo1.Lines.Add('</body></html>');
    try
            Memo1.Lines.SaveToFile(ProjectPath+'jclient.html');
          except
             ShowMessage('Error to save');
          end;


          Memo1.Clear;
          Memo1.Lines.Add('<svg xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><text x="0"  y="15">SVG image</text>');
          for j:=1 to rowCount-1 do
            begin
             if(Length(StringGrid2.Cells[2, j])>0) then
                   begin
                       Memo1.Lines.Add('<text x="40"  y="'+(j*35).ToString+'">'+StringGrid2.Cells[6, j]+'</text>');
                       Memo1.Lines.Add('<text x="130"  y="'+(j*35).ToString+'">'+StringGrid2.Cells[8, j]+'</text>');
                       Memo1.Lines.Add('<text id="SVG_'+StringGrid2.Cells[2, j]+'" x="400"  y="'+(j*35).ToString+'">value</text>');
                       Memo1.Lines.Add('<rect id="REC_'+StringGrid2.Cells[2, j]+'" x="10" y="'+(j*35-15).ToString+'" width="20" height="20" fill="red"/>');
                   end;
           end;
                      Memo1.Lines.Add('</svg>');

                      try
                              Memo1.Lines.SaveToFile(ProjectPath+'image.svg');
                            except
                               ShowMessage('Error to save');
                            end;


end;
procedure TMainFrame.MercuryClient();
var
  rowCount,i,j,z: integer;
  mThread:string;
begin
  Memo1.Clear;
  Memo1.Lines.Add('# -*- coding: utf-8 -*-');
  Memo1.Lines.Add('###########################################################################');
  Memo1.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
  Memo1.Lines.Add('## Mercury client by Jack Maclov');
  Memo1.Lines.Add('## http://scadapy.ln-group.ru/');
  Memo1.Lines.Add('##');
  Memo1.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  Memo1.Lines.Add('########################################################################### ');
  Memo1.Lines.Add('import time');
  Memo1.Lines.Add('import gc');
  Memo1.Lines.Add('import socket');
  Memo1.Lines.Add('import threading');
  Memo1.Lines.Add('import serial');
  Memo1.Lines.Add('import mercury as m');

  mThread:='';
  rowCount:=MainTree.Items.Count;
  try
     begin
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 1) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 Memo1.Lines.Add('def Proc_'+i.ToString+'(f=1):');
                 mThread:=mThread+'         modb_'+i.ToString+' = threading.Thread(target=Proc_'+i.ToString+',args=(1,))'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.daemon = True'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.start()'+#13#10;
                 Memo1.Lines.Add('     startAdr=[]');
                 Memo1.Lines.Add('     rangeAdr=[]');
                 Memo1.Lines.Add('     rtuAddress=[]');
                 Memo1.Lines.Add('     varname=[]');
                 Memo1.Lines.Add('     timeOut=[]');
                 Memo1.Lines.Add('     reg=[]');
                 z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                             end;
                                        end;

                 Memo1.Lines.Add('     unitCount='+z.ToString);

           end;
        end;
  Memo1.Lines.Add('     for i in range(0,unitCount+1):');
  Memo1.Lines.Add('         rtuAddress.append(i)');
  Memo1.Lines.Add('         reg.append(i)');
  Memo1.Lines.Add('         startAdr.append(i)');
  Memo1.Lines.Add('         rangeAdr.append(i)');
  Memo1.Lines.Add('         varname.append(i)');
  Memo1.Lines.Add('         timeOut.append(i)');
  if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   Memo1.Lines.Add('# tcp settings');
                   end;
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   Memo1.Lines.Add('     try:');
                   Memo1.Lines.Add('         com=serial.Serial('''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', timeout=2, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)');
                   Memo1.Lines.Add('         time.sleep(2) ');
                   Memo1.Lines.Add('     except Exception as e:');
                   Memo1.Lines.Add('          pass');
                   end;
    for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                             begin

                              Memo1.Lines.Add('     x='+(j-1).ToString()+'; '+
                              'varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+''')');

                             end;
                        end;
  Memo1.Lines.Add('     while True:');
  Memo1.Lines.Add('         for i in range(0,unitCount):   ');
  Memo1.Lines.Add('             try:');
  Memo1.Lines.Add('                 varNameData=m.getDataFromCounter(rtuAddress[i],com,0)');
  Memo1.Lines.Add('                 sock_udp.sendto((varname[i]+":").encode(''utf-8'')+str(varNameData).encode(''utf-8''), server_address_udp)');
  Memo1.Lines.Add('             except Exception as e:');
  Memo1.Lines.Add('                 varNameData=None');
  Memo1.Lines.Add('                 sock_udp.sendto((varname[i]+":Error").encode(''utf-8''), server_address_udp)');
  Memo1.Lines.Add('             time.sleep(float(timeOut[x]))');
  Memo1.Lines.Add('if __name__ == "__main__":');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         try:');
  Memo1.Lines.Add('             print( ''UDP sender start'')');
  Memo1.Lines.Add('             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  Memo1.Lines.Add('             server_address_udp = (''localhost'', 64000)');
  Memo1.Lines.Add('         except Exception as e:');
  Memo1.Lines.Add('             print(''UDP fail '',e)');
  Memo1.Lines.Add('         print( ''Starting mercury client'')');
  Memo1.Lines.Add('         time.sleep(1.0)');

   Memo1.Lines.Add('  ########################### treads block');
   Memo1.Lines.Add(mThread);

  Memo1.Lines.Add('         while True:');
  Memo1.Lines.Add('             pass');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print(e)');
  end;
  except

  end;


  try
    Memo1.Lines.SaveToFile(ProjectPath+'mclient.py');
  except
    ShowMessage('Error to save');
  end;
end;

procedure TMainFrame.MercuryLib();

begin
  Memo1.Clear;
  Memo1.Lines.Add('# -*- coding: utf-8 -*-');
  Memo1.Lines.Add('###########################################################################');
  Memo1.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
  Memo1.Lines.Add('## Mercury lib by Jack Maclov');
  Memo1.Lines.Add('## http://scadapy.ln-group.ru/');
  Memo1.Lines.Add('##');
  Memo1.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  Memo1.Lines.Add('########################################################################### ');
  Memo1.Lines.Add('import serial');
  Memo1.Lines.Add('import binascii');
  Memo1.Lines.Add('import time');
  Memo1.Lines.Add('a=''''  ');
  Memo1.Lines.Add('auchCRCHi = [');
  Memo1.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  Memo1.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  Memo1.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  Memo1.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,');
  Memo1.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,');
  Memo1.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,');
  Memo1.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  Memo1.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,');
  Memo1.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  Memo1.Lines.Add('0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  Memo1.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  Memo1.Lines.Add('0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  Memo1.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  Memo1.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  Memo1.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  Memo1.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  Memo1.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  Memo1.Lines.Add('0x40]');
  Memo1.Lines.Add('auchCRCLo = [');
  Memo1.Lines.Add('0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,');
  Memo1.Lines.Add('0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,');
  Memo1.Lines.Add('0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,');
  Memo1.Lines.Add('0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,');
  Memo1.Lines.Add('0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,');
  Memo1.Lines.Add('0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,');
  Memo1.Lines.Add('0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,');
  Memo1.Lines.Add('0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,');
  Memo1.Lines.Add('0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,');
  Memo1.Lines.Add('0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,');
  Memo1.Lines.Add('0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,');
  Memo1.Lines.Add('0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,');
  Memo1.Lines.Add('0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,');
  Memo1.Lines.Add('0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,');
  Memo1.Lines.Add('0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,');
  Memo1.Lines.Add('0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,');
  Memo1.Lines.Add('0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,');
  Memo1.Lines.Add('0x40]');
  Memo1.Lines.Add('def crc16Lo(data) :');
  Memo1.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  Memo1.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  Memo1.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  Memo1.Lines.Add('    for ch in data :');
  Memo1.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  Memo1.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  Memo1.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  Memo1.Lines.Add('    return (uchCRCLo)');
  Memo1.Lines.Add('def crc16Hi(data) :');
  Memo1.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  Memo1.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  Memo1.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  Memo1.Lines.Add('    for ch in data :');
  Memo1.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  Memo1.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  Memo1.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  Memo1.Lines.Add('    return (uchCRCHi)');
  Memo1.Lines.Add('def sndOpCh(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(4)');
  Memo1.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  Memo1.Lines.Add('             ret = 1');
  Memo1.Lines.Add('         else: ');
  Memo1.Lines.Add('             ret = 0');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''cndOpCh'',e)');
  Memo1.Lines.Add('         ret=0      ');
  Memo1.Lines.Add('     return ret');
  Memo1.Lines.Add('def getEn0(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x00]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(19)');
  Memo1.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  Memo1.Lines.Add('             Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  Memo1.Lines.Add('             Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  Memo1.Lines.Add('             Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  Memo1.Lines.Add('             Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  Memo1.Lines.Add('         else:');
  Memo1.Lines.Add('             Aplus  = ''Error''   ');
  Memo1.Lines.Add('             Aminus = ''Error''  ');
  Memo1.Lines.Add('             Rplus  = ''Error''  ');
  Memo1.Lines.Add('             Rminus = ''Error''  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getEn0- '',e)');
  Memo1.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  Memo1.Lines.Add('def getEn1(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x01]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x01, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(19)');
  Memo1.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  Memo1.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  Memo1.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  Memo1.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getEn1- '',e) ');
  Memo1.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  Memo1.Lines.Add('def getEn2(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x02]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x02, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(19)');
  Memo1.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  Memo1.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  Memo1.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  Memo1.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getEn2- '',e) ');
  Memo1.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  Memo1.Lines.Add('def getEn3(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x03]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x03, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(19)');
  Memo1.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  Memo1.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  Memo1.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  Memo1.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getEn3- '',e) ');
  Memo1.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  Memo1.Lines.Add('def getEn4(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x04]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(19)');
  Memo1.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  Memo1.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  Memo1.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  Memo1.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getEn4- '',e) ');
  Memo1.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  Memo1.Lines.Add('def getConnect(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush() ');
  Memo1.Lines.Add('         dataIn = [ int(netAdr), 0x00]');
  Memo1.Lines.Add('         ser.write([ int(netAdr), 0x00 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(4)');
  Memo1.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  Memo1.Lines.Add('             ret = 1');
  Memo1.Lines.Add('         else: ');
  Memo1.Lines.Add('             ret = 0');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         ret=0');
  Memo1.Lines.Add('     return ret');
  Memo1.Lines.Add('def getU(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x11]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x11, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(12)');
  Memo1.Lines.Add('         U1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  Memo1.Lines.Add('         U2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  Memo1.Lines.Add('         U3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getU- '',e)   ');
  Memo1.Lines.Add('     return U1,U2,U3');
  Memo1.Lines.Add('def getI(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x21]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x21, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(12)');
  Memo1.Lines.Add('         I1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  Memo1.Lines.Add('         I2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  Memo1.Lines.Add('         I3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getI- '',e)   ');
  Memo1.Lines.Add('     return I1,I2,I3');
  Memo1.Lines.Add('def getP(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x00]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(15)');
  Memo1.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  Memo1.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  Memo1.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  Memo1.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  Memo1.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  Memo1.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  Memo1.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  Memo1.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8])');
  Memo1.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  Memo1.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  Memo1.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  Memo1.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  Memo1.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getP- '',e)   ');
  Memo1.Lines.Add('     return P,P1,P2,P3');
  Memo1.Lines.Add('def getPS(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x08]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x08, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(15)');
  Memo1.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  Memo1.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  Memo1.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  Memo1.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  Memo1.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  Memo1.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  Memo1.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  Memo1.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  Memo1.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  Memo1.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  Memo1.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  Memo1.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  Memo1.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getPS- '',e)  ');
  Memo1.Lines.Add('     return P,P1,P2,P3');
  Memo1.Lines.Add('def getPQ(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x04]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(15)');
  Memo1.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  Memo1.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  Memo1.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  Memo1.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  Memo1.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  Memo1.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  Memo1.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  Memo1.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  Memo1.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  Memo1.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  Memo1.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  Memo1.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  Memo1.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getPQ- '',e)  ');
  Memo1.Lines.Add('     return P,P1,P2,P3');
  Memo1.Lines.Add('def getCosF(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x30]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x30, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(15)');
  Memo1.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  Memo1.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  Memo1.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  Memo1.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  Memo1.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  Memo1.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  Memo1.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  Memo1.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  Memo1.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  Memo1.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  Memo1.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  Memo1.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  Memo1.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  Memo1.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getCosF- '',e)');
  Memo1.Lines.Add('     return P,P1,P2,P3');
  Memo1.Lines.Add('def getAngle(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x51]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x51, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(12)');
  Memo1.Lines.Add('         A1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2]) ');
  Memo1.Lines.Add('         A2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5]) ');
  Memo1.Lines.Add('         A3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8]) ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getAng- '',e) ');
  Memo1.Lines.Add('     return A1^0xFFFFFF,A2^0xFFFFFF,A3^0xFFFFFF,');
  Memo1.Lines.Add('def getFreq(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x40]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x40, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(6)');
  Memo1.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  Memo1.Lines.Add('             f  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  Memo1.Lines.Add('         else:');
  Memo1.Lines.Add('             f=''Error''');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getFreq- '',e)');
  Memo1.Lines.Add('     return f');
  Memo1.Lines.Add('def getSN(netAdr,ser):');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         ser.flushInput()');
  Memo1.Lines.Add('         ser.flush()        ');
  Memo1.Lines.Add('         dataIn = [ int(netAdr),0x08,0x00]');
  Memo1.Lines.Add('         ser.write([ int(netAdr),0x08,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  Memo1.Lines.Add('         reqString= ser.read(6)');
  Memo1.Lines.Add('         sn1 = str(reqString[1]).zfill(2) ');
  Memo1.Lines.Add('         sn2 = str(reqString[2]).zfill(2) ');
  Memo1.Lines.Add('         sn3 = str(reqString[3]).zfill(2) ');
  Memo1.Lines.Add('         sn4 = str(reqString[4]).zfill(2) ');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         print (''getSN'',e)    ');
  Memo1.Lines.Add('     return sn1+sn2+sn3+sn4');
  Memo1.Lines.Add('def getDataFromCounter(netAdr,serialPort,DEBUG):');
  Memo1.Lines.Add('     serialPort.flushInput()');
  Memo1.Lines.Add('     serialPort.flush()');
  Memo1.Lines.Add('     data=''''   ');
  Memo1.Lines.Add('     try:');
  Memo1.Lines.Add('         getConn=getConnect(netAdr,serialPort)');
  Memo1.Lines.Add('         if(getConn == 1):');
  Memo1.Lines.Add('             time.sleep(0.2)');
  Memo1.Lines.Add('             openChannel=sndOpCh(netAdr,serialPort)');
  Memo1.Lines.Add('             if(openChannel == 1):');
  Memo1.Lines.Add('                 time.sleep(0.2) ');
  Memo1.Lines.Add('                 sn1 = getSN(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.2) ');
  Memo1.Lines.Add('                 freq=getFreq(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1) ');
  Memo1.Lines.Add('                 Aplus,Aminus,Rplus,Rminus = getEn0(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1) ');
  Memo1.Lines.Add('                 Aplus1,Aminus1,Rplus1,Rminus1 = getEn1(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1) ');
  Memo1.Lines.Add('                 Aplus2,Aminus2,Rplus2,Rminus2 = getEn2(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1) ');
  Memo1.Lines.Add('                 Aplus3,Aminus3,Rplus3,Rminus3 = getEn3(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 Aplus4,Aminus4,Rplus4,Rminus4 = getEn4(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 U1,U2,U3 = getU(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 I1,I2,I3 = getI(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 P,P1,P2,P3 = getP(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 PS,PS1,PS2,PS3 = getPS(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 PQ,PQ1,PQ2,PQ3 = getPQ(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 cosF,cosF1,cosF2,cosF3 = getCosF(netAdr,serialPort)');
  Memo1.Lines.Add('                 time.sleep(0.1)');
  Memo1.Lines.Add('                 Angle1,Angle2,Angle3 = getAngle(netAdr,serialPort)');
  Memo1.Lines.Add('                 data=sn1,freq,Aplus,Aminus,Rplus,Rminus,Aplus1,Aminus1,Rplus1,Rminus1,Aplus2,Aminus2,Rplus2,Rminus2,Aplus3,Aminus3,Rplus3,Rminus3,Aplus4,Aminus4,Rplus4,Rminus4,U1,U2,U3,I1,I2,I3,P,P1,P2,P3,PS,PS1,PS2,PS3,PQ,PQ1,PQ2,PQ3,cosF,cosF1,cosF2,cosF3,Angle1,Angle2,Angle3');
  Memo1.Lines.Add('             else:');
  Memo1.Lines.Add('                 data=''Error''');
  Memo1.Lines.Add('         else:');
  Memo1.Lines.Add('             data=''Error''');
  Memo1.Lines.Add('     except Exception as e:');
  Memo1.Lines.Add('         data=''Error''');
  Memo1.Lines.Add('     return data');
  try
    Memo1.Lines.SaveToFile(ProjectPath+'mercury.py');
  except
    ShowMessage('Error to save');
  end;

end;

end.


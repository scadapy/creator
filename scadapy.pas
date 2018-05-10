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
    BOpenProject: TBitBtn;
    BStartJsonServer: TBitBtn;
    BStartHtmlClient: TBitBtn;
    BStartMercuryClient: TBitBtn;
    BStartDBArch: TBitBtn;
    BGVKTreeAddString: TBitBtn;
    BGVKTreeDelString: TBitBtn;
    BStartVKClient: TBitBtn;
    BStartMonitor: TBitBtn;
    BSaveProject: TBitBtn;
    BNewProject: TBitBtn;
    BGMainGridAdd: TBitBtn;
    BCompilePy: TBitBtn;
    BStartModbusClient: TBitBtn;
    BGVarTreeAddString: TBitBtn;
    BGVarTreeDelString: TBitBtn;
    CProtocol: TComboBox;
    CChanal: TComboBox;
    EIPtty: TEdit;
    ELinuxPythonPath: TEdit;
    EDBhost: TEdit;
    EDBPort: TEdit;
    EDBLogin: TEdit;
    EDBPassword: TEdit;
    EVKLogin: TEdit;
    EVKPassword: TEdit;
    EPortBoadRate: TEdit;
    EInfo: TEdit;
    EProjectName: TEdit;
    EWindowsPythonPath: TEdit;
    EProjectPath: TEdit;
    EWindowsBrowser: TEdit;
    ELinuxTerminal: TEdit;
    ELinuxBrowser: TEdit;
    LInfo: TLabel;
    LChanal: TLabel;
    LIPtty: TLabel;
    LTCPBaudRate: TLabel;
    LDBHost: TLabel;
    LDBPort: TLabel;
    LDBLogin: TLabel;
    LDBPassword: TLabel;
    LVKLogin: TLabel;
    LVKPassword: TLabel;
    LProjectName: TLabel;
    LWinPythonPath: TLabel;
    LProjectPath: TLabel;
    LWinBrowser: TLabel;
    LLinuxTerminal: TLabel;
    LLinuxBrowser: TLabel;
    LLinuxPython: TLabel;
    LProtocol: TLabel;
    MainFormMenu: TMainMenu;
    MainTree: TTreeView;
    FileItem: TMenuItem;
    MemoSave: TMemo;
    ItemExit: TMenuItem;
    RunItem: TMenuItem;
    ItemRunMonitor: TMenuItem;
    ItemRunModbus: TMenuItem;
    ItemRunMercury: TMenuItem;
    ItemModbus: TMenuItem;
    ItemMercury: TMenuItem;
    ItemJserver: TMenuItem;
    ItemRunWebClient: TMenuItem;
    ItemRunDBArch: TMenuItem;
    MenuItem19: TMenuItem;
    ItemOpenProject: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    ItemVKClient: TMenuItem;
    ItemRunVKClient: TMenuItem;
    ItemSaveAsProject: TMenuItem;
    ItemSaveProject: TMenuItem;
    ItemCreateProject: TMenuItem;
    ItemRunJsonServer: TMenuItem;
    ItemMainTreeAdd: TMenuItem;
    ItemMainTreeDel: TMenuItem;
    CreateItem: TMenuItem;
    OpenDialogProject: TOpenDialog;
    MainPage: TPageControl;
    TabDevicePanelMiddle: TPanel;
    TabVKPanelInfo: TPanel;
    TabConfigPanelInfo: TPanel;
    TabVariablesPanelInfo: TPanel;
    TabDevicePanelVar: TPanel;
    TabConfigPanelMain: TPanel;
    TabDevicePanelUp: TPanel;
    PanelMainMenu: TPanel;
    PopupMenuMainTree: TPopupMenu;
    Process1: TProcess;
    SaveDialogProject: TSaveDialog;
    BGMainGridSave: TSpeedButton;
    MainFormSplitter: TSplitter;
    TabVariablesSplitter: TSplitter;
    TabVKSplitter: TSplitter;
    MainFormStatusBar: TStatusBar;
    GMainTree: TStringGrid;
    GVarTree: TStringGrid;
    GVKTree: TStringGrid;
    TabDevice: TTabSheet;
    TabVariables: TTabSheet;
    TabVK: TTabSheet;
    TabDB: TTabSheet;
    TabConfig: TTabSheet;
    VarTree: TTreeView;
    VkTree: TTreeView;



    procedure BStartJsonServerClick(Sender: TObject);
    procedure BStartHtmlClientClick(Sender: TObject);
    procedure BStartMercuryClientClick(Sender: TObject);
    procedure BStartDBArchClick(Sender: TObject);
    procedure BStartVKClientClick(Sender: TObject);
    procedure BOpenProjectClick(Sender: TObject);
    procedure BStartMonitorClick(Sender: TObject);
    procedure BSaveProjectClick(Sender: TObject);
    procedure BNewProjectClick(Sender: TObject);
    procedure BGMainGridAddClick(Sender: TObject);
    procedure BCompilePyClick(Sender: TObject);
    procedure BStartModbusClientClick(Sender: TObject);
    procedure BGVarTreeAddStringClick(Sender: TObject);
    procedure BGVarTreeDelStringClick(Sender: TObject);
    procedure CProtocolSelect(Sender: TObject);
    procedure CChanalSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainTreeClick(Sender: TObject);
    procedure RunItemClick(Sender: TObject);
    procedure ItemRunMonitorClick(Sender: TObject);
    procedure ItemRunModbusClick(Sender: TObject);
    procedure ItemRunMercuryClick(Sender: TObject);
    procedure ItemModbusClick(Sender: TObject);
    procedure ItemMercuryClick(Sender: TObject);
    procedure ItemJserverClick(Sender: TObject);
    procedure ItemRunWebClientClick(Sender: TObject);
    procedure ItemRunDBArchClick(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure ItemVKClientClick(Sender: TObject);
    procedure ItemRunVKClientClick(Sender: TObject);
    procedure ItemOpenProjectClick(Sender: TObject);
    procedure ItemSaveAsProjectClick(Sender: TObject);
    procedure ItemSaveProjectClick(Sender: TObject);
    procedure ItemCreateProjectClick(Sender: TObject);
    procedure ItemRunJsonServerClick(Sender: TObject);
    procedure ItemMainTreeAddClick(Sender: TObject);
    procedure ItemMainTreeDelClick(Sender: TObject);
    procedure CreateItemClick(Sender: TObject);
    procedure BGMainGridSaveClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; aRow: Integer);
    procedure GMainTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var Editor: TWinControl);
    procedure GVarTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GVarTreeDragOver(Sender: TDragState; var Accept: Boolean);
    procedure GVarTreeSelectCell(Sender: TObject;  aRow: Integer);
    procedure GVarTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var Editor: TWinControl);
    procedure GVKTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GVKTreeDragOver(Sender: TObject; var Accept: Boolean);
    procedure GVKTreeSelectCell(Sender: TObject;  aRow: Integer);
    procedure GVKTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var Editor: TWinControl);
    procedure TabVariablesShow(Sender: TObject);
    procedure TabVKShow(Sender: TObject);
    procedure VarTreeDragOver(Sender: TObject; var Accept: Boolean);
    procedure VarTreeMouseDown(Sender: TObject; Button: TMouseButton);
    procedure VkTreeDragOver(Sender: TObject; var Accept: Boolean);

  private
   procedure SaveToFileModbusPy();
   procedure OpenProject();
   procedure SaveAsProject();
   procedure CreateProject();
   procedure RunCmdCommand(comEx: string);
   procedure SaveXML2();
   procedure OpenProjectXML(fileName: string);
   procedure OpenDBXML(fileName: string);
   procedure OpenVkXML(fileName: string);
   procedure LoadVarTree();
   procedure SaveTreeData();
   procedure LoadFromFileXML(filename: String);
   procedure XML2Tree(tree: TTreeView; XMLDoc: TXMLDocument);
   procedure Monitor();
   procedure SaveToFileJserverPy();
   procedure SaveToFileHtml();
   procedure MercuryLib();
   procedure MercuryClient();
   procedure DbArch();
   procedure SaveStartStop();
   procedure LoadVkTree();
   procedure LoadFromVkXML(filename: String);
   procedure VkClient();
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
  DbHost:String;
  DbPort:String;
  DbLogin:String;
  DbPassword:String;
  VkLogin:String;
  VkPassword:String;
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
       Version:='ScadaPy Creator v.3.4.1 ';
       MainFrame.Caption:=Version;
       PathToProject:=ExtractFilePath(Application.ExeName);
       TabDevicePanelMiddle.Align:=alClient;
       TabConfigPanelMain.Align:=alClient;
       GMainTree.Clear;
       GMainTree.ColCount:=7;
       GMainTree.RowCount:=2;
       GMainTree.Cells[0,0] := '№';
       GMainTree.Cells[1,0] := 'Name';
       GMainTree.Cells[2,0] := 'RTU address';
       GMainTree.Cells[3,0] := 'REG name';
       GMainTree.Cells[4,0] := 'REG address';
       GMainTree.Cells[5,0] := 'REG offset';
       GMainTree.Cells[6,0] := 'TimeOut';
       GMainTree.ColWidths[0]:=30;
       GMainTree.ColWidths[1]:=200;
       GMainTree.ColWidths[2]:=80;
       GMainTree.ColWidths[3]:=200;
       GMainTree.ColWidths[4]:=200;
       GMainTree.ColWidths[5]:=70;
       GMainTree.ColWidths[6]:=70;

//////////////////////////////////////////////////////
       GVarTree.Clear;
       GVarTree.ColCount:=10;
       GVarTree.RowCount:=2;
       GVarTree.Cells[0,0] := '№';
       GVarTree.Cells[1,0] := 'Источник';
       GVarTree.Cells[2,0] := 'Название переменной';
       GVarTree.Cells[3,0] := 'Адрес';
       GVarTree.Cells[4,0] := 'Количество байт';
       GVarTree.Cells[5,0] := 'Порядок байт';
       GVarTree.Cells[6,0] := 'Тип данных';
       GVarTree.Cells[7,0] := 'Множитель';
       GVarTree.Cells[8,0] := 'Псевдоним';
       GVarTree.Cells[9,0] := 'Период архивации';

       GVarTree.ColWidths[0]:=30;
       GVarTree.ColWidths[1]:=200;
       GVarTree.ColWidths[2]:=200;
       GVarTree.ColWidths[3]:=80;
       GVarTree.ColWidths[4]:=120;
       GVarTree.ColWidths[5]:=100;
       GVarTree.ColWidths[6]:=100;
       GVarTree.ColWidths[7]:=70;
       GVarTree.ColWidths[8]:=200;
       GVarTree.ColWidths[9]:=120;
//////////////////////////////////////////////////////
       GVKTree.Clear;
       GVKTree.ColCount:=5;
       GVKTree.RowCount:=2;
       GVKTree.Cells[0,0] := '№';
       GVKTree.Cells[1,0] := 'Название переменной';
       GVKTree.Cells[2,0] := 'Сообщение';
       GVKTree.Cells[3,0] := 'vk id';
       GVKTree.Cells[4,0] := 'Период отправки';
       GVKTree.ColWidths[0]:=30;
       GVKTree.ColWidths[1]:=200;
       GVKTree.ColWidths[2]:=280;
       GVKTree.ColWidths[3]:=100;
       GVKTree.ColWidths[4]:=150;
end;

procedure TMainFrame.BStartMonitorClick(Sender: TObject);
begin
    Monitor();
end;

procedure TMainFrame.BSaveProjectClick(Sender: TObject);
begin
      ProjectName:=EProjectName.Text;
      ProjectPath:=EProjectPath.Text;
      PathToPythonWindows:=EWindowsPythonPath.Text;
      PathToBrowserWindows:=EWindowsBrowser.Text;
      PathToTerminalLinux:=ELinuxTerminal.Text;
      PathToBrowserLinux:=ELinuxBrowser.Text;
      PathToPythonLinux:=ELinuxPythonPath.Text;
      DbHost:=EDBhost.Text;
      DbPort:=EDBPort.Text;
      DbLogin:=EDBLogin.Text;
      DbPassword:=EDBPassword.Text;
      VkLogin:= EVKLogin.Text;
      VkPassword:= EVKPassword.Text;
      MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
      //try
     //   SaveTreeData();
   //   except

     // end;
      SaveXML2();
      try
        begin
         SaveToFileModbusPy();
         SaveToFileJserverPy();
         SaveToFileHtml();
         MercuryLib();
         MercuryClient();
         DbArch();
         VkClient();
       end;
      except

      end;

end;

procedure TMainFrame.BNewProjectClick(Sender: TObject);
begin
  CreateProject();
end;

procedure TMainFrame.BGMainGridAddClick(Sender: TObject);
begin
    GMainTree.RowCount:=GMainTree.RowCount + 1 ;
end;

procedure TMainFrame.BCompilePyClick(Sender: TObject);
begin
 SaveToFileModbusPy();
 SaveToFileJserverPy();
 SaveToFileHtml();
 MercuryLib();
 MercuryClient();
 DbArch();
 VkClient();
 SaveStartStop();

end;

procedure TMainFrame.BStartModbusClientClick(Sender: TObject);
begin
       {$IFDEF Windows}
          RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
       {$ENDIF Windows}
       {$IFDEF Unix}
        RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'modbus.py'+'"');
       {$ENDIF Unix}
end;

procedure TMainFrame.BGVarTreeAddStringClick(Sender: TObject);
begin
      GVKTree.RowCount:=GVKTree.RowCount + 1 ;
end;

procedure TMainFrame.BGVarTreeDelStringClick(Sender: TObject);
begin
      GVKTree.DeleteRow(ArRow);
end;

procedure TMainFrame.BOpenProjectClick(Sender: TObject);
begin
    OpenProject();
    LoadVarTree();
    LoadVkTree();
end;

procedure TMainFrame.BStartJsonServerClick(Sender: TObject);
begin
  {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'jserver.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
  RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'jserver.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.BStartHtmlClientClick(Sender: TObject);
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

procedure TMainFrame.BStartMercuryClientClick(Sender: TObject);
begin
  {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'mclient.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
     RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'mclient.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.BStartDBArchClick(Sender: TObject);
begin
  {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'dbserver.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
  RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'dbserver.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.BStartVKClientClick(Sender: TObject);
begin
  {$IFDEF Windows}
   RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'vkclient.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
   RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'vkclient.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.CProtocolSelect(Sender: TObject);
begin

end;

procedure TMainFrame.CChanalSelect(Sender: TObject);
begin

end;

procedure TMainFrame.MainTreeClick(Sender: TObject);
var  parId,i,j: integer;

begin
  try
     if (MainTree.SelectionVisible=True)   then
     begin
     EIPtty.Clear;
     EPortBoadRate.Clear;
     if MainTree.Selected.Selected = True then
         EInfo.Text:=MainTree.Selected.Text;

     parId:=StrToInt(MainTree.Selected.Parent.Index.ToString());
     //childId:=StrToInt(MainTree.Selected.Index.ToString());
     if(MainTree.Selected.Level=2) and (parId=0)   then
          begin
              GMainTree.Clear;
              GMainTree.ColCount:=7;
              GMainTree.RowCount:=2;
              GMainTree.ColWidths[0]:=30;
              GMainTree.ColWidths[1]:=200;
              GMainTree.ColWidths[2]:=80;
              GMainTree.ColWidths[3]:=200;
              GMainTree.ColWidths[4]:=200;
              GMainTree.ColWidths[5]:=70;
              GMainTree.ColWidths[6]:=70;
              GMainTree.Cells[0,0] := '№';
              GMainTree.Cells[1,0] := 'Name';
              GMainTree.Cells[2,0] := 'RTU address';
              GMainTree.Cells[3,0] := 'REG name';
              GMainTree.Cells[4,0] := 'REG address';
              GMainTree.Cells[5,0] := 'REG offset';
              GMainTree.Cells[6,0] := 'TimeOut';
                if (MStructure(MainTree.Selected.Data)<>nil) then
                begin
                   CProtocol.ItemIndex:=MStructure(MainTree.Selected.Data)^.ProtocolType.ToInteger;
                   CChanal.ItemIndex:=MStructure(MainTree.Selected.Data)^.ChanalType.ToInteger;
                   EIPtty.Text:=MStructure(MainTree.Selected.Data)^.TCP_COM;
                   EPortBoadRate.Text:=MStructure(MainTree.Selected.Data)^.PORT_SPEED;
                   i:=Length(MStructure(MainTree.Selected.Data)^.StringData);
                   GMainTree.RowCount:=i+1;
                   for j:=1 to i-1 do
                   begin
                      GMainTree.Cells[0, j]:=j.ToString ;
                      GMainTree.Cells[1, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][1]  ;
                      GMainTree.Cells[2, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][2]  ;
                      GMainTree.Cells[3, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][3]  ;
                      GMainTree.Cells[4, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][4]  ;
                      GMainTree.Cells[5, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][5]  ;
                      GMainTree.Cells[6, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][6]  ;
                  end;
              end;
          end;


      if   (MainTree.Selected.Level=2) and (parId=1)  then
      begin
           GMainTree.Clear;
           GMainTree.RowCount:=2;
           GMainTree.ColWidths[0]:=30;
           GMainTree.ColWidths[1]:=200;
           GMainTree.ColWidths[2]:=120;
           GMainTree.ColWidths[3]:=70;
           GMainTree.ColWidths[4]:=70;
           GMainTree.ColWidths[5]:=70;
           GMainTree.ColWidths[6]:=70;
           GMainTree.Cells[0,0] := '№';
           GMainTree.Cells[1,0] := 'Name';
           GMainTree.Cells[2,0] := 'Net Address';
           GMainTree.Cells[3,0] := 'Empty';
           GMainTree.Cells[4,0] := 'Empty';
           GMainTree.Cells[5,0] := 'Serial Number';
           GMainTree.Cells[6,0] := 'TimeOut';
             if (MStructure(MainTree.Selected.Data)<>nil) then
             begin
                CProtocol.ItemIndex:=MStructure(MainTree.Selected.Data)^.ProtocolType.ToInteger;
                CChanal.ItemIndex:=MStructure(MainTree.Selected.Data)^.ChanalType.ToInteger;
                EIPtty.Text:=MStructure(MainTree.Selected.Data)^.TCP_COM;
                EPortBoadRate.Text:=MStructure(MainTree.Selected.Data)^.PORT_SPEED;
                i:=Length(MStructure(MainTree.Selected.Data)^.StringData);
                GMainTree.RowCount:=i+1;
                for j:=1 to i-1 do
                begin
                   GMainTree.Cells[0, j]:=j.ToString ;
                   GMainTree.Cells[1, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][1]  ;
                   GMainTree.Cells[2, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][2]  ;
                   GMainTree.Cells[3, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][3]  ;
                   GMainTree.Cells[4, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][4]  ;
                   GMainTree.Cells[5, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][5]  ;
                   GMainTree.Cells[6, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][6]  ;
               end;
           end;
       end;

      end;
  except
     ShowMessage('Error');
  end;

end;

procedure TMainFrame.RunItemClick(Sender: TObject);
begin


end;

procedure TMainFrame.ItemRunMonitorClick(Sender: TObject);
begin
  Monitor();
end;

procedure TMainFrame.ItemRunModbusClick(Sender: TObject);
begin
         {$IFDEF Windows}
           RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
        {$ENDIF Windows}
        {$IFDEF Unix}
          RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'modbus.py'+'"');
       {$ENDIF Unix}

end;

procedure TMainFrame.ItemRunMercuryClick(Sender: TObject);
begin
  {$IFDEF Windows}
       RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'mclient.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
       RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'mclient.py'+'"');
   {$ENDIF Unix}
end;

procedure TMainFrame.ItemModbusClick(Sender: TObject);
begin
   SaveToFileModbusPy();
end;

procedure TMainFrame.ItemMercuryClick(Sender: TObject);
begin
   MercuryLib();
   MercuryClient();
end;

procedure TMainFrame.ItemJserverClick(Sender: TObject);
begin
   SaveToFileJserverPy();
   SaveToFileHtml();
end;

procedure TMainFrame.ItemRunWebClientClick(Sender: TObject);
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

procedure TMainFrame.ItemRunDBArchClick(Sender: TObject);
begin
  {$IFDEF Windows}
   RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'dbserver.py"');
  {$ENDIF Windows}
  {$IFDEF Unix}
  RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'dbserver.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.MenuItem19Click(Sender: TObject);
begin
   DbArch();
end;

procedure TMainFrame.MenuItem20Click(Sender: TObject);
begin
       {$IFDEF Windows}
       //   RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
       {$ENDIF Windows}
       {$IFDEF Unix}
        RunCmdCommand(ProjectPath+'start.sh');
       {$ENDIF Unix}
end;

procedure TMainFrame.MenuItem21Click(Sender: TObject);
begin
       {$IFDEF Windows}
       //   RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'modbus.py"');
       {$ENDIF Windows}
       {$IFDEF Unix}
       try
          RunCmdCommand(ProjectPath+'stop.sh');
       except
            On E :Exception do begin
             ShowMessage(E.Message);
            end;
       end;
       {$ENDIF Unix}

end;

procedure TMainFrame.ItemVKClientClick(Sender: TObject);
begin
  VkClient();
end;

procedure TMainFrame.ItemRunVKClientClick(Sender: TObject);
begin
   {$IFDEF Windows}
      RunCmdCommand(PathToPythonWindows+' '+ProjectPath+'vkclient.py"');
   {$ENDIF Windows}
   {$IFDEF Unix}
      RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+ProjectPath+'vkclient.py'+'"');
  {$ENDIF Unix}
end;

procedure TMainFrame.ItemOpenProjectClick(Sender: TObject);
begin
   OpenProject();
   LoadVarTree();
   LoadVkTree();
end;


procedure TMainFrame.ItemSaveAsProjectClick(Sender: TObject);
begin
 SaveAsProject();
 SaveXML2();
end;

procedure TMainFrame.ItemSaveProjectClick(Sender: TObject);
begin
      ProjectName:=EProjectName.Text;
      ProjectPath:=EProjectPath.Text;
      PathToPythonWindows:=EWindowsPythonPath.Text;
      PathToBrowserWindows:=EWindowsBrowser.Text;
      PathToTerminalLinux:=ELinuxTerminal.Text;
      PathToBrowserLinux:=ELinuxBrowser.Text;
      PathToPythonLinux:=ELinuxPythonPath.Text;
      MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
      SaveXML2();
      //LoadVarTree();
end;

procedure TMainFrame.ItemCreateProjectClick(Sender: TObject);
begin
     CreateProject();
     SaveXML2();
end;

procedure TMainFrame.ItemRunJsonServerClick(Sender: TObject);
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
 MemoSave.Clear;
     MemoSave.Lines.Add('import socket');
     MemoSave.Lines.Add('import sys');
     MemoSave.Lines.Add('import time');
     MemoSave.Lines.Add('sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
     MemoSave.Lines.Add('server_address = (''localhost'', 64000)');
     MemoSave.Lines.Add('print(''starting up on {} port {}''.format(*server_address))');
     MemoSave.Lines.Add('sock.bind(server_address)');
     MemoSave.Lines.Add('while True:');
     MemoSave.Lines.Add('    data, address = sock.recvfrom(4096)');
     MemoSave.Lines.Add('    print(data)');
     MemoSave.Lines.SaveToFile(PathToProject+ 'udpmonitor.py' );
    {$IFDEF Windows}
     RunCmdCommand(PathToPythonWindows+' '+PathToProject+'udpmonitor.py"');
    {$ENDIF Windows}
    {$IFDEF Unix}
     RunCmdCommand(PathToTerminalLinux + ' "'+PathToPythonLinux+' '+PathToProject+'udpmonitor.py'+'"');
     {$ENDIF Unix}
end;
procedure TMainFrame.ItemMainTreeAddClick(Sender: TObject);
var
  DataRec:  MStructure;
begin
        if MainTree.Selected.Selected = True then
           EInfo.Text:=MainTree.Selected.Text;
        if( (StrToInt(MainTree.Selected.Index.ToString())=0 ) and
            (StrToInt(MainTree.Selected.Parent.Index.ToString())=1) ) then
             begin
              MainTree.items.AddChild(MainTree.Selected,'Название порта modbus');
              GMainTree.Clear;
              GMainTree.RowCount:=2;
              GMainTree.ColWidths[0]:=30;
              GMainTree.ColWidths[1]:=200;
              GMainTree.ColWidths[2]:=80;
              GMainTree.ColWidths[3]:=200;
              GMainTree.ColWidths[4]:=200;
              GMainTree.ColWidths[5]:=70;
              GMainTree.ColWidths[6]:=70;
              GMainTree.Cells[0,0] := '№';
              GMainTree.Cells[1,0] := 'Name';
              GMainTree.Cells[2,0] := 'RTU address';
              GMainTree.Cells[3,0] := 'REG name';
              GMainTree.Cells[4,0] := 'REG address';
              GMainTree.Cells[5,0] := 'REG offset';
              GMainTree.Cells[6,0] := 'TimeOut';
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

procedure TMainFrame.ItemMainTreeDelClick(Sender: TObject);
begin
  if(MainTree.Selected.Level=2) then
      MainTree.Selected.Delete;
end;

procedure TMainFrame.CreateItemClick(Sender: TObject);
begin
      SaveToFileModbusPy();
end;

procedure TMainFrame.BGMainGridSaveClick(Sender: TObject);
begin
    SaveTreeData();
end;

procedure TMainFrame.StringGrid1SelectCell(Sender: TObject; aRow: Integer);
begin
  ArRow:=ARow;
end;

procedure TMainFrame.GMainTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);

begin
   if aCol=3 then
   begin
        Editor := GMainTree.EditorByStyle(cbsPickList);
        TCustomComboBox(Editor).Items.CommaText := 'READ_INPUT_REGISTERS,READ_DISCRETE_INPUTS,READ_COILS,READ_HOLDING_REGISTERS';
   end;

end;

procedure TMainFrame.GVarTreeDragDrop(Sender, Source: TObject; X, Y: Integer  );
var
  DestCol, DestRow: Integer;
begin
   DestCol:=0;
   DestRow:=0;
   if Source is TTreeView then
     begin

          GVarTree.RowCount:=GVarTree.RowCount+1;
          GVarTree.MouseToCell(X, Y, DestCol, DestRow);
          GVarTree.Cells[DestCol,DestRow]:=VarTree.Selected.Text;
          GVarTree.Cells[3,DestRow]:='0';
          GVarTree.Cells[4,DestRow]:='1';
          GVarTree.Cells[7,DestRow]:='1';

     end;
end;

procedure TMainFrame.GVarTreeDragOver(Sender: TDragState; var Accept: Boolean);
begin
 Accept := true;
end;

procedure TMainFrame.GVarTreeSelectCell(Sender: TObject; aRow: Integer);
begin
    ArRow:=ARow;
end;

procedure TMainFrame.GVarTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);
begin
   if aCol=5 then
   begin
        Editor := GVarTree.EditorByStyle(cbsPickList);
        TCustomComboBox(Editor).Items.CommaText := '1,12,21';
   end;
   if aCol=6 then
      begin
           Editor := GVarTree.EditorByStyle(cbsPickList);
           TCustomComboBox(Editor).Items.CommaText := 'integer,float,string,bool';
      end;
   if aCol=9 then
      begin
           Editor := GVarTree.EditorByStyle(cbsPickList);
           TCustomComboBox(Editor).Items.CommaText := '0,1,5,15,30,60';
      end;
end;

procedure TMainFrame.GVKTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  DestCol, DestRow: Integer;
begin
   DestCol:=0;
   DestRow:=0;
   if Source is TTreeView then
     begin
          GVKTree.RowCount:=GVKTree.RowCount+1;
          GVKTree.MouseToCell(X, Y, DestCol, DestRow);
          GVKTree.Cells[DestCol,DestRow]:=VkTree.Selected.Text;
     end;
end;

procedure TMainFrame.GVKTreeDragOver(Sender: TObject; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.GVKTreeSelectCell(Sender: TObject; aRow: Integer);
begin
      ArRow:=ARow;
end;

procedure TMainFrame.GVKTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);
begin
   if aCol=4 then
      begin
           Editor := GVKTree.EditorByStyle(cbsPickList);
           TCustomComboBox(Editor).Items.CommaText := '0,1,5,15,30,60';
      end;
end;

procedure TMainFrame.TabVariablesShow(Sender: TObject);
begin
  LoadVarTree();
end;

procedure TMainFrame.TabVKShow(Sender: TObject);
begin
      LoadVkTree();
end;

procedure TMainFrame.VarTreeDragOver(Sender: TObject; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.VarTreeMouseDown(Sender: TObject; Button: TMouseButton);
begin
    if Button = mbLeft then
      VarTree.BeginDrag(true);

end;

procedure TMainFrame.VkTreeDragOver(Sender: TObject;var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.SaveToFileModbusPy();
var
  rowCount,i,j,z: integer;
  insText,mThread,mThreadJoin:String;
begin
        mThread:='';
        mThreadJoin:='';
        rowCount:=MainTree.Items.Count;
        MemoSave.Clear;
        MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        MemoSave.Lines.Add('###########################################################################');
        MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        MemoSave.Lines.Add('## Modbus Client by Jack Mas');
        MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        MemoSave.Lines.Add('##');
        MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        MemoSave.Lines.Add('########################################################################### ');
        MemoSave.Lines.Add('import time');
        MemoSave.Lines.Add('import modbus_tk');
        MemoSave.Lines.Add('import modbus_tk.defines as cst');
        MemoSave.Lines.Add('import modbus_tk.modbus_tcp as modbus_tcp');
        MemoSave.Lines.Add('from modbus_tk import modbus_rtu');
        MemoSave.Lines.Add('import serial');
        MemoSave.Lines.Add('import gc');
        MemoSave.Lines.Add('import socket');
        MemoSave.Lines.Add('import threading');
        MemoSave.Lines.Add('import json');
        try
        for i:=1 to RowCount do
         begin
          if (MainTree.Items.Item[i-1].Parent.Index = 0) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 MemoSave.Lines.Add('def Proc_'+i.ToString+'(f=1):');
                 mThread:=mThread+'         modb_'+i.ToString+' = threading.Thread(target=Proc_'+i.ToString+',args=(1,))'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.daemon = True'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.start()'+#13#10;
                 mThreadJoin:=mThreadJoin+'         modb_'+i.ToString+'.join()'+#13#10;

                 MemoSave.Lines.Add('     startAdr=[]');
                 MemoSave.Lines.Add('     rangeAdr=[]');
                 MemoSave.Lines.Add('     rtuAddress=[]');
                 MemoSave.Lines.Add('     varname=[]');
                 MemoSave.Lines.Add('     timeOut=[]');
                 MemoSave.Lines.Add('     reg=[]');
                 z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                             end;
                                        end;

                 MemoSave.Lines.Add('     unitCount='+z.ToString);
                 MemoSave.Lines.Add('     for i in range(0,unitCount+1):');
                 MemoSave.Lines.Add('         rtuAddress.append(i)');
                 MemoSave.Lines.Add('         reg.append(i)');
                 MemoSave.Lines.Add('         startAdr.append(i)');
                 MemoSave.Lines.Add('         rangeAdr.append(i)');
                 MemoSave.Lines.Add('         varname.append(i)');
                 MemoSave.Lines.Add('         timeOut.append(i)');
                 MemoSave.Lines.Add('     try:');
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   MemoSave.Lines.Add('         master = modbus_tcp.TcpMaster(host='''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''', port=int('''+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))');
                   insText:='                 master = modbus_tcp.TcpMaster(host='''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''', port=int('''+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'''))';
                   end;
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   MemoSave.Lines.Add('         com=serial.Serial('''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', bytesize=8, parity=''N'', stopbits=1, xonxoff=0)');
                   MemoSave.Lines.Add('         master=modbus_rtu.RtuMaster(com)');
                   end;
                 MemoSave.Lines.Add('         master.set_timeout(2)');
                 MemoSave.Lines.Add('     except Exception as e:');
                 MemoSave.Lines.Add('          pass');
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                             begin
                              MemoSave.Lines.Add('     x='+(j-1).ToString()+'; '+
                           'varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+''')');

                             end;
                        end;
                 MemoSave.Lines.Add('     while True:');
                 MemoSave.Lines.Add('         for i in range(0,unitCount):');
                 MemoSave.Lines.Add('             try:');
                 MemoSave.Lines.Add('                 if(reg[i]==''READ_INPUT_REGISTERS''):   c=cst.READ_INPUT_REGISTERS');
                 MemoSave.Lines.Add('                 if(reg[i]==''READ_DISCRETE_INPUTS''):   c=cst.READ_DISCRETE_INPUTS');
                 MemoSave.Lines.Add('                 if(reg[i]==''READ_COILS''):             c=cst.READ_COILS');
                 MemoSave.Lines.Add('                 if(reg[i]==''READ_HOLDING_REGISTERS''): c=cst.READ_HOLDING_REGISTERS');
                 MemoSave.Lines.Add('                 varNameData= master.execute(int(rtuAddress[i]), c, int(startAdr[i]), int(rangeAdr[i]) )');
                 MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp)');
                 MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_arch)');
                 MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_vk)');
                 MemoSave.Lines.Add('             except Exception as e:');
                 MemoSave.Lines.Add('                 varNameData=None');
                 MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp)');
                 MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_arch)');
                 MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_vk)');
                 MemoSave.Lines.Add(insText);
                 MemoSave.Lines.Add('             time.sleep(float(timeOut[i]))');
                 MemoSave.Lines.Add('             gc.collect()');
             end;
       end;
       except

       end;

 MemoSave.Lines.Add('if __name__ == "__main__":');
 MemoSave.Lines.Add('     try:');
 MemoSave.Lines.Add('         try:');
 MemoSave.Lines.Add('             print( ''UDP sender start'')');
 MemoSave.Lines.Add('             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
 MemoSave.Lines.Add('             server_address_udp = (''localhost'', 64000)');
 MemoSave.Lines.Add('             sock_udp_arch = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
 MemoSave.Lines.Add('             server_address_udp_arch = (''localhost'', 64001)');
 MemoSave.Lines.Add('             sock_udp_vk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
 MemoSave.Lines.Add('             server_address_udp_vk = (''localhost'', 64002)');
 MemoSave.Lines.Add('         except Exception as e:');
 MemoSave.Lines.Add('             print(''UDP fail '',e)');
 MemoSave.Lines.Add('         print( ''Starting modbus client'')');
 MemoSave.Lines.Add('         time.sleep(1.0)');
 MemoSave.Lines.Add('  ########################### treads block');
 MemoSave.Lines.Add(mThread);
 MemoSave.Lines.Add(mThreadJoin);
 MemoSave.Lines.Add('     except Exception as e:');
 MemoSave.Lines.Add('         print(e)');
   try
     MemoSave.Lines.SaveToFile(ProjectPath+'modbus.py');
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
       OpenDialogProject.Title := 'Open project ScadaPy ';
       OpenDialogProject.Filter := 'ScadaPy project|*.xml' ;
       if OpenDialogProject.Execute then
       begin
             filename := OpenDialogProject.Filename;
             ProjectFile := filename;
             FullProjectFilePath:=OpenDialogProject.FileName;
             ProjectPath:=OpenDialogProject.InitialDir;
       end;
       MainTree.Items.Clear;
       MainTree.Items.AddFirst(nil,'Конфигурация проекта');
       MainTree.Items.Add(nil,'Протоколы');
       OpenProjectXML(filename);
       OpenDBXML(filename);
       OpenVkXML(filename);

       LoadFromFileXML(filename);
       LoadFromVkXML(filename);
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
      SaveDialogProject.Title := 'Save new project ScadaPy ';
      SaveDialogProject.Filter := 'ScadaPy project|*.xml' ;
      if SaveDialogProject.Execute and (Length(SaveDialogProject.FileName)>0) then
      try
      begin
          ProjectName:=EProjectName.Text;
          ProjectPath:=SaveDialogProject.InitialDir;
          EProjectPath.Text:=SaveDialogProject.InitialDir;
          FullProjectFilePath:=SaveDialogProject.FileName;
          PathToPythonWindows:=EWindowsPythonPath.Text;
          PathToBrowserWindows:=EWindowsBrowser.Text;
          PathToTerminalLinux:=ELinuxTerminal.Text;
          PathToBrowserLinux:=ELinuxBrowser.Text;
          PathToPythonLinux:=ELinuxPythonPath.Text;
          ProjectFile:=SaveDialogProject.Filename;
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
      SaveDialogProject.Title := 'Create new project ScadaPy ';
      SaveDialogProject.Filter := 'ScadaPy project|*.xml' ;
      if SaveDialogProject.Execute then
      begin
          if Length(EProjectName.Text) < 1 then
          begin
             ProjectName:='NewProject';
              EProjectName.Text:='NewProject';
          end;

          ProjectPath:=SaveDialogProject.InitialDir;
          EProjectPath.Text:=SaveDialogProject.InitialDir;
          FullProjectFilePath:=SaveDialogProject.FileName;

          if Length(EWindowsPythonPath.Text) < 1 then
          begin
             PathToPythonWindows:='c:\Python35\python.exe';
             EWindowsPythonPath.Text:='c:\Python35\python.exe';
          end;

             PathToBrowserWindows:='c:\Program Files\Internet Explorer\iexplore';
             EWindowsBrowser.Text:='c:\Program Files\Internet Explorer\iexplore';

          if Length(ELinuxTerminal.Text) < 1 then
          begin
             PathToTerminalLinux:='xfce4-terminal --geometry=100x20 -e';
             ELinuxTerminal.Text:='xfce4-terminal --geometry=100x20 -e';

          end;
          if Length(ELinuxBrowser.Text) < 1 then
          begin
             PathToBrowserLinux:='firefox';
             ELinuxBrowser.Text:='firefox';

          end;
          if Length(ELinuxPythonPath.Text) < 1 then
          begin
             PathToPythonLinux:='python3';
             ELinuxPythonPath.Text:='python3';

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
           AProcess.Options := AProcess.Options;// + [poWaitOnExit];
       {$ENDIF Unix}
           AProcess.Execute;
           AProcess.Free;
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
                                   EProjectName.Text:=ProjectName;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'ProjectPath') then
                               begin
                                  EProjectPath.Text:=ProjectPath;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToPythonWindows') then
                               begin
                                  PathToPythonWindows:=String(Item[j].Attributes.Item[i].NodeValue);
                                  EWindowsPythonPath.Text:=PathToPythonWindows;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToBrowserWindows') then
                               begin
                                   PathToBrowserWindows:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EWindowsBrowser.Text:=PathToBrowserWindows;
                               end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToTerminalLinux') then
                                begin
                                   PathToTerminalLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   ELinuxTerminal.Text:=PathToTerminalLinux;
                                end;

                           if (Item[j].Attributes.Item[i].NodeName = 'PathToBrowserLinux') then
                               begin
                                   PathToBrowserLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   ELinuxBrowser.Text:=PathToBrowserLinux;
                              end;
                           if (Item[j].Attributes.Item[i].NodeName = 'PathToPythonLinux') then
                               begin
                                   PathToPythonLinux:=String(Item[j].Attributes.Item[i].NodeValue);
                                   ELinuxPythonPath.Text:=PathToPythonLinux;
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

procedure TMainFrame.OpenVkXML(fileName: string);
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
                                   VkLogin:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EVKLogin.Text:=VkLogin;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'VkPassword') then
                               begin
                                   VkPassword:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EVKPassword.Text:=VkPassword;
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

procedure TMainFrame.OpenDBXML(fileName: string);
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
                                   DbHost:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EDBhost.Text:=DbHost;
                               end;
                            if (Item[j].Attributes.Item[i].NodeName = 'DbPort') then
                               begin
                                   DbPort:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EDBPort.Text:=DbPort;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'DbLogin') then
                               begin
                                   DbLogin:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EDBLogin.Text:=DbLogin;
                               end;
                             if (Item[j].Attributes.Item[i].NodeName = 'DbPassword') then
                               begin
                                   DbPassword:=String(Item[j].Attributes.Item[i].NodeValue);
                                   EDBPassword.Text:=DbPassword;
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


procedure TMainFrame.LoadVkTree();
var
  Node,ParentNode: TTreeNode;
  i,rowCount: integer;
begin
       VkTree.Items.Clear;
       ParentNode:=VkTree.items.add(nil,'Список Переменных');
       Node:=VkTree.items.add(ParentNode, 'Переменные');
       rowCount:=GVarTree.RowCount;
       for i:=1 to RowCount-1 do
       begin
          if Length(GVarTree.Cells[2, i]) > 0 then
            begin
             VkTree.items.AddChild(Node,GVarTree.Cells[8, i]);
            end;
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
  rowCount,i,j,rowCountVk: integer;
begin
rowCount:=MainTree.Items.Count;
MemoSave.Clear;
MemoSave.Lines.Add('<?xml version="1.0"?>');
MemoSave.Lines.Add('<Config xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
/////////////////
MemoSave.Lines.Add(' <VkVariables>');
rowCountVk:= GVKTree.RowCount-1;
       for i:=1 to RowCountVk do
       begin
            if   (Length(GVKTree.Cells[1, i]) > 0) and
                 (Length(GVKTree.Cells[4, i]) > 0) and
                 (Length(GVKTree.Cells[3, i]) > 0)  then
                begin
                    MemoSave.Lines.Add('    <VkPoint Id="'+i.ToString+'" VkVar="'+GVKTree.Cells[1, i]+'" '+
                                        'VkMessage="'+GVKTree.Cells[2, i]+'" VkId="'+GVKTree.Cells[3, i]+
                    '" VkTime="'+GVKTree.Cells[4, i]+'" >'+GVarTree.Cells[3, i]+'</VkPoint>');
                end;
       end;
MemoSave.Lines.Add(' </VkVariables>');

MemoSave.Lines.Add(' <VkConfig>');
MemoSave.Lines.Add('     <Cnf VkLogin="'+EVKLogin.Text+'" VkPassword="'+EVKPassword.Text+'"></Cnf>');
MemoSave.Lines.Add(' </VkConfig>');
MemoSave.Lines.Add(' <DbConfig>');
MemoSave.Lines.Add('     <Cnf DbHost="'+EDBhost.Text+'" DbPort="'+EDBPort.Text+'" DbLogin="'+EDBLogin.Text+'" DbPassword="'+EDBPassword.Text+'"></Cnf>');
MemoSave.Lines.Add(' </DbConfig>');
MemoSave.Lines.Add(' <ProjectConfig>');
MemoSave.Lines.Add('     <Config ProjectName="'+EProjectName.Text+'" ProjectPath="'+EProjectPath.Text+'" PathToPythonWindows="'+EWindowsPythonPath.Text+'" PathToBrowserWindows="'+EWindowsBrowser.Text+
'" PathToTerminalLinux="'+ELinuxTerminal.Text+'" PathToBrowserLinux="'+ELinuxBrowser.Text+'" PathToPythonLinux="'+ELinuxPythonPath.Text+'"></Config>');
MemoSave.Lines.Add(' </ProjectConfig>');
MemoSave.Lines.Add(' <ModbusConfig>');
       try
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 0) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 MemoSave.Lines.Add('     <PortModbus ParentIndex="'+MainTree.Items.Item[i-1].Parent.Index.ToString+'" ItemIndex="'+MainTree.Items.Item[i-1].Index.ToString+
                 '" Level="'+MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(MainTree.Items.Item[i-1].Data)^.ProtocolType+
                 '"  Mtype="'+MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM +
                 '" port_speed="'+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ MainTree.Items.Item[i-1].Text+'">'+MainTree.Items.Item[i-1].Parent.Index.ToString);

                        for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                            if( Length(MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                              begin
                               MemoSave.Lines.Add('          <VariableModbus id="'+j.ToString+'" VarName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                               '" RtuAddress="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" RegName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                               '" RegAddress="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" RegOffset="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                               '" TimeOut="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableModbus>');
                              end;
                        end;
                 MemoSave.Lines.Add('     </PortModbus>');

             end;
       end;
       except
       end;
       MemoSave.Lines.Add(' </ModbusConfig>');
       MemoSave.Lines.Add(' <MercuryConfig>');
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 1) and  (MainTree.Items.Item[i-1].Level=2) then
            begin
                MemoSave.Lines.Add('     <PortMercury ParentIndex="'+MainTree.Items.Item[i-1].Parent.Index.ToString+'" ItemIndex="'+MainTree.Items.Item[i-1].Index.ToString+
             '" Level="'+MainTree.Items.Item[i-1].Level.ToString+'" Protocol="'+MStructure(MainTree.Items.Item[i-1].Data)^.ProtocolType+
             '" Mtype="'+MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType+'" tcp_com="'+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM +
             '" port_speed="'+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+'" name="'+ MainTree.Items.Item[i-1].Text+'">'+MainTree.Items.Item[i-1].Parent.Index.ToString);
                for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                begin
                  if( Length(MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0 ) then
                     begin
                       MemoSave.Lines.Add('          <VariableMercury id="'+j.ToString+'" VarName="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+
                       '" Serial_Number="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+'" Empty1="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+
                       '" Empty2="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+'" Net_Address="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+
                       '" TimeOut="'+MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+'"></VariableMercury>');
                     end;
                end;
         MemoSave.Lines.Add('     </PortMercury>');
            end;
       end;
MemoSave.Lines.Add(' </MercuryConfig>');
MemoSave.Lines.Add(' <Variables>');
rowCount:= GVarTree.RowCount-1;
       for i:=1 to RowCount do
       begin
            if  (Length(GVarTree.Cells[1, i]) > 0) and
                (Length(GVarTree.Cells[2, i]) > 0) and
                (Length(GVarTree.Cells[3, i]) > 0) and
                (Length(GVarTree.Cells[4, i]) > 0) and
                (Length(GVarTree.Cells[5, i]) > 0) and
                (Length(GVarTree.Cells[6, i]) > 0) and
                (Length(GVarTree.Cells[7, i]) > 0) then
                begin
                    MemoSave.Lines.Add('    <VarPoint Id="'+i.ToString+'" VarName="'+GVarTree.Cells[1, i]+'" '+
                                        'Alias="'+GVarTree.Cells[2, i]+'" Address="'+GVarTree.Cells[3, i]+
                    '" ByteCount="'+GVarTree.Cells[4, i]+'" ByteRoute="'+GVarTree.Cells[5, i]+'" VarType="'+GVarTree.Cells[6, i]+
                    '" Manage="'+GVarTree.Cells[7, i]+'" '+' VarAlias="'+GVarTree.Cells[8, i]+'"  DbArch="'+GVarTree.Cells[9, i]+'" >'+GVarTree.Cells[1, i]+'</VarPoint>');
                end;
       end;
MemoSave.Lines.Add(' </Variables>');
MemoSave.Lines.Add('</Config>');
MemoSave.Lines.SaveToFile( FullProjectFilePath );
end;

procedure TMainFrame.SaveTreeData();
var
DataRec:MStructure;
i,j:integer;
begin
    New(DataRec);
    DataRec^.ProtocolType:=CProtocol.ItemIndex.ToString;
    DataRec^.ChanalType  :=CChanal.ItemIndex.ToString;
    DataRec^.TCP_COM     := EIPtty.Text;
    DataRec^.PORT_SPEED  := EPortBoadRate.Text;
    i:=GMainTree.RowCount;
    for j:=1 to i-1 do
    begin
         if  (Length(GMainTree.Cells[1, j]) > 0) and
             (Length(GMainTree.Cells[2, j]) > 0) and
             (Length(GMainTree.Cells[5, j]) > 0) and
             (Length(GMainTree.Cells[6, j]) > 0) then
             begin
                SetLength(DataRec^.StringData,j+1,7);
                DataRec^.StringData[j][1]:= GMainTree.Cells[1, j] ;
                DataRec^.StringData[j][2]:= GMainTree.Cells[2, j] ;
                DataRec^.StringData[j][3]:= GMainTree.Cells[3, j] ;
                DataRec^.StringData[j][4]:= GMainTree.Cells[4, j] ;
                DataRec^.StringData[j][5]:= GMainTree.Cells[5, j] ;
                DataRec^.StringData[j][6]:= GMainTree.Cells[6, j] ;
             end;

    end;
    MainTree.Selected.Data := DataRec;

end;

procedure TMainFrame.LoadFromVkXML(filename: String);
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
                     GVKTree.RowCount:=Count+2;
                        for i := 0 to 4 do
                        begin
                           GVKTree.Cells[0, j+1]:= (j+1).ToString;
                           if (Item[j].Attributes.Item[i].NodeName = 'VkVar') then       GVKTree.Cells[1, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkMessage') then   GVKTree.Cells[2, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkId') then        GVKTree.Cells[3, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VkTime') then      GVKTree.Cells[4, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
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
                     GVarTree.RowCount:=Count+2;
                        for i := 0 to 9 do
                        begin
                           GVarTree.Cells[0, j+1]:= (j+1).ToString;
                           if (Item[j].Attributes.Item[i].NodeName = 'VarName') then       GVarTree.Cells[1, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Alias') then         GVarTree.Cells[2, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Address') then       GVarTree.Cells[3, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteCount') then     GVarTree.Cells[4, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'ByteRoute') then     GVarTree.Cells[5, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarType') then       GVarTree.Cells[6, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'Manage') then        GVarTree.Cells[7, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'VarAlias') then      GVarTree.Cells[8, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);
                           if (Item[j].Attributes.Item[i].NodeName = 'DbArch') then        GVarTree.Cells[9, j+1]:= String(Item[j].Attributes.Item[i].NodeValue);

                           MemoSave.Lines.Add(String(Item[j].Attributes.Item[i].NodeValue));
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
        MemoSave.Clear;
        MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        MemoSave.Lines.Add('###########################################################################');
        MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        MemoSave.Lines.Add('## JSON WEB server by Jack Mas');
        MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        MemoSave.Lines.Add('##');
        MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        MemoSave.Lines.Add('########################################################################### ');
        MemoSave.Lines.Add('import sys');
        MemoSave.Lines.Add('import time');
        MemoSave.Lines.Add('import logging');
        MemoSave.Lines.Add('import gc');
        MemoSave.Lines.Add('import os');
        MemoSave.Lines.Add('import threading');
        MemoSave.Lines.Add('from http.server import BaseHTTPRequestHandler, HTTPServer');
        MemoSave.Lines.Add('import json');
        MemoSave.Lines.Add('import base64');
        MemoSave.Lines.Add('import ssl');
        MemoSave.Lines.Add('from datetime import datetime');
        MemoSave.Lines.Add('from enum import Enum, IntEnum');
        MemoSave.Lines.Add('import uuid');
        MemoSave.Lines.Add('import socket');
        MemoSave.Lines.Add('import struct');
        MemoSave.Lines.Add('class S(BaseHTTPRequestHandler):');
        MemoSave.Lines.Add('     def _set_response(self):');
        MemoSave.Lines.Add('         self.send_response(200)');
        MemoSave.Lines.Add('         self.send_header(''Content-type'',''text/html'')');
        MemoSave.Lines.Add('         self.end_headers()');
        MemoSave.Lines.Add('     def do_HEAD(self):');
        MemoSave.Lines.Add('         self.send_response(200)');
        MemoSave.Lines.Add('         self.send_header(''Content-type'', ''text/html'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Accept-Charset,X-Accept,Content-Type,Credentials'')');
        MemoSave.Lines.Add('         self.end_headers()');
        MemoSave.Lines.Add('     def do_AUTHHEAD(self):');
        MemoSave.Lines.Add('         self.send_response(401)');
        MemoSave.Lines.Add('         self.send_header(''WWW-Authenticate'',''Basic realm="Demo Realm"'')');
        MemoSave.Lines.Add('         self.send_header("Cache-Control", "no-cache")');
        MemoSave.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET, OPTIONS'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''Authorization'')');
        MemoSave.Lines.Add('         self.end_headers()');
        MemoSave.Lines.Add('     def do_OPTIONS(self):');
        MemoSave.Lines.Add('         self.send_response(200)');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Credentials'',''true'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Origin'',self.headers.get(''Origin''))');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Methods'',''GET,OPTIONS'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''X-Request, X-Requested-With'')');
        MemoSave.Lines.Add('         self.send_header(''Access-Control-Allow-Headers'',''origin, Authorization, accept'')');
        MemoSave.Lines.Add('         self.send_header(''Content-type'',''application/json'')');
        MemoSave.Lines.Add('         self.end_headers()');
        MemoSave.Lines.Add('     def do_GET(self):');
        MemoSave.Lines.Add('         global key ');
        MemoSave.Lines.Add('         if self.headers.get(''Authorization'') == None:');
        MemoSave.Lines.Add('             self.do_AUTHHEAD()');
        MemoSave.Lines.Add('             response = { ''success'': False, ''error'': ''No auth header received''}');
        MemoSave.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        MemoSave.Lines.Add('         elif self.headers.get(''Authorization'') == ''Basic '' + str(key):');
        MemoSave.Lines.Add('             resp=[]');
        MemoSave.Lines.Add('             self.send_response(200)');
        MemoSave.Lines.Add('             self.send_header(''Allow'',''GET, OPTIONS'')');
        MemoSave.Lines.Add('             self.send_header("Cache-Control", "no-cache")');
        MemoSave.Lines.Add('             self.send_header(''Content-type'',''application/json'')');
        MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Origin'', self.headers.get(''Origin''))');
        MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Credentials'', ''true'')');
        MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Methods'', ''GET, OPTIONS'')');
        MemoSave.Lines.Add('             self.send_header(''Access-Control-Allow-Headers'', ''X-Request, X-Requested-With'')');
        MemoSave.Lines.Add('             self.send_header("Access-Control-Allow-Headers", "Authorization")');
        MemoSave.Lines.Add('             self.end_headers()');
        MemoSave.Lines.Add('             req=str(self.path)[1:]');
        MemoSave.Lines.Add('             if(req == "data" ):');
        MemoSave.Lines.Add('                 try:');
        MemoSave.Lines.Add('                     self.wfile.write(bytes(json.dumps(AllData), ''utf-8''))');
        MemoSave.Lines.Add('                 except Exception as e:');
        MemoSave.Lines.Add('                     print(''get req data error'',e)');
        MemoSave.Lines.Add('             else:');
        MemoSave.Lines.Add('                 response = { ''req error'':''Invalid credentials''}');
        MemoSave.Lines.Add('                 self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        MemoSave.Lines.Add('                 print(''error req'')');
        MemoSave.Lines.Add('         else:');
        MemoSave.Lines.Add('             self.do_AUTHHEAD()');
        MemoSave.Lines.Add('             response = { ''success'': False, ''error'': ''Invalid credentials''}');
        MemoSave.Lines.Add('             self.wfile.write(bytes(json.dumps(response), ''utf-8''))');
        MemoSave.Lines.Add('def set_auth( username, password):');
        MemoSave.Lines.Add('         global key');
        MemoSave.Lines.Add('         key = base64.b64encode(bytes(''%s:%s'' % (username, password), ''utf-8'')).decode(''ascii'')');
        MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
        MemoSave.Lines.Add('         if(x!=None):');
        MemoSave.Lines.Add('             mVar=x ');
        MemoSave.Lines.Add('         else:');
        MemoSave.Lines.Add('             mVar=mVar');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         pass');
        MemoSave.Lines.Add('     return(mVar)');
        MemoSave.Lines.Add('def SelectData(getData):');
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) then
                   MemoSave.Lines.Add('     global '+GVarTree.Cells[2, j]);
           end;
        MemoSave.Lines.Add('     global AllData');
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) then
                   MemoSave.Lines.Add('     global '+GVarTree.Cells[2, j]);
           end;
        MemoSave.Lines.Add('     global AllData');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0)  then
                begin
                   MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=setVariables('+GVarTree.Cells[2, j]+',getData,'''+GVarTree.Cells[1, j]+''','''+GVarTree.Cells[2, j]+''','''+GVarTree.Cells[3, j]+''','''+GVarTree.Cells[4, j]+''','''+GVarTree.Cells[5, j]+''','''+GVarTree.Cells[6, j]+''','''+GVarTree.Cells[7,j]+''')');
                AllData:=AllData+GVarTree.Cells[2, j]+','
                end;
          end;

        MemoSave.Lines.Add('#-----------------------------------------------------------------------------------');
        MemoSave.Lines.Add('     AllData=['+AllData+']');
        MemoSave.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        MemoSave.Lines.Add('     varData=None');
        MemoSave.Lines.Add('     if(json.loads( getData.decode("utf-8") )[''name''] == source):');
        MemoSave.Lines.Add('         temp=json.loads( getData.decode("utf-8") )[''data'']');
        MemoSave.Lines.Add('         if(temp!=''Error''):');
        MemoSave.Lines.Add('             if(dataType==''float''):');
        MemoSave.Lines.Add('                 if(count==''2''): ');
        MemoSave.Lines.Add('                     if(sequence==''12''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('                     if(sequence==''21''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('             if(dataType==''integer''):');
        MemoSave.Lines.Add('                 if(count==''1''):');
        MemoSave.Lines.Add('                     temp2=int(temp[int(address)])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        MemoSave.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        MemoSave.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             if(dataType==''bool''):');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        MemoSave.Lines.Add('                         temp2=True');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        MemoSave.Lines.Add('                         temp2=False');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             if(dataType==''string''):');
        MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             try:');
        MemoSave.Lines.Add('                 mult=int(multiply)');
        MemoSave.Lines.Add('             except Exception as e:');
        MemoSave.Lines.Add('                 mult=float(multiply)');
        MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        MemoSave.Lines.Add('                 varData=varData*mult');
        MemoSave.Lines.Add('             returnData={varName:varData}');
        MemoSave.Lines.Add('             return returnData');
        MemoSave.Lines.Add('         else:');
        MemoSave.Lines.Add('             varData={varName:''Error''}');
        MemoSave.Lines.Add('             return varData');
        MemoSave.Lines.Add('     else:');
        MemoSave.Lines.Add('         return None');
        MemoSave.Lines.Add('def udpserv(i=1):');
        MemoSave.Lines.Add('     global udpdata ');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        MemoSave.Lines.Add('         server_address = (''localhost'', 64000)');
        MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        MemoSave.Lines.Add('         sock.bind(server_address)');
        MemoSave.Lines.Add('         while True:');
        MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        MemoSave.Lines.Add('             udpdata=data');
        MemoSave.Lines.Add('             SelectData(udpdata)');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('def run(server_class=HTTPServer, handler_class=S, port=8080):');
        MemoSave.Lines.Add('     server_address = (serverSlave, int(portSlave))');
        MemoSave.Lines.Add('     httpd = server_class(server_address, handler_class)');
        MemoSave.Lines.Add('     print(''Starting httpd...\n'')');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         httpd.serve_forever()');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('         pass');
        MemoSave.Lines.Add('     httpd.server_close() ');
        MemoSave.Lines.Add('if __name__ == "__main__": ');
        MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) then
                   MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=''''');
           end;
        MemoSave.Lines.Add('     AllData=''''');
        MemoSave.Lines.Add('     try: ');
        MemoSave.Lines.Add('         print( ''Starting web server...'')');
        MemoSave.Lines.Add('         serverSlave=''127.0.0.1''');
        MemoSave.Lines.Add('         portSlave=''8080''');
        MemoSave.Lines.Add('         timeOut=2 ');
        MemoSave.Lines.Add('         login=''root''');
        MemoSave.Lines.Add('         password=''root''');
        MemoSave.Lines.Add('         set_auth(login,password)');
        MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,)) ');
        MemoSave.Lines.Add('         modb.daemon = True');
        MemoSave.Lines.Add('         modb.start()');
        MemoSave.Lines.Add('         run()');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        try
            MemoSave.Lines.SaveToFile(ProjectPath+'jserver.py');
          except
             ShowMessage('Error to save');
          end;
end;


procedure TMainFrame.SaveToFileHtml();
var
  rowCount,j: integer;
begin
  MemoSave.Clear;
  MemoSave.Lines.Add('<!--###########################################################################');
  MemoSave.Lines.Add('## Html code generated with '+Version+' '+ DateToStr(Date())+' ');
  MemoSave.Lines.Add('## Html Client by Jack Mas');
  MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  MemoSave.Lines.Add('##');
  MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  MemoSave.Lines.Add('########################################################################### -->');
  MemoSave.Lines.Add('<!DOCTYPE html>');
  MemoSave.Lines.Add('<meta http-equiv="content-type" content="text/html; charset=utf-8">');
  MemoSave.Lines.Add('<meta charset="utf-8">');
  MemoSave.Lines.Add('<title>ScadaPy Html client</title>');
  MemoSave.Lines.Add('<script type="text/javascript">');
  MemoSave.Lines.Add('var Host="http://127.0.0.1:8080/data";');
  MemoSave.Lines.Add('var Login=''root'';');
  MemoSave.Lines.Add('var Password=''root'';');
  MemoSave.Lines.Add('var resp="0";');
   rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) then
                   begin
                   MemoSave.Lines.Add('var '+GVarTree.Cells[2, j]+';');
                   MemoSave.Lines.Add('var Alias_'+GVarTree.Cells[2, j]+'='''+GVarTree.Cells[8, j]+''';');
                   end;

           end;
  MemoSave.Lines.Add('function init()  {   setInterval(function(){ getData();}, 1000); }');
  MemoSave.Lines.Add('function getData() {');
  MemoSave.Lines.Add('if (window.XMLHttpRequest) {  xmlhttp=new XMLHttpRequest();                        }');
  MemoSave.Lines.Add('else                       {  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");      }');
  MemoSave.Lines.Add('xmlhttp.open("GET",Host,true);');
  MemoSave.Lines.Add('xmlhttp.setRequestHeader("Authorization", "Basic " + btoa(Login+":"+Password));');
  MemoSave.Lines.Add('xmlhttp.withCredentials = true;');
  MemoSave.Lines.Add('xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");');
  MemoSave.Lines.Add('xmlhttp.send(null);');
  MemoSave.Lines.Add('xmlhttp.onreadystatechange=function()   {');
  MemoSave.Lines.Add('if (xmlhttp.readyState==4 && xmlhttp.status==200) {');
  MemoSave.Lines.Add('resp= xmlhttp.responseText;');
  MemoSave.Lines.Add('parseResp=JSON.parse(resp);');
  MemoSave.Lines.Add('document.getElementById("recv").innerHTML=resp;');
  rowCount:=GVarTree.RowCount;
       for j:=1 to rowCount-1 do
           begin
            if(Length(GVarTree.Cells[2, j])>0) then
                  begin
                     MemoSave.Lines.Add('try      { document.getElementById("'+GVarTree.Cells[2, j]+'").innerHTML=Alias_'+GVarTree.Cells[2, j]+'+'': ''+ parseResp['+(j-1).ToString+'].'+GVarTree.Cells[2, j]+'; }');
                     MemoSave.Lines.Add('catch(e) { document.getElementById("'+GVarTree.Cells[2, j]+'").innerHTML=Alias_'+GVarTree.Cells[2, j]+'+'': 0''; }');
                     if(GVarTree.Cells[6, j] = 'bool') then
                       begin
                        MemoSave.Lines.Add('try {');
                        MemoSave.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+GVarTree.Cells[2, j]+';');
                        MemoSave.Lines.Add('if(parseResp['+(j-1).ToString+'].'+GVarTree.Cells[2, j]+' == true) { document.getElementById("i1").contentDocument.getElementById("REC_'+GVarTree.Cells[2, j]+'").setAttribute("fill", "red"); }');
                        MemoSave.Lines.Add('else { document.getElementById("i1").contentDocument.getElementById("REC_'+GVarTree.Cells[2, j]+'").setAttribute("fill", "green"); }');
                        MemoSave.Lines.Add('} catch(e) {');
                        MemoSave.Lines.Add('document.getElementById("i1").contentDocument.getElementById("SVG_'+GVarTree.Cells[2, j]+'").textContent=0; }');
                       end
                     else
                       begin
 MemoSave.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+GVarTree.Cells[2, j]+'.toFixed(3); }');
 MemoSave.Lines.Add('catch(e) {');
 MemoSave.Lines.Add('try      { document.getElementById("i1").contentDocument.getElementById("SVG_'+GVarTree.Cells[2, j]+'").textContent=parseResp['+(j-1).ToString+'].'+GVarTree.Cells[2, j]+'; }');
 MemoSave.Lines.Add('catch(e) { document.getElementById("i1").contentDocument.getElementById("SVG_'+GVarTree.Cells[2, j]+'").textContent=0; }');
 MemoSave.Lines.Add('         }');
                       end;
                  end;
          end;
  MemoSave.Lines.Add('}  }  }');
  MemoSave.Lines.Add('</script>');
  MemoSave.Lines.Add('<body onload="init()" style="background-color:white" >');
  MemoSave.Lines.Add('<span id="recv"></span><br>');
         for j:=1 to rowCount-1 do
           begin
            if(Length(GVarTree.Cells[2, j])>0) then
                  begin
                     MemoSave.Lines.Add('<span id="'+GVarTree.Cells[2, j]+'"></span><br>');
                  end;
          end;
         MemoSave.Lines.Add('<br><br><iframe id="i1" width="800" height="'+(j*35).ToString+'"  src="./image.svg" ></iframe>');
         MemoSave.Lines.Add('</body></html>');
    try
            MemoSave.Lines.SaveToFile(ProjectPath+'jclient.html');
          except
             ShowMessage('Error to save');
          end;
          MemoSave.Clear;
          MemoSave.Lines.Add('<svg xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><text x="0"  y="15">SVG image</text>');
          for j:=1 to rowCount-1 do
            begin
             if(Length(GVarTree.Cells[2, j])>0) then
                   begin
                       MemoSave.Lines.Add('<text x="40"  y="'+(j*35).ToString+'">'+GVarTree.Cells[6, j]+'</text>');
                       MemoSave.Lines.Add('<text x="130"  y="'+(j*35).ToString+'">'+GVarTree.Cells[8, j]+'</text>');
                       MemoSave.Lines.Add('<text id="SVG_'+GVarTree.Cells[2, j]+'" x="400"  y="'+(j*35).ToString+'">value</text>');
                       MemoSave.Lines.Add('<rect id="REC_'+GVarTree.Cells[2, j]+'" x="10" y="'+(j*35-15).ToString+'" width="20" height="20" fill="red"/>');
                   end;
           end;
                      MemoSave.Lines.Add('</svg>');

                      try
                              MemoSave.Lines.SaveToFile(ProjectPath+'image.svg');
                            except
                               ShowMessage('Error to save');
                            end;


end;
procedure TMainFrame.MercuryClient();
var
  rowCount,i,j,z: integer;
  mThread,mThreadJoin:string;
begin
  MemoSave.Clear;
  MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
  MemoSave.Lines.Add('###########################################################################');
  MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
  MemoSave.Lines.Add('## Mercury client by Jack Mas');
  MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  MemoSave.Lines.Add('##');
  MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  MemoSave.Lines.Add('########################################################################### ');
  MemoSave.Lines.Add('import time');
  MemoSave.Lines.Add('import gc');
  MemoSave.Lines.Add('import socket');
  MemoSave.Lines.Add('import threading');
  MemoSave.Lines.Add('import serial');
  MemoSave.Lines.Add('import mercury as m');
  MemoSave.Lines.Add('import json');
  mThread:='';
  mThreadJoin:='';
  rowCount:=MainTree.Items.Count;
  try
     begin
       for i:=1 to RowCount do
       begin
          if (MainTree.Items.Item[i-1].Parent.Index = 1) and (MainTree.Items.Item[i-1].Level=2) then
            begin
                 MemoSave.Lines.Add('def Proc_'+i.ToString+'(f=1):');
                 mThread:=mThread+'         modb_'+i.ToString+' = threading.Thread(target=Proc_'+i.ToString+',args=(1,))'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.daemon = True'+#13#10;
                 mThread:=mThread+'         modb_'+i.ToString+'.start()'+#13#10;
                 mThreadJoin:=mThreadJoin+'         modb_'+i.ToString+'.join()'+#13#10;
                 MemoSave.Lines.Add('     startAdr=[]');
                 MemoSave.Lines.Add('     rangeAdr=[]');
                 MemoSave.Lines.Add('     rtuAddress=[]');
                 MemoSave.Lines.Add('     varname=[]');
                 MemoSave.Lines.Add('     timeOut=[]');
                 MemoSave.Lines.Add('     reg=[]');
                 z:=0;
                 for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                        begin
                                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                             begin
                                              z:=z+1;
                                             end;
                                        end;

                 MemoSave.Lines.Add('     unitCount='+z.ToString);

           end;
        end;
  MemoSave.Lines.Add('     for i in range(0,unitCount+1):');
  MemoSave.Lines.Add('         rtuAddress.append(i)');
  MemoSave.Lines.Add('         reg.append(i)');
  MemoSave.Lines.Add('         startAdr.append(i)');
  MemoSave.Lines.Add('         rangeAdr.append(i)');
  MemoSave.Lines.Add('         varname.append(i)');
  MemoSave.Lines.Add('         timeOut.append(i)');
  if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='0') then
                   begin
                   MemoSave.Lines.Add('# tcp settings');
                   end;
                 if (MStructure(MainTree.Items.Item[i-1].Data)^.ChanalType ='1') then
                   begin
                   MemoSave.Lines.Add('     try:');
                   MemoSave.Lines.Add('         com=serial.Serial('''+MStructure(MainTree.Items.Item[i-1].Data)^.TCP_COM+''','+MStructure(MainTree.Items.Item[i-1].Data)^.PORT_SPEED+', timeout=2, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)');
                   MemoSave.Lines.Add('         time.sleep(2) ');
                   MemoSave.Lines.Add('     except Exception as e:');
                   MemoSave.Lines.Add('          pass');
                   end;
    for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                        begin
                           if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                             begin

                              MemoSave.Lines.Add('     x='+(j-1).ToString()+'; '+
                              'varname[x],rtuAddress[x],reg[x],startAdr[x],rangeAdr[x],timeOut[x]=('''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][2]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][3]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][4]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][5]+''','''+
                              MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][6]+''')');

                             end;
                        end;
  MemoSave.Lines.Add('     while True:');
  MemoSave.Lines.Add('         for i in range(0,unitCount):   ');
  MemoSave.Lines.Add('             try:');
  MemoSave.Lines.Add('                 varNameData=m.getDataFromCounter(rtuAddress[i],com,0)');
  MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp)');
  MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_arch)');
  MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':varNameData} ).encode(''utf-8''), server_address_udp_vk)');
  MemoSave.Lines.Add('             except Exception as e:');
  MemoSave.Lines.Add('                 varNameData=None');
  MemoSave.Lines.Add('                 sock_udp.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp)');
  MemoSave.Lines.Add('                 sock_udp_arch.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_arch)');
  MemoSave.Lines.Add('                 sock_udp_vk.sendto(  json.dumps( {''name'':varname[i],''data'':''Error''} ).encode(''utf-8''), server_address_udp_vk)');
  MemoSave.Lines.Add('             time.sleep(float(timeOut[x]))');
  MemoSave.Lines.Add('if __name__ == "__main__":');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         try:');
  MemoSave.Lines.Add('             print( ''UDP sender start'')');
  MemoSave.Lines.Add('             sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  MemoSave.Lines.Add('             server_address_udp = (''localhost'', 64000)');
  MemoSave.Lines.Add('             sock_udp_arch = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  MemoSave.Lines.Add('             server_address_udp_arch = (''localhost'', 64001)');
  MemoSave.Lines.Add('             sock_udp_vk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
  MemoSave.Lines.Add('             server_address_udp_vk = (''localhost'', 64002)');
  MemoSave.Lines.Add('         except Exception as e:');
  MemoSave.Lines.Add('             print(''UDP fail '',e)');
  MemoSave.Lines.Add('         print( ''Starting mercury client'')');
  MemoSave.Lines.Add('         time.sleep(1.0)');
  MemoSave.Lines.Add('  ########################### treads block');
  MemoSave.Lines.Add(mThread);
  MemoSave.Lines.Add(mThreadJoin);
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print(e)');
  end;
  except
  end;
  try
    MemoSave.Lines.SaveToFile(ProjectPath+'mclient.py');
  except
    ShowMessage('Error to save');
  end;
end;

procedure TMainFrame.MercuryLib();

begin
  MemoSave.Clear;
  MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
  MemoSave.Lines.Add('###########################################################################');
  MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
  MemoSave.Lines.Add('## Mercury lib by Jack Mas');
  MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  MemoSave.Lines.Add('##');
  MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  MemoSave.Lines.Add('########################################################################### ');
  MemoSave.Lines.Add('import serial');
  MemoSave.Lines.Add('import binascii');
  MemoSave.Lines.Add('import time');
  MemoSave.Lines.Add('a=''''  ');
  MemoSave.Lines.Add('auchCRCHi = [');
  MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  MemoSave.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,');
  MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,');
  MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,');
  MemoSave.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,');
  MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  MemoSave.Lines.Add('0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  MemoSave.Lines.Add('0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,');
  MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  MemoSave.Lines.Add('0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,');
  MemoSave.Lines.Add('0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,');
  MemoSave.Lines.Add('0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,');
  MemoSave.Lines.Add('0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,');
  MemoSave.Lines.Add('0x40]');
  MemoSave.Lines.Add('auchCRCLo = [');
  MemoSave.Lines.Add('0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,');
  MemoSave.Lines.Add('0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,');
  MemoSave.Lines.Add('0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,');
  MemoSave.Lines.Add('0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,');
  MemoSave.Lines.Add('0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,');
  MemoSave.Lines.Add('0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,');
  MemoSave.Lines.Add('0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,');
  MemoSave.Lines.Add('0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,');
  MemoSave.Lines.Add('0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,');
  MemoSave.Lines.Add('0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,');
  MemoSave.Lines.Add('0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,');
  MemoSave.Lines.Add('0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,');
  MemoSave.Lines.Add('0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,');
  MemoSave.Lines.Add('0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,');
  MemoSave.Lines.Add('0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,');
  MemoSave.Lines.Add('0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,');
  MemoSave.Lines.Add('0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,');
  MemoSave.Lines.Add('0x40]');
  MemoSave.Lines.Add('def crc16Lo(data) :');
  MemoSave.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  MemoSave.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  MemoSave.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  MemoSave.Lines.Add('    for ch in data :');
  MemoSave.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  MemoSave.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  MemoSave.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  MemoSave.Lines.Add('    return (uchCRCLo)');
  MemoSave.Lines.Add('def crc16Hi(data) :');
  MemoSave.Lines.Add('    uchCRCHi = 0xFF   # high byte of CRC initialized');
  MemoSave.Lines.Add('    uchCRCLo = 0xFF   # low byte of CRC initialized');
  MemoSave.Lines.Add('    uIndex   = 0x0000 # will index into CRC lookup table');
  MemoSave.Lines.Add('    for ch in data :');
  MemoSave.Lines.Add('        uIndex   = uchCRCLo ^ ch');
  MemoSave.Lines.Add('        uchCRCLo = uchCRCHi ^ auchCRCHi[uIndex]');
  MemoSave.Lines.Add('        uchCRCHi = auchCRCLo[uIndex]');
  MemoSave.Lines.Add('    return (uchCRCHi)');
  MemoSave.Lines.Add('def sndOpCh(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(4)');
  MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  MemoSave.Lines.Add('             ret = 1');
  MemoSave.Lines.Add('         else: ');
  MemoSave.Lines.Add('             ret = 0');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''cndOpCh'',e)');
  MemoSave.Lines.Add('         ret=0      ');
  MemoSave.Lines.Add('     return ret');
  MemoSave.Lines.Add('def getEn0(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x00]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(19)');
  MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  MemoSave.Lines.Add('             Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  MemoSave.Lines.Add('             Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  MemoSave.Lines.Add('             Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  MemoSave.Lines.Add('             Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  MemoSave.Lines.Add('         else:');
  MemoSave.Lines.Add('             Aplus  = ''Error''   ');
  MemoSave.Lines.Add('             Aminus = ''Error''  ');
  MemoSave.Lines.Add('             Rplus  = ''Error''  ');
  MemoSave.Lines.Add('             Rminus = ''Error''  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getEn0- '',e)');
  MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  MemoSave.Lines.Add('def getEn1(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x01]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x01, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(19)');
  MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getEn1- '',e) ');
  MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  MemoSave.Lines.Add('def getEn2(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x02]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x02, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(19)');
  MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getEn2- '',e) ');
  MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  MemoSave.Lines.Add('def getEn3(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x03]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x03, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(19)');
  MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getEn3- '',e) ');
  MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  MemoSave.Lines.Add('def getEn4(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x05,0x00,0x04]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x05,0x00,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(19)');
  MemoSave.Lines.Add('         Aplus  = int(reqString[2]<<24) + int(reqString[1]<<16) + int(reqString[4]<<8) + int(reqString[3])   ');
  MemoSave.Lines.Add('         Aminus =  int(reqString[6]<<24) + int(reqString[5]<<16) + int(reqString[8]<<8) + int(reqString[7])  ');
  MemoSave.Lines.Add('         Rplus  =  int(reqString[10]<<24) + int(reqString[9]<<16) + int(reqString[12]<<8) + int(reqString[11])  ');
  MemoSave.Lines.Add('         Rminus  =  int(reqString[14]<<24) + int(reqString[13]<<16) + int(reqString[16]<<8) + int(reqString[15])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getEn4- '',e) ');
  MemoSave.Lines.Add('     return Aplus, Aminus^0xFFFFFFFF,Rplus,Rminus^0xFFFFFFFF');
  MemoSave.Lines.Add('def getConnect(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush() ');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr), 0x00]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr), 0x00 , crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(4)');
  MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  MemoSave.Lines.Add('             ret = 1');
  MemoSave.Lines.Add('         else: ');
  MemoSave.Lines.Add('             ret = 0');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         ret=0');
  MemoSave.Lines.Add('     return ret');
  MemoSave.Lines.Add('def getU(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x11]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x11, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(12)');
  MemoSave.Lines.Add('         U1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  MemoSave.Lines.Add('         U2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  MemoSave.Lines.Add('         U3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getU- '',e)   ');
  MemoSave.Lines.Add('     return U1,U2,U3');
  MemoSave.Lines.Add('def getI(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x21]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x21, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(12)');
  MemoSave.Lines.Add('         I1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  MemoSave.Lines.Add('         I2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5])  ');
  MemoSave.Lines.Add('         I3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8])  ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getI- '',e)   ');
  MemoSave.Lines.Add('     return I1,I2,I3');
  MemoSave.Lines.Add('def getP(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x00]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(15)');
  MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8])');
  MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getP- '',e)   ');
  MemoSave.Lines.Add('     return P,P1,P2,P3');
  MemoSave.Lines.Add('def getPS(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x08]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x08, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(15)');
  MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getPS- '',e)  ');
  MemoSave.Lines.Add('     return P,P1,P2,P3');
  MemoSave.Lines.Add('def getPQ(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x04]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x04, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(15)');
  MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getPQ- '',e)  ');
  MemoSave.Lines.Add('     return P,P1,P2,P3');
  MemoSave.Lines.Add('def getCosF(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x30]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x30, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(15)');
  MemoSave.Lines.Add('         bt1=str(bin(reqString[1]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt4=str(bin(reqString[4]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt7=str(bin(reqString[7]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         bt10=str(bin(reqString[10]))[2:].zfill(8) ');
  MemoSave.Lines.Add('         P  = int(reqString[3]<<8) + int(reqString[2])');
  MemoSave.Lines.Add('         if( bt1[1] == ''1''): P = P        #   0x40');
  MemoSave.Lines.Add('         if( bt1[0] == ''1''): P = P * -1   #   0x80 ');
  MemoSave.Lines.Add('         P1  = int(reqString[6]<<8) + int(reqString[5])');
  MemoSave.Lines.Add('         if( bt4[1] == ''1''): P1 = P1        #   0x40');
  MemoSave.Lines.Add('         if( bt4[0] == ''1''): P1 = P1 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P2  = int(reqString[9]<<8) + int(reqString[8]) ');
  MemoSave.Lines.Add('         if( bt7[1] == ''1''): P2 = P2        #   0x40');
  MemoSave.Lines.Add('         if( bt7[0] == ''1''): P2 = P2 * -1   #   0x80 ');
  MemoSave.Lines.Add('         P3  = int(reqString[12]<<8) + int(reqString[11])');
  MemoSave.Lines.Add('         if( bt10[1] == ''1''): P3 = P3        #   0x40');
  MemoSave.Lines.Add('         if( bt10[0] == ''1''): P3 = P3 * -1   #   0x80 ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getCosF- '',e)');
  MemoSave.Lines.Add('     return P,P1,P2,P3');
  MemoSave.Lines.Add('def getAngle(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn =  [ int(netAdr),0x08,0x16,0x51]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x51, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(12)');
  MemoSave.Lines.Add('         A1  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2]) ');
  MemoSave.Lines.Add('         A2  = int(reqString[4]<<16) + int(reqString[6]<<8) + int(reqString[5]) ');
  MemoSave.Lines.Add('         A3  = int(reqString[7]<<16) + int(reqString[9]<<8) + int(reqString[8]) ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getAng- '',e) ');
  MemoSave.Lines.Add('     return A1^0xFFFFFF,A2^0xFFFFFF,A3^0xFFFFFF,');
  MemoSave.Lines.Add('def getFreq(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x16,0x40]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x16,0x40, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(6)');
  MemoSave.Lines.Add('         if(reqString[0] == int(netAdr) ):');
  MemoSave.Lines.Add('             f  = int(reqString[1]<<16) + int(reqString[3]<<8) + int(reqString[2])  ');
  MemoSave.Lines.Add('         else:');
  MemoSave.Lines.Add('             f=''Error''');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getFreq- '',e)');
  MemoSave.Lines.Add('     return f');
  MemoSave.Lines.Add('def getSN(netAdr,ser):');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         ser.flushInput()');
  MemoSave.Lines.Add('         ser.flush()        ');
  MemoSave.Lines.Add('         dataIn = [ int(netAdr),0x08,0x00]');
  MemoSave.Lines.Add('         ser.write([ int(netAdr),0x08,0x00, crc16Lo(dataIn), crc16Hi(dataIn) ])');
  MemoSave.Lines.Add('         reqString= ser.read(6)');
  MemoSave.Lines.Add('         sn1 = str(reqString[1]).zfill(2) ');
  MemoSave.Lines.Add('         sn2 = str(reqString[2]).zfill(2) ');
  MemoSave.Lines.Add('         sn3 = str(reqString[3]).zfill(2) ');
  MemoSave.Lines.Add('         sn4 = str(reqString[4]).zfill(2) ');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         print (''getSN'',e)    ');
  MemoSave.Lines.Add('     return sn1+sn2+sn3+sn4');
  MemoSave.Lines.Add('def getDataFromCounter(netAdr,serialPort,DEBUG):');
  MemoSave.Lines.Add('     serialPort.flushInput()');
  MemoSave.Lines.Add('     serialPort.flush()');
  MemoSave.Lines.Add('     data=''''   ');
  MemoSave.Lines.Add('     try:');
  MemoSave.Lines.Add('         getConn=getConnect(netAdr,serialPort)');
  MemoSave.Lines.Add('         if(getConn == 1):');
  MemoSave.Lines.Add('             time.sleep(0.2)');
  MemoSave.Lines.Add('             openChannel=sndOpCh(netAdr,serialPort)');
  MemoSave.Lines.Add('             if(openChannel == 1):');
  MemoSave.Lines.Add('                 time.sleep(0.2) ');
  MemoSave.Lines.Add('                 sn1 = getSN(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.2) ');
  MemoSave.Lines.Add('                 freq=getFreq(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1) ');
  MemoSave.Lines.Add('                 Aplus,Aminus,Rplus,Rminus = getEn0(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1) ');
  MemoSave.Lines.Add('                 Aplus1,Aminus1,Rplus1,Rminus1 = getEn1(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1) ');
  MemoSave.Lines.Add('                 Aplus2,Aminus2,Rplus2,Rminus2 = getEn2(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1) ');
  MemoSave.Lines.Add('                 Aplus3,Aminus3,Rplus3,Rminus3 = getEn3(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 Aplus4,Aminus4,Rplus4,Rminus4 = getEn4(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 U1,U2,U3 = getU(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 I1,I2,I3 = getI(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 P,P1,P2,P3 = getP(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 PS,PS1,PS2,PS3 = getPS(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 PQ,PQ1,PQ2,PQ3 = getPQ(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 cosF,cosF1,cosF2,cosF3 = getCosF(netAdr,serialPort)');
  MemoSave.Lines.Add('                 time.sleep(0.1)');
  MemoSave.Lines.Add('                 Angle1,Angle2,Angle3 = getAngle(netAdr,serialPort)');
  MemoSave.Lines.Add('                 data=sn1,freq,Aplus,Aminus,Rplus,Rminus,Aplus1,Aminus1,Rplus1,Rminus1,Aplus2,Aminus2,Rplus2,Rminus2,Aplus3,Aminus3,Rplus3,Rminus3,Aplus4,Aminus4,Rplus4,Rminus4,U1,U2,U3,I1,I2,I3,P,P1,P2,P3,PS,PS1,PS2,PS3,PQ,PQ1,PQ2,PQ3,cosF,cosF1,cosF2,cosF3,Angle1,Angle2,Angle3');
  MemoSave.Lines.Add('             else:');
  MemoSave.Lines.Add('                 data=''Error''');
  MemoSave.Lines.Add('         else:');
  MemoSave.Lines.Add('             data=''Error''');
  MemoSave.Lines.Add('     except Exception as e:');
  MemoSave.Lines.Add('         data=''Error''');
  MemoSave.Lines.Add('     return data');
  try
    MemoSave.Lines.SaveToFile(ProjectPath+'mercury.py');
  except
    ShowMessage('Error to save');
  end;

end;


procedure TMainFrame.DbArch();
var
  rowCount,j: integer;
  AllData:String;
begin
        AllData:='';
        rowCount:=MainTree.Items.Count;
        MemoSave.Clear;
        MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        MemoSave.Lines.Add('###########################################################################');
        MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        MemoSave.Lines.Add('## DB Postgresql arch by Jack Mas');
        MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        MemoSave.Lines.Add('##');
        MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        MemoSave.Lines.Add('########################################################################### ');
        MemoSave.Lines.Add('import postgresql');
        MemoSave.Lines.Add('import schedule');
        MemoSave.Lines.Add('import sys');
        MemoSave.Lines.Add('import time');
        MemoSave.Lines.Add('import gc');
        MemoSave.Lines.Add('import os');
        MemoSave.Lines.Add('import threading');
        MemoSave.Lines.Add('from datetime import datetime');
        MemoSave.Lines.Add('import socket');
        MemoSave.Lines.Add('import struct');
        MemoSave.Lines.Add('import json');

       MemoSave.Lines.Add('def createDB(login,password,host,dbname):');
       MemoSave.Lines.Add('     db=''''');
       MemoSave.Lines.Add('     try: ');
       MemoSave.Lines.Add('         db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"") ');
       MemoSave.Lines.Add('         print(''Connection OK'')');
       MemoSave.Lines.Add('     except Exception as e:');
       MemoSave.Lines.Add('         print(''Not exist'')');
       MemoSave.Lines.Add('         try:');
       MemoSave.Lines.Add('             db = postgresql.open("pq://"+login+":"+password+"@"+host) ');
       MemoSave.Lines.Add('             db.execute(''CREATE DATABASE ''+dbname)');
       MemoSave.Lines.Add('             print(''Create database OK'')');
       MemoSave.Lines.Add('             db = postgresql.open("pq://"+login+":"+password+"@"+host+"/"+dbname+"")');
       MemoSave.Lines.Add('             try:');
       MemoSave.Lines.Add('                 db.execute("CREATE TABLE  IF NOT EXISTS archiveData (varname varchar(80),date date,time time, varDataFI real, varDataStr varchar(200), varDataBool boolean)")');
       MemoSave.Lines.Add('                 print(''Create table OK'')');
       MemoSave.Lines.Add('             except Exception as e:');
       MemoSave.Lines.Add('                 print(e)');
       MemoSave.Lines.Add('         except Exception as e:');
       MemoSave.Lines.Add('             print(''Error to connect'',e)');
       MemoSave.Lines.Add('     return db');
       MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
       MemoSave.Lines.Add('     try:');
       MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
       MemoSave.Lines.Add('         if(x!=None and x[1]!=''Error''):');
       MemoSave.Lines.Add('             mVar=x ');
       MemoSave.Lines.Add('         else:');
       MemoSave.Lines.Add('             mVar=mVar');
       MemoSave.Lines.Add('     except Exception as e:');
       MemoSave.Lines.Add('         #');
       MemoSave.Lines.Add('         pass');
       MemoSave.Lines.Add('     return(mVar)');

        MemoSave.Lines.Add('def SelectData(getData):');
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[9, j])>0) then
                   MemoSave.Lines.Add('     global '+GVarTree.Cells[2, j]);
           end;
        MemoSave.Lines.Add('     global AllData');

        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0)  and (Length(GVarTree.Cells[9, j])>0) then
                begin
                   MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=setVariables('+GVarTree.Cells[2, j]+',getData,'''+GVarTree.Cells[1, j]+''','''+GVarTree.Cells[2, j]+''','''+GVarTree.Cells[3, j]+''','''+GVarTree.Cells[4, j]+''','''+GVarTree.Cells[5, j]+''','''+GVarTree.Cells[6, j]+''','''+GVarTree.Cells[7,j]+''')');
                AllData:=AllData+GVarTree.Cells[2, j]+','
                end;
          end;
        //MemoSave.Lines.Add('#-----------------------------------------------------------------------------------');

        MemoSave.Lines.Add('     AllData=['+AllData+']');
        MemoSave.Lines.Add('def startJob(t=1):');
        MemoSave.Lines.Add('     schedule.every(1).minutes.do(job1min)');
        MemoSave.Lines.Add('     schedule.every(5).minutes.do(job5min)');
        MemoSave.Lines.Add('     schedule.every(15).minutes.do(job15min)');
        MemoSave.Lines.Add('     schedule.every(30).minutes.do(job30min)');
        MemoSave.Lines.Add('     schedule.every().hour.do(jobH)');
        MemoSave.Lines.Add('     while 1: ');
        MemoSave.Lines.Add('         schedule.run_pending()');
        MemoSave.Lines.Add('         time.sleep(1)');
        MemoSave.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        MemoSave.Lines.Add('     varData=None');
        MemoSave.Lines.Add('     if(json.loads( getData.decode("utf-8") )[''name''] == source):');
        MemoSave.Lines.Add('         temp=json.loads( getData.decode("utf-8") )[''data'']');
        MemoSave.Lines.Add('         if(temp!=''Error''):');
        MemoSave.Lines.Add('             if(dataType==''float''):');
        MemoSave.Lines.Add('                 if(count==''2''): ');
        MemoSave.Lines.Add('                     if(sequence==''12''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('                     if(sequence==''21''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('             if(dataType==''integer''):');
        MemoSave.Lines.Add('                 if(count==''1''):');
        MemoSave.Lines.Add('                     temp2=int(temp[int(address)])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        MemoSave.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        MemoSave.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             if(dataType==''bool''):');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        MemoSave.Lines.Add('                         temp2=True');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        MemoSave.Lines.Add('                         temp2=False');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             if(dataType==''string''):');
        MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             try:');
        MemoSave.Lines.Add('                 mult=int(multiply)');
        MemoSave.Lines.Add('             except Exception as e:');
        MemoSave.Lines.Add('                 mult=float(multiply)');
        MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        MemoSave.Lines.Add('                 varData=varData*mult');
        MemoSave.Lines.Add('             returnData=[varName,varData,dataType]');
        MemoSave.Lines.Add('             return returnData');
        MemoSave.Lines.Add('         else:');
        MemoSave.Lines.Add('             varData=[varName,''ErrorVar'',dataType]');
        MemoSave.Lines.Add('             return varData');
        MemoSave.Lines.Add('     else:');
        MemoSave.Lines.Add('             return [varName,''Error'',dataType]');
        MemoSave.Lines.Add('def udpserv(i=1):');
        MemoSave.Lines.Add('     global udpdata ');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        MemoSave.Lines.Add('         server_address = (''localhost'', 64001)');
        MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        MemoSave.Lines.Add('         sock.bind(server_address)');
        MemoSave.Lines.Add('         while True:');
        MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        MemoSave.Lines.Add('             udpdata=data');
        MemoSave.Lines.Add('             SelectData(udpdata)');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('def insData(putData):');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         if(putData!=None and len(putData)>0):');
        MemoSave.Lines.Add('             varName,varValue,varDataType=putData');
        MemoSave.Lines.Add('             if(varValue!=''Error'' and varValue!=None  and varValue!=''ErrorVar''):');
        MemoSave.Lines.Add('                 if(varDataType == ''string''):');
        MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        MemoSave.Lines.Add('                 if(varDataType == ''integer'' or varDataType == ''float''):');
        MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataFI) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        MemoSave.Lines.Add('                 if(varDataType == ''bool''): ');
        MemoSave.Lines.Add('                     db.execute("INSERT INTO archiveData (date,time,varname,varDataBool) VALUES (now(),now(),''"+varName+"'',"+str(varValue)+")")');
        MemoSave.Lines.Add('             if(varValue==''Error''  or varValue==''ErrorVar''):');
        MemoSave.Lines.Add('                 db.execute("INSERT INTO archiveData (date,time,varname,varDataStr) VALUES (now(),now(),''"+varName+"'',''Error'')")');
        MemoSave.Lines.Add('     except Exception as e: ');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('         pass ');
        MemoSave.Lines.Add('def job1min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) then
                begin
                   if( GVarTree.Cells[9, j] = '1')  then
                         MemoSave.Lines.Add('     insData('+GVarTree.Cells[2, j]+')');
                end;
          end;
        MemoSave.Lines.Add('     pass');

        MemoSave.Lines.Add('def job5min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) then
                begin
                   if( GVarTree.Cells[9, j] = '5')  then
                         MemoSave.Lines.Add('     insData('+GVarTree.Cells[2, j]+')');
                end;
          end;
        MemoSave.Lines.Add('     pass');

        MemoSave.Lines.Add('def job15min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) then
                begin
                   if( GVarTree.Cells[9, j] = '15')  then
                         MemoSave.Lines.Add('     insData('+GVarTree.Cells[2, j]+')');
                end;
          end;
        MemoSave.Lines.Add('     pass');

        MemoSave.Lines.Add('def job30min():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) then
                begin
                   if( GVarTree.Cells[9, j] = '30')  then
                         MemoSave.Lines.Add('     insData('+GVarTree.Cells[2, j]+')');
                end;
          end;
        MemoSave.Lines.Add('     pass');

         MemoSave.Lines.Add('def jobH():');
        for j:=1 to rowCount-1 do
          begin
              if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) then
                begin
                   if( GVarTree.Cells[9, j] = '60')  then
                         MemoSave.Lines.Add('     insData('+GVarTree.Cells[2, j]+')');
                end;
          end;
        MemoSave.Lines.Add('     pass');
        MemoSave.Lines.Add('if __name__ == "__main__": ');
        MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0)  and (Length(GVarTree.Cells[9, j])>0) then
                   MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=['''+GVarTree.Cells[2, j]+''',''Error'',''string'']');
           end;
        MemoSave.Lines.Add('     AllData=''''');
        MemoSave.Lines.Add('     try: ');
        MemoSave.Lines.Add('         print( ''Starting DB Postgresql server...'')');
        MemoSave.Lines.Add('         db=createDB("'+EDBLogin.Text+'","'+EDBPassword.Text+'","'+EDBhost.Text+'","scadapy")');
        MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,))');
        MemoSave.Lines.Add('         modb.daemon = True');
        MemoSave.Lines.Add('         modb.start()');
        MemoSave.Lines.Add('         arch = threading.Thread(target=startJob,args=(1,))');
        MemoSave.Lines.Add('         arch.daemon = True');
        MemoSave.Lines.Add('         arch.start()');
        MemoSave.Lines.Add('         arch.join()');
        MemoSave.Lines.Add('         modb.join()');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
         try
            MemoSave.Lines.SaveToFile(ProjectPath+'dbserver.py');
          except
             ShowMessage('Error to save');
          end;


end;

procedure TMainFrame.SaveStartStop();
begin
         {$IFDEF Windows}
           //RunCmdCommand(PathToPythonWindows+' '+PathToProject+'udpmonitor.py"');
         {$ENDIF Windows}
         {$IFDEF Unix}
         MemoSave.Clear;
         MemoSave.Lines.Add('#!/bin/sh');
         MemoSave.Lines.Add('echo ''Start python scripts''');
         MemoSave.Lines.Add('nohup python3 '+ProjectPath+'modbus.py 1>/dev/null 2>/dev/null &');
         MemoSave.Lines.Add('echo $! > '+ProjectPath+'modbus.pid');
         MemoSave.Lines.Add('nohup python3 '+ProjectPath+'mclient.py 1>/dev/null 2>/dev/null &');
         MemoSave.Lines.Add('echo $! > '+ProjectPath+'mclient.pid');
         MemoSave.Lines.Add('nohup python3 '+ProjectPath+'jserver.py 1>/dev/null 2>/dev/null &');
         MemoSave.Lines.Add('echo $! > '+ProjectPath+'jserver.pid');
         MemoSave.Lines.Add('nohup python3 '+ProjectPath+'dbserver.py 1>/dev/null 2>/dev/null &');
         MemoSave.Lines.Add('echo $! > '+ProjectPath+'dbserver.pid');
         MemoSave.Lines.SaveToFile(ProjectPath+'start.sh' );
         MemoSave.Clear;
         MemoSave.Lines.Add('#!/bin/sh');
         MemoSave.Lines.Add('echo ''Stop python scripts''');
         MemoSave.Lines.Add('kill -9 `cat '+ProjectPath+'modbus.pid`');
         MemoSave.Lines.Add('kill -9 `cat '+ProjectPath+'mclient.pid`');
         MemoSave.Lines.Add('kill -9 `cat '+ProjectPath+'jserver.pid`');
         MemoSave.Lines.Add('kill -9 `cat '+ProjectPath+'dbserver.pid`');
         MemoSave.Lines.SaveToFile(ProjectPath+'stop.sh' );
         try
             RunCmdCommand('chmod 777 '+ProjectPath+'start.sh');
             RunCmdCommand('chmod 777 '+ProjectPath+'stop.sh');
         except
             ShowMessage('Scripts chmod error');
         end;
        {$ENDIF Unix}
end;


procedure TMainFrame.VkClient();
var
  rowCount,j,rowCount3,j3: integer;
  AllData,VarValue:String;
begin
        AllData:='';
        rowCount:=MainTree.Items.Count;
        MemoSave.Clear;
        MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
        MemoSave.Lines.Add('###########################################################################');
        MemoSave.Lines.Add('## Python code generated with '+Version+' '+ DateToStr(Date())+' ');
        MemoSave.Lines.Add('## vk client by Jack Mas');
        MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
        MemoSave.Lines.Add('##');
        MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
        MemoSave.Lines.Add('########################################################################### ');
       // MemoSave.Lines.Add('import postgresql');
        MemoSave.Lines.Add('import schedule');
        MemoSave.Lines.Add('import sys');
        MemoSave.Lines.Add('import time');
        MemoSave.Lines.Add('import gc');
        MemoSave.Lines.Add('import os');
        MemoSave.Lines.Add('import threading');
        MemoSave.Lines.Add('from datetime import datetime');
        MemoSave.Lines.Add('import socket');
        MemoSave.Lines.Add('import struct');
        MemoSave.Lines.Add('import json');
        MemoSave.Lines.Add('import vk_api');

       MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
       MemoSave.Lines.Add('     try:');
       MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
       MemoSave.Lines.Add('         if(x!=None and x[1]!=''Error''):');
       MemoSave.Lines.Add('             mVar=x ');
       MemoSave.Lines.Add('         else:');
       MemoSave.Lines.Add('             mVar=mVar');
       MemoSave.Lines.Add('     except Exception as e:');
       MemoSave.Lines.Add('         #');
       MemoSave.Lines.Add('         pass');
       MemoSave.Lines.Add('     return(mVar)');

        MemoSave.Lines.Add('def SelectData(getData):');
        try

        rowCount3:=GVKTree.RowCount;
        for j3:=1 to rowCount3-1 do
           begin
           VarValue:= GVKTree.Cells[1, j3];

           rowCount:=GVarTree.RowCount;

              for j:=1 to rowCount-1 do

                begin
                   if(Length(GVarTree.Cells[2, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                    begin
                       MemoSave.Lines.Add('     global '+GVarTree.Cells[2, j]);
                    end;
                end;

           end;
         MemoSave.Lines.Add('     global AllData');

        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                    if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0)  and (GVarTree.Cells[8, j]=VarValue) then
                     begin
                        MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=setVariables('+GVarTree.Cells[2, j]+',getData,'''+GVarTree.Cells[1, j]+''','''+GVarTree.Cells[2, j]+''','''+GVarTree.Cells[3, j]+''','''+GVarTree.Cells[4, j]+''','''+GVarTree.Cells[5, j]+''','''+GVarTree.Cells[6, j]+''','''+GVarTree.Cells[7,j]+''')');
                        AllData:=AllData+GVarTree.Cells[2, j]+','
                     end;
               end;
        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 1: ' + E.Message);

        end;

        MemoSave.Lines.Add('     AllData=['+AllData+']');
        MemoSave.Lines.Add('def startJob(t=1):');
        MemoSave.Lines.Add('     schedule.every(1).minutes.do(job1min)');
        MemoSave.Lines.Add('     schedule.every(5).minutes.do(job5min)');
        MemoSave.Lines.Add('     schedule.every(15).minutes.do(job15min)');
        MemoSave.Lines.Add('     schedule.every(30).minutes.do(job30min)');
        MemoSave.Lines.Add('     schedule.every().hour.do(jobH)');
        MemoSave.Lines.Add('     while 1: ');
        MemoSave.Lines.Add('         schedule.run_pending()');
        MemoSave.Lines.Add('         time.sleep(1)');
        MemoSave.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        MemoSave.Lines.Add('     varData=None');
        MemoSave.Lines.Add('     if(json.loads( getData.decode("utf-8") )[''name''] == source):');
        MemoSave.Lines.Add('         temp=json.loads( getData.decode("utf-8") )[''data'']');
        MemoSave.Lines.Add('         if(temp!=''Error''):');
        MemoSave.Lines.Add('             if(dataType==''float''):');
        MemoSave.Lines.Add('                 if(count==''2''): ');
        MemoSave.Lines.Add('                     if(sequence==''12''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('                     if(sequence==''21''):');
        MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        MemoSave.Lines.Add('                         varData=temp2[0]');
        MemoSave.Lines.Add('             if(dataType==''integer''):');
        MemoSave.Lines.Add('                 if(count==''1''):');
        MemoSave.Lines.Add('                     temp2=int(temp[int(address)])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        MemoSave.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        MemoSave.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             if(dataType==''bool''):');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        MemoSave.Lines.Add('                         temp2=True');
        MemoSave.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        MemoSave.Lines.Add('                         temp2=False');
        MemoSave.Lines.Add('                     varData=str(temp2)');
        MemoSave.Lines.Add('             if(dataType==''string''):');
        MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        MemoSave.Lines.Add('                     varData=temp2');
        MemoSave.Lines.Add('             try:');
        MemoSave.Lines.Add('                 mult=int(multiply)');
        MemoSave.Lines.Add('             except Exception as e:');
        MemoSave.Lines.Add('                 mult=float(multiply)');
        MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        MemoSave.Lines.Add('                 varData=str(varData*mult)');
        MemoSave.Lines.Add('             else:');
        MemoSave.Lines.Add('                 varData=str(varData)');

        MemoSave.Lines.Add('             returnData=[varName,varData,dataType]');
        MemoSave.Lines.Add('             return returnData');
        MemoSave.Lines.Add('         else:');
        MemoSave.Lines.Add('             varData=[varName,''ErrorVar'',dataType]');
        MemoSave.Lines.Add('             return varData');
        MemoSave.Lines.Add('     else:');
        MemoSave.Lines.Add('             return [varName,''Error'',dataType]');
        MemoSave.Lines.Add('def udpserv(i=1):');
        MemoSave.Lines.Add('     global udpdata ');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        MemoSave.Lines.Add('         server_address = (''localhost'', 64002)');
        MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        MemoSave.Lines.Add('         sock.bind(server_address)');
        MemoSave.Lines.Add('         while True:');
        MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        MemoSave.Lines.Add('             udpdata=data');
        MemoSave.Lines.Add('             SelectData(udpdata)');
        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('def sendMessage(user_id,putData,vklogin,vkpassword,message):');
        MemoSave.Lines.Add('     vk = vk_api.VkApi(login = vklogin, password = vkpassword) ');
        MemoSave.Lines.Add('     vk.auth() ');
        MemoSave.Lines.Add('     nowTime=datetime.strftime(datetime.now(), "%d.%m.%Y %H:%M:%S")');
        MemoSave.Lines.Add('     try:');
        MemoSave.Lines.Add('         if(putData!=None and len(putData)>0):');
        MemoSave.Lines.Add('             varName,varValue,varDataType=putData');
        MemoSave.Lines.Add('             vk.method(''messages.send'', {''user_id'':user_id,''message'':nowTime+''\n''+message+'':''+varValue }) ');
        MemoSave.Lines.Add('     except Exception as e: ');
        MemoSave.Lines.Add('         print(e)');
        MemoSave.Lines.Add('         pass ');
        MemoSave.Lines.Add('def job1min():');

        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
            //   try
               begin
                   if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( GVKTree.Cells[4, j3] = '1')  then
                         MemoSave.Lines.Add('     sendMessage('''+GVKTree.Cells[3, j3]+''','+GVarTree.Cells[2, j]+','''+VkLogin+''','''
                         +VkPassword+''','''+GVKTree.Cells[2, j3]+GVKTree.Cells[1, j3]+''')');
                   end;
              end;
        //     except
        //   on E: Exception do
        //   ShowMessage('222: ' + E.Message);
        //
        //end;


        end;

        MemoSave.Lines.Add('     pass');
        MemoSave.Lines.Add('def job5min():');
        try
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( GVKTree.Cells[4, j3] = '5')  then
                         MemoSave.Lines.Add('     sendMessage('''+GVKTree.Cells[3, j3]+''','+GVarTree.Cells[2, j]+','''+VkLogin+''','''
                         +VkPassword+''','''+GVKTree.Cells[2, j3]+GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 3: ' + E.Message);

        end;

        MemoSave.Lines.Add('     pass');
        MemoSave.Lines.Add('def job15min():');
        try
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( GVKTree.Cells[4, j3] = '15')  then
                         MemoSave.Lines.Add('     sendMessage('''+GVKTree.Cells[3, j3]+''','+GVarTree.Cells[2, j]+','''+VkLogin+''','''
                         +VkPassword+''','''+GVKTree.Cells[2, j3]+GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
         except
           on E: Exception do
           ShowMessage('An exception was raised 4: ' + E.Message);

        end;



         MemoSave.Lines.Add('     pass');

        MemoSave.Lines.Add('def job30min():');
         for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( GVKTree.Cells[4, j3] = '30')  then
                         MemoSave.Lines.Add('     sendMessage('''+GVKTree.Cells[3, j3]+''','+GVarTree.Cells[2, j]+','''+VkLogin+''','''
                         +VkPassword+''','''+GVKTree.Cells[2, j3]+GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        MemoSave.Lines.Add('     pass');

        MemoSave.Lines.Add('def jobH():');
        for j3:=1 to rowCount3-1 do
        begin
               VarValue:= GVKTree.Cells[1, j3];
               for j:=1 to rowCount-1 do
               begin
                   if(Length(GVarTree.Cells[2, j])>0) and (Length(GVarTree.Cells[1, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   begin
                       if( GVKTree.Cells[4, j3] = '60')  then
                         MemoSave.Lines.Add('     sendMessage('''+GVKTree.Cells[3, j3]+''','+GVarTree.Cells[2, j]+','''+VkLogin+''','''
                         +VkPassword+''','''+GVKTree.Cells[2, j3]+GVKTree.Cells[1, j3]+''')');
                   end;
                end;

        end;
        MemoSave.Lines.Add('     pass');
        MemoSave.Lines.Add('if __name__ == "__main__": ');
        MemoSave.Lines.Add('     pathFolder =os.path.abspath(sys.argv[0]).replace(os.path.basename(__file__),'''')');
        try
        for j3:=0 to rowCount3-1 do
        begin
        VarValue:= GVKTree.Cells[1, j3];
        rowCount:=GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(GVarTree.Cells[2, j])>0) and (GVarTree.Cells[8, j]=VarValue) then
                   MemoSave.Lines.Add('     '+GVarTree.Cells[2, j]+'=['''+GVarTree.Cells[2, j]+''',''Error'',''string'']');
           end;
        end;
        except
           on E: Exception do
           ShowMessage('An exception was raised 5: ' + E.Message);

        end;

        MemoSave.Lines.Add('     AllData=''''');
        MemoSave.Lines.Add('     try: ');
        MemoSave.Lines.Add('         print( ''Starting VK Client...'')');
        MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,))');
        MemoSave.Lines.Add('         modb.daemon = True');
        MemoSave.Lines.Add('         modb.start()');
        MemoSave.Lines.Add('         arch = threading.Thread(target=startJob,args=(1,))');
        MemoSave.Lines.Add('         arch.daemon = True');
        MemoSave.Lines.Add('         arch.start()');
        MemoSave.Lines.Add('         arch.join()');
        MemoSave.Lines.Add('         modb.join()');

        MemoSave.Lines.Add('     except Exception as e:');
        MemoSave.Lines.Add('         print(e)');
        try
            MemoSave.Lines.SaveToFile(ProjectPath+'vkclient.py');
          except
             ShowMessage('Error to save');
          end;


end;





end.


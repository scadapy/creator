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
    BGiec104serverPlus: TBitBtn;
    BGiec104serverMinus: TBitBtn;
    Biec104client: TBitBtn;
    Biec104server: TBitBtn;
    BTkInterRun: TBitBtn;
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
    CBoxGmainTree: TCheckBox;
    CBoxGVarTree: TCheckBox;
    CheckDebug: TCheckBox;
    CProtocol: TComboBox;
    CChanal: TComboBox;
    Eiec104serverPort: TEdit;
    Eiec104serverIP: TEdit;
    Eiec104serverDebug: TEdit;
    Eudpport: TEdit;
    Eudpip: TEdit;
    Eiec104port: TEdit;
    Eiec104ip: TEdit;
    Edebug: TEdit;
    EIPtty: TEdit;
    ELinuxPythonPath: TEdit;
    EDBhost: TEdit;
    EDBPort: TEdit;
    EDBLogin: TEdit;
    EDBPassword: TEdit;
    EVKLogin: TEdit;
    Eiec104serverUDPport: TEdit;
    EVKPassword: TEdit;
    EPortBoadRate: TEdit;
    EInfo: TEdit;
    EProjectName: TEdit;
    Eiec104serverUDPIP: TEdit;
    EWindowsPythonPath: TEdit;
    EProjectPath: TEdit;
    EWindowsBrowser: TEdit;
    ELinuxTerminal: TEdit;
    ELinuxBrowser: TEdit;
    Liec104serverIP: TLabel;
    Liec104serverDebug: TLabel;
    Lserveriec104port: TLabel;
    Ludpport: TLabel;
    Ludpip: TLabel;
    Liecport: TLabel;
    Liecip: TLabel;
    Ldebug: TLabel;
    LInfo: TLabel;
    LChanal: TLabel;
    LIPtty: TLabel;
    LTCPBaudRate: TLabel;
    LDBHost: TLabel;
    LDBPort: TLabel;
    LDBLogin: TLabel;
    LDBPassword: TLabel;
    LVKLogin: TLabel;
    LserverUDPport: TLabel;
    LVKPassword: TLabel;
    LProjectName: TLabel;
    Liec104serverUDPIP: TLabel;
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
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Piec: TPanel;
    RunItem: TMenuItem;
    ItemRunMonitor: TMenuItem;
    ItemRunModbus: TMenuItem;
    ItemRunMercury: TMenuItem;
    ItemModbus: TMenuItem;
    ItemMercury: TMenuItem;
    ItemJserver: TMenuItem;
    ItemRunWebClient: TMenuItem;
    ItemRunDBArch: TMenuItem;
    ItemDBArchSave: TMenuItem;
    ItemOpenProject: TMenuItem;
    ItemStartSH: TMenuItem;
    ItemStopSH: TMenuItem;
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
    Splitter1: TSplitter;
    Giec104server: TStringGrid;
    TabDevicePanelMiddle: TPanel;
    TabIec104: TTabSheet;
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
    TabVKPanelInfo1: TPanel;
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
    Iec104serverTree: TTreeView;



    procedure BGiec104serverMinusClick(Sender: TObject);
    procedure BGiec104serverPlusClick(Sender: TObject);
    procedure BGVKTreeAddStringClick(Sender: TObject);
    procedure BGVKTreeDelStringClick(Sender: TObject);
    procedure Biec104clientClick(Sender: TObject);
    procedure BTkInterRunClick(Sender: TObject);
    procedure Biec104serverClick(Sender: TObject);
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
    procedure Button1Click(Sender: TObject);
    procedure CBoxGmainTreeChange(Sender: TObject);
    procedure CBoxGVarTreeChange(Sender: TObject);
    procedure CProtocolSelect(Sender: TObject);
    procedure CChanalSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Giec104serverDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Giec104serverDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Giec104serverSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure Giec104serverSelectEditor(Sender: TObject; aCol, aRow: Integer;
      var TabEditor: TWinControl);
    procedure Iec104serverTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Iec104serverTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MainTreeClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure RunItemClick(Sender: TObject);
    procedure ItemRunMonitorClick(Sender: TObject);
    procedure ItemRunModbusClick(Sender: TObject);
    procedure ItemRunMercuryClick(Sender: TObject);
    procedure ItemModbusClick(Sender: TObject);
    procedure ItemMercuryClick(Sender: TObject);
    procedure ItemJserverClick(Sender: TObject);
    procedure ItemRunWebClientClick(Sender: TObject);
    procedure ItemRunDBArchClick(Sender: TObject);
    procedure ItemDBArchSaveClick(Sender: TObject);
    procedure ItemStartSHClick(Sender: TObject);
    procedure ItemStopSHClick(Sender: TObject);
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


    procedure GMainTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var TabEditor: TWinControl);

    procedure GVarTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GVarTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);

    procedure GVarTreeSelectCell(Sender: TObject; aCol, aRow: Integer;var CanSelect: Boolean);
    procedure GVarTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var TabEditor: TWinControl);

    procedure GVKTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GVKTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);


    procedure GVKTreeSelectCell(Sender: TObject;  aRow: Integer);
    procedure GVKTreeSelectEditor(Sender: TObject; aCol, aRow: Integer;var TabEditor: TWinControl);
    procedure TabIec104Show(Sender: TObject);
    procedure TabVariablesShow(Sender: TObject);
    procedure TabVKShow(Sender: TObject);
   // procedure VarTreeClick(Sender: TObject);

    procedure VarTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
    procedure VarTreeMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure VkTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
    procedure VkTreeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure LoadIec104ServerTree();


  private
   procedure OpenProject();
   procedure SaveAsProject();
   procedure CreateProject();
  // procedure RunCmdCommand(comEx: string);
   procedure OpenProjectXML(fileName: string);
   procedure LoadVarTree();
   procedure SaveTreeData();
  // procedure Monitor();
   //procedure SaveStartStop();
   procedure LoadVkTree();

    public
  end;
  type
    TModbusStructure = record
    ProtocolType: string;
    ChanalType: string;
    TCP_COM: string;
    PORT_SPEED: string;
    StringData: array of array of string;
    IecIp: string;
    IecPort: string;
    UdpIp: string;
    UdpPort: string;
    TimeSync: string;
    Debug: string;
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
  SelectionString: integer;
implementation
uses VkProcedure, MercProcedure,ModbusProcedure,DbProcedure,JsonProcedure,xmlprocedure,cmdprocedure,iec104,Editor,Tkinter ;
{$R *.lfm}

{ TMainFrame }

procedure TMainFrame.FormCreate(Sender: TObject);
begin
       Version:='ScadaPy Creator v.3.8.1 ';
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
       GMainTree.Cells[5,0] := 'REGs range ';
       GMainTree.Cells[6,0] := 'TimeOut';
       GMainTree.ColWidths[0]:=30;
       GMainTree.ColWidths[1]:=200;
       GMainTree.ColWidths[2]:=80;
       GMainTree.ColWidths[3]:=200;
       GMainTree.ColWidths[4]:=100;
       GMainTree.ColWidths[5]:=100;
       GMainTree.ColWidths[6]:=70;

//////////////////////////////////////////////////////
       GVarTree.Clear;
       GVarTree.ColCount:=10;
       GVarTree.RowCount:=2;
       GVarTree.Cells[0,0] := '№';
       GVarTree.Cells[1,0] := 'Source';
       GVarTree.Cells[2,0] := 'Var name';
       GVarTree.Cells[3,0] := 'Array address';
       GVarTree.Cells[4,0] := 'Range';
       GVarTree.Cells[5,0] := 'Sequence';
       GVarTree.Cells[6,0] := 'Data type';
       GVarTree.Cells[7,0] := 'Koef';
       GVarTree.Cells[8,0] := 'Alias';
       GVarTree.Cells[9,0] := 'DB interval';

       GVarTree.ColWidths[0]:=30;
       GVarTree.ColWidths[1]:=200;
       GVarTree.ColWidths[2]:=200;
       GVarTree.ColWidths[3]:=90;
       GVarTree.ColWidths[4]:=45;
       GVarTree.ColWidths[5]:=65;
       GVarTree.ColWidths[6]:=65;
       GVarTree.ColWidths[7]:=50;
       GVarTree.ColWidths[8]:=200;
       GVarTree.ColWidths[9]:=80;
//////////////////////////////////////////////////////
       GVKTree.Clear;
       GVKTree.ColCount:=5;
       GVKTree.RowCount:=2;
       GVKTree.Cells[0,0] := '№';
       GVKTree.Cells[1,0] := 'Var name';
       GVKTree.Cells[2,0] := 'Message';
       GVKTree.Cells[3,0] := 'vk id';
       GVKTree.Cells[4,0] := 'Send period';
       GVKTree.ColWidths[0]:=30;
       GVKTree.ColWidths[1]:=200;
       GVKTree.ColWidths[2]:=280;
       GVKTree.ColWidths[3]:=100;
       GVKTree.ColWidths[4]:=150;
///////////////////////////////////////////////////////////
       Giec104server.Clear;
       Giec104server.ColCount:=9;
       Giec104server.RowCount:=2;
       Giec104server.Cells[0,0] := '№';
       Giec104server.Cells[1,0] := 'Source';
       Giec104server.Cells[2,0] := 'Var name';
       Giec104server.Cells[3,0] := 'Address iec 104';
       Giec104server.Cells[4,0] := 'Range';
       Giec104server.Cells[5,0] := 'Sequence';
       Giec104server.Cells[6,0] := 'Data type';
       Giec104server.Cells[7,0] := 'Array address';
       Giec104server.Cells[8,0] := 'Koef';

       Giec104server.ColWidths[0]:=30;
       Giec104server.ColWidths[1]:=200;
       Giec104server.ColWidths[2]:=200;
       Giec104server.ColWidths[3]:=100;
       Giec104server.ColWidths[4]:=45;
       Giec104server.ColWidths[5]:=65;
       Giec104server.ColWidths[6]:=65;
       Giec104server.ColWidths[7]:=90;
       Giec104server.ColWidths[8]:=50;

end;

procedure TMainFrame.Giec104serverDragDrop(Sender, Source: TObject; X,  Y: Integer);
var
  DestCol, DestRow: Integer;
begin
   DestCol:=0;
   DestRow:=0;
   if Source is TTreeView then
     begin

          Giec104server.RowCount:=Giec104server.RowCount+1;
          Giec104server.MouseToCell(X, Y, DestCol, DestRow);
          Giec104server.Cells[DestCol,DestRow]:=Iec104ServerTree.Selected.Text;
          Giec104server.Cells[4,DestRow]:='1';
          Giec104server.Cells[5,DestRow]:='1';
          Giec104server.Cells[7,DestRow]:='0';

     end;
end;

procedure TMainFrame.Giec104serverDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := true;
end;

procedure TMainFrame.Giec104serverSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
      ArRow:=ARow;
end;

procedure TMainFrame.Giec104serverSelectEditor(Sender: TObject; aCol,
  aRow: Integer; var TabEditor: TWinControl);
begin
        if aCol=6 then
       begin
        TabEditor := Giec104server.EditorByStyle(cbsPickList);
        TCustomComboBox(TabEditor).Items.CommaText := 'bool,int,int32,float';
       end;
end;

procedure TMainFrame.Iec104serverTreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.Iec104serverTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   try
     begin
      if Button = mbLeft then
        Iec104serverTree.BeginDrag(true);
     end;
    except
         ShowMessage('Error drag drop');
    end;
end;

procedure TMainFrame.BStartMonitorClick(Sender: TObject);
begin
    cmdprocedure.StartMonitor();
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
      xmlprocedure.SaveXMLConfig();
      try
        begin
         ModbusProcedure.ModbusPySave();
         JsonProcedure.JserverPySave();
         JsonProcedure.FileHtmlSave();
         JsonProcedure.JserverPySave();
         JsonProcedure.FileHtmlSave();
         MercProcedure.MercuryLibSave();
         MercProcedure.MercuryClientSave();
         DbProcedure.DbArchSave();
         VkProcedure.VkClientSave();
         iec104.clientSave();
       end;
      except
          ShowMessage('Error while saving project.');
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
 ModbusProcedure.ModbusPySave();
 JsonProcedure.JserverPySave();
 JsonProcedure.FileHtmlSave();
 MercProcedure.MercuryLibSave();
 MercProcedure.MercuryClientSave();
 DbProcedure.DbArchSave();
 VkProcedure.VkClientSave();
 SaveStartStopSh();
 iec104.clientSave();
 iec104.serverSave();
end;

procedure TMainFrame.BStartModbusClientClick(Sender: TObject);
begin
      cmdprocedure.StartCommand('modbus.py');
end;

procedure TMainFrame.BGVarTreeAddStringClick(Sender: TObject);
begin

      GVarTree.RowCount:=GVarTree.RowCount + 1 ;
end;

procedure TMainFrame.BGVarTreeDelStringClick(Sender: TObject);
begin
      GVarTree.DeleteRow(ArRow);
end;

procedure TMainFrame.Button1Click(Sender: TObject);
begin

end;

procedure TMainFrame.CBoxGmainTreeChange(Sender: TObject);
begin
  if(CBoxGmainTree.Checked=True) then
        GMainTree.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,
                            goDrawFocusSelected,goRowSizing,goColSizing,goRowMoving,goColMoving,
                            goEditing,goAutoAddRows,goTabs,goAlwaysShowEditor,goColSpanning,goRelaxedRowSelect,
                            goSmoothScroll,goFixedRowNumbering,goScrollKeepVisible,goHeaderHotTracking,
                            goHeaderPushedLook,goSelectionActive,goFixedColSizing,goDontScrollPartCell,
                            goCellHints,goTruncCellHints,goCellEllipsis,goAutoAddRowsSkipContentCheck,goRowHighlight];

  if(CBoxGmainTree.Checked=False) then
        GMainTree.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,
                            goDrawFocusSelected,goRowSizing,goColSizing,goRowMoving,goColMoving,
                            goEditing,goAutoAddRows,goTabs,goColSpanning,goRelaxedRowSelect,
                            goSmoothScroll,goFixedRowNumbering,goScrollKeepVisible,goHeaderHotTracking,
                            goHeaderPushedLook,goSelectionActive,goFixedColSizing,goDontScrollPartCell,
                            goCellHints,goTruncCellHints,goCellEllipsis,goAutoAddRowsSkipContentCheck,goRowHighlight,goRowSelect];



end;

procedure TMainFrame.CBoxGVarTreeChange(Sender: TObject);
begin
  if(CBoxGVarTree.Checked=True) then
        GVarTree.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,
                            goDrawFocusSelected,goRowSizing,goColSizing,goRowMoving,goColMoving,
                            goEditing,goAutoAddRows,goTabs,goAlwaysShowEditor,goColSpanning,goRelaxedRowSelect,
                            goSmoothScroll,goFixedRowNumbering,goScrollKeepVisible,goHeaderHotTracking,
                            goHeaderPushedLook,goSelectionActive,goFixedColSizing,goDontScrollPartCell,
                            goCellHints,goTruncCellHints,goCellEllipsis,goAutoAddRowsSkipContentCheck,goRowHighlight];

  if(CBoxGVarTree.Checked=False) then
        GVarTree.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,
                            goDrawFocusSelected,goRowSizing,goColSizing,goRowMoving,goColMoving,
                            goEditing,goAutoAddRows,goTabs,goColSpanning,goRelaxedRowSelect,
                            goSmoothScroll,goFixedRowNumbering,goScrollKeepVisible,goHeaderHotTracking,
                            goHeaderPushedLook,goSelectionActive,goFixedColSizing,goDontScrollPartCell,
                            goCellHints,goTruncCellHints,goCellEllipsis,goAutoAddRowsSkipContentCheck,goRowHighlight,goRowSelect];
end;

procedure TMainFrame.BOpenProjectClick(Sender: TObject);
begin
    OpenProject();
    LoadVarTree();
    LoadVkTree();
    LoadIec104ServerTree();
end;

procedure TMainFrame.BStartJsonServerClick(Sender: TObject);
begin
    cmdprocedure.StartCommand('jserver.py');
end;

procedure TMainFrame.Biec104clientClick(Sender: TObject);
begin
    cmdprocedure.Start104Client();
end;

procedure TMainFrame.BTkInterRunClick(Sender: TObject);
begin
      Tkinter.createTkinterPython();
end;

procedure TMainFrame.Biec104serverClick(Sender: TObject);
begin
      cmdprocedure.Start104server();
end;

procedure TMainFrame.BGiec104serverPlusClick(Sender: TObject);
begin
       Giec104server.RowCount:=Giec104server.RowCount + 1 ;  //Giec104server
end;

procedure TMainFrame.BGVKTreeAddStringClick(Sender: TObject);
begin
   GVKTree.RowCount:=GVKTree.RowCount + 1 ;
end;

procedure TMainFrame.BGVKTreeDelStringClick(Sender: TObject);
begin
   GVKTree.DeleteRow(ArRow);
end;

procedure TMainFrame.BGiec104serverMinusClick(Sender: TObject);
begin
        Giec104server.DeleteRow(ArRow);                //Giec104server
end;

procedure TMainFrame.BStartHtmlClientClick(Sender: TObject);
begin
   cmdprocedure.StartHtmlClient();
end;

procedure TMainFrame.BStartMercuryClientClick(Sender: TObject);
begin
    cmdprocedure.StartCommand('mclient.py');
end;

procedure TMainFrame.BStartDBArchClick(Sender: TObject);
begin
  cmdprocedure.StartCommand('dbserver.py');
end;

procedure TMainFrame.BStartVKClientClick(Sender: TObject);
begin
  cmdprocedure.StartCommand('vkclient.py');
end;

procedure TMainFrame.CProtocolSelect(Sender: TObject);
begin

end;

procedure TMainFrame.CChanalSelect(Sender: TObject);
begin

end;

procedure TMainFrame.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  selEvent:Integer;
begin


  selEvent := MessageDlg('Save project before closing ?',mtCustom,mbOKCancel, 0);


  if selEvent = mrOK     then
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
      xmlprocedure.SaveXMLConfig();
      try
        begin
         ModbusProcedure.ModbusPySave();
         JsonProcedure.JserverPySave();
         JsonProcedure.FileHtmlSave();
         JsonProcedure.JserverPySave();
         JsonProcedure.FileHtmlSave();
         MercProcedure.MercuryLibSave();
         MercProcedure.MercuryClientSave();
         DbProcedure.DbArchSave();
         VkProcedure.VkClientSave();
         iec104.clientSave();
       end;
      except
          ShowMessage('Error while saving project.');
      end;


  end;


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

/// modbus
     if(MainTree.Selected.Level=2) and (parId=0)   then
          begin
              SelectionString:=1;
              GMainTree.Clear;
              GMainTree.ColCount:=7;
              GMainTree.RowCount:=2;
              GMainTree.ColWidths[0]:=30;
              GMainTree.ColWidths[1]:=200;
              GMainTree.ColWidths[2]:=80;
              GMainTree.ColWidths[3]:=200;
              GMainTree.ColWidths[4]:=100;
              GMainTree.ColWidths[5]:=100;
              GMainTree.ColWidths[6]:=70;
              GMainTree.Cells[0,0] := '№';
              GMainTree.Cells[1,0] := 'Name';
              GMainTree.Cells[2,0] := 'RTU address';
              GMainTree.Cells[3,0] := 'REG name';
              GMainTree.Cells[4,0] := 'REG address';
              GMainTree.Cells[5,0] := 'REGs range';
              GMainTree.Cells[6,0] := 'TimeOut';
              Piec.Visible:=False;
                if (MStructure(MainTree.Selected.Data)<>nil) then
                begin
                   Piec.Visible:=False;
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

/////////////////   merc
      if   (MainTree.Selected.Level=2) and (parId=1)  then
      begin
           SelectionString:=2;
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
           Piec.Visible:=False;
             if (MStructure(MainTree.Selected.Data)<>nil) then
             Piec.Visible:=False;
             begin
                try
                   if(MStructure(MainTree.Selected.Data) <> nil) then
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
                except
                end;
           end;
       end;
////////////////// iec
            if   (MainTree.Selected.Level=2) and (parId=2)  then
            begin
                         SelectionString:=3;
                         GMainTree.Clear;
                         GMainTree.RowCount:=2;
                         GMainTree.ColWidths[0]:=30;
                         GMainTree.ColWidths[1]:=200;
                         GMainTree.ColWidths[2]:=120;
                         GMainTree.ColWidths[5]:=200;
                         GMainTree.ColWidths[6]:=100;
                         GMainTree.Cells[0,0] := '№';
                         GMainTree.Cells[1,0] := 'VarName';
                         GMainTree.Cells[2,0] := 'Address';
                         GMainTree.Cells[3,0] := 'Empty';
                         GMainTree.Cells[4,0] := 'Empty';
                         GMainTree.Cells[5,0] := 'Alias';
                         GMainTree.Cells[6,0] := 'Type';
                         Piec.Visible:=True;
                   if (MStructure(MainTree.Selected.Data)<>nil) then
                   begin
                     i:=Length(MStructure(MainTree.Selected.Data)^.StringData);
                     GMainTree.RowCount:=i+1;
                     for j:=1 to i-1 do
                     begin
                         GMainTree.Cells[0, j]:=j.ToString ;
                         GMainTree.Cells[1, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][1]  ;
                         GMainTree.Cells[2, j]:=MStructure(MainTree.Selected.Data)^.StringData[j][2]  ;
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

procedure TMainFrame.MenuItem1Click(Sender: TObject);
begin
  cmdprocedure.Start104Client();
end;

procedure TMainFrame.MenuItem2Click(Sender: TObject);
begin
   iec104.clientSave();
end;

procedure TMainFrame.MenuItem3Click(Sender: TObject);
begin
        cmdprocedure.Start104server();
end;

procedure TMainFrame.MenuItem4Click(Sender: TObject);
begin
  iec104.serverSave();
end;

procedure TMainFrame.MenuItem5Click(Sender: TObject);
begin
   Editor.EditorForm.Show();
end;

procedure TMainFrame.RunItemClick(Sender: TObject);
begin


end;

procedure TMainFrame.ItemRunMonitorClick(Sender: TObject);
begin
  cmdprocedure.StartMonitor();
end;

procedure TMainFrame.ItemRunModbusClick(Sender: TObject);
begin
    cmdprocedure.StartCommand('modbus.py');
end;

procedure TMainFrame.ItemRunMercuryClick(Sender: TObject);
begin
  cmdprocedure.StartCommand('mclient.py');
end;

procedure TMainFrame.ItemModbusClick(Sender: TObject);
begin
   ModbusProcedure.ModbusPySave();
end;

procedure TMainFrame.ItemMercuryClick(Sender: TObject);
begin
   MercProcedure.MercuryLibSave();
   MercProcedure.MercuryClientSave();
end;

procedure TMainFrame.ItemJserverClick(Sender: TObject);
begin
  JsonProcedure.JserverPySave();
  JsonProcedure.FileHtmlSave();
end;

procedure TMainFrame.ItemRunWebClientClick(Sender: TObject);

begin
       cmdprocedure.StartHtmlClient();
end;

procedure TMainFrame.ItemRunDBArchClick(Sender: TObject);
begin
      cmdprocedure.StartCommand('dbserver.py');
end;

procedure TMainFrame.ItemDBArchSaveClick(Sender: TObject);
begin
   DbProcedure.DbArchSave();
end;

procedure TMainFrame.ItemStartSHClick(Sender: TObject);
begin
      cmdprocedure.StartSh();
end;

procedure TMainFrame.ItemStopSHClick(Sender: TObject);
begin
 cmdprocedure.StopSh();
end;

procedure TMainFrame.ItemVKClientClick(Sender: TObject);
begin
 VkProcedure.VkClientSave();
end;

procedure TMainFrame.ItemRunVKClientClick(Sender: TObject);
begin
       cmdprocedure.StartCommand('vkclient.py');
end;

procedure TMainFrame.ItemOpenProjectClick(Sender: TObject);
begin
   OpenProject();
   LoadVarTree();
   LoadVkTree();
   LoadIec104ServerTree();
end;


procedure TMainFrame.ItemSaveAsProjectClick(Sender: TObject);
begin
 SaveAsProject();
 xmlprocedure.SaveXMLConfig();
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
      xmlprocedure.SaveXMLConfig();
      //LoadVarTree();
end;

procedure TMainFrame.ItemCreateProjectClick(Sender: TObject);
begin
     CreateProject();
     xmlprocedure.SaveXMLConfig();
end;

procedure TMainFrame.ItemRunJsonServerClick(Sender: TObject);
begin
     cmdprocedure.StartCommand('jserver.py');
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
              MainTree.items.AddChild(MainTree.Selected,'Unit modbus');
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
               MainTree.items.AddChild(MainTree.Selected,'Unit Меркурий-230');
            end;
       if( (StrToInt(MainTree.Selected.Index.ToString())=2 )         and
           (StrToInt(MainTree.Selected.Parent.Index.ToString())=1) ) and
           (MainTree.Selected.HasChildren = False )  then
            begin
               MainTree.items.AddChild(MainTree.Selected,'Unit IEC60870-5-104');
            end;



      New(DataRec);
      DataRec^.TCP_COM := '';
      DataRec^.PORT_SPEED := '';
      DataRec^.ChanalType := '';
      DataRec^.ProtocolType := '';
   //   DataRec^. := '';

      MainTree.Selected.Data := DataRec;
end;

procedure TMainFrame.ItemMainTreeDelClick(Sender: TObject);
begin
  if(MainTree.Selected.Level=2) then
      MainTree.Selected.Delete;
end;

procedure TMainFrame.CreateItemClick(Sender: TObject);
begin
      ModbusProcedure.ModbusPySave();
end;

procedure TMainFrame.BGMainGridSaveClick(Sender: TObject);
begin
    SaveTreeData();
end;

procedure TMainFrame.GMainTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var TabEditor: TWinControl);

begin
   if(SelectionString=1) then
   begin
      if aCol=3 then
       begin
        TabEditor := GMainTree.EditorByStyle(cbsPickList);
        TCustomComboBox(TabEditor).Items.CommaText := 'READ_INPUT_REGISTERS,READ_DISCRETE_INPUTS,READ_COILS,READ_HOLDING_REGISTERS';
       end;
   end;

   if(SelectionString=3) then
   begin
      if aCol=6 then
       begin
        TabEditor := GMainTree.EditorByStyle(cbsPickList);
        TCustomComboBox(TabEditor).Items.CommaText := 'bool,int,int32,float';
       end;
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

procedure TMainFrame.GVarTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);

begin
 Accept := true;
end;

procedure TMainFrame.GVarTreeSelectCell(Sender: TObject; aCol, aRow: Integer;var CanSelect: Boolean);
begin
    ArRow:=ARow;
end;

procedure TMainFrame.GVarTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var TabEditor: TWinControl);
begin
   if aCol=5 then
   begin
        TabEditor := GVarTree.EditorByStyle(cbsPickList);
        TCustomComboBox(TabEditor).Items.CommaText := '1,12,21';
   end;
   if aCol=6 then
      begin
           TabEditor := GVarTree.EditorByStyle(cbsPickList);
           TCustomComboBox(TabEditor).Items.CommaText := 'integer,intSigned,float,string,bool';
      end;
   if aCol=9 then
      begin
           TabEditor := GVarTree.EditorByStyle(cbsPickList);
           TCustomComboBox(TabEditor).Items.CommaText := '0,1,5,15,30,60';
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

procedure TMainFrame.GVKTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);

begin
  Accept := true;
end;

procedure TMainFrame.GVKTreeSelectCell(Sender: TObject; aRow: Integer);
begin
      ArRow:=ARow;
end;

procedure TMainFrame.GVKTreeSelectEditor(Sender: TObject; aCol, aRow: Integer; var TabEditor: TWinControl);
begin
   if aCol=4 then
      begin
           TabEditor := GVKTree.EditorByStyle(cbsPickList);
           TCustomComboBox(TabEditor).Items.CommaText := '0,1,5,15,30,60';
      end;
end;

procedure TMainFrame.TabIec104Show(Sender: TObject);
begin
  LoadIec104ServerTree();
end;

procedure TMainFrame.TabVariablesShow(Sender: TObject);
begin
  LoadVarTree();
end;

procedure TMainFrame.TabVKShow(Sender: TObject);
begin
      LoadVkTree();
end;


procedure TMainFrame.VarTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);

begin
  Accept := true;
end;


procedure TMainFrame.VarTreeMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
    try
     begin
      if Button = mbLeft then
        VarTree.BeginDrag(true);
     end;
    except
         ShowMessage('Error drag drop');
    end;


end;

procedure TMainFrame.VkTreeDragOver(Sender, Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TMainFrame.VkTreeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    try
     begin
      if Button = mbLeft then
        VkTree.BeginDrag(true);
     end;
    except
         ShowMessage('Error drag drop');
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
       MainTree.Items.AddFirst(nil,'Project configuration');
       MainTree.Items.Add(nil,'Protocols');
       OpenProjectXML(filename);

       xmlprocedure.OpenDBXMLfile(fileName);
       xmlprocedure.OpenVkXMLfile(fileName);
       xmlprocedure.LoadFromXMLfile(filename);
       xmlprocedure.LoadFromXMLVK(filename);

       MainFrame.Caption:=Version + ProjectName +' file '+  ProjectFile;
     end;
    except on E: Exception do
      ShowMessage('Error while opening project: ' + E.Message);


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
          xmlprocedure.SaveXMLConfig();
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
           MainTree.Items.AddFirst(nil,'Project configuration');
           Node:=MainTree.Items.Add(nil,'Protocols');
           MainTree.Items.AddChild(Node,'Client Modbus');
           MainTree.Items.AddChild(Node,'Client Меркурий-230');
           MainTree.Items.AddChild(Node,'Client IEC60870-5-104');

           xmlprocedure.SaveXMLConfig();
      end;
   except
       ShowMessage('Project not created');
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


procedure TMainFrame.LoadVkTree();
var
  Node,ParentNode: TTreeNode;
  i,rowCount: integer;
begin
       VkTree.Items.Clear;
       ParentNode:=VkTree.items.add(nil,'Variables list');
       Node:=VkTree.items.add(ParentNode, 'Variables');
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
       ParentNode:=VarTree.items.add(nil,'Variables list');
       ///////////////////
       Node:=VarTree.items.add(ParentNode, 'Client Modbus');
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
       /////////////////////
       Node:=VarTree.items.add(ParentNode, 'Client Mercury-230');
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
       /////////////////////
       Node:=VarTree.items.add(ParentNode, 'Client 60870-5-104');
       for i:=1 to RowCount do
       begin
                if (MainTree.Items.Item[i-1].Parent.Index = 2) and (MainTree.Items.Item[i-1].Level=2) then
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





procedure TMainFrame.LoadIec104ServerTree();
var
  Node,ParentNode: TTreeNode;
  i,j,z,rowCount: integer;
begin
       Iec104serverTree.Items.Clear;
       ParentNode:=Iec104serverTree.items.add(nil,'Variables list');
       ///////////////////
       Node:=Iec104serverTree.items.add(ParentNode, 'Client Modbus');
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
                                              Iec104serverTree.items.AddChild(Node,MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]);
                                             end;
                                        end;
            end;
       end;
       /////////////////////
       Node:=Iec104serverTree.items.add(ParentNode, 'Client Mercury-230');
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
                                                    Iec104serverTree.items.AddChild(Node,MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]);
                                                   end;
                                              end;
                   end;
       end;
       /////////////////////
       Node:=Iec104serverTree.items.add(ParentNode, 'Client 60870-5-104');
       for i:=1 to RowCount do
       begin
                if (MainTree.Items.Item[i-1].Parent.Index = 2) and (MainTree.Items.Item[i-1].Level=2) then
                  begin
                       z:=0;
                       for j:=1 to Length(  MStructure(MainTree.Items.Item[i-1].Data)^.StringData  )-1 do
                                              begin
                                                 if( Length( MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]) > 0    ) then
                                                   begin
                                                    z:=z+1;
                                                    Iec104serverTree.items.AddChild(Node,MStructure(MainTree.Items.Item[i-1].Data)^.StringData[j][1]);
                                                   end;
                                              end;
                   end;
       end;

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



end.


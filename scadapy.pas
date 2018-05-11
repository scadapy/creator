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
    Button1: TButton;
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
    procedure Button1Click(Sender: TObject);
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
uses VkProcedure, MercProcedure,ModbusProcedure,DbProcedure,JsonProcedure,xmlprocedure,cmdprocedure ;
{$R *.lfm}

{ TMainFrame }

procedure TMainFrame.FormCreate(Sender: TObject);
begin
       Version:='ScadaPy Creator v.3.4.2 ';
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
      //try
     //   SaveTreeData();
   //   except

     // end;
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
 ModbusProcedure.ModbusPySave();
 JsonProcedure.JserverPySave();
 JsonProcedure.FileHtmlSave();
 MercProcedure.MercuryLibSave();
 MercProcedure.MercuryClientSave();
 DbProcedure.DbArchSave();
 VkProcedure.VkClientSave();
 SaveStartStopSh();

end;

procedure TMainFrame.BStartModbusClientClick(Sender: TObject);
begin
      cmdprocedure.StartCommand('modbus.py');
end;

procedure TMainFrame.BGVarTreeAddStringClick(Sender: TObject);
begin
      GVKTree.RowCount:=GVKTree.RowCount + 1 ;
end;

procedure TMainFrame.BGVarTreeDelStringClick(Sender: TObject);
begin
      GVKTree.DeleteRow(ArRow);
end;

procedure TMainFrame.Button1Click(Sender: TObject);
begin
   VkProcedure.VkClientSave();
end;

procedure TMainFrame.BOpenProjectClick(Sender: TObject);
begin
    OpenProject();
    LoadVarTree();
    LoadVkTree();
end;

procedure TMainFrame.BStartJsonServerClick(Sender: TObject);
begin
    cmdprocedure.StartCommand('jserver.py');
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
      ModbusProcedure.ModbusPySave();
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
       xmlprocedure.OpenDBXMLfile(fileName);
       xmlprocedure.OpenVkXMLfile(fileName);

       xmlprocedure.LoadFromXMLfile(filename);
       xmlprocedure.LoadFromXMLVK(filename);
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
           MainTree.Items.AddFirst(nil,'Конфигурация проекта');
           Node:=MainTree.Items.Add(nil,'Протоколы');
           MainTree.Items.AddChild(Node,'Modbus');
           MainTree.Items.AddChild(Node,'Меркурий-230');
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


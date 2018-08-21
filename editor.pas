unit Editor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RTTIGrids, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, EditBtn, ValEdit, LCLType, ExtDlgs, Menus,
  ComCtrls;

type

  { TEditorForm }

  TEditorForm = class(TForm)
    BTDiscret: TSpeedButton;
    BTLabel: TSpeedButton;
    BTFree: TSpeedButton;
    BTStaticText: TSpeedButton;
    BTPBar: TSpeedButton;
    Button1: TButton;
    ColorDialog: TColorDialog;
    EX: TEdit;
    BTEdit: TSpeedButton;
    UDPPORT: TEdit;
    EY: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoSave: TMemo;
    CopyObject: TMenuItem;
    MenuItem1: TMenuItem;
    ObjectEdit: TMenuItem;
    ObjectMove: TMenuItem;
    DeleteObject: TMenuItem;
    ObjectValue: TEdit;
    LObject: TLabel;
    MainCanvas: TImage;
    UDPIP: TEdit;
    OpenDialog1: TOpenDialog;
    ObjectMenu: TPopupMenu;
    TopPanel: TPanel;
    Bpicture: TSpeedButton;
    Bcolor: TSpeedButton;
    BdelImage: TSpeedButton;
    procedure BTDiscretClick(Sender: TObject);
    procedure BTFreeClick(Sender: TObject);
    procedure BTLabelClick(Sender: TObject);
    procedure BTPBarClick(Sender: TObject);
    procedure BTStaticTextClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  //  procedure Button2Click(Sender: TObject);
  //  procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure MainCanvasClick(Sender: TObject);
    procedure MainCanvasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MainCanvasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CopyObjectClick(Sender: TObject);
    procedure DeleteObjectClick(Sender: TObject);
    procedure MainCanvasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  //  procedure MainCanvasPaint(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ObjectMenuClose(Sender: TObject);
    procedure ObjectMoveClick(Sender: TObject);
    procedure ObjectEditClick(Sender: TObject);
    procedure ObjectTLabelClicked(Sender:Tobject);
    procedure ObjectTEditClicked(Sender:Tobject);
    procedure ObjectTStaticTextClicked(Sender:TObject);
    procedure ObjectTDiscretClicked(Sender:TObject);
    procedure ObjectTPBarClicked(Sender:TObject);
    procedure BpictureClick(Sender: TObject);
    procedure BcolorClick(Sender: TObject);
    procedure BdelImageClick(Sender: TObject);
    procedure BTEditClick(Sender: TObject);
    procedure copyObjects();
    procedure editObjects();
    procedure delObjects();
    procedure linkObjects();
    procedure unselObjects();
    procedure selObjects(X,Y:integer);
    function findColor(fillString: TColor): string;

   private
    MoveAllow:Integer;
    MoveAllowKey:Integer;

 public
    EditBoxAllow:Integer;
    EditObject:array[0..1000] of TEdit;
    EditArray:Integer;


    LabelAllow:Integer;
    LabelObject:array[0..1000] of TLabel;
    LabelArray:Integer;
    LabelMove:TLabel;


    StaticTextAllow:Integer;
    StaticTextObject:array[0..1000] of TStaticText;
    StaticTextArray:Integer;
    StaticTextMove:TStaticText;


  
    DiscretAllow:Integer;
    DiscretObject:array[0..1000] of TFlowPanel;
    DiscretArray:Integer;

    PBarAllow:Integer;
    PBarObject:array[0..1000] of TProgressBar;
    PBarArray:Integer;



    EditMove:TEdit;
    DiscretMove:TFlowPanel;
    PBarMove:TProgressBar;
    ImageName:String;
    CanvasColor:String;
    MouseButtonDown: Boolean;

  end;

var
  EditorForm: TEditorForm;
  difX,difY,oldX,oldY,scrWidth,scrHeight:integer;
  x0,y0,x1,y1,xd,yd:integer;

implementation
uses PropertyForm,scadapy,linkForm,cmdprocedure,Tkinter;
{$R *.lfm}

{ TEditorForm }



procedure TEditorForm.BTDiscretClick(Sender: TObject);
begin
      LabelAllow:=0;
      EditBoxAllow:=0;
      StaticTextAllow:=0;
      DiscretAllow:=1;
      PBarAllow:=0;
      MainCanvas.Cursor:=crCross;
end;

procedure TEditorForm.BTFreeClick(Sender: TObject);
begin
  
    EditBoxAllow:=0;
    LabelAllow:=0;
    StaticTextAllow:=0;
    DiscretAllow:=0;
    PBarAllow:=0;
    MainCanvas.Cursor:=crDefault;
end;

procedure TEditorForm.BTLabelClick(Sender: TObject);
begin
  
      LabelAllow:=1;
      EditBoxAllow:=0;
      StaticTextAllow:=0;
      DiscretAllow:=0;
      PBarAllow:=0;

      MainCanvas.Cursor:=crCross;
end;

procedure TEditorForm.BTPBarClick(Sender: TObject);
begin
      EditBoxAllow:=0;
      LabelAllow:=0;
      StaticTextAllow:=0;
      DiscretAllow:=0;
      PBarAllow:=1;

      MainCanvas.Cursor:=crCross;

end;

procedure TEditorForm.BTStaticTextClick(Sender: TObject);
begin
  
      EditBoxAllow:=0;
      LabelAllow:=0;
      StaticTextAllow:=1;
      DiscretAllow:=0;
      PBarAllow:=0;

      MainCanvas.Cursor:=crCross;

end;

function TEditorForm.findColor(fillString: TColor): string;
var setCl,pseudoColor:String;
C,CHex:Cardinal;

begin
         pseudoColor:=ColorToString(fillString);
         case pseudoColor of
            'clDefault'   : setCl:='gray';
            'clRed'       : setCl:='red';
            'clBlack'     : setCl:='black';
            'clBlue'      : setCl:='blue';
            'clWhite'     : setCl:='white';
            'clMaroon'    : setCl:='maroon';
            'clGreen'     : setCl:='green';
            'clOlive'     : setCl:='olive';
            'clNavy'      : setCl:='navy';
            'clPurple'    : setCl:='purple';
            'clTeal'      : setCl:='teal';
            'clSilver'    : setCl:='silver';
            'clLime'      : setCl:='lime';
            'clYellow'    : setCl:='yellow';
            'clFuchsia'   : setCl:='fuchsia';
            'clGray'      : setCl:='gray';
            'clAqua'      : setCl:='aqua';
            'clLtGray'    : setCl:='ltgray';
            'clDkGray'    : setCl:='dkgray';
            'clCream'     : setCl:='cream';
            'clMedGray'   : setCl:='medgray';
            'clMoneyGreen': setCl:='moneygray';
            'clSkyBlue'   : setCl:='scyblue';
          else
            if(Pos('$',pseudoColor)=1 ) then
              begin
                C:=fillString;
                CHex:= (C Shr 24) Or ((C And $FF0000) Shr 8) Or ((C And $FF00) Shl 8) Or (C Shl 24);
                setCl:=ColorToString(CHex);
                Delete(setCl,1,1);
                Delete(setCl,7,2);
                setCl:='#'+ setCl;

              end
            else
              setCl:='white';
          end;
          result:=setCl;
end;


procedure TEditorForm.Button1Click(Sender: TObject);
var
  i,j,rowCount,cl:Integer;
  AllData,orient:String;
begin
    Tkinter.createTkinterPython();
  //  EditorForm.Close;
end;

procedure TEditorForm.FormActivate(Sender: TObject);
begin
  MainCanvas.Width:=screen.Width;
  MainCanvas.Height:=screen.Height;
end;


procedure TEditorForm.ObjectTDiscretClicked(Sender:TObject);
var
  UnitClicked:TFlowPanel;
begin
    MoveAllow:=1;
    UnitClicked := sender as TFlowPanel;
      if Assigned(UnitClicked) then
       begin
           ObjectValue.Text:=UnitClicked.Caption;
           EX.Text:=UnitClicked.Left.ToString;
           EY.Text:=UnitClicked.Top.ToString;
           DiscretMove:= UnitClicked;

           UnitClicked.BevelInner:=bvRaised;
           UnitClicked.BevelOuter:=bvLowered;

           LabelMove:=nil;
           EditMove:=nil;
           StaticTextMove:=nil;
           PBarMove:=nil;
       end;

end;

procedure TEditorForm.ObjectTPBarClicked(Sender:TObject);
var
  UnitClicked:TProgressBar;
begin
    MoveAllow:=1;
    UnitClicked := sender as TProgressBar;
      if Assigned(UnitClicked) then
       begin

           EX.Text:=UnitClicked.Left.ToString;
           EY.Text:=UnitClicked.Top.ToString;
           PBarMove:= UnitClicked;
           ObjectValue.Text:=UnitClicked.Name;
           UnitClicked.Style:=pbstMarquee;
           DiscretMove:=nil;
           LabelMove:=nil;
           EditMove:=nil;
           StaticTextMove:=nil;
       end;

end;

procedure TEditorForm.BpictureClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  MainCanvas.Picture.LoadFromFile(OpenDialog1.FileName);
  ImageName:=OpenDialog1.FileName;
  Invalidate;
end;

procedure TEditorForm.BcolorClick(Sender: TObject);
begin
  ColorDialog.Execute;
  MainCanvas.Color :=ColorDialog.Color;
  MainCanvas.Canvas.Brush.Color:=ColorDialog.Color;
  MainCanvas.Canvas.FillRect(MainCanvas.Canvas.ClipRect);
  CanvasColor:=findColor(MainCanvas.Color);
  Invalidate;
end;

procedure TEditorForm.BdelImageClick(Sender: TObject);
begin
  MainCanvas.Picture.Clear;
  ImageName:='';
  Invalidate;
end;

procedure TEditorForm.BTEditClick(Sender: TObject);
begin

      EditBoxAllow:=1;
      LabelAllow:=0;
      StaticTextAllow:=0;
      DiscretAllow:=0;
      PBarAllow:=0;
      MainCanvas.Cursor:=crCross;

end;



procedure TEditorForm.ObjectTLabelClicked(Sender:TObject);
var
  UnitClicked:TLabel;
begin
    MoveAllow:=1;
    UnitClicked := sender as TLabel;
      if Assigned(UnitClicked) then
       begin
           ObjectValue.Text:=UnitClicked.Caption;
           EX.Text:=UnitClicked.Left.ToString;
           EY.Text:=UnitClicked.Top.ToString;
           LabelMove:= UnitClicked;
          // UnitClicked.Transparent:=True;
           UnitClicked.Tag:=1;
           UnitClicked.Canvas.Brush.Color:=clBlack;
           UnitClicked.Canvas.Brush.Style:=bsSolid;
           UnitClicked.Canvas.FrameRect(ClientRect);

           DiscretMove:=nil;
           PBarMove:=nil;
           EditMove:=nil;
           StaticTextMove:=nil;

       end;

end;

procedure TEditorForm.ObjectTStaticTextClicked(Sender:TObject);
var
  UnitClicked:TStaticText;
begin
  MoveAllow:=1;
  UnitClicked := sender as TStaticText;
      if Assigned(UnitClicked) then
       begin
           ObjectValue.Text:=UnitClicked.Caption;
           EX.Text:=UnitClicked.Left.ToString;
           EY.Text:=UnitClicked.Top.ToString;
           StaticTextMove:= UnitClicked;
           StaticTextMove.Transparent:=True;
           StaticTextMove.BorderStyle:=sbsSunken;
           DiscretMove:=nil;
           LabelMove:=nil;
           EditMove:=nil;
           PBarMove:=nil;



       end;

end;



procedure TEditorForm.ObjectTEditClicked(Sender:TObject);
var
  UnitClicked:TEdit;

begin
    MoveAllow:=1;
    UnitClicked := sender as TEdit;
      if Assigned(UnitClicked) then
       begin
           ObjectValue.Text:=UnitClicked.Text;
           EX.Text:=UnitClicked.Left.ToString;
           EY.Text:=UnitClicked.Top.ToString;
           EditMove:=UnitClicked;
           UnitClicked.SelectAll;
           UnitClicked.HideSelection:=False;
           PBarMove:=nil;
           DiscretMove:=nil;
           LabelMove:=nil;
           StaticTextMove:=nil;
       end;
end;

procedure TEditorForm.FormCreate(Sender: TObject);
begin
  LabelAllow:=0;
  EditBoxAllow:=0;
  EditArray:=0;
  LabelArray:=0;
  DiscretArray:=0;
  PBarArray:=0;
  ImageName:='';
  MainCanvas.Width:=screen.Width;
  MainCanvas.Height:=screen.Height;
end;

procedure TEditorForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  NewForm:TForm;
  chobj:integer;
begin
    if(Key=17) then MoveAllowKey:=1
    else  MoveAllowKey:=0;
    if((Key=40) or (Key=38)  or (Key=37)  or (Key=39)) then
    begin
    MoveAllow:=0;
    MouseButtonDown:=False;
    end;

    // --------------------------- edit object move
     if(Key=40) then
     begin
         EditMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
               EditObject[chobj].Top:=EditObject[chobj].Top+1;
         end;
     end;
     if(Key=38) then
     begin
         EditMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
               EditObject[chobj].Top:=EditObject[chobj].Top-1;
         end;
     end;
     if(Key=37) then
     begin
         EditMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
               EditObject[chobj].Left:=EditObject[chobj].Left-1;
         end;
     end;
     if(Key=39) then
     begin
         EditMove:=nil;
         for chobj := 0 to 999 do
              begin
                 if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
                    EditObject[chobj].Left:=EditObject[chobj].Left+1;
              end;
         end;
// --------------------------- static text object move
      if(Key=40) then
      begin
          StaticTextMove:=nil;
          for chobj := 0 to 999 do
          begin
             if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
                StaticTextObject[chobj].Top:=StaticTextObject[chobj].Top+1;
          end;
      end;

      if(Key=38) then
      begin
          StaticTextMove:=nil;
          for chobj := 0 to 999 do
          begin
             if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
                StaticTextObject[chobj].Top:=StaticTextObject[chobj].Top-1;
          end;
      end;

      if(Key=37) then
      begin
          StaticTextMove:=nil;
          for chobj := 0 to 999 do
          begin
             if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
              StaticTextObject[chobj].Left:=StaticTextObject[chobj].Left-1;
          end;
      end;

      if(Key=39) then
      begin
          StaticTextMove:=nil;
          for chobj := 0 to 999 do
          begin
           if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
              StaticTextObject[chobj].Left:=StaticTextObject[chobj].Left+1;
          end;
      end;

      // --------------------------- label object move
     if(Key=40) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(LabelObject[chobj]<>nil) and (LabelObject[chobj].Tag=1) then
               LabelObject[chobj].Top:=LabelObject[chobj].Top+1;
         end;
     end;
     if(Key=38) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(LabelObject[chobj]<>nil) and (LabelObject[chobj].Tag=1) then
               LabelObject[chobj].Top:=LabelObject[chobj].Top-1;
         end;
     end;
     if(Key=37) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(LabelObject[chobj]<>nil) and (LabelObject[chobj].Tag=1) then
               LabelObject[chobj].Left:=LabelObject[chobj].Left-1;
         end;
     end;
     if(Key=39) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
              begin
                 if(LabelObject[chobj]<>nil) and (LabelObject[chobj].Tag=1) then
                    LabelObject[chobj].Left:=LabelObject[chobj].Left+1;
              end;
         end;


  //----------discret


   if(Key=40) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(DiscretObject[chobj]<>nil) and
              (DiscretObject[chobj].BevelInner=bvRaised) and
              (DiscretObject[chobj].BevelOuter=bvLowered) then
               DiscretObject[chobj].Top:=DiscretObject[chobj].Top+1;
         end;
     end;



     if(Key=38) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(DiscretObject[chobj]<>nil) and
                      (DiscretObject[chobj].BevelInner=bvRaised) and
                      (DiscretObject[chobj].BevelOuter=bvLowered) then
                       DiscretObject[chobj].Top:=DiscretObject[chobj].Top-1;
         end;
     end;
     if(Key=37) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin

            if(DiscretObject[chobj]<>nil) and
                      (DiscretObject[chobj].BevelInner=bvRaised) and
                      (DiscretObject[chobj].BevelOuter=bvLowered) then
                       DiscretObject[chobj].Left:=DiscretObject[chobj].Left-1;

         end;
     end;
     if(Key=39) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
              begin
                 if(DiscretObject[chobj]<>nil) and
                                   (DiscretObject[chobj].BevelInner=bvRaised) and
                                   (DiscretObject[chobj].BevelOuter=bvLowered) then
                                    DiscretObject[chobj].Left:=DiscretObject[chobj].Left+1;
              end;
     end;

  //----------pbar


   if(Key=40) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(PBarObject[chobj]<>nil) and
              (PBarObject[chobj].Style=pbstMarquee) then
               PBarObject[chobj].Top:=PBarObject[chobj].Top+1;
         end;
     end;



     if(Key=38) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(PBarObject[chobj]<>nil) and
              (PBarObject[chobj].Style=pbstMarquee) then
                       PBarObject[chobj].Top:=PBarObject[chobj].Top-1;
         end;
     end;
     if(Key=37) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
         begin
            if(PBarObject[chobj]<>nil) and
              (PBarObject[chobj].Style=pbstMarquee) then
                       PBarObject[chobj].Left:=PBarObject[chobj].Left-1;

         end;
     end;
     if(Key=39) then
     begin
         LabelMove:=nil;
         for chobj := 0 to 999 do
              begin
                 if(PBarObject[chobj]<>nil) and
                   (PBarObject[chobj].Style=pbstMarquee) then
                                    PBarObject[chobj].Left:=PBarObject[chobj].Left+1;
              end;
     end;
     // F7
     if(Key=118) then linkObjects();
     // F2
     if(Key=113) then editObjects();
     // F5
     if(Key=116) then copyObjects();
     // del
      if(Key=46) then delObjects();

end;

procedure TEditorForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MoveAllowKey:=0;
end;

procedure TEditorForm.FormResize(Sender: TObject);
begin
  MainCanvas.Width:=screen.Width;
  MainCanvas.Height:=screen.Height;
end;


procedure TEditorForm.MainCanvasClick(Sender: TObject);
var
  i:integer;
begin
  DiscretMove:=nil;
  LabelMove:=nil;
  EditMove:=nil;
  StaticTextMove:=nil;
  PBarMove:=nil;
  unselObjects();
  MoveAllowKey:=0;
end;

procedure TEditorForm.MainCanvasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
// --------------------------- create OBJECTS

   x0:=x;
   y0:=y;
   if (Button=mbLeft) then
   begin
     MouseButtonDown:=true
   end;
     if (DiscretAllow=1) then
     begin
       DiscretObject[DiscretArray]:=TFlowPanel.Create(Self);
       DiscretObject[DiscretArray].Parent:=Self;
       DiscretObject[DiscretArray].Width:=35;
       DiscretObject[DiscretArray].Cursor:=crHandPoint;
       DiscretObject[DiscretArray].Font.Size:=10;
       DiscretObject[DiscretArray].Height:=35;
       DiscretObject[DiscretArray].Caption:='DI_'+ IntToStr(DiscretArray);
       DiscretObject[DiscretArray].Name:='DI_'+ IntToStr(DiscretArray);
       DiscretObject[DiscretArray].ShowHint:=True;
       DiscretObject[DiscretArray].Hint:=DiscretObject[DiscretArray].Caption;
       DiscretObject[DiscretArray].Left:=X+MainCanvas.Left;
       DiscretObject[DiscretArray].Top:=Y-DiscretObject[DiscretArray].Height+MainCanvas.Top;

       DiscretObject[DiscretArray].BevelInner:=bvNone;
       DiscretObject[DiscretArray].BevelOuter:=bvNone;

       DiscretObject[DiscretArray].Color:=$000000FD;
       DiscretObject[DiscretArray].Font.Color:=$00FFFFFF;
       DiscretObject[DiscretArray].PopupMenu:=ObjectMenu;
       DiscretObject[DiscretArray].OnClick := @ObjectTDiscretClicked;
       DiscretArray:=DiscretArray+1;
     end;




   if (EditBoxAllow=1) then
   begin
     EditObject[EditArray]:=TEdit.Create(EditorForm);
     EditObject[EditArray].Parent:=EditorForm;
     EditObject[EditArray].Width:=120;
     EditObject[EditArray].Cursor:=crHandPoint;
     EditObject[EditArray].Height:=100;
     EditObject[EditArray].Left:=X+MainCanvas.Left;

     EditObject[EditArray].ReadOnly:=True;
     EditObject[EditArray].AutoSelect:=False;

     EditObject[EditArray].BorderStyle:=bsNone;
     EditObject[EditArray].Color:=$00F7F7F7;
     EditObject[EditArray].Font.Color:=$00141414;
     EditObject[EditArray].Font.Size:=14;
     EditObject[EditArray].Font.Name:='Arial';
     EditObject[EditArray].PopupMenu:=ObjectMenu;
     EditObject[EditArray].Name:='AI_'+ IntToStr(EditArray);


     //EditObject[EditArray].DragKind:=dkDock;
     EditObject[EditArray].HideSelection:=False;
     EditObject[EditArray].ShowHint:=True;
     EditObject[EditArray].Top:=Y-EditObject[EditArray].Height+MainCanvas.Top;
     EditObject[EditArray].Text:='VarValue_'+ IntToStr(EditArray);
     EditObject[EditArray].Hint:=EditObject[EditArray].Text;
     EditObject[EditArray].OnClick := @ObjectTEditClicked;
     EditArray:=EditArray+1;
   end;

   if (PBarAllow=1) then
   begin
     PBarObject[PBarArray]:=TProgressBar.Create(EditorForm);
     PBarObject[PBarArray].Parent:=EditorForm;
     PBarObject[PBarArray].Width:=150;
     PBarObject[PBarArray].Cursor:=crHandPoint;
     PBarObject[PBarArray].Height:=20;
     PBarObject[PBarArray].Left:=X+MainCanvas.Left;
     PBarObject[PBarArray].PopupMenu:=ObjectMenu;
     PBarObject[PBarArray].Style:=pbstNormal;
     PBarObject[PBarArray].Name:='PB_'+ IntToStr(PBarArray);
     PBarObject[PBarArray].Top:=Y-PBarObject[PBarArray].Height+MainCanvas.Top;
     PBarObject[PBarArray].Position:=50;
     PBarObject[PBarArray].Color:=clGreen;
     PBarObject[PBarArray].Font.Color:=clWhite;
     PBarObject[PBarArray].ShowHint:=True;
     PBarObject[PBarArray].Hint:=PBarObject[PBarArray].Name;

     PBarObject[PBarArray].OnClick := @ObjectTPBarClicked;
     PBarArray:=PBarArray+1;
   end;
  if (LabelAllow=1) then
   begin
     LabelObject[LabelArray]:=TLabel.Create(EditorForm);
     LabelObject[LabelArray].Parent:=EditorForm;
     LabelObject[LabelArray].Cursor:=crHandPoint;
     LabelObject[LabelArray].Width:=250;


     LabelObject[LabelArray].Left:=X+MainCanvas.Left;
     LabelObject[LabelArray].Color:=$00F7F7F7;
     LabelObject[LabelArray].Font.Color:=$00141414;
     LabelObject[LabelArray].Font.Size:=14;
     LabelObject[LabelArray].Font.Name:='Arial';
     LabelObject[LabelArray].Font.Height:=20;
     LabelObject[LabelArray].Height:=20;
     LabelObject[LabelArray].Width:=80;
     LabelObject[LabelArray].ShowHint:=True;
     LabelObject[LabelArray].Tag:=0;

     LabelObject[LabelArray].Transparent:=false;
     LabelObject[LabelArray].PopupMenu:=ObjectMenu;
     LabelObject[LabelArray].Top:=Y-LabelObject[LabelArray].Font.Height+MainCanvas.Top;
     LabelObject[LabelArray].Caption:='VarLabel_'+ IntToStr(LabelArray);
     LabelObject[LabelArray].Name:='VLab_'+ IntToStr(LabelArray);

     LabelObject[LabelArray].Hint:=LabelObject[LabelArray].Caption;


     LabelObject[LabelArray].OnClick := @ObjectTLabelClicked;
     LabelArray:=LabelArray+1;
   end;

 if (StaticTextAllow=1) then
   begin
     StaticTextObject[StaticTextArray]:=TStaticText.Create(EditorForm);
     StaticTextObject[StaticTextArray].Parent:=EditorForm;
     StaticTextObject[StaticTextArray].Cursor:=crHandPoint;
     StaticTextObject[StaticTextArray].Width:=150;
    // if( StaticTextObject[StaticTextArray].Height < 2) then
     StaticTextObject[StaticTextArray].Height:=25;
     StaticTextObject[StaticTextArray].Color:=$00F7F7F7;
     StaticTextObject[StaticTextArray].Font.Color:=$00141414;
     StaticTextObject[StaticTextArray].Font.Size:=14;
     StaticTextObject[StaticTextArray].Font.Name:='Arial';
     StaticTextObject[StaticTextArray].PopupMenu:=ObjectMenu;
     StaticTextObject[StaticTextArray].Transparent:=False;
     StaticTextObject[StaticTextArray].ShowHint:=True;
     StaticTextObject[StaticTextArray].Name:='SText_'+ IntToStr(StaticTextArray);
     StaticTextObject[StaticTextArray].Left:=X+MainCanvas.Left;
     StaticTextObject[StaticTextArray].Top:=Y-StaticTextObject[StaticTextArray].Height+MainCanvas.Top;
     StaticTextObject[StaticTextArray].Caption:='VarStaticText_'+ IntToStr(StaticTextArray);
     StaticTextObject[StaticTextArray].Hint:=StaticTextObject[StaticTextArray].Caption;
     StaticTextObject[StaticTextArray].OnClick := @ObjectTStaticTextClicked;
     StaticTextArray:=StaticTextArray+1;
   end;



end;

procedure TEditorForm.MainCanvasMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  chobj:integer;
begin
  difX:=X;
  difY:=Y;
  if((MoveAllow=1) and (MoveAllowKey=1)) or MouseButtonDown=true then
  begin
   if( DiscretMove<>nil) then
   begin
          DiscretMove.Left:=X+MainCanvas.Left;
          DiscretMove.Top:=y-DiscretMove.Height+MainCanvas.Top;
          EX.Text:=DiscretMove.Left.ToString;
          EY.Text:=DiscretMove.Top.ToString;

   end;
   //---------move static text
          for chobj := 0 to 999 do
          begin
               if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
               begin

                  if(X > oldX) then
                  StaticTextObject[chobj].Left:=StaticTextObject[chobj].Left+(difX-oldX)
                  else
                  StaticTextObject[chobj].Left:=StaticTextObject[chobj].Left-(oldX-difX);
                  if(Y > oldY) then
                  StaticTextObject[chobj].Top:=StaticTextObject[chobj].Top+(Y-oldY)
                  else
                  StaticTextObject[chobj].Top:=StaticTextObject[chobj].Top-(oldY-Y) ;

               end;

               //---------move edit
                  if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
                  begin
                  if(X > oldX) then
                  EditObject[chobj].Left:=EditObject[chobj].Left+(difX-oldX)
                  else
                  EditObject[chobj].Left:=EditObject[chobj].Left-(oldX-difX);
                  if(Y > oldY) then
                  EditObject[chobj].Top:=EditObject[chobj].Top+(Y-oldY)
                  else
                  EditObject[chobj].Top:=EditObject[chobj].Top-(oldY-Y) ;
                  end;
                  //---------move label
                     if(LabelObject[chobj]<>nil) and (LabelObject[chobj].Tag=1) then
                     begin
                     if(X > oldX) then
                     LabelObject[chobj].Left:=LabelObject[chobj].Left+(difX-oldX)
                     else
                     LabelObject[chobj].Left:=LabelObject[chobj].Left-(oldX-difX);
                     if(Y > oldY) then
                     LabelObject[chobj].Top:=LabelObject[chobj].Top+(Y-oldY)
                     else
                     LabelObject[chobj].Top:=LabelObject[chobj].Top-(oldY-Y) ;
                     end;
                     //---------move discret
                     if(DiscretObject[chobj]<>nil) and
                       (DiscretObject[chobj].BevelInner=bvRaised) and
                       (DiscretObject[chobj].BevelOuter=bvLowered) then
                     begin
                     if(X > oldX) then
                     DiscretObject[chobj].Left:=DiscretObject[chobj].Left+(difX-oldX)
                     else
                     DiscretObject[chobj].Left:=DiscretObject[chobj].Left-(oldX-difX);
                     if(Y > oldY) then
                     DiscretObject[chobj].Top:=DiscretObject[chobj].Top+(Y-oldY)
                     else
                     DiscretObject[chobj].Top:=DiscretObject[chobj].Top-(oldY-Y);
                     end;

                     //---------move pbar
                      if(PBarObject[chobj]<>nil) and
                        (PBarObject[chobj].Style=pbstMarquee) then
                      begin
                      if(X > oldX) then
                      PBarObject[chobj].Left:=PBarObject[chobj].Left+(difX-oldX)
                      else
                      PBarObject[chobj].Left:=PBarObject[chobj].Left-(oldX-difX);
                      if(Y > oldY) then
                      PBarObject[chobj].Top:=PBarObject[chobj].Top+(Y-oldY)
                      else
                      PBarObject[chobj].Top:=PBarObject[chobj].Top-(oldY-Y) ;
                      end;
          end;
end;
  oldX:=X;
  oldY:=Y;

end;

procedure TEditorForm.CopyObjectClick(Sender: TObject);
begin
   copyObjects();
end;

procedure TEditorForm.DeleteObjectClick(Sender: TObject);
begin
     delObjects();
end;

procedure TEditorForm.MainCanvasMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
  selObjects(X,Y);

end;





procedure TEditorForm.MenuItem1Click(Sender: TObject);
begin
    linkObjects();

end;

procedure TEditorForm.ObjectMenuClose(Sender: TObject);
begin
    MoveAllowKey:=0;
end;

procedure TEditorForm.ObjectMoveClick(Sender: TObject);
begin
  MoveAllowKey:=1
end;

procedure TEditorForm.ObjectEditClick(Sender: TObject);
begin
 editObjects();
end;
procedure TEditorForm.copyObjects();
var
  chobj:integer;
begin


     for chobj := 0 to 999 do
     begin
       if(StaticTextObject[chobj]<>nil) and (StaticTextObject[chobj].Transparent=True) then
        begin
        StaticTextObject[StaticTextArray]:=TStaticText.Create(EditorForm);
        StaticTextObject[StaticTextArray].Parent:=EditorForm;
        StaticTextObject[StaticTextArray].Cursor:=crHandPoint;
        StaticTextObject[StaticTextArray].Width:=StaticTextObject[chobj].Width;
        StaticTextObject[StaticTextArray].Height:=StaticTextObject[chobj].Height;
        StaticTextObject[StaticTextArray].Left:=StaticTextObject[chobj].Left-StaticTextObject[chobj].Width-20;
        StaticTextObject[StaticTextArray].Color:=StaticTextObject[chobj].Color;
        StaticTextObject[StaticTextArray].Font:=StaticTextObject[chobj].Font;
        StaticTextObject[StaticTextArray].Transparent:=False;
        StaticTextObject[StaticTextArray].Top:=StaticTextObject[chobj].Top-StaticTextObject[chobj].Height-20;
        StaticTextObject[StaticTextArray].Caption:=StaticTextObject[chobj].Caption;
        StaticTextObject[StaticTextArray].ShowHint:=True;
        StaticTextObject[StaticTextArray].Hint:=StaticTextObject[chobj].Caption;
        StaticTextObject[StaticTextArray].Name:='SText_'+ IntToStr(StaticTextArray);
        StaticTextObject[StaticTextArray].PopupMenu:=ObjectMenu;
        StaticTextObject[StaticTextArray].OnClick := @ObjectTStaticTextClicked;
        StaticTextArray:=StaticTextArray+1;

        end;

                       //---------move edit
        if(EditObject[chobj]<>nil) and (EditObject[chobj].HideSelection=False) then
          begin
           EditObject[EditArray]:=TEdit.Create(Self);
           EditObject[EditArray].Parent:=Self;
           EditObject[EditArray].Width:=EditObject[chobj].Width;
           EditObject[EditArray].Color:=EditObject[chobj].Color;
           EditObject[EditArray].Font:=EditObject[chobj].Font;
           EditObject[EditArray].Cursor:=crHandPoint;
           EditObject[EditArray].Height:=EditObject[chobj].Height;
           EditObject[EditArray].AutoSelect:=True;
           EditObject[EditArray].Left:=EditObject[chobj].Left-EditObject[chobj].Width-20;
           EditObject[EditArray].HideSelection:=True;
           EditObject[EditArray].Enabled:=True;
           EditObject[EditArray].ReadOnly:=True;

           EditObject[EditArray].BorderStyle:=bsNone;
           EditObject[EditArray].Name:='AI_'+ IntToStr(EditArray);
           EditObject[EditArray].Top:=EditObject[chobj].Top - EditObject[chobj].Height -20;
           EditObject[EditArray].Text:='VarValue_'+ IntToStr(EditArray);
           EditObject[EditArray].ShowHint:=True;
           EditObject[EditArray].Hint:=EditObject[chobj].Text;

           EditObject[EditArray].PopupMenu:=ObjectMenu;
           EditObject[EditArray].OnClick := @ObjectTEditClicked;
           EditArray:=EditArray+1;
           end;

          if( LabelObject[chobj]<>nil) and
            (LabelObject[chobj].Canvas.Brush.Style=bsSolid) and
            (LabelObject[chobj].Canvas.Brush.Color=clBlack) then
          begin
            LabelObject[LabelArray]:=TLabel.Create(EditorForm);
            LabelObject[LabelArray].Parent:=EditorForm;
            LabelObject[LabelArray].Cursor:=crHandPoint;
            LabelObject[LabelArray].Width:=LabelObject[chobj].Width;
            LabelObject[LabelArray].Font:=LabelObject[chobj].Font;
            LabelObject[LabelArray].Color:=LabelObject[chobj].Color;
            LabelObject[LabelArray].Left:=LabelObject[chobj].Left-LabelObject[chobj].Width-20;
            LabelObject[LabelArray].Top:=LabelObject[chobj].Top - LabelObject[chobj].Height -20;
            LabelObject[LabelArray].Transparent:=False;
            LabelObject[LabelArray].Canvas.Brush.Style:=bsClear;
            LabelObject[LabelArray].Caption:=LabelObject[chobj].Caption;
            LabelObject[LabelArray].ShowHint:=True;
            LabelObject[LabelArray].Tag:=0;
            LabelObject[LabelArray].Hint:=LabelObject[chobj].Caption;
            LabelObject[LabelArray].Name:='VLab_'+ IntToStr(LabelArray);
            LabelObject[LabelArray].PopupMenu:=ObjectMenu;
            LabelObject[LabelArray].OnClick := @ObjectTLabelClicked;
            LabelArray:=LabelArray+1;
           end;

         if( DiscretObject[chobj]<>nil) and
           ( DiscretObject[chobj].BevelInner=bvRaised ) and
           ( DiscretObject[chobj].BevelOuter=bvLowered )

           then
         begin
          DiscretObject[DiscretArray]:=TFlowPanel.Create(Self);
          DiscretObject[DiscretArray].Parent:=Self;
          DiscretObject[DiscretArray].Width:=DiscretObject[chobj].Width;
          DiscretObject[DiscretArray].Cursor:=crHandPoint;
          DiscretObject[DiscretArray].Height:=DiscretObject[chobj].Height;
          DiscretObject[DiscretArray].Caption:='DI_'+ IntToStr(DiscretArray);
          DiscretObject[DiscretArray].Name:='DI_'+ IntToStr(DiscretArray);
          DiscretObject[DiscretArray].Left:=DiscretObject[chobj].Left-DiscretObject[chobj].Width-20;
          DiscretObject[DiscretArray].Top:=DiscretObject[chobj].Top - DiscretObject[chobj].Height -20;
          DiscretObject[DiscretArray].BevelInner:=bvNone;
          DiscretObject[DiscretArray].BevelOuter:=bvNone;
          DiscretObject[DiscretArray].Color:=DiscretObject[chobj].Color;
          DiscretObject[DiscretArray].Font.Color:=DiscretObject[chobj].Font.Color;
          DiscretObject[DiscretArray].ShowHint:=True;
          DiscretObject[DiscretArray].Hint:=DiscretObject[chobj].Caption;
          DiscretObject[DiscretArray].PopupMenu:=ObjectMenu;
          DiscretObject[DiscretArray].OnClick := @ObjectTDiscretClicked;
          DiscretArray:=DiscretArray+1;
         end;

         if( PBarObject[chobj]<>nil) and (PBarObject[chobj].Style=pbstMarquee) then
         begin
          PBarObject[PBarArray]:=TProgressBar.Create(Self);
          PBarObject[PBarArray].Parent:=Self;
          PBarObject[PBarArray].Width:=PBarObject[chobj].Width;
          PBarObject[PBarArray].Cursor:=crHandPoint;
          PBarObject[PBarArray].Height:=PBarObject[chobj].Height;
          PBarObject[PBarArray].Orientation:=PBarObject[chobj].Orientation;
          try
              PBarObject[PBarArray].Name:='PB_'+ IntToStr(PBarArray);
          except
             begin
               PBarObject[PBarArray].Name:='';
               ShowMessage('This name already in use');
             end;
          end;
          PBarObject[PBarArray].Left:=PBarObject[chobj].Left-PBarObject[chobj].Width-20;
          PBarObject[PBarArray].Top:=PBarObject[chobj].Top - PBarObject[chobj].Height -20;
          PBarObject[PBarArray].Max:=PBarObject[chobj].Max;
          PBarObject[PBarArray].Color:=PBarObject[chobj].Color;
          PBarObject[PBarArray].PopupMenu:=ObjectMenu;
          PBarObject[PBarArray].Position:=PBarObject[chobj].Position;
          PBarObject[PBarArray].Color:=PBarObject[chobj].Color;
          PBarObject[PBarArray].Font.Color:=PBarObject[chobj].Font.Color;

          PBarObject[PBarArray].ShowHint:=True;
          PBarObject[PBarArray].Hint:=PBarObject[PBarArray].Name;
          PBarObject[PBarArray].OnClick := @ObjectTPBarClicked;
          PBarArray:=PBarArray+1;
        end;
   end;

   unselObjects();
end;
procedure TEditorForm.unselObjects();
var
  chobj:integer;
begin

                       for chobj := 0 to 999 do
                          begin
                             if(StaticTextObject[chobj]<>nil) then
                              begin
                                 StaticTextObject[chobj].Transparent:=False;
                                 StaticTextObject[chobj].BorderStyle:=sbsNone;

                              end;
                             if(EditObject[chobj]<>nil)  then
                             begin
                                EditObject[chobj].AutoSelect :=False;
                                EditObject[chobj].HideSelection:=True;
                                EditObject[chobj].SelLength:=0;
                                EditObject[chobj].SelStart:=0;
                             end;
                             if(LabelObject[chobj]<>nil)  then
                             begin
                                LabelObject[chobj].Transparent :=False;
                                LabelObject[chobj].Canvas.Brush.Style:=bsClear;
                                LabelObject[chobj].Canvas.Brush.Color:=clWhite;
                                LabelObject[chobj].Canvas.FrameRect(ClientRect);
                                LabelObject[chobj].Tag:=0;

                             end;

                             if(DiscretObject[chobj]<>nil)  then
                             begin
                                 DiscretObject[chobj].BevelInner:=bvNone;
                                 DiscretObject[chobj].BevelOuter:=bvNone;

                             end;
                             if(PBarObject[chobj]<>nil)  then
                             begin
                                 PBarObject[chobj].Style:=pbstNormal;


                             end;

                          end;

                     //  MouseButtonDown:=False;
end;

procedure TEditorForm.editObjects();
begin
  if( LabelMove<>nil) then
          begin
             PropertyForm.PrForm.PropGrid.TIObject:=LabelMove;
             PropertyForm.PrForm.Show();
          end;

          if( EditMove<>nil) then
          begin
             PropertyForm.PrForm.PropGrid.TIObject:=EditMove;
             PropertyForm.PrForm.Show();
          end;

          if( StaticTextMove<>nil) then
          begin
             PropertyForm.PrForm.PropGrid.TIObject:=StaticTextMove;
             PropertyForm.PrForm.Show();
          end;
          if( DiscretMove<>nil) then
          begin
             PropertyForm.PrForm.PropGrid.TIObject:=DiscretMove;
             PropertyForm.PrForm.Show();
          end;

          if( PBarMove<>nil) then
          begin
             PropertyForm.PrForm.PropGrid.TIObject:=PBarMove;
             PropertyForm.PrForm.Show();
          end;
end;

procedure TEditorForm.delObjects();
begin


                  if( LabelMove<>nil)      then
                  begin
                     LabelMove.Enabled:=false;
                     LabelMove.Visible:=false;
                  end;

                  if( EditMove<>nil)       then
                   begin
                      EditMove.Enabled:=false;
                      EditMove.Visible:=false;
                   end;
                  if( StaticTextMove<>nil) then
                  begin
                     StaticTextMove.Enabled:=false;
                     StaticTextMove.Visible:=false;
                  end;

                  if( DiscretMove<>nil)    then
                  begin
                     DiscretMove.Enabled:=false;
                     DiscretMove.Visible:=false;
                  end;
                  if( PBarMove<>nil)    then
                  begin
                     PBarMove.Enabled:=false;
                     PBarMove.Visible:=false;
                     PBarMove.Name:='';
                  end;

end;

procedure TEditorForm.linkObjects();
begin
                       if( EditMove<>nil) then
                        begin
                          linkForm.lForm.varEdit.Text:=EditMove.Text;
                        end;

                        if( DiscretMove<>nil) then
                        begin
                          linkForm.lForm.varEdit.Text:=DiscretMove.Caption;
                        end;
                        if( PBarMove<>nil) then
                        begin
                          linkForm.lForm.varEdit.Text:=PBarMove.Name;
                        end;


                        linkForm.lForm.Show;





end;

procedure TEditorForm.selObjects(X,Y:integer);
var
 chobj:Integer;
begin
   //MainCanvas.Canvas.DrawFocusRect(Rect(x0,y0,x,y));
   for chobj := 0 to 999 do
       begin
         if(StaticTextObject[chobj]<>nil)    and
         (StaticTextObject[chobj].Left > x0) and
         (StaticTextObject[chobj].Left < x)  and
         (StaticTextObject[chobj].Top > y0)  and
         (StaticTextObject[chobj].Top < y)   then
         begin
              StaticTextObject[chobj].Transparent:=True;
              StaticTextObject[chobj].BorderStyle:=sbsSingle;
         end;
         if(EditObject[chobj]<>nil) and
         (EditObject[chobj].Left > x0) and
         (EditObject[chobj].Left < x)  and
         (EditObject[chobj].Top > y0)  and
         (EditObject[chobj].Top < y)   then
         begin
            EditObject[chobj].SelectAll;
            EditObject[chobj].HideSelection:=False;
         end;
         if(LabelObject[chobj]<>nil) and
         (LabelObject[chobj].Left > x0) and
         (LabelObject[chobj].Left < x)  and
         (LabelObject[chobj].Top > y0)  and
         (LabelObject[chobj].Top < y)   then
         begin
            LabelObject[chobj].Canvas.Brush.Color:=clBlack;
            LabelObject[chobj].Canvas.Brush.Style:=bsSolid;
            LabelObject[chobj].Canvas.FrameRect(ClientRect);
            LabelObject[chobj].Tag:=1;
         end;

         if(DiscretObject[chobj]<>nil) and
         (DiscretObject[chobj].Left > x0) and
         (DiscretObject[chobj].Left < x)  and
         (DiscretObject[chobj].Top > y0)  and
         (DiscretObject[chobj].Top < y)   then
         begin
          DiscretObject[chobj].BevelInner:=bvRaised;
          DiscretObject[chobj].BevelOuter:=bvLowered;

         end;

          if(PBarObject[chobj]<>nil) and
         (PBarObject[chobj].Left > x0) and
         (PBarObject[chobj].Left < x)  and
         (PBarObject[chobj].Top > y0)  and
         (PBarObject[chobj].Top < y)   then
         begin
          PBarObject[chobj].Style:=pbstMarquee;


         end;
      end;

end;

end.


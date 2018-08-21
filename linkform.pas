unit linkForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TlForm }

  TlForm = class(TForm)
    Button1: TButton;
    varEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private

  public

  end;

var
  lForm: TlForm;

implementation
uses scadapy,Editor;
{$R *.lfm}

{ TlForm }

procedure TlForm.Button1Click(Sender: TObject);
begin
   if(Editor.EditorForm.EditMove<>nil) then
       begin
       Editor.EditorForm.EditMove.Text:=varEdit.Text;
       Editor.EditorForm.EditMove.Hint:=varEdit.Text;

       end;

   if(Editor.EditorForm.DiscretMove<>nil) then
       begin
       Editor.EditorForm.DiscretMove.Caption:=varEdit.Text;
       Editor.EditorForm.DiscretMove.Hint:=varEdit.Text;

       end;
   if(Editor.EditorForm.PBarMove<>nil) then
       begin
         try
           Editor.EditorForm.PBarMove.Name:=varEdit.Text;
           Editor.EditorForm.PBarMove.Hint:=varEdit.Text;
         except
           ShowMessage('This name already exists.');
         end;

       end;


   lForm.Close;

end;

procedure TlForm.FormActivate(Sender: TObject);
var
  varCount,i:Integer;
begin
   if(Editor.EditorForm.EditMove<>nil) then
         varEdit.Text:= Editor.EditorForm.EditMove.Text;
   if(Editor.EditorForm.DiscretMove<>nil) then
         varEdit.Text:= Editor.EditorForm.DiscretMove.Caption;
   if(Editor.EditorForm.PBarMove<>nil) then
        varEdit.Text:= Editor.EditorForm.PBarMove.Name;

   ListBox1.Clear;
   varCount:= scadapy.MainFrame.GVarTree.RowCount-1;

    for i:=1 to varCount do
       begin
            if  (Length(scadapy.MainFrame.GVarTree.Cells[1, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[2, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[3, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[4, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[5, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[6, i]) > 0) and
                (Length(scadapy.MainFrame.GVarTree.Cells[7, i]) > 0) then
                   begin
                      ListBox1.Items.Add(scadapy.MainFrame.GVarTree.Cells[8, i]);
                   end;
       end;

end;

procedure TlForm.ListBox1Click(Sender: TObject);
begin
      if(ListBox1.Items.Count>0) then
         varEdit.Text:= scadapy.MainFrame.GVarTree.Cells[2, ListBox1.itemindex+1];// ListBox1.items[ListBox1.itemindex];

end;

procedure TlForm.ListBox1DblClick(Sender: TObject);
begin
       if(ListBox1.Items.Count>0) then
         varEdit.Text:=scadapy.MainFrame.GVarTree.Cells[2, ListBox1.itemindex+1];// ListBox1.items[ListBox1.itemindex];


       if(Editor.EditorForm.EditMove<>nil) then
       begin
           Editor.EditorForm.EditMove.Text:=varEdit.Text;
           Editor.EditorForm.EditMove.Hint:=varEdit.Text;
       end;

       if(Editor.EditorForm.DiscretMove<>nil) then
       begin
         Editor.EditorForm.DiscretMove.Caption:=varEdit.Text;
         Editor.EditorForm.DiscretMove.Hint:=varEdit.Text;
       end;
       if(Editor.EditorForm.PBarMove<>nil) then
       begin
           try
             Editor.EditorForm.PBarMove.Name:=varEdit.Text;
             Editor.EditorForm.PBarMove.Hint:=varEdit.Text;
           except
             ShowMessage('This name already exists.');
           end;
       end;
       lForm.Close;

end;

end.


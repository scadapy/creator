unit PropertyForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RTTIGrids, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls;

type

  { TPrForm }

  TPrForm = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    PropGrid: TTIPropertyGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  PrForm: TPrForm;

implementation

{$R *.lfm}

{ TPrForm }

procedure TPrForm.Button1Click(Sender: TObject);
begin
   PrForm.Close;
end;

procedure TPrForm.FormCreate(Sender: TObject);
begin

end;

end.


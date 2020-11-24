unit View.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmViewBase = class(TForm)
    GridPanel1: TGridPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewBase: TfrmViewBase;

implementation

{$R *.dfm}

end.

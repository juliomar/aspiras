unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses rtti;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LContexto : TRttiContext;
  LTipo: TRttiType;
  LMetodo : TRttiMethod;
begin
  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(TForm1);

    Memo1.Lines.Clear;
    for LMetodo in LTipo.GetMethods do
    begin
      Memo1.Lines.Add(LMetodo.Name);
    end;

    LMetodo := LTipo.GetMethod('CLOSE');
  finally
    LContexto.Free;
  end;
end;

end.

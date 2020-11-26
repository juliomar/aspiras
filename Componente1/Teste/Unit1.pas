unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EventosAspiras;

type
  TForm1 = class(TForm)
    EventosAspiras1: TEventosAspiras;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure EventosAspiras1Status(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption :=  EventosAspiras1.TamanhoString(Edit1.Text).ToString;
end;

procedure TForm1.EventosAspiras1Status(Sender: TObject);
begin
  Memo1.Lines.Add(TEventosAspiras(Sender).Nome);
end;

end.

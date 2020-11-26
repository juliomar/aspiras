unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TAspirasHelper = class helper for TEdit
    function Vazio: Boolean;
  end;

  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
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
  if Edit1.Vazio then
    ShowMessage('está vazio');


  if Edit2.Vazio then
    ShowMessage('Está vazio');


  if Edit3.Vazio then
    ShowMessage('está vazio');
end;

  { TAspirasHelper }

function TAspirasHelper.Vazio: Boolean;
begin
  Result := trim(Self.Text) = EmptyStr;
end;

end.

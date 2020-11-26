unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAspirasThread = class(TThread)
  private
    FAux : string;
    FMemo:TMemo;
  public
    constructor Create(AMemo: TMemo);reintroduce;
    procedure Execute;override;
    procedure Sincronizar;
  end;


  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    FAspirasThread : TAspirasThread;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TAspirasThread }

constructor TAspirasThread.Create(AMemo: TMemo);
begin
  inherited Create(True);
  Self.FreeOnTerminate := true;

  FAux := EmptyStr;
  FMemo := AMemo;
end;

procedure TAspirasThread.Execute;
var
i : integer;
begin
  inherited;
  i := 0;
  while i< 100000 do
  begin
    i := i+1;
    Self.FAux := 'Valor de I:'+ IntToStr(i);
    Self.Synchronize(Self.Sincronizar);
    Self.Sleep(1);
  end;
end;

procedure TAspirasThread.Sincronizar;
begin
  FMemo.Lines.Add(Self.FAux);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Self.FAspirasThread := TAspirasThread.Create(Memo1);
  Self.FAspirasThread.Execute;
end;

end.

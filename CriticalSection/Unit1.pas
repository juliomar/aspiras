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
  System.SyncObjs, Vcl.StdCtrls;

type
  TObjetoMensagem = class
  public
    procedure Dispara(Amsg: string);
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSessaoCritica: TCriticalSection;
    FObjetoMensagem : TObjetoMensagem;
  public
      { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
  { TObjetoMensagem }

procedure TObjetoMensagem.Dispara(Amsg: string);
begin
  ShowMessage(Amsg);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  FThread1: TThread;
  FThread2: TThread;
  FThread3: TThread;

begin
  FThread1 := TThread.CreateAnonymousThread(
    procedure
    begin
      FSessaoCritica.Enter;
      try
        TThread.Sleep(5000);
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            FObjetoMensagem.Dispara('Primeira Thread');
          end)
      finally
        FSessaoCritica.Leave;
      end;
    end
    );
  FThread2 := TThread.CreateAnonymousThread(
    procedure
    begin
      FSessaoCritica.Enter;
      try
        TThread.Sleep(100);
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            FObjetoMensagem.Dispara('Segunda Thread');
          end)
      finally
        FSessaoCritica.Leave;
      end;
    end
    );
   FThread3:=   TThread.CreateAnonymousThread(
    procedure
    begin
      FSessaoCritica.Enter;
      try
        TThread.Sleep(3000);
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            FObjetoMensagem.Dispara('Terceira Thread');
          end)
      finally
        FSessaoCritica.Leave;
      end;
    end
    );

FThread1.Start;
FThread2.Start;
FThread3.Start;


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Assigned(FObjetoMensagem) then
    FreeAndNil(FObjetoMensagem);
  if Assigned(FSessaoCritica ) then
    FreeAndNil(FSessaoCritica);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSessaoCritica :=TCriticalSection.Create;
  FObjetoMensagem := TObjetoMensagem.Create;
end;

end.

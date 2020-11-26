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
  Vcl.StdCtrls,
  System.Threading;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure Metodo1;
    procedure Metodo2;
    procedure Metodo3;
  public
      { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LInicio: TDateTime;
  LFim   : TDateTime;

  LTask : array [0..2] of ITask;
begin
  LInicio := now;

  LTask[0] := TTask.Create( Metodo1);
  LTask[0].Start;

  LTask[1] := TTask.Create( Metodo2);
  LTask[1].Start;

  LTask[2] := TTask.Create( Metodo3);
  LTask[2].Start;

  TTask.WaitForAll(LTask);

  LFim := now;

  ShowMessage(Format('Consultas realizdas em %s segundos.', [ FormatDatetime('ss', LFim - LInicio) ]));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Lista : TStringList;
  i: Integer;
begin
  Lista := TStringList.Create;
  Lista.Text := 'carregararquivo';

  TParallel.&For(0, Pred(Lista.Count),
    procedure (i: integer)
    begin
      TThread.Queue(
        TThread.CurrentThread,
          procedure
          begin
            ///procesaralgumacoisa
          end
      )
    end
  );

end;

  { TForm1 }

procedure TForm1.Metodo1;
begin
  Sleep(2000);
end;

procedure TForm1.Metodo2;
begin
  Sleep(3000);
end;

procedure TForm1.Metodo3;
begin
  Sleep(4000);
end;

end.

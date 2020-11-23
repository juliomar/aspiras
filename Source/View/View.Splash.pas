unit View.Splash;

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
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls;

const
  WM_UPDATE_PB = WM_USER;

type
  TfrmViewSplash = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
  private
      { Private declarations }
  public
    procedure Update(var msg: TMessage); message WM_UPDATE_PB;
    class function ExibirSplash: Boolean;
  end;

var
  LSplash: TfrmViewSplash;

implementation

{$R *.dfm}
  { TfrmViewSplash }

procedure UpdateThreadViaMessage;
var
  i: integer;
begin
  for i := 0 to 100 do
  begin
    sleep(20);
    PostMessage(LSplash.Handle, WM_UPDATE_PB, i, 0);
  end;
  LSplash.hide;
end;

class function TfrmViewSplash.ExibirSplash: Boolean;
var
  i: integer;
begin
  LSplash := TfrmViewSplash.Create(Application);
  try
    LSplash.show;
    Application.processmessages;
    TThread.CreateAnonymousThread(UpdateThreadViaMessage).start;
  finally
      /// LSplash.free;
  end;
end;

procedure TfrmViewSplash.Update(var msg: TMessage);
begin
  ProgressBar1.Position := msg.WParam;
end;

end.

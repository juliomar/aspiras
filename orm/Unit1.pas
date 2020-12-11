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
  ConnectionModule,
  Unit2,
  Vcl.StdCtrls,

  Aurelius.Engine.ObjectManager,
  System.Generics.Collections,
  system.Generics.Defaults, SqlMonitor;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FManager: TObjectManager;
    procedure showmonitor ;

  public
      { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
showmonitor
end;

procedure TForm1.showmonitor;
var
  LForm : TSqlMonitorForm;
begin
  LForm := TSqlMonitorForm.GetInstance;

  LForm.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  LArtista: TArtist;
begin

  FManager := TSQLiteConnection.CreateManager;
  try
    LArtista      := TArtist.Create;
    LArtista.Name := 'ORM AURELIUS';

    FManager.Save(LArtista);
    ShowMessage(LArtista.ArtistId.ToString);
  finally
    FManager.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LArtista : TArtist;
begin
  FManager := TSQLiteConnection.CreateManager;
  try
    LArtista := FManager.Find<TArtist>(276);

    ShowMessage(LArtista.ArtistId.ToString + #13+ LArtista.Name.Value);

    LArtista.Name := 'Mudança ASPIRAS';

    FManager.Flush;

  finally
    FManager.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  LArtistas : TList<TArtist>;
  LArtista : TArtist;
begin
  FManager := TSQLiteConnection.CreateManager;
  try
    LArtistas := FManager.Find<TArtist>.List;

    Memo1.Lines.Clear;
    for LArtista in LArtistas do
    begin
      Memo1.Lines.Add(LArtista.ArtistId.ToString + ' - '+ LArtista.Name);
    end;

  finally
    FManager.Free;
  end;

end;

end.

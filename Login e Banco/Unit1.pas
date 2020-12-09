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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.DApt,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  FireDAC.Comp.Client,
  IniFiles;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtusuario: TEdit;
    edtsenha: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    FID: integer;
    function ValidarAcesso(const AUsuario: string; const ASenha: string): Boolean;
  public
      { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ValidarAcesso(edtusuario.Text, edtsenha.Text) then
    ShowMessage('Usuário Válido' + #13 + 'ID ' + FID.ToString)
  else
    ShowMessage('Usuário ERRADO');
end;

procedure TForm1.FDConnection1BeforeConnect(Sender: TObject);
var
  Lconfig : TIniFile;
begin
  Lconfig := TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini') );
  try
    FDConnection1.Params.Values['Database'] :=
     Lconfig.ReadString('CONFIG','BANCO',ExtractFilePath(ParamStr(0))+ 'Chinook.db');

  finally
  Lconfig.Free;
  end;
    //FDConnection1.Params.Values['Database'] := ExtractFilePath(ParamStr(0))+ 'Chinook.db';
end;

function TForm1.ValidarAcesso(const AUsuario, ASenha: string): Boolean;
var
  LQryUsuario: TFDQuery;
begin
  LQryUsuario := TFDQuery.Create(Self);
  try
    LQryUsuario.Connection := FDConnection1;
    LQryUsuario.SQL.Add('SELECT * FROM usuario');
    LQryUsuario.SQL.Add('WHERE  usuario = :usuario');
    LQryUsuario.SQL.Add('AND senha = :senha');

    LQryUsuario.ParamByName('usuario').Value := AUsuario;
    LQryUsuario.ParamByName('senha').Value   := ASenha;
    LQryUsuario.Open;

    Result := not LQryUsuario.IsEmpty;

    if Result = false then
      raise Exception.Create('Usuário ou Senha inválida');

    FID := LQryUsuario.FieldByName('id').AsInteger;
  finally
    LQryUsuario.Free;
  end;
end;

end.

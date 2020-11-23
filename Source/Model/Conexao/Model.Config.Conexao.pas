unit Model.Config.Conexao;

interface

uses
  System.SysUtils,
  System.IniFiles;

type
  TConfigIni = class(TMemIniFile)
  private
    class var FInstancia: TConfigIni;
    function GetBanco: string;
    procedure SetBanco(const Value: string);
    class function GetInstancia: TConfigIni; static;
  public
    class property Instancia: TConfigIni read GetInstancia;

    property Banco: string read GetBanco write SetBanco;
  end;

implementation

  { TConfigIni }

function TConfigIni.GetBanco: string;
begin
  Result := Self.ReadString('CONFIG', 'Banco', '');
end;

class function TConfigIni.GetInstancia: TConfigIni;
begin
  if not (Assigned(FInstancia)) then
    FInstancia := TConfigIni.Create(ChangeFileExt(ParamStr(0), '.ini'));

  Result := FInstancia;
end;

procedure TConfigIni.SetBanco(const Value: string);
begin
  Self.WriteString('CONFIG', 'Banco', Value);
end;

initialization

TConfigIni.GetInstancia;

finalization

if Assigned(TConfigIni.FInstancia) then
  FreeAndNil(TConfigIni.FInstancia);

end.

unit Model.Conexao.Factory.FireDAC;

interface

uses
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
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  data.DB;

type
  TFDConnectionFactory = class
  public
    class function Connection: TFDConnection;
  end;

implementation

uses
  Model.config.Conexao;
  { TFDConnectionFactory }

class function TFDConnectionFactory.Connection: TFDConnection;
begin
  Result := TFDConnection.Create(nil);
  Result.params.clear;
  Result.drivername                     := 'SQLite';
  Result.params.Values[ 'DriverID' ]    := 'SQLite';
  Result.params.Values[ 'Database' ]    := TConfigIni.Instancia.Banco;
  Result.params.Values[ 'LockingMode' ] := 'Normal';
  Result.loginprompt                    := false;
  Result.connected                      := true;
end;

end.

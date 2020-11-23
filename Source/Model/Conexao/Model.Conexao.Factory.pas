unit Model.Conexao.Factory;

interface

uses
  FireDAC.Comp.Client;

type
  TFactoryConnection = class
  public
    class function Connection: TFDConnection;
  end;

implementation

uses
  Model.Conexao.Factory.FireDAC;
  { TFactoryConnection }

class function TFactoryConnection.Connection: TFDConnection;
begin
  Result := TFDConnectionFactory.Connection;
end;

end.

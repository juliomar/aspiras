unit Model.Connection.FireDAC;

interface

uses
  Model.Connection.Interfaces,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Phys.SQLite,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async;

type
  TModelFireDACConexao = class(TInterfacedObject,
                               IModelConexao)
  private
    FConexao: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConexao;
    function Connection: TObject;
  end;

implementation

  { TModelFireDACConexao }

function TModelFireDACConexao.Connection: TObject;
begin
  Result := FConexao;
end;

constructor TModelFireDACConexao.Create;
begin
  FConexao                 := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'SQLite';
  FConexao.Params.Database := 'C:\Users\juliomar\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db';
  FConexao.Connected       := true;
end;

destructor TModelFireDACConexao.Destroy;
begin
  FConexao.Free;
  inherited;
end;

class function TModelFireDACConexao.New: IModelConexao;
begin
  Result := Self.Create;
end;

end.

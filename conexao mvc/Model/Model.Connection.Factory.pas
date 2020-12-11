unit Model.Connection.Factory;

interface

uses
  Model.Connection.Interfaces,
  Model.Connection.FireDAC,
  Model.Query.FireDAC;

type
  TModelConexaoFactory = class(TInterfacedObject,
                               IModelConexaoFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConexaoFactory;
    function Conexao: IModelConexao;
    function Query: IModelQuery;
  end;

implementation

  { TModelConexaoFactory }

function TModelConexaoFactory.Conexao: IModelConexao;
begin
  Result := TModelFireDACConexao.New;
end;

constructor TModelConexaoFactory.Create;
begin

end;

destructor TModelConexaoFactory.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactory.New: IModelConexaoFactory;
begin
  Result := Self.Create;
end;

function TModelConexaoFactory.Query: IModelQuery;
begin
  Result := TModelFireDACQuery.Create(Self.Conexao);
end;

end.

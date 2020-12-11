unit Model.Entidade.Customer;

interface

uses
  Model.Connection.Interfaces,
  Data.DB,
  Model.Connection.Factory,
  Firedac.Comp.Client;

type
  TModelEntidadeCustomer = class(TInterfacedObject,
                                 IModelEntidade)
  private
    FQuery: IModelQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelEntidade;
    function Dataset(AValue: TDataSource): IModelEntidade;
    procedure Open;
  end;

implementation

  { TModelEntidadeCustomer }

constructor TModelEntidadeCustomer.Create;
begin
  FQuery := TModelConexaoFactory.New.Query;
end;

function TModelEntidadeCustomer.Dataset(AValue: TDataSource): IModelEntidade;
begin
  Result         := Self;
  AValue.Dataset := TFDQuery(FQuery.Query);
end;

destructor TModelEntidadeCustomer.Destroy;
begin

  inherited;
end;

class function TModelEntidadeCustomer.New: IModelEntidade;
begin
  Result := Self.Create;
end;

procedure TModelEntidadeCustomer.Open;
begin
  FQuery.Open('SELECT * FROM Employee');
end;

end.

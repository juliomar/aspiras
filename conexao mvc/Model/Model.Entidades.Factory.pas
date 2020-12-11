unit Model.Entidades.Factory;

interface

uses Model.Connection.Interfaces, Model.Entidade.Customer;

type
  TModelEntidadesFactory = class(TInterfacedObject, IModelEntidadesFactory)
    private
      FCustomer : IModelEntidade;
    public
      constructor Create;
      destructor Destroy;override;
      class function New : IModelEntidadesFactory;
      function Customer : IModelEntidade;
  end;
implementation

{ TModelEntidadesFactory }

constructor TModelEntidadesFactory.Create;
begin

end;

function TModelEntidadesFactory.Customer: IModelEntidade;
begin
  if not Assigned(FCustomer) then
    FCustomer := TModelEntidadeCustomer.New;

  Result := FCustomer;
end;

destructor TModelEntidadesFactory.Destroy;
begin

  inherited;
end;

class function TModelEntidadesFactory.New: IModelEntidadesFactory;
begin
  Result := Self.Create;
end;

end.

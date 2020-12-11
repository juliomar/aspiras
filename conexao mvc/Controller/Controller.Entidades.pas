unit Controller.Entidades;

interface

uses
  Controller.Interfaces,
  Model.Connection.Interfaces,
  Model.Entidades.Factory;

type
  TController = class(TInterfacedObject,
                      IController)
  private
    FModelEntidades: IModelEntidadesFactory;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IController;
    function Entidades: IModelEntidadesFactory;
  end;

implementation

  { TController }

constructor TController.Create;
begin
  FModelEntidades := TModelEntidadesFactory.New;
end;

destructor TController.Destroy;
begin
  inherited;
end;

function TController.Entidades: IModelEntidadesFactory;
begin
  Result := FModelEntidades;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

end.

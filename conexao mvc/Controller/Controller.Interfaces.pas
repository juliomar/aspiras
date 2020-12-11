unit Controller.Interfaces;

interface

uses Model.Connection.Interfaces;


type
  IController = interface
    function Entidades : IModelEntidadesFactory;
  end;

implementation

end.

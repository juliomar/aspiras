unit Model.Connection.Interfaces;

interface

uses
  Data.DB;

type
  IModelQuery = interface;

  IModelConexao = interface
    function Connection: TObject;
  end;

  IModelConexaoFactory = interface
    function Conexao: IModelConexao;
    function Query: IModelQuery;
  end;

  IModelQuery = interface
    function Query: TObject;
    function Open(ASQL: string): IModelQuery;
    function ExecSQL(ASQL: string): IModelQuery;
  end;

  IModelEntidade = interface
    function Dataset(AValue: TDataSource): IModelEntidade;
    procedure Open;
  end;

  IModelEntidadesFactory = interface
    function Customer: IModelEntidade;
  end;

implementation

end.

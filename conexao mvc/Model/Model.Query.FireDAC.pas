unit Model.Query.FireDAC;

interface

uses
  Model.Connection.Interfaces,
  FireDAC.Comp.Client;

type
  TModelFireDACQuery = class(TInterfacedObject,
                             IModelQuery)
  private
    FQuery  : TFDQuery;
    FConexao: IModelConexao;
  public
    constructor Create(AValue: IModelConexao);
    destructor Destroy; override;
    class function New(AValue: IModelConexao): IModelQuery;
    function Query: TObject;
    function Open(ASQL: string): IModelQuery;
    function ExecSQL(ASQL: string): IModelQuery;
  end;

implementation

  { TModelFireDACQuery }

constructor TModelFireDACQuery.Create(AValue: IModelConexao);
begin
  FConexao          := AValue;
  FQuery            := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConexao.Connection);
end;

destructor TModelFireDACQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TModelFireDACQuery.ExecSQL(ASQL: string): IModelQuery;
begin
  Result := Self;
  FQuery.ExecSQL(ASQL);
end;

class function TModelFireDACQuery.New(AValue: IModelConexao): IModelQuery;
begin
  Result := Self.Create(AValue);
end;

function TModelFireDACQuery.Open(ASQL: string): IModelQuery;
begin
  Result := Self;
  FQuery.Open(ASQL);
end;

function TModelFireDACQuery.Query: TObject;
begin
  Result := FQuery;
end;

end.

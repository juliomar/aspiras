unit Previsao.Model.Data;

interface

uses
  System.SysUtils,
  System.Classes,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Previsao.Model.Interfaces,
  Previsao.Model.Entidade;

type
  TModelData = class(TDataModule,
                       IPrevisaoData)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    FEntidade : TPrevisaoModel;
    FCodeCity : string;
    FToken : string;
  public
    class function New : IPrevisaoData;
    function consultarclima: IPrevisaoData;
    function Entidade(Value: TPrevisaoModel): IPrevisaoData;
    function CodeCity(Value: string): IPrevisaoData;
    function Token(Value: string): IPrevisaoData;
    function FindCityID(City, State: string): string;
  end;

var
  ModelData: TModelData;

implementation

uses
  System.JSON,
  System.types,
  Windows;


{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TDataModule1 }

function TModelData.CodeCity(Value: string): IPrevisaoData;
begin
  Result := Self;
  FCodeCity := Value;
end;

function TModelData.consultarclima: IPrevisaoData;
var
  LObjeto, LDados : TJSONObject;
begin
  Result := Self;
  RESTClient1.BaseURL :=
    'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/'+ FCodeCity +'/current?token='+FToken;

  RESTRequest1.Execute;

  LObjeto := RESTResponse1.JSONValue as TJSONObject;

  LDados := LObjeto.Values['data'] as TJSONObject;

  FEntidade.City := LObjeto.Values['name'].Value;
  FEntidade.State := LObjeto.Values['state'].Value;
  FEntidade.Country  := LObjeto.Values['country'].Value;
  FEntidade.Temperature := LDados.Values['temperature'].Value.ToDouble;
  FEntidade.win_direction := LDados.Values['wind_direction'].Value;
  FEntidade.win_velocity := LDados.Values['wind_velocity'].Value.ToInteger;
  FEntidade.humidity := LDados.Values['humidity'].Value.ToDouble;
  FEntidade.codition := LDados.Values['condition'].Value;
  FEntidade.pressure := LDados.Values['pressure'].Value.ToDouble;
  FEntidade.sensation := LDados.Values['sensation'].Value.ToDouble;
  FEntidade.date := LDados.Values['date'].Value;


end;

function TModelData.Entidade(Value: TPrevisaoModel): IPrevisaoData;
begin
  Result := Self;
  FEntidade := Value;
end;

function TModelData.FindCityID(City, State: string): string;
var
  LContent : string;
  LObjetoArray : TJSONArray;
  LData : TJSONValue;
  LObjeto : TJSONObject;
begin
  RESTClient1.BaseURL := 'http://apiadvisor.climatempo.com.br/api/v1/locale/city';
  RESTClient1.AddParameter('name', City);
  RESTClient1.AddParameter('state', State);
  RESTClient1.AddParameter('token', FToken );
  RESTRequest1.Execute;
  LContent := RESTResponse1.Content;
  LObjetoArray := RESTResponse1.JSONValue as TJSONArray;
  for LData in LObjetoArray do
  begin
    LObjeto := LData as TJSONObject;
    Result := LObjeto.Values['id'].Value;
  end;


end;

class function TModelData.New: IPrevisaoData;
begin
  Result := Self.Create(nil);
end;

function TModelData.Token(Value: string): IPrevisaoData;
begin
  Result := Self;
  FToken := Value;
end;

end.

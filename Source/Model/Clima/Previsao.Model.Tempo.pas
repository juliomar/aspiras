unit Previsao.Model.Tempo;

interface

uses
  Previsao.Model.Entidade,
  Previsao.Model.Interfaces,
  system.Classes;

type
  TPrevisaoTempo = class
  private
    FEntidade : TPrevisaoModel;
    FCodeCity : string;
    FToken : string;
    procedure setCodeCity(const Value: string);
    procedure SetToken(const Value: string);

  public
    constructor Create;
    destructor Destroy;override;

    function ConsultaPrevisao : TPrevisaoTempo ;
    function FindCityID (city,state : string):string;
    function Return : TPrevisaoModel;

    property CodeCity : string read fCodeCity write setCodeCity;
    property Token : string  read FToken write SetToken;
  end;

implementation
uses system.SysUtils, Previsao.Model.Data;

{ TPrevisaoTempo }

function TPrevisaoTempo.ConsultaPrevisao: TPrevisaoTempo;
begin
  if not Assigned(FEntidade) then
    FEntidade := TPrevisaoModel.Create;

  TModelData
    .New
    .Entidade(FEntidade)
    .Token(FToken)
    .CodeCity(FCodeCity)
    .consultarclima;
  Result :=  Self;
end;

constructor TPrevisaoTempo.Create;
begin

end;

destructor TPrevisaoTempo.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TPrevisaoTempo.FindCityID(city, state: string): string;
begin
  Result :=
    TModelData
      .New
        .Token(FToken)
          .FindCityID(city,state);

end;

function TPrevisaoTempo.Return: TPrevisaoModel;
begin
  Result := FEntidade;
end;

procedure TPrevisaoTempo.setCodeCity(const Value: string);
begin
  fCodeCity := Value;
end;

procedure TPrevisaoTempo.SetToken(const Value: string);
begin
  FToken := Value;
end;

end.

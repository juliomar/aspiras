unit Previsao.Model.Interfaces;

interface

uses
  Previsao.Model.Entidade;

type
  IPrevisao = interface
    [ '{C1637195-05C6-44AF-8050-6C49F8C4F1A4}' ]
    function Consultar: string;
  end;

  IPrevisaoData = interface
    [ '{97E9B881-BD31-4C2F-8F78-6222B39730F5}' ]
    function consultarclima: IPrevisaoData;
    function Entidade(Value: TPrevisaoModel): IPrevisaoData;
    function CodeCity(Value: string): IPrevisaoData;
    function Token(Value: string): IPrevisaoData;
    function FindCityID(City, State: string): string;
  end;

implementation

end.

unit Previsao.Model.Entidade;

interface

uses
  System.Classes;

type
  TPrevisaoModel = class
  private
    Fwin_velocity : integer;
    Fcodition     : string;
    Fdate         : string;
    Fhumidity     : double;
    FState        : string;
    Fsensation    : double;
    Fpressure     : double;
    FCountry      : string;
    Fwin_direction: string;
    FTemperature  : double;
    FCity         : string;
    procedure SetCity(const Value: string);
    procedure Setcodition(const Value: string);
    procedure SetCountry(const Value: string);
    procedure Setdate(const Value: string);
    procedure Sethumidity(const Value: double);
    procedure Setpressure(const Value: double);
    procedure Setsensation(const Value: double);
    procedure SetState(const Value: string);
    procedure SetTemperature(const Value: double);
    procedure Setwin_direction(const Value: string);
    procedure Setwin_velocity(const Value: integer);

  public
    property City         : string read FCity write SetCity;
    property State        : string read FState write SetState;
    property Country      : string read FCountry write SetCountry;
    property Temperature  : double read FTemperature write SetTemperature;
    property win_direction: string read Fwin_direction write Setwin_direction;
    property win_velocity : integer read Fwin_velocity write Setwin_velocity;
    property humidity     : double read Fhumidity write Sethumidity;
    property codition     : string read Fcodition write Setcodition;
    property pressure     : double read Fpressure write Setpressure;
    property sensation    : double read Fsensation write Setsensation;
    property date         : string read Fdate write Setdate;
  end;

implementation

  { TPrevisaoModel }

procedure TPrevisaoModel.SetCity(const Value: string);
begin
  FCity := Value;
end;

procedure TPrevisaoModel.Setcodition(const Value: string);
begin
  Fcodition := Value;
end;

procedure TPrevisaoModel.SetCountry(const Value: string);
begin
  FCountry := Value;
end;

procedure TPrevisaoModel.Setdate(const Value: string);
begin
  Fdate := Value;
end;

procedure TPrevisaoModel.Sethumidity(const Value: double);
begin
  Fhumidity := Value;
end;

procedure TPrevisaoModel.Setpressure(const Value: double);
begin
  Fpressure := Value;
end;

procedure TPrevisaoModel.Setsensation(const Value: double);
begin
  Fsensation := Value;
end;

procedure TPrevisaoModel.SetState(const Value: string);
begin
  FState := Value;
end;

procedure TPrevisaoModel.SetTemperature(const Value: double);
begin
  FTemperature := Value;
end;

procedure TPrevisaoModel.Setwin_direction(const Value: string);
begin
  Fwin_direction := Value;
end;

procedure TPrevisaoModel.Setwin_velocity(const Value: integer);
begin
  Fwin_velocity := Value;
end;

end.

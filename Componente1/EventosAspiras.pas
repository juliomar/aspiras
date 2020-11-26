unit EventosAspiras;

interface

uses
  System.Classes;

type
  TNotifyEvent = procedure (Sender:TObject) of Object;

  TEventosAspiras = class(TComponent)

  private
    FNome: string;
    FStatus: TNotifyEvent;
    procedure SetNome(const Value: string);
    procedure SetStatus(const Value: TNotifyEvent);
  public
    function TamanhoString(Value: string): integer;
  published
    property Nome : string read FNome write SetNome;
    property Status : TNotifyEvent read FStatus write SetStatus;
    procedure OnStatus;
  end;

procedure register;

implementation

  { TEventosAspiras }

procedure register;
begin
  RegisterComponents('Aspiras', [ TEventosAspiras ]);
end;

procedure TEventosAspiras.OnStatus;
begin
  if Assigned(Status) then
    Status(Self);
end;

procedure TEventosAspiras.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TEventosAspiras.SetStatus(const Value: TNotifyEvent);
begin
  FStatus := Value;
end;

function TEventosAspiras.TamanhoString(Value: string): integer;
begin
  Nome := Value;
  Result := Length(Value);
  OnStatus;
end;

end.

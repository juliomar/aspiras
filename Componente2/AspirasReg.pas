unit AspirasReg;

interface

uses
  system.Classes;

procedure register;

implementation

uses
  AspirasLegenda,
  AspirasLegendaCC;

procedure register;
begin
  RegisterComponents('Aspiras', [ TAspirasLegenda, TAspirasLegendaCC ]);
end;

end.

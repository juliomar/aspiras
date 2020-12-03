unit Unit2;

interface

type
  TCalc = class
  public
    function add(x, y: integer): integer;
    function sub(x, y: integer): integer;
  end;

implementation

  { TCalc }

function TCalc.add(x, y: integer): integer;
begin
  Result := x + y;
end;

function TCalc.sub(x, y: integer): integer;
begin
  Result := x - y ;
end;

end.

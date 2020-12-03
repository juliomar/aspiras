unit Unit3;

interface

uses
  DUnitX.TestFramework,
  Unit2;

type
  [TestFixture]
  TTesTCalc = class
  strict private
    FCalc : TCalc;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestarSub;
    [TestCase('TesteA','8,2,10')]
    procedure TestAdd(AValor1 , AValor2, _Result : integer);

    [TestCase('TesteSub','3,4,-1')]

    [TestCase('TesteNovo','10, 3, 7')]
    [TestCase('TesteErro','4, 5, -1')]
    procedure TestSub(AValor1,  AValor2, _Result : integer);
  end;

implementation

procedure TTesTCalc.Setup;
begin
  FCalc := TCalc.Create;
end;

procedure TTesTCalc.TearDown;
begin
  FCalc.Free;
end;


procedure TTesTCalc.TestAdd(AValor1, AValor2, _Result: integer);
var
  LResult : Integer;
begin
  LResult := FCalc.add(AValor1,AValor2);
  Assert.AreEqual(LResult,_Result);
end;

procedure TTesTCalc.TestarSub;
var
  LResult : Integer;
begin
  LResult := FCalc.sub(5,6);
  Assert.AreEqual(LResult,-1);
end;

procedure TTesTCalc.TestSub(AValor1, AValor2, _Result: integer);
var
  LResult : Integer;
begin
  LResult := FCalc.sub(AValor1,AValor2);
  Assert.AreEqual(LResult,_Result);
end;

initialization
  TDUnitX.RegisterTestFixture(TTesTCalc);

end.

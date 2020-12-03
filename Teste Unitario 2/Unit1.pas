unit Unit1;

interface

uses
  DUnitX.TestFramework,
  Unit2;

type
  [TestFixture]
  TUsuarioTestes = class
  private
    FUsuario : TUsuario;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ValidarMetodoEntrarNoSistema;

  end;

implementation

uses Delphi.Mocks;

procedure TUsuarioTestes.Setup;
begin
  FUsuario := TUsuario.Create;
end;

procedure TUsuarioTestes.TearDown;
begin
  if Assigned(FUsuario) then
    FUsuario.Free;
end;


procedure TUsuarioTestes.ValidarMetodoEntrarNoSistema;
var
  Mock : TMock<IUsuario>;
begin
  Mock := TMock<IUsuario>.Create;
  Mock.Setup.WillReturn('Juliomar');

  Assert.IsTrue(FUsuario.EntrarNoSistema(TStub<ILog>.Create, Mock)='Entrou','Método Entrar no sistema e logar ficou ok');
end;

initialization
  TDUnitX.RegisterTestFixture(TUsuarioTestes);

end.

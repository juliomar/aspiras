program Project1;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Form1},
  Model.Connection.Interfaces in 'Model\Model.Connection.Interfaces.pas',
  Model.Connection.FireDAC in 'Model\Model.Connection.FireDAC.pas',
  Model.Query.FireDAC in 'Model\Model.Query.FireDAC.pas',
  Model.Connection.Factory in 'Model\Model.Connection.Factory.pas',
  Model.Entidade.Customer in 'Model\Model.Entidade.Customer.pas',
  Model.Entidades.Factory in 'Model\Model.Entidades.Factory.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller.Entidades in 'Controller\Controller.Entidades.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

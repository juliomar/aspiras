program AspirasBiblioteca;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {frmViewPrincipal},
  Model.Conexao.Factory in 'Model\Conexao\Model.Conexao.Factory.pas',
  Model.Conexao.Factory.FireDAC in 'Model\Conexao\Model.Conexao.Factory.FireDAC.pas',
  View.Splash in 'View\View.Splash.pas' {frmViewSplash},
  Model.Config.Conexao in 'Model\Conexao\Model.Config.Conexao.pas',
  View.Cadastrado.Base in 'View\View.Cadastrado.Base.pas' {frmViewCadastroBase},
  View.Cadastro.Biblioteca in 'View\View.Cadastro.Biblioteca.pas' {frmViewCadastroBibliotecas},
  View.Cadastro.Alunos in 'View\View.Cadastro.Alunos.pas' {frmViewCadastroAlunos},
  View.Cadastro.Editoras in 'View\View.Cadastro.Editoras.pas' {frmViewCadastroEditoras},
  View.Cadastro.Livros in 'View\View.Cadastro.Livros.pas' {frmViewCadastroLivros},
  View.Base in 'View\View.Base.pas' {frmViewBase},
  View.Clima in 'View\View.Clima.pas' {frmViewClima},
  Previsao.Model.Entidade in 'Model\Clima\Previsao.Model.Entidade.pas',
  Previsao.Model.Interfaces in 'Model\Clima\Previsao.Model.Interfaces.pas',
  Previsao.Model.Data in 'Model\Clima\Previsao.Model.Data.pas' {ModelData: TDataModule},
  Previsao.Model.Tempo in 'Model\Clima\Previsao.Model.Tempo.pas';

{$R *.res}

begin
  Application.Initialize;

  TfrmViewSplash.ExibirSplash;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Biblioteca Aspiras';
  Application.CreateForm(TfrmViewPrincipal, frmViewPrincipal);
  Application.CreateForm(TModelData, ModelData);
  Application.Run;
end.

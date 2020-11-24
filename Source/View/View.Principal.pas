unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.TitleBarCtrls,
  Vcl.Menus,
  System.Actions,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  System.ImageList,
  Vcl.ImgList, Vcl.Imaging.jpeg;

type
  TfrmViewPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Shape1: TShape;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    actBiblioteca: TAction;
    actAlunos: TAction;
    actEditoras: TAction;
    actLivros: TAction;
    actEmprestimos: TAction;
    actFechar: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    Image1: TImage;
    Label1: TLabel;
    actClima: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    procedure actAlunosExecute(Sender: TObject);
    procedure actBibliotecaExecute(Sender: TObject);
    procedure actClimaExecute(Sender: TObject);
    procedure actEditorasExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actLivrosExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
      { Private declarations }
  public
      { Public declarations }
  end;

var
  frmViewPrincipal: TfrmViewPrincipal;

implementation

{$R *.dfm}

uses
  Model.Conexao.Factory,
  FireDAC.Comp.Client,
  FireDAC.DApt, View.Cadastro.Biblioteca, View.Cadastro.Alunos,
  View.Cadastro.Editoras, View.Cadastro.Livros, View.Clima;

procedure TfrmViewPrincipal.actAlunosExecute(Sender: TObject);
begin
  if not assigned(frmViewCadastroAlunos) then
    frmViewCadastroAlunos := TfrmViewCadastroAlunos.Create(Self);
  frmViewCadastroAlunos.Show;
end;

procedure TfrmViewPrincipal.actBibliotecaExecute(Sender: TObject);
begin
  if not assigned(frmViewCadastroBibliotecas) then
    frmViewCadastroBibliotecas := TfrmViewCadastroBibliotecas.Create(Self);
  frmViewCadastroBibliotecas.Show;
end;

procedure TfrmViewPrincipal.actClimaExecute(Sender: TObject);
begin
  frmViewClima := TfrmViewClima.Create(Application);
  try
    frmViewClima.ShowModal;
  finally
    frmViewClima.Free;
  end;
end;

procedure TfrmViewPrincipal.actEditorasExecute(Sender: TObject);
begin
  if not assigned(frmViewCadastroEditoras) then
    frmViewCadastroEditoras := TfrmViewCadastroEditoras.Create(Self);
  frmViewCadastroEditoras.Show;
end;

procedure TfrmViewPrincipal.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewPrincipal.actLivrosExecute(Sender: TObject);
begin
  if not assigned(frmViewCadastroLivros) then
    frmViewCadastroLivros := TfrmViewCadastroLivros.Create(Self);
  frmViewCadastroLivros.Show;
end;

procedure TfrmViewPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Deseja fechar a aplicação?', mtConfirmation, [ mbYes, mbNo ], 0) = mrYes;
end;

end.

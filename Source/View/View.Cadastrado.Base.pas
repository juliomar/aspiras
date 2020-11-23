unit View.Cadastrado.Base;

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
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  System.Actions,
  Vcl.ActnList,
  Vcl.ToolWin,
  System.ImageList,
  Vcl.ImgList;

type
  TfrmViewCadastroBase = class(TForm)
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    actNovo: TAction;
    actEditar: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actExcluir: TAction;
    actFechar: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    GridPanel1: TGridPanel;
    ImageList1: TImageList;
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      { Private declarations }
  public
      { Public declarations }
  end;

var
  frmViewCadastroBase: TfrmViewCadastroBase;

implementation

{$R *.dfm}

procedure TfrmViewCadastroBase.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewCadastroBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

unit Unit1;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Unit2,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    CampoCodigo: TEdit;
    CampoNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    CampoEstadoCivil: TComboBox;
    CampoSexo: TRadioGroup;
    CampoSenioridade: TTrackBar;
    CampoDataNascimento: TDateTimePicker;
    CampoCorUniforme: TShape;
    CampoPlanoSaude: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    FDMemTable1: TFDMemTable;
    FDMemTable1nome: TStringField;
    DataSource1: TDataSource;
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FListaFuncionarios: TObjectList<TFuncionario>;

    procedure PreencherDataset;
    function IncluirFuncionario(Dados: array of Variant): TFuncionario;
    procedure PreencherCampos(AFuncionario : TFuncionario);
  public

  end;

var
  Form1: TForm1;

implementation

uses
  Rtti;
{$R *.dfm}

procedure TForm1.FDMemTable1AfterScroll(DataSet: TDataSet);
begin
  PreencherCampos(FListaFuncionarios[Pred( FDMemTable1.RecNo)]);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FListaFuncionarios.Free;
end;

function TForm1.IncluirFuncionario(Dados: array of Variant): TFuncionario;
begin
  Result                := TFuncionario.Create;
  Result.Codigo         := Dados[ 0 ];
  Result.Nome           := Dados[ 1 ];
  Result.EstadoCivil    := Dados[ 2 ];
  Result.Sexo           := Dados[ 3 ];
  Result.Senioridade    := Dados[ 4 ];
  Result.DataNascimento := StrToDate( Dados[ 5 ]);
  Result.CorUniforme    := Dados[ 6 ];
  Result.PlanoSaude     := Dados[ 7 ];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FListaFuncionarios := TObjectList<TFuncionario>.Create;

  FListaFuncionarios.Add({}
    IncluirFuncionario([ 1, 'Juliomar', 'Casado(a)', 'Masculino', 3, '02/02/1984', clBlue, True ]));
  FListaFuncionarios.Add({}
    IncluirFuncionario([ 2, 'Maria', 'Solteiro(a)', 'Feminino', 5, '01/05/1988', clYellow, false ]));
  FListaFuncionarios.Add({}
    IncluirFuncionario([ 3, 'Joao', 'Solteiro(a)', 'Masculino', 2, '20/03/1990', clSkyBlue, false ]));
  FListaFuncionarios.Add({}
    IncluirFuncionario([ 4, 'Joana', 'Casado(a)', 'Femenino', 4, '13/05/1989', clRed, True ]));

  PreencherDataset;
end;

  { TForm1 }

procedure TForm1.PreencherCampos(AFuncionario: TFuncionario);
var
  LContexto : TRttiContext;
  LTipo : TRttiType;
  LPropriedade : TRttiProperty;
  LValor : Variant;
  LComponente : TComponent;
begin
  LContexto := TRttiContext.Create.Create;
  try
    LTipo := LContexto.GetType(TFuncionario.ClassInfo);

    for LPropriedade in LTipo.GetProperties do
    begin
      LValor := LPropriedade.GetValue(AFuncionario).AsVariant;
      LComponente := FindComponent('Campo'+LPropriedade.Name);

      if LComponente is TEdit then
        (LComponente as TEdit).Text := LValor;
      if LComponente is  TComboBox then
        (LComponente as TComboBox).ItemIndex := (LComponente as TComboBox).Items.IndexOf(LValor);
      if LComponente  is TRadioGroup then
        (LComponente as TRadioGroup).ItemIndex := (LComponente as TRadioGroup).Items.IndexOf(LValor);
      if LComponente  is TCheckBox then
        (LComponente as TCheckBox).Checked := LValor;
      if LComponente is TTrackBar then
        (LComponente as TTrackBar).Position := LValor;
      if LComponente is TDateTimePicker then
        (LComponente as TDateTimePicker).Date := LValor;
      if LComponente is TShape then
        (LComponente as TShape).Brush.Color := LValor;

    end;


  finally
    LContexto.Free;
  end;

end;

procedure TForm1.PreencherDataset;
var
  LContexto       : TRttiContext;
  LTipo           : TRttiType;
  LPropriedadeNome: TRttiProperty;
  LFuncionario    : TFuncionario;
begin
  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(TFuncionario.ClassInfo);

    LPropriedadeNome := LTipo.GetProperty('Nome');

    for LFuncionario in FListaFuncionarios do
    begin
      FDMemTable1.AppendRecord([ LPropriedadeNome.GetValue(LFuncionario).AsString ]);
    end;
    FDMemTable1.First;
  finally
    LContexto.Free;
  end;

end;



end.

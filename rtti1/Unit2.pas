unit Unit2;

interface
uses vcl.Graphics;

type
  TFuncionario = class
  private
    FCodigo: integer;
    FNome: string;
    FEstadoCivil: string;
    FSexo: string;
    FSenioridade: integer;
    FDataNascimento: TDatetime;
    FCorUniforme: Tcolor;
    FPlanoSaude: Boolean;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property EstadoCivil: string read FEstadoCivil write FEstadoCivil;
    property Sexo: string read FSexo write FSexo;
    property Senioridade: integer read FSenioridade write FSenioridade;
    property DataNascimento: TDatetime read FDataNascimento write FDataNascimento;
    property CorUniforme: Tcolor read FCorUniforme write FCorUniforme;
    property PlanoSaude: Boolean read FPlanoSaude write FPlanoSaude;
  end;

implementation

end.

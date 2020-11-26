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
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Datasnap.DBClient;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    FSQLDescricao: string;
    FDataset     : tclientdataset;
    FSQLCodigo   : string;
    procedure SetDataset(const Value: tclientdataset);
    procedure SetSQLCodigo(const Value: string);
    procedure SetSQLDescricao(const Value: string);
      { Private declarations }
  public
    procedure Buscar;
    function GetCodigo: integer;
    property Dataset: tclientdataset read FDataset write SetDataset;
    property SQLCodigo: string read FSQLCodigo write SetSQLCodigo;
    property SQLDescricao: string read FSQLDescricao write SetSQLDescricao;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if FDataset.RecordCount > 0 then
  begin
    ModalResult := mrOk;
    close;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  close;

end;

  { TForm1 }

procedure TForm1.Buscar;
begin
  FDataset.close;
  if RadioGroup1.ItemIndex = 0 then
  begin
    FDataset.CommandText           := FSQLCodigo;
    FDataset.Params[ 0 ].AsInteger := StrToInt(Edit1.Text);
  end
  else
  begin
    FDataset.CommandText          := FSQLDescricao;
    FDataset.Params[ 0 ].AsString := '%' + Edit1.Text + '%';
  end;
  FDataset.Open;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  BitBtn1.Enabled := FDataset.RecordCount > 0;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Edit1.Text <> '' then
    begin
      if Assigned(FDataset) then
      begin
        Buscar;
        DBGrid1.SetFocus;
        StatusBar1.SimpleText := format('%d registro(s) encontrado(s) com "%s"', [ FDataset.RecordCount, Edit1.Text ]);
        Key                   := #0;
      end;
    end;
end;

function TForm1.GetCodigo: integer;
begin
  Result := FDataset.Fields[ 0 ].AsInteger;
end;

procedure TForm1.SetDataset(const Value: tclientdataset);
begin
  if FDataset <> Value then
  begin
    FDataset            := Value;
    DataSource1.Dataset := FDataset;
  end;
end;

procedure TForm1.SetSQLCodigo(const Value: string);
begin
  FSQLCodigo := Value;
end;

procedure TForm1.SetSQLDescricao(const Value: string);
begin
  FSQLDescricao := Value;
end;

end.

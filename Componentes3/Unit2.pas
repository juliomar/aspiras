unit Unit2;

interface

uses
  system.Classes,
  vcl.Forms,
  data.DB,
  dialogs,
  Unit1,
  Graphics,
  controls,
  dbclient;

type
  TAspirasLocalizar = class(TComponent)
  private
    FDataset     : TClientDataSet;
    FSQLDescricao: string;
    FSQLCodigo   : string;
    procedure SetDataset(const Value: TClientDataSet);
    procedure SetSQLCodigo(const Value: string);
    procedure SetSQLDescricao(const Value: string);
  protected
   procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    function Execute: Boolean;
    function ReturnValue: integer;
  published
    property Dataset     : TClientDataSet read FDataset write SetDataset;
    property SQLCodigo   : string read FSQLCodigo write SetSQLCodigo;
    property SQLDescricao: string read FSQLDescricao write SetSQLDescricao;
  end;

procedure register;

implementation

  { TAspirasLocalizar }

procedure register;
begin
  RegisterComponents('Aspiras', [ TAspirasLocalizar ]);
end;

function TAspirasLocalizar.Execute: Boolean;
begin
  if not FDataset.Active then
    FDataset.Active := True;
  Form1             := TForm1.Create(nil);
  try
    Form1.Dataset      := FDataset;
    Form1.SQLCodigo    := FSQLCodigo;
    Form1.SQLDescricao := FSQLDescricao;
    Form1.ShowModal;
    Result := Form1.ModalResult = mrOk;
  finally
    Form1.Free;
  end;
end;

procedure TAspirasLocalizar.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent = FDataSet then
      FDataSet := nil;
end;

function TAspirasLocalizar.ReturnValue: integer;
begin

end;

procedure TAspirasLocalizar.SetDataset(const Value: TClientDataSet);
begin
  FDataset := Value;
end;

procedure TAspirasLocalizar.SetSQLCodigo(const Value: string);
begin
  FSQLCodigo := Value;
end;

procedure TAspirasLocalizar.SetSQLDescricao(const Value: string);
begin
  FSQLDescricao := Value;
end;

end.

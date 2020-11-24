unit View.Clima;

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
  View.Base,
  Vcl.ExtCtrls,
  REST.Types,
  Vcl.StdCtrls,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  REST.Response.Adapter,
  Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmViewClima = class(TfrmViewBase)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Button2: TButton;
    DataSource1: TDataSource;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
      { Private declarations }
  public
      { Public declarations }
  end;

var
  frmViewClima: TfrmViewClima;

implementation

{$R *.dfm}

uses
  Previsao.Model.Tempo;

procedure TfrmViewClima.Button1Click(Sender: TObject);
begin
  RESTClient1.BaseURL := Edit2.Text;

  RESTRequest1.Execute;

  if RESTResponse1.StatusCode = 200 then
    Memo1.Lines.Text := RESTResponse1.JSONValue.ToString
  else
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add(RESTResponse1.StatusCode.ToString);
    Memo1.Lines.Add(RESTResponse1.StatusText);
  end;
end;

procedure TfrmViewClima.Button2Click(Sender: TObject);
begin
  DataSource1.DataSet := FDMemTable1;

  RESTRequest2.Execute;

end;

procedure TfrmViewClima.Button3Click(Sender: TObject);
begin
  DataSource1.DataSet := FDMemTable2;

  RESTClient3.BaseURL := format('http://viacep.com.br/ws/%s/json', [ Edit1.Text ]);

  RESTRequest3.Execute;
end;

procedure TfrmViewClima.Button4Click(Sender: TObject);
var
  LPrevisao: TPrevisaoTempo;
begin
  LPrevisao := TPrevisaoTempo.Create;
  try
    LPrevisao.Token    := '97a8f41ef0d91a0b843d52c210ece558';
    LPrevisao.CodeCity := LPrevisao.FindCityID('Sarandi', 'PR');
    LPrevisao.ConsultaPrevisao;
    ShowMessage(LPrevisao.Return.Temperature.ToString);
  finally
    LPrevisao.free;
  end;

end;

end.

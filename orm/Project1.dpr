program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ConnectionModule in 'ConnectionModule.pas' {SQLiteConnection: TDataModule},
  Unit2 in 'Unit2.pas',
  SqlMonitor in 'SqlMonitor.pas' {SqlMonitorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSQLiteConnection, SQLiteConnection);
  Application.Run;
end.

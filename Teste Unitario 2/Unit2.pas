unit Unit2;

interface

uses sysutils;

type

{$M+}
  ILog = interface
    ['{14F51C79-D397-4E72-831E-38EC9C7C9239}']
    procedure Logar(ATexto : string);
  end;
  IUsuario = interface
    ['{E5F3BEB0-C454-4ADA-A9BE-F0DB306E9C50}']
    function NomeUsuario : string;
  end;

  TUsuario = class
  public
    function EntrarNoSistema(ALog: ILog; Ausuario: IUsuario): string;
  end;
{$M-}


implementation


{ TUsuario }

function TUsuario.EntrarNoSistema(ALog: ILog; Ausuario: IUsuario): string;
begin
  //ALog.Logar('Gravar dados');
  ALog.Logar(Format( 'Usuário %s entrou no sistema',[Ausuario.NomeUsuario]));
  Result := 'Entrou';
end;

end.

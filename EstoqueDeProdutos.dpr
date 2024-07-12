program EstoqueDeProdutos;

uses
  Vcl.Forms,
  UnitLogin in 'Forms\UnitLogin.pas' {FormLogin},
  UnitDMLogin in 'DMs\UnitDMLogin.pas' {DMLogin: TDataModule},
  UnitPrincipal in 'Forms\UnitPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TDMLogin, DMLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.

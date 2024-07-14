program EstoqueDeProdutos;

uses
  Vcl.Forms,
  UnitLogin in 'Forms\UnitLogin.pas' {FormLogin},
  UnitDMLogin in 'DMs\UnitDMLogin.pas' {DMLogin: TDataModule},
  UnitPrincipal in 'Forms\UnitPrincipal.pas' {FormPrincipal},
  Usuario in 'Class\Usuario.pas',
  UnitSobre in 'Forms\UnitSobre.pas' {FormSobre},
  UnitCadUsuario in 'Forms\Cadastros\UnitCadUsuario.pas' {FormCadUsuario},
  UnitDMPrincipal in 'DMs\UnitDMPrincipal.pas' {DMPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TDMLogin, DMLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormSobre, FormSobre);
  Application.CreateForm(TFormCadUsuario, FormCadUsuario);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.

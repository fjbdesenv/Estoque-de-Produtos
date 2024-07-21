program EstoqueDeProdutos;

uses
  Vcl.Forms,
  UnitLogin in 'Forms\UnitLogin.pas' {FormLogin},
  UnitDMLogin in 'DMs\UnitDMLogin.pas' {DMLogin: TDataModule},
  UnitPrincipal in 'Forms\UnitPrincipal.pas' {FormPrincipal},
  Usuario in 'Class\Usuario.pas',
  UnitSobre in 'Forms\UnitSobre.pas' {FormSobre},
  UnitCadUsuario in 'Forms\Cadastros\UnitCadUsuario.pas' {FormCadUsuario},
  UnitDMPrincipal in 'DMs\UnitDMPrincipal.pas' {DMPrincipal: TDataModule},
  UnitCadVariacao in 'Forms\Cadastros\UnitCadVariacao.pas' {FormCadVariacao},
  UnitConstantes in 'Constants\UnitConstantes.pas',
  UnitCadTamanho in 'Forms\Cadastros\UnitCadTamanho.pas' {FormCadTamanho},
  UnitCadProduto in 'Forms\Cadastros\UnitCadProduto.pas' {FormCadProduto},
  UnitCadMovimentoEstoque in 'Forms\Cadastros\UnitCadMovimentoEstoque.pas' {FormCadMov};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TDMLogin, DMLogin);
  Application.CreateForm(TFormSobre, FormSobre);
  Application.CreateForm(TFormCadUsuario, FormCadUsuario);
  Application.CreateForm(TFormCadVariacao, FormCadVariacao);
  Application.CreateForm(TFormCadTamanho, FormCadTamanho);
  Application.CreateForm(TFormCadProduto, FormCadProduto);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFormCadMov, FormCadMov);
  Application.Run;
end.

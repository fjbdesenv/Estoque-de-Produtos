unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdBaseComponent, IdUserPassProvider;

type
  TFormLogin = class(TForm)
    PanelPrincipal: TPanel;
    LabelNome: TLabel;
    LabelLogin: TLabel;
    EditNome: TEdit;
    LabelSenha: TLabel;
    EditSenha: TEdit;
    ButtonLogin: TButton;
    procedure ButtonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses UnitDMLogin, UnitPrincipal;


procedure TFormLogin.ButtonLoginClick(Sender: TObject);
var
  Resultado: String;
begin
  DMLogin.sqlLogin.Close;
  DMLogin.sqlLogin.Params.ParamByName('pNome').Value := EditNome.Text;
  DMLogin.sqlLogin.Params.ParamByName('pSenha').Value := EditSenha.Text;
  DMLogin.sqlLogin.Open;

  Resultado := DMLogin.sqlLogin.FieldByName('RESULTADO').AsString;

  if(Resultado = '1') then
  begin
    DMLogin.Conexao.Close;
    FormLogin.Visible := False;
    FormPrincipal.ShowModal;
    FormLogin.Close;
  end
  else
    ShowMessage('Usuário ou senha incorreto.');

  DMLogin.sqlLogin.Close;
end;

end.

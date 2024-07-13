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
    procedure FormShow(Sender: TObject);
    procedure ResetCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses UnitDMLogin, UnitPrincipal, Usuario;


procedure TFormLogin.ButtonLoginClick(Sender: TObject);
var
  Resultado: String;
  Usuario : TUsuario;
begin
  Usuario         := TUsuario.Create;

  try
    DMLogin.Conexao.Open;

    DMLogin.sqlLogin.Close;
    DMLogin.sqlLogin.Params.ParamByName('pNome').Value := EditNome.Text;
    DMLogin.sqlLogin.Params.ParamByName('pSenha').Value := EditSenha.Text;
    DMLogin.sqlLogin.Open;

    if (DMLogin.sqlLogin.RecordCount > 0) then
    begin
      FormLogin.Visible := False;

      Usuario.codigo  := DMLogin.sqlLogin.FieldByName('codigo').AsInteger;
      Usuario.nome    := DMLogin.sqlLogin.FieldByName('nome').AsString;
      Usuario.nivel   := DMLogin.sqlLogin.FieldByName('nivel').AsInteger;

      FormPrincipal.SetUsuario(Usuario);
      FormPrincipal.Visible := True;
    end
    else
      ShowMessage('Usuário ou senha incorreto.');

  finally
    DMLogin.Conexao.Close;
    Usuario.Free;
  end;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  ResetCampos;
  DMLogin.Conexao.Open;
end;

procedure TFormLogin.ResetCampos;
begin
  FormLogin.EditNome.Text := '';
  FormLogin.EditSenha.Text := '';
end;

end.

unit UnitCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TFormCadUsuario = class(TForm)
    PanelSuperior: TPanel;
    LabelTitulo: TLabel;
    PanelInferior: TPanel;
    campoCodigo: TDBEdit;
    LabelNome: TLabel;
    campoNome: TDBEdit;
    campoSenha: TDBEdit;
    LabelSenha: TLabel;
    campoDataCriacao: TDBEdit;
    LabelDataCriacao: TLabel;
    campoDataEdicao: TDBEdit;
    LabelDataEdicao: TLabel;
    PanelCentral: TPanel;
    campoNivel: TRadioGroup;
    ButtonNovo: TSpeedButton;
    ButtonGravar: TSpeedButton;
    ButtonCancelar: TSpeedButton;
    procedure AtualizarNivel;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure MostrarCampos(show: Boolean);
    function VerificarCampos():Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadUsuario: TFormCadUsuario;

implementation

{$R *.dfm}

uses UnitDMPrincipal;

procedure TFormCadUsuario.AtualizarNivel;
var
  NivelString:String;
  NivelInteger:Integer;
begin
  NivelInteger := 0;
  NivelString := DMPrincipal.TableUsuario.FieldByName('nivel').AsString;

  if(NivelString = 'Usuário') then
    NivelInteger := 0

  else if(NivelString = 'Gerente') then
    NivelInteger := 1

  else if(NivelString = 'Administrador') then
    NivelInteger := 2;

  DMPrincipal.TableUsuario.FieldByName('nivel').AsInteger := NivelInteger;
end;

procedure TFormCadUsuario.MostrarCampos(show: Boolean);
begin
  ButtonGravar.Enabled      := show;
  ButtonCancelar.Enabled    := show;
  ButtonNovo.Enabled        := not show;

  campoCodigo.Visible       := show;
  PanelCentral.Visible      := show;
  campoNivel.ItemIndex      := -1;
end;

function TFormCadUsuario.VerificarCampos:Boolean;
var
  MessageErro: String;
begin
  MessageErro := '';
  Result := True;

  if (campoNivel.ItemIndex = -1) then
  begin
    MessageErro := 'Selecione o nível do usuário.';
    Result := False;
  end

  else if (campoNome.Text = '') then
  begin
    MessageErro := 'Preencha o campo Nome.';
    Result := False;
  end

  else if (campoSenha.Text = '') then
  begin
    MessageErro := 'Preencha o campo Senha.';
    Result := False;
  end;

  if(MessageErro <> '') then
    Application.MessageBox(PChar(MessageErro), 'Atenção', MB_ICONEXCLAMATION+MB_OK);

end;

procedure TFormCadUsuario.ButtonCancelarClick(Sender: TObject);
begin
  try
    DMPrincipal.TableUsuario.Cancel;
    MostrarCampos(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadUsuario.ButtonGravarClick(Sender: TObject);
begin
  try
    AtualizarNivel;

    if(not VerificarCampos()) then
      Exit;

    DMPrincipal.TableUsuario.Post;
    MostrarCampos(True);
    ButtonGravar.Enabled      := False;
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadUsuario.ButtonNovoClick(Sender: TObject);
begin
  try
    DMPrincipal.TableUsuario.Append;
    MostrarCampos(True);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

end.

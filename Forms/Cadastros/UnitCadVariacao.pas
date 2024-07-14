unit UnitCadVariacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TFormCadVariacao = class(TForm)
    PanelInferior: TPanel;
    ButtonNovo: TSpeedButton;
    ButtonGravar: TSpeedButton;
    ButtonCancelar: TSpeedButton;
    PanelCentral: TPanel;
    LabelDescricao: TLabel;
    LabelSenha: TLabel;
    LabelDataCriacao: TLabel;
    LabelDataEdicao: TLabel;
    campoDescricao: TDBEdit;
    campoAbreviatura: TDBEdit;
    campoDataCriacao: TDBEdit;
    campoDataEdicao: TDBEdit;
    campoCodigo: TDBEdit;
    PanelSuperior: TPanel;
    LabelTitulo: TLabel;
    procedure ButtonNovoClick(Sender: TObject);
    procedure MostrarCampos(show: Boolean);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    function VerificarCampos:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadVariacao: TFormCadVariacao;

implementation

{$R *.dfm}

uses UnitDMPrincipal;

procedure TFormCadVariacao.ButtonCancelarClick(Sender: TObject);
begin
  try
    DMPrincipal.TableVariacao.Cancel;
    MostrarCampos(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadVariacao.ButtonGravarClick(Sender: TObject);
begin
  try
    if(not VerificarCampos()) then
      Exit;

    DMPrincipal.TableVariacao.Post;
    MostrarCampos(True);
    ButtonGravar.Enabled      := False;
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadVariacao.ButtonNovoClick(Sender: TObject);
begin
   try
    DMPrincipal.TableVariacao.Insert;
    MostrarCampos(True);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadVariacao.MostrarCampos(show: Boolean);
begin
  ButtonGravar.Enabled      := show;
  ButtonCancelar.Enabled    := show;
  ButtonNovo.Enabled        := not show;

  campoCodigo.Visible       := show;
  PanelCentral.Visible      := show;
end;

function TFormCadVariacao.VerificarCampos:Boolean;
var
  MessageErro: String;
begin
  MessageErro := '';
  Result := True;

  if (campoDescricao .Text = '') then
  begin
    MessageErro := 'Preencha o campo Descrição.';
    Result := False;
  end

  else if (campoAbreviatura.Text = '') then
  begin
    MessageErro := 'Preencha o campo Abreviatura.';
    Result := False;
  end;

  if(MessageErro <> '') then
    Application.MessageBox(PChar(MessageErro), 'Atenção', MB_ICONEXCLAMATION+MB_OK);
end;
end.

unit UnitCadTamanho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TFormCadTamanho = class(TForm)
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
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure MostrarCampos(show: Boolean);
    function VerificarCampos:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadTamanho: TFormCadTamanho;

implementation

{$R *.dfm}

uses UnitDMPrincipal;

procedure TFormCadTamanho.ButtonCancelarClick(Sender: TObject);
begin
  try
    DMPrincipal.TableTamanho.Cancel;
    MostrarCampos(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadTamanho.ButtonGravarClick(Sender: TObject);
begin
  try
    if(not VerificarCampos()) then
      Exit;

    DMPrincipal.TableTamanho.Post;
    MostrarCampos(True);
    ButtonGravar.Enabled      := False;
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadTamanho.ButtonNovoClick(Sender: TObject);
begin
   try
    DMPrincipal.TableTamanho.Insert;
    MostrarCampos(True);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadTamanho.MostrarCampos(show: Boolean);
begin
  ButtonGravar.Enabled      := show;
  ButtonCancelar.Enabled    := show;
  ButtonNovo.Enabled        := not show;

  campoCodigo.Visible       := show;
  PanelCentral.Visible      := show;
end;

function TFormCadTamanho.VerificarCampos:Boolean;
var
  MessageErro: String;
begin
  MessageErro := '';
  Result := True;

  if (campoDescricao .Text = '') then
  begin
    MessageErro := 'Preencha o campo Descri��o.';
    Result := False;
  end

  else if (campoAbreviatura.Text = '') then
  begin
    MessageErro := 'Preencha o campo Abreviatura.';
    Result := False;
  end;

  if(MessageErro <> '') then
    Application.MessageBox(PChar(MessageErro), 'Aten��o', MB_ICONEXCLAMATION+MB_OK);
end;

end.
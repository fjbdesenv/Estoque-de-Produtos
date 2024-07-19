unit UnitCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadProduto = class(TForm)
    PanelInferior: TPanel;
    ButtonNovo: TSpeedButton;
    ButtonGravar: TSpeedButton;
    ButtonCancelar: TSpeedButton;
    PanelCentral: TPanel;
    LabelDescricao: TLabel;
    LabelDataCriacao: TLabel;
    LabelDataEdicao: TLabel;
    campoDescricao: TDBEdit;
    campoCodigo: TDBEdit;
    PanelSuperior: TPanel;
    LabelTitulo: TLabel;
    LabelTamanho: TLabel;
    LabelVariacao: TLabel;
    campoTamanho: TDBLookupComboBox;
    campoVariacao: TDBLookupComboBox;
    GridDetalheProduto: TDBGrid;
    ButtonGravarDet: TSpeedButton;
    ButtonCancelarDet: TSpeedButton;
    PanelDetalhamneto: TPanel;
    ButtonNovoDet: TSpeedButton;
    campoDataCriacao: TDBEdit;
    campoDataEdicao: TDBEdit;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure MostrarCamposProduto(show: Boolean);
    procedure MostrarDetalhamento(show: Boolean);
    procedure HabilitarCamposDet(show: Boolean);
    procedure HabilitarCamposPro(show: Boolean);
    function VerificarCampos:Boolean;
    procedure ButtonCancelarDetClick(Sender: TObject);
    procedure ButtonGravarDetClick(Sender: TObject);
    procedure ButtonNovoDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadProduto: TFormCadProduto;
  CodigoProduto: Integer;

implementation

{$R *.dfm}

uses UnitDMPrincipal;

procedure TFormCadProduto.MostrarCamposProduto(show: Boolean);
begin
  HabilitarCamposPro(show);

  campoCodigo.Visible       := show;
  PanelCentral.Visible      := show;
end;

procedure TFormCadProduto.MostrarDetalhamento(show: Boolean);
begin
   // Filtra apenas os detalhamentos do produto
   DMPrincipal.TableProdDet.Filtered := False;
   DMPrincipal.TableProdDet.Filter   := 'codigo_produto = ' + IntToStr(CodigoProduto);
   DMPrincipal.TableProdDet.Filtered := True;

   PanelDetalhamneto.Visible := show;
   PanelDetalhamneto.Enabled := show;
end;

procedure TFormCadProduto.ButtonCancelarClick(Sender: TObject);
begin
  try
    DMPrincipal.TableProduto.Cancel;
    MostrarCamposProduto(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.ButtonCancelarDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableProdDet.Cancel;

    HabilitarCamposDet(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.ButtonGravarClick(Sender: TObject);
begin
  try
    if(not VerificarCampos()) then
      Exit;

    DMPrincipal.TableProduto.Post;
    CodigoProduto := DMPrincipal.TableProduto.FieldByName('codigo').AsInteger;

    MostrarCamposProduto(True);
    MostrarDetalhamento(True);

    ButtonGravar.Enabled      := False;
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.ButtonGravarDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableProdDet.FieldByName('codigo_produto').AsInteger := CodigoProduto;
    DMPrincipal.TableProdDet.Post;

    HabilitarCamposDet(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.ButtonNovoClick(Sender: TObject);
begin
  try
    DMPrincipal.TableProduto.Close;
    DMPrincipal.TableProduto.Open;
    DMPrincipal.TableProduto.Append;
    MostrarCamposProduto(True);
    MostrarDetalhamento(False);

  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.ButtonNovoDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableProdDet.Close;
    DMPrincipal.TableProdDet.Open;
    DMPrincipal.TableProdDet.Append;

    HabilitarCamposDet(True);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadProduto.HabilitarCamposDet(show: Boolean);
begin
    ButtonGravarDet.Enabled       := show;
    ButtonCancelarDet.Enabled     := show;
    ButtonNovoDet.Enabled         := not show;
    campoVariacao.Enabled         := show;
    campoTamanho.Enabled          := show;
end;

procedure TFormCadProduto.HabilitarCamposPro(show: Boolean);
begin
  ButtonGravar.Enabled      := show;
  ButtonCancelar.Enabled    := show;
  ButtonNovo.Enabled        := not show;
end;

function TFormCadProduto.VerificarCampos:Boolean;
var
  MessageErro: String;
begin
  MessageErro := '';
  Result := True;

  if (campoDescricao .Text = '') then
  begin
    MessageErro := 'Preencha o campo Descrição.';
    Result := False;
  end;

  if(MessageErro <> '') then
    Application.MessageBox(PChar(MessageErro), 'Atenção', MB_ICONEXCLAMATION+MB_OK);
end;

end.

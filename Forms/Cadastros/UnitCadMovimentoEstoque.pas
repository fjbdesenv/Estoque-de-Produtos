unit UnitCadMovimentoEstoque;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFormCadMov = class(TForm)
    LabelTitulo: TLabel;
    PanelInferior: TPanel;
    ButtonNovo: TSpeedButton;
    ButtonGravar: TSpeedButton;
    ButtonCancelar: TSpeedButton;
    PanelCentral: TPanel;
    LabelDataCriacao: TLabel;
    LabelDataEdicao: TLabel;
    PanelDetalhamento: TPanel;
    LabelVariacao: TLabel;
    LabelTamanho: TLabel;
    ButtonCancelarDet: TSpeedButton;
    ButtonGravarDet: TSpeedButton;
    ButtonNovoDet: TSpeedButton;
    GridDetalheProduto: TDBGrid;
    campoTamanho: TDBLookupComboBox;
    campoVariacao: TDBLookupComboBox;
    campoDataCriacao: TDBEdit;
    campoDataEdicao: TDBEdit;
    campoCodigo: TDBEdit;
    LabelProduto: TLabel;
    campoProduto: TDBLookupComboBox;
    campoObservacao: TDBMemo;
    campoTipo: TRadioGroup;
    LabelObservacao: TLabel;
    PanelMovimento: TPanel;
    PanelSuperior: TPanel;
    campoQuantidade: TDBEdit;
    LabelQuantidade: TLabel;
    procedure ButtonGravarClick(Sender: TObject);
    procedure AtualizarTipoMov;
    procedure MostrarDetalhamento(show: Boolean);
    procedure MostrarCamposMov(show: Boolean);
    procedure HabilitarCamposDet(show: Boolean);
    procedure HabilitarCamposMov(show: Boolean);
    function VerificarCampos:Boolean;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonNovoDetClick(Sender: TObject);
    procedure ButtonGravarDetClick(Sender: TObject);
    procedure ButtonCancelarDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadMov: TFormCadMov;
  CodigoMov: Integer;

implementation

{$R *.dfm}

uses UnitDMPrincipal;

procedure TFormCadMov.AtualizarTipoMov;
var
  TipoString:String;
  TipolInteger:Integer;
begin
  TipolInteger := 0;
  TipoString := campoTipo.Items[campoTipo.ItemIndex];

  if(TipoString = 'Entrada') then
    TipolInteger := 1

  else if(TipoString = 'Saída') then
    TipolInteger := 2;

  DMPrincipal.TableMov.FieldByName('tipo').AsInteger := TipolInteger;
end;

procedure TFormCadMov.MostrarCamposMov(show: Boolean);
begin
  HabilitarCamposMov(show);

  PanelMovimento.Visible := show;
  PanelCentral.Visible := show;
end;

procedure TFormCadMov.MostrarDetalhamento(show: Boolean);
begin
   // Filtra apenas os detalhamentos do produto
   DMPrincipal.TableMovProd.Filtered := False;
   DMPrincipal.TableMovProd.Filter   := 'codigo_movimento = ' + IntToStr(CodigoMov);
   DMPrincipal.TableMovProd.Filtered := True;

   PanelDetalhamento.Visible := show;
   PanelDetalhamento.Enabled := show;
end;

procedure TFormCadMov.HabilitarCamposDet(show: Boolean);
begin
    ButtonGravarDet.Enabled       := show;
    ButtonCancelarDet.Enabled     := show;
    ButtonNovoDet.Enabled         := not show;

    campoProduto.Enabled          := show;
    campoVariacao.Enabled         := show;
    campoTamanho.Enabled          := show;
end;

procedure TFormCadMov.HabilitarCamposMov(show: Boolean);
begin
  ButtonGravar.Enabled      := show;
  ButtonCancelar.Enabled    := show;
  ButtonNovo.Enabled        := not show;
end;

procedure TFormCadMov.ButtonCancelarClick(Sender: TObject);
begin
  try
    DMPrincipal.TableMov.Cancel;
    MostrarCamposMov(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadMov.ButtonCancelarDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableMovProd.Cancel;

    HabilitarCamposDet(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadMov.ButtonGravarClick(Sender: TObject);
begin
  try
    if(not VerificarCampos()) then
      Exit;

    AtualizarTipoMov;

    DMPrincipal.TableMov.Post;
    CodigoMov := DMPrincipal.TableMov.FieldByName('codigo').AsInteger;

    MostrarCamposMov(True);
    MostrarDetalhamento(True);

    ButtonGravar.Enabled      := False;
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadMov.ButtonGravarDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableMovProd.Post;

    HabilitarCamposDet(False);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadMov.ButtonNovoClick(Sender: TObject);
begin
try
    DMPrincipal.TableMov.Close;
    DMPrincipal.TableMov.Open;
    DMPrincipal.TableMov.Append;

    MostrarCamposMov(True);
    MostrarDetalhamento(False);

  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

procedure TFormCadMov.ButtonNovoDetClick(Sender: TObject);
begin
  try
    DMPrincipal.TableMovProd.Close;
    DMPrincipal.TableMovProd.Open;
    DMPrincipal.TableMovProd.Append;

    DMPrincipal.TableMovProd.FieldByName('codigo_movimento').AsInteger := CodigoMov;
    campoQuantidade.Text := '1';

    HabilitarCamposDet(True);
  except
    On e: Exception do
      Application.MessageBox(PChar(e.Message), 'Erro', MB_ICONERROR+MB_OK);
  end;
end;

function TFormCadMov.VerificarCampos:Boolean;
var
  MessageErro: String;
begin
  MessageErro := '';
  Result := True;

  if (campoTipo.ItemIndex = -1) then
  begin
    MessageErro := 'Preencha o campo Tipo de Movimento';
    Result := False;
  end;

  if(MessageErro <> '') then
    Application.MessageBox(PChar(MessageErro), 'Atenção', MB_ICONEXCLAMATION+MB_OK);
end;

end.

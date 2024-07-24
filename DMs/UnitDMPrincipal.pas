unit UnitDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMPrincipal = class(TDataModule)
    Conexao: TFDConnection;
    TableUsuario: TFDTable;
    TableUsuariocodigo: TFDAutoIncField;
    TableUsuarionivel: TShortintField;
    TableUsuarionome: TStringField;
    TableUsuariosenha: TStringField;
    TableUsuariodata_criacao: TDateTimeField;
    TableUsuariodata_alteracao: TDateTimeField;
    DataSourceUsuario: TDataSource;
    DataSourceTamanho: TDataSource;
    TableTamanho: TFDTable;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    TableVariacao: TFDTable;
    TableProduto: TFDTable;
    DataSourceProduto: TDataSource;
    TableVariacaocodigo: TFDAutoIncField;
    TableVariacaodescricao: TStringField;
    TableVariacaoabreviatura: TStringField;
    TableVariacaodata_criacao: TDateTimeField;
    TableVariacaodata_alteracao: TDateTimeField;
    DataSourceMov: TDataSource;
    TableMov: TFDTable;
    TableProdutocodigo: TFDAutoIncField;
    TableProdutodescricao: TStringField;
    TableProdutodata_criacao: TDateTimeField;
    TableProdutodata_alteracao: TDateTimeField;
    TableMovcodigo: TFDAutoIncField;
    TableMovtipo: TShortintField;
    TableMovfechado: TShortintField;
    TableMovobservacao: TStringField;
    TableMovdata_criacao: TDateTimeField;
    TableMovdata_alteracao: TDateTimeField;
    DataSourceMovProd: TDataSource;
    TableProdDet: TFDTable;
    DataSourceProdDet: TDataSource;
    TableProdDetcodigo: TFDAutoIncField;
    TableProdDetcodigo_produto: TIntegerField;
    TableProdDetcodigo_variacao: TIntegerField;
    TableProdDetcodigo_tamanho: TIntegerField;
    TableProdDetpeso: TIntegerField;
    TableProdDetsaldo: TIntegerField;
    TableProdDetdata_criacao: TDateTimeField;
    TableProdDetdata_alteracao: TDateTimeField;
    TableMovProd: TFDTable;
    TableMovProdcodigo: TFDAutoIncField;
    TableMovProdcodigo_movimento: TIntegerField;
    TableMovProdcodigo_variacao: TIntegerField;
    TableMovProdcodigo_produto: TIntegerField;
    TableMovProdcodigo_tamanho: TIntegerField;
    TableMovProdquantidade: TIntegerField;
    TableMovProddata_criacao: TDateTimeField;
    TableMovProddata_alteracao: TDateTimeField;
    SQLAtualizarSaldo: TFDQuery;
    procedure TableMovProdBeforePost(DataSet: TDataSet);
    procedure AtualizarSaldo(Opcao:Integer);
    procedure TableMovProdBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPrincipal.TableMovProdBeforeDelete(DataSet: TDataSet);
begin
  AtualizarSaldo(2);
end;

procedure TDMPrincipal.TableMovProdBeforePost(DataSet: TDataSet);
begin
  AtualizarSaldo(1);
end;

procedure TDMPrincipal.AtualizarSaldo(Opcao:Integer);
var
  Tipo, Valor: Integer;
begin
  Tipo := TableMov.FieldByName('tipo').AsInteger;
  Valor := TableMovProd.FieldByName('quantidade').AsInteger;

  SQLAtualizarSaldo.ParamByName('pProduto').Value := TableMovProd.FieldByName('codigo_produto').AsInteger;
  SQLAtualizarSaldo.ParamByName('pVariacao').Value := TableMovProd.FieldByName('codigo_variacao').AsInteger;
  SQLAtualizarSaldo.ParamByName('pTamanho').Value := TableMovProd.FieldByName('codigo_tamanho').AsInteger;


  case Opcao of
    1: begin
      if(Tipo = 1) then
        SQLAtualizarSaldo.ParamByName('pValor').Value := Valor
      else if(Tipo = 2) then
        SQLAtualizarSaldo.ParamByName('pValor').Value := -Valor
      else
        SQLAtualizarSaldo.ParamByName('pValor').Value := 0;
    end;
    2: begin
      if(Tipo = 1) then
        SQLAtualizarSaldo.ParamByName('pValor').Value := -Valor
      else if(Tipo = 2) then
        SQLAtualizarSaldo.ParamByName('pValor').Value := Valor
      else
        SQLAtualizarSaldo.ParamByName('pValor').Value := 0;
    end;
  end;


  SQLAtualizarSaldo.Execute;
end;

end.

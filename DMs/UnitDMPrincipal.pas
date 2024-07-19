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
    DataSourceProdDet: TDataSource;
    TableProdDet: TFDTable;
    TableProdDetcodigo: TFDAutoIncField;
    TableProdDetcodigo_produto: TIntegerField;
    TableProdDetcodigo_variacao: TIntegerField;
    TableProdDetcodigo_tamanho: TIntegerField;
    TableProdDetpeso: TIntegerField;
    TableProdDetsaldo: TIntegerField;
    TableProdDetdata_criacao: TDateTimeField;
    TableProdDetdata_alteracao: TDateTimeField;
    TableProdutocodigo: TFDAutoIncField;
    TableProdutodescricao: TStringField;
    TableProdutodata_criacao: TDateTimeField;
    TableProdutodata_alteracao: TDateTimeField;
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

end.

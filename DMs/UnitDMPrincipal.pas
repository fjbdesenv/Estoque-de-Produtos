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

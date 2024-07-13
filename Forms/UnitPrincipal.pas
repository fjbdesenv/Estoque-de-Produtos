unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Consulta1: TMenuItem;
    Produto1: TMenuItem;
    Usuario1: TMenuItem;
    Produto2: TMenuItem;
    Produto3: TMenuItem;
    Detalhamento1: TMenuItem;
    Variao1: TMenuItem;
    amanho1: TMenuItem;
    MovimentoEstoque1: TMenuItem;
    Detalhamento2: TMenuItem;
    Estoque1: TMenuItem;
    Movimento1: TMenuItem;
    Variao2: TMenuItem;
    amanho2: TMenuItem;
    Movimento2: TMenuItem;
    ImagemPrincipal: TImage;
    PanelInferior: TPanel;
    PanelSuperior: TPanel;
    LabelTitulo: TLabel;
    LabelVersao: TLabel;
    Label1: TLabel;
    LabelUsuario: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetUsuario(usuario:String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

var
  Usuario: String;

implementation

{$R *.dfm}

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  { Ajustar versão }
  LabelVersao.Caption := 'Versão: 0.2.1  ';
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure TFormPrincipal.SetUsuario(usuario:String);
begin
  Usuario := usuario;
  LabelUsuario.Caption := 'Usuário: ' + usuario;
end;

end.

unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, Usuario;

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
    LabelUsuario: TLabel;
    rocarUsurio1: TMenuItem;
    PanelDados: TPanel;
    LabelNivel: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetUsuario(usuario:TUsuario);
    procedure rocarUsurio1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sobre1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
  Usuario: TUsuario;

implementation

{$R *.dfm}

uses UnitLogin, UnitSobre, UnitCadUsuario, UnitConstantes;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  { Ajustar versão }
  LabelVersao.Caption := 'Versão: ' + PegarVersao + ' ';
end;

procedure TFormPrincipal.Produto1Click(Sender: TObject);
begin
  FormCadUsuario.ShowModal;
end;

procedure TFormPrincipal.rocarUsurio1Click(Sender: TObject);
begin
  FormLogin.Visible := True;
  FormPrincipal.Visible:= False;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure TFormPrincipal.SetUsuario(usuario:TUsuario);
begin
  Usuario   := usuario;
  LabelUsuario.Caption  := 'Usuário: ' + Usuario.nome;

  case Usuario.nivel of
    0:  LabelNivel.Caption := 'Nível: Normal';
    1:  LabelNivel.Caption := 'Nível: Adiministrador';
  end;
end;

procedure TFormPrincipal.Sobre1Click(Sender: TObject);
begin
  FormSobre.ShowModal;
end;

end.

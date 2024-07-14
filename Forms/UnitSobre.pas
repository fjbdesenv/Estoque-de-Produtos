unit UnitSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormSobre = class(TForm)
    PanelPricipal: TPanel;
    LabelTitulo: TLabel;
    campoSobre: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.dfm}

uses UnitConstantes;

procedure TFormSobre.FormShow(Sender: TObject);
begin
  campoSobre.Lines.Clear;
  campoSobre.Lines.Add('Desenvolvedor: F�bio J�nior Barbosa');
  campoSobre.Lines.Add('Email: fjb.desenv@gmail.com');
  campoSobre.Lines.Add('');
  campoSobre.Lines.Add('Vers�o: ' + PegarVersao);
  campoSobre.Lines.Add('');
  campoSobre.Lines.Add('');
  campoSobre.Lines.Add('Esta programa n�o � comercializavel, tem apenas fins de aprendizado.');
end;

end.

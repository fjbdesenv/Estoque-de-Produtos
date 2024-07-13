object FormSobre: TFormSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Sobre o Sistema'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object PanelPricipal: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 160
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 626
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Estoque de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ExplicitLeft = 2
      ExplicitTop = 0
    end
    object campoSobre: TMemo
      Left = 1
      Top = 46
      Width = 626
      Height = 395
      Align = alClient
      EditMargins.Auto = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'Desenvolvedor: F'#225'bio J'#250'nior Barbosa'
        'Email: fjb.desenv@gmail.com'
        ''
        'Vers'#227'o: 0.3.0'
        ''
        ''
        
          'Esta programa n'#227'o '#233' comercializavel, tem apenas fins de aprendiz' +
          'ado.')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end

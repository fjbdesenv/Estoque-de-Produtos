object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Login'
  ClientHeight = 307
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 307
    Align = alClient
    TabOrder = 0
    VerticalAlignment = taAlignBottom
    ExplicitWidth = 374
    ExplicitHeight = 298
    object LabelNome: TLabel
      Left = 27
      Top = 83
      Width = 47
      Height = 23
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelLogin: TLabel
      Left = 155
      Top = 32
      Width = 45
      Height = 23
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSenha: TLabel
      Left = 27
      Top = 139
      Width = 47
      Height = 23
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditNome: TEdit
      Left = 80
      Top = 80
      Width = 225
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
    end
    object EditSenha: TEdit
      Left = 80
      Top = 136
      Width = 225
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object ButtonLogin: TButton
      Left = 131
      Top = 200
      Width = 110
      Height = 57
      Caption = 'Acessar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonLoginClick
    end
  end
end

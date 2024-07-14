object FormCadVariacao: TFormCadVariacao
  Left = 0
  Top = 0
  Caption = 'FormCadVariacao'
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
  object PanelInferior: TPanel
    Left = 0
    Top = 41
    Width = 628
    Height = 401
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 26
    ExplicitHeight = 416
    object ButtonNovo: TSpeedButton
      Left = 16
      Top = 367
      Width = 100
      Height = 30
      DisabledImageName = 'ButtonNovo'
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonNovoClick
    end
    object ButtonGravar: TSpeedButton
      Left = 232
      Top = 367
      Width = 100
      Height = 30
      DisabledImageName = 'ButtonGravar'
      Caption = 'Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonGravarClick
    end
    object ButtonCancelar: TSpeedButton
      Left = 480
      Top = 367
      Width = 100
      Height = 30
      DisabledImageName = 'ButtonCancelar'
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonCancelarClick
    end
    object PanelCentral: TPanel
      Left = 8
      Top = 35
      Width = 609
      Height = 315
      TabOrder = 0
      Visible = False
      object LabelDescricao: TLabel
        Left = 8
        Top = 8
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object LabelSenha: TLabel
        Left = 240
        Top = 8
        Width = 61
        Height = 15
        Caption = 'Abreviatura'
      end
      object LabelDataCriacao: TLabel
        Left = 8
        Top = 295
        Width = 40
        Height = 15
        Caption = 'Cria'#231#227'o'
      end
      object LabelDataEdicao: TLabel
        Left = 276
        Top = 295
        Width = 73
        Height = 15
        Caption = #218'ltima Edi'#231#227'o'
      end
      object campoDescricao: TDBEdit
        Left = 8
        Top = 29
        Width = 200
        Height = 23
        DataField = 'descricao'
        DataSource = DMPrincipal.DataSourceVariacao
        TabOrder = 0
      end
      object campoAbreviatura: TDBEdit
        Left = 240
        Top = 29
        Width = 200
        Height = 23
        DataField = 'abreviatura'
        DataSource = DMPrincipal.DataSourceVariacao
        MaxLength = 10
        TabOrder = 1
      end
      object campoDataCriacao: TDBEdit
        Left = 54
        Top = 287
        Width = 150
        Height = 23
        DataField = 'data_criacao'
        DataSource = DMPrincipal.DataSourceVariacao
        Enabled = False
        MaxLength = 10
        TabOrder = 2
      end
      object campoDataEdicao: TDBEdit
        Left = 355
        Top = 287
        Width = 150
        Height = 23
        DataField = 'data_alteracao'
        DataSource = DMPrincipal.DataSourceVariacao
        Enabled = False
        MaxLength = 10
        TabOrder = 3
      end
    end
    object campoCodigo: TDBEdit
      Left = 8
      Top = 5
      Width = 121
      Height = 23
      DataField = 'codigo'
      DataSource = DMPrincipal.DataSourceVariacao
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
  end
  object PanelSuperior: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 622
    object LabelTitulo: TLabel
      Left = 1
      Top = 1
      Width = 626
      Height = 39
      Align = alClient
      Alignment = taCenter
      Caption = 'Cadastro de Varia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 326
      ExplicitHeight = 45
    end
  end
end

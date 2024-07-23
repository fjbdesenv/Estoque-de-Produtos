object FormCadMov: TFormCadMov
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Movimento de Estoque'
  ClientHeight = 696
  ClientWidth = 919
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
    Top = 57
    Width = 919
    Height = 639
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 913
    ExplicitHeight = 630
    object ButtonNovo: TSpeedButton
      Left = 167
      Top = 591
      Width = 100
      Height = 30
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
      Left = 384
      Top = 591
      Width = 100
      Height = 30
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
      Left = 632
      Top = 591
      Width = 100
      Height = 30
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
      Top = 186
      Width = 897
      Height = 383
      TabOrder = 0
      Visible = False
      object PanelDetalhamento: TPanel
        Left = 6
        Top = 16
        Width = 875
        Height = 353
        Caption = 'PanelDetalhamento'
        TabOrder = 0
        Visible = False
        object LabelVariacao: TLabel
          Left = 164
          Top = 5
          Width = 44
          Height = 15
          Caption = 'Varia'#231#227'o'
        end
        object LabelTamanho: TLabel
          Left = 320
          Top = 5
          Width = 49
          Height = 15
          Caption = 'Tamanho'
        end
        object ButtonCancelarDet: TSpeedButton
          Left = 774
          Top = 19
          Width = 100
          Height = 30
          Caption = 'Cancelar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = ButtonCancelarDetClick
        end
        object ButtonGravarDet: TSpeedButton
          Left = 668
          Top = 19
          Width = 100
          Height = 30
          Caption = 'Gravar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = ButtonGravarDetClick
        end
        object ButtonNovoDet: TSpeedButton
          Left = 562
          Top = 19
          Width = 100
          Height = 30
          Caption = 'Novo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = ButtonNovoDetClick
        end
        object LabelProduto: TLabel
          Left = 8
          Top = 5
          Width = 43
          Height = 15
          Caption = 'Produto'
        end
        object LabelQuantidade: TLabel
          Left = 491
          Top = 5
          Width = 62
          Height = 15
          Caption = 'Quantidade'
        end
        object GridDetalheProduto: TDBGrid
          Left = 8
          Top = 55
          Width = 849
          Height = 285
          DataSource = DMPrincipal.DataSourceMovProd
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo_movimento'
              Title.Caption = 'Movimento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo_produto'
              Title.Caption = 'Produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo_variacao'
              Title.Caption = 'Varia'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo_tamanho'
              Title.Caption = 'Tamanho'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantidade'
              Title.Caption = 'Quantidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_criacao'
              Title.Caption = 'Cria'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_alteracao'
              Title.Caption = 'Altera'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object campoTamanho: TDBLookupComboBox
          Left = 320
          Top = 26
          Width = 150
          Height = 23
          DataField = 'codigo_tamanho'
          DataSource = DMPrincipal.DataSourceMovProd
          Enabled = False
          KeyField = 'codigo'
          ListField = 'descricao'
          ListSource = DMPrincipal.DataSourceTamanho
          TabOrder = 1
        end
        object campoVariacao: TDBLookupComboBox
          Left = 164
          Top = 26
          Width = 150
          Height = 23
          DataField = 'codigo_variacao'
          DataSource = DMPrincipal.DataSourceMovProd
          Enabled = False
          ImeName = 'campoVariacao'
          KeyField = 'codigo'
          ListField = 'descricao'
          ListSource = DMPrincipal.DataSourceVariacao
          TabOrder = 2
        end
        object campoProduto: TDBLookupComboBox
          Left = 8
          Top = 26
          Width = 150
          Height = 23
          DataField = 'codigo_produto'
          DataSource = DMPrincipal.DataSourceMovProd
          Enabled = False
          KeyField = 'codigo'
          ListField = 'descricao'
          ListSource = DMPrincipal.DataSourceProduto
          TabOrder = 3
        end
        object campoQuantidade: TDBEdit
          Left = 487
          Top = 26
          Width = 69
          Height = 23
          DataField = 'quantidade'
          DataSource = DMPrincipal.DataSourceMovProd
          TabOrder = 4
        end
      end
    end
    object PanelMovimento: TPanel
      Left = 8
      Top = 12
      Width = 897
      Height = 168
      TabOrder = 1
      Visible = False
      object LabelObservacao: TLabel
        Left = 306
        Top = 27
        Width = 62
        Height = 15
        Caption = 'Observa'#231#227'o'
      end
      object LabelDataCriacao: TLabel
        Left = 6
        Top = 110
        Width = 40
        Height = 15
        Caption = 'Cria'#231#227'o'
      end
      object LabelDataEdicao: TLabel
        Left = 145
        Top = 110
        Width = 73
        Height = 15
        Caption = #218'ltima Edi'#231#227'o'
      end
      object campoCodigo: TDBEdit
        Left = 5
        Top = 5
        Width = 121
        Height = 23
        DataField = 'codigo'
        DataSource = DMPrincipal.DataSourceMov
        Enabled = False
        TabOrder = 0
      end
      object campoTipo: TRadioGroup
        Left = 6
        Top = 34
        Width = 264
        Height = 55
        Caption = 'Tipo  de Movimento'
        Columns = 2
        Items.Strings = (
          'Entrada'
          'Sa'#237'da')
        TabOrder = 1
      end
      object campoObservacao: TDBMemo
        Left = 306
        Top = 48
        Width = 575
        Height = 105
        DataField = 'observacao'
        DataSource = DMPrincipal.DataSourceMov
        TabOrder = 2
      end
      object campoDataCriacao: TDBEdit
        Left = 5
        Top = 131
        Width = 121
        Height = 23
        DataField = 'data_criacao'
        DataSource = DMPrincipal.DataSourceMov
        Enabled = False
        TabOrder = 3
      end
      object campoDataEdicao: TDBEdit
        Left = 145
        Top = 131
        Width = 121
        Height = 23
        DataField = 'data_alteracao'
        DataSource = DMPrincipal.DataSourceMov
        Enabled = False
        TabOrder = 4
      end
    end
  end
  object PanelSuperior: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 57
    Align = alTop
    Caption = 'PanelSuperior'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 913
    object LabelTitulo: TLabel
      Left = 1
      Top = 1
      Width = 917
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Cadastro Movimento de Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 507
    end
  end
end

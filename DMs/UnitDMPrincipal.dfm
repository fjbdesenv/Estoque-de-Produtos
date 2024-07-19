object DMPrincipal: TDMPrincipal
  Height = 764
  Width = 1124
  PixelsPerInch = 120
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=db_estoque'
      'User_Name=root'
      'Password=123456'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 568
    Top = 24
  end
  object TableUsuario: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'usuario'
    Left = 80
    Top = 136
    object TableUsuariocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TableUsuarionivel: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'nivel'
      Origin = 'nivel'
    end
    object TableUsuarionome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
    end
    object TableUsuariosenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TableUsuariodata_criacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TableUsuariodata_alteracao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
  end
  object DataSourceUsuario: TDataSource
    DataSet = TableUsuario
    Left = 80
    Top = 208
  end
  object DataSourceVariacao: TDataSource
    DataSet = TableVariacao
    Left = 256
    Top = 208
  end
  object DataSourceTamanho: TDataSource
    DataSet = TableTamanho
    Left = 416
    Top = 208
  end
  object TableTamanho: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'tamanho'
    Left = 416
    Top = 136
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'abreviatura'
      Origin = 'abreviatura'
    end
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object DateTimeField2: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
  end
  object TableVariacao: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'variacao'
    Left = 256
    Top = 136
    object TableVariacaocodigo: TFDAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object TableVariacaodescricao: TStringField
      FieldName = 'descricao'
      Required = True
    end
    object TableVariacaoabreviatura: TStringField
      FieldName = 'abreviatura'
    end
    object TableVariacaodata_criacao: TDateTimeField
      FieldName = 'data_criacao'
    end
    object TableVariacaodata_alteracao: TDateTimeField
      FieldName = 'data_alteracao'
    end
  end
  object TableProduto: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'produto'
    Left = 576
    Top = 136
    object TableProdutocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object TableProdutodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
    end
    object TableProdutodata_criacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TableProdutodata_alteracao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
  end
  object DataSourceProduto: TDataSource
    DataSet = TableProduto
    Left = 576
    Top = 208
  end
  object DataSourceProdDet: TDataSource
    DataSet = TableProdDet
    Left = 736
    Top = 208
  end
  object TableProdDet: TFDTable
    Active = True
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'produto_detalhamento'
    Left = 736
    Top = 136
    object TableProdDetcodigo: TFDAutoIncField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TableProdDetcodigo_produto: TIntegerField
      DisplayLabel = 'PRODUTO'
      FieldName = 'codigo_produto'
      Origin = 'codigo_produto'
      Required = True
    end
    object TableProdDetcodigo_variacao: TIntegerField
      DisplayLabel = 'VARIA'#199#195'O'
      FieldName = 'codigo_variacao'
      Origin = 'codigo_variacao'
      Required = True
    end
    object TableProdDetcodigo_tamanho: TIntegerField
      DisplayLabel = 'TAMANHO'
      FieldName = 'codigo_tamanho'
      Origin = 'codigo_tamanho'
      Required = True
    end
    object TableProdDetpeso: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'PESO'
      FieldName = 'peso'
      Origin = 'peso'
    end
    object TableProdDetsaldo: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'SALDO'
      FieldName = 'saldo'
      Origin = 'saldo'
    end
    object TableProdDetdata_criacao: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CRIA'#199#195'O'
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TableProdDetdata_alteracao: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'ALTERA'#199#195'O'
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
  end
end

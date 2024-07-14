object DMPrincipal: TDMPrincipal
  Height = 750
  Width = 1000
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
    Left = 456
    Top = 48
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
    IndexFieldNames = 'codigo'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'variacao'
    Left = 256
    Top = 136
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ShortintField1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'nivel'
      Origin = 'nivel'
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object DateTimeField3: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object DateTimeField4: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
    object TableVariacaodescricao: TStringField
      FieldName = 'descricao'
      Required = True
    end
    object TableVariacaoabreviatura: TStringField
      FieldName = 'abreviatura'
    end
  end
end

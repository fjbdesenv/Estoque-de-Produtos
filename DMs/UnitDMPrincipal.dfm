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
    TableName = 'db_estoque.usuario'
    Left = 80
    Top = 136
    object TableUsuariocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
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
end

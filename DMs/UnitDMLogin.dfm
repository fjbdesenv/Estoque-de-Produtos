object DMLogin: TDMLogin
  Height = 412
  Width = 481
  PixelsPerInch = 120
  object sqlLogin: TFDQuery
    Active = True
    DetailFields = 'count(codigo)'
    Connection = Conexao
    SQL.Strings = (
      'select '
      '    codigo,'
      '    nome,'
      '    nivel'
      'from usuario '
      'where nome = :pNome '
      '    and senha = :pSenha;')
    Left = 176
    Top = 128
    ParamData = <
      item
        Name = 'pNome'
        DataType = ftString
        ParamType = ptInput
        Value = 'False'
      end
      item
        Name = 'pSenha'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=db_estoque'
      'User_Name=root'
      'Password=123456'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 176
    Top = 48
  end
end

object DMLogin: TDMLogin
  Height = 412
  Width = 481
  PixelsPerInch = 120
  object sqlLogin: TFDQuery
    DetailFields = 'count(codigo)'
    Connection = Conexao
    SQL.Strings = (
      'select '
      '    count(codigo) RESULTADO'
      'from USUARIO '
      'where NOME = :pNome '
      '    and SENHA = :pSenha;')
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
    LoginPrompt = False
    Left = 176
    Top = 48
  end
end

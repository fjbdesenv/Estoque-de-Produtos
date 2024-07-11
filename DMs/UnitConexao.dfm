object DMConexao: TDMConexao
  Height = 296
  Width = 368
  PixelsPerInch = 120
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=db_geleia'
      'User_Name=root'
      'Password=123456'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 160
    Top = 48
  end
end

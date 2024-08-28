object dmConexao: TdmConexao
  Height = 480
  Width = 640
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=C:\SCL\AulaMVC\MVC.IB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3051'
      'DriverID=IB')
    Connected = True
    Left = 120
    Top = 40
  end
end

object dmCliente: TdmCliente
  Height = 480
  Width = 640
  object qryPesquisar: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTES --WHERE NOME LIKE :NOME')
    Left = 24
    Top = 8
    object qryPesquisarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object qryPesquisarTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryPesquisarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 15
    end
    object qryPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
  end
  object qryInserir: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      'insert into CLIENTES (NOME, TIPO, DOCUMENTO, TELEFONE)'
      'values (:NOME, :TIPO, :DOCUMENTO, :TELEFONE)')
    Left = 96
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 80
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object qryAlterar: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      '      update CLIENTES'
      '                                             set NOME = :NOME,'
      '                                                 TIPO = :TIPO,'
      
        '                                                 DOCUMENTO = :DO' +
        'CUMENTO,'
      
        '                                                 TELEFONE = :TEL' +
        'EFONE'
      '                                             where (ID = :ID)')
    Left = 160
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryExcluir: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      'delete from CLIENTES'
      'where (ID = :ID)')
    Left = 224
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspPesquisar: TDataSetProvider
    DataSet = qryPesquisar
    Left = 24
    Top = 72
  end
  object cdsPesquisar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    ReadOnly = True
    Left = 24
    Top = 136
    object cdsPesquisarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPesquisarTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPesquisarDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 15
    end
    object cdsPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
  end
end

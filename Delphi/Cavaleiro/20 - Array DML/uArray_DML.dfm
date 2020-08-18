object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o Array DML'
  ClientHeight = 275
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCaminhoDoArquivo: TLabel
    Left = 8
    Top = 8
    Width = 95
    Height = 13
    Caption = 'Caminho do arquivo'
  end
  object btnSelecionarArquivo: TSpeedButton
    Left = 451
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = btnSelecionarArquivoClick
  end
  object lblDados: TLabel
    Left = 8
    Top = 88
    Width = 34
    Height = 13
    Caption = 'Dados:'
  end
  object btnImportar: TSpeedButton
    Left = 8
    Top = 51
    Width = 466
    Height = 22
    Caption = 'Importar'
    Flat = True
    OnClick = btnImportarClick
  end
  object edtCaminhoDoArquivo: TEdit
    Left = 8
    Top = 24
    Width = 442
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object grdDados: TDBGrid
    Left = 8
    Top = 104
    Width = 466
    Height = 162
    DataSource = dsrDados
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATANASC'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROFISSAO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARTAO'
        Width = 80
        Visible = True
      end>
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=G:\Documentos\Delphi\ARRAY_DML.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 232
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.csv'
    Filter = '*.csv|*.csv'
    Left = 424
    Top = 56
  end
  object fdqImportacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO FUNCIONARIO '
      '(ID,NOME,CIDADE,EMAIL,DATANASC,PROFISSAO,CARTAO) '
      'VALUES'
      '(:ID,:NOME,:CIDADE,:EMAIL,:DATANASC,:PROFISSAO,:CARTAO)')
    Left = 272
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Name = 'DATANASC'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'PROFISSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Name = 'CARTAO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end>
    object fdqImportacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqImportacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 500
    end
    object fdqImportacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 500
    end
    object fdqImportacaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 500
    end
    object fdqImportacaoDATANASC: TDateField
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
    end
    object fdqImportacaoPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 500
    end
    object fdqImportacaoCARTAO: TStringField
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 500
    end
  end
  object dsrDados: TDataSource
    AutoEdit = False
    DataSet = fdqConsulta
    Left = 312
    Top = 168
  end
  object fdqConsulta: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from FUNCIONARIO')
    Left = 312
    Top = 120
    object fdqConsultaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqConsultaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 500
    end
    object fdqConsultaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 500
    end
    object fdqConsultaEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 500
    end
    object fdqConsultaDATANASC: TDateField
      DisplayLabel = 'Dt. Nascimento'
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
    end
    object fdqConsultaPROFISSAO: TStringField
      DisplayLabel = 'Profiss'#227'o'
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 500
    end
    object fdqConsultaCARTAO: TStringField
      DisplayLabel = 'Cart'#227'o'
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 500
    end
  end
end

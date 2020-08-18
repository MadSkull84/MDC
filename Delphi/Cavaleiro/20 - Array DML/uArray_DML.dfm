object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 306
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 95
    Height = 13
    Caption = 'Caminho do arquivo'
  end
  object SpeedButton1: TSpeedButton
    Left = 456
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 34
    Height = 13
    Caption = 'Dados:'
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 51
    Width = 95
    Height = 22
    Caption = 'Importar'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 449
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 136
    Width = 466
    Height = 162
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
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
    Left = 416
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
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
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'DATANASC'
        ParamType = ptInput
      end
      item
        Name = 'PROFISSAO'
        ParamType = ptInput
      end
      item
        Name = 'CARTAO'
        ParamType = ptInput
      end>
    object FDQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 500
    end
    object FDQuery1CIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 500
    end
    object FDQuery1EMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 500
    end
    object FDQuery1DATANASC: TDateField
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
    end
    object FDQuery1PROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 500
    end
    object FDQuery1CARTAO: TStringField
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 500
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 312
    Top = 120
  end
end

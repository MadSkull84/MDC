object frmRegistro: TfrmRegistro
  Left = 0
  Top = 0
  Caption = 'Programas instalados'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnListarProgramas: TSpeedButton
    Left = 8
    Top = 8
    Width = 619
    Height = 22
    Caption = 'Listar Programas Instalados'
    OnClick = btnListarProgramasClick
  end
  object dbgProgramas: TDBGrid
    Left = 8
    Top = 36
    Width = 619
    Height = 256
    DataSource = dscProgramas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PROGRAMA'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSAO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        ReadOnly = True
        Width = 225
        Visible = True
      end>
  end
  object cdsProgramas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 56
    object cdsProgramasPROGRAMA: TStringField
      DisplayLabel = 'Programa'
      FieldName = 'PROGRAMA'
      Size = 250
    end
    object cdsProgramasVERSAO: TStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAO'
      Size = 250
    end
    object cdsProgramasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Size = 250
    end
  end
  object dscProgramas: TDataSource
    AutoEdit = False
    DataSet = cdsProgramas
    Left = 424
    Top = 104
  end
end

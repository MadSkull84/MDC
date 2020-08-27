object frmArquivoZip: TfrmArquivoZip
  Left = 0
  Top = 0
  Caption = 'Compactar Arquivos'
  ClientHeight = 385
  ClientWidth = 633
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
  object btnSelecionarArquivos: TSpeedButton
    Left = 8
    Top = 8
    Width = 619
    Height = 22
    Caption = 'Selecionar arquivos ...'
    OnClick = btnSelecionarArquivosClick
  end
  object lblArquivoSaida: TLabel
    Left = 8
    Top = 296
    Width = 206
    Height = 13
    Caption = 'Nome do arquivo compactado a ser gerado'
  end
  object btnArquivoSaida: TSpeedButton
    Left = 600
    Top = 312
    Width = 27
    Height = 22
    Caption = '...'
    OnClick = btnArquivoSaidaClick
  end
  object btnGerarArquivo: TSpeedButton
    Left = 8
    Top = 336
    Width = 619
    Height = 22
    Caption = 'Gerar Arquivo'
    OnClick = btnGerarArquivoClick
  end
  object dbgArquivos: TDBGrid
    Left = 8
    Top = 32
    Width = 586
    Height = 260
    DataSource = dscArquivos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ARQUIVO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMINHO'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXTENSAO'
        Width = 50
        Visible = True
      end>
  end
  object edtNomeArquivoSaida: TEdit
    Left = 8
    Top = 312
    Width = 586
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object pgbProgresso: TProgressBar
    Left = 8
    Top = 360
    Width = 619
    Height = 17
    Smooth = True
    TabOrder = 2
  end
  object dbnArquivos: TDBNavigator
    Left = 600
    Top = 32
    Width = 25
    Height = 110
    DataSource = dscArquivos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    Kind = dbnVertical
    TabOrder = 3
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 168
  end
  object cdsArquivos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    object cdsArquivosARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      Size = 250
    end
    object cdsArquivosCAMINHO: TStringField
      DisplayLabel = 'Caminho'
      FieldName = 'CAMINHO'
      Size = 1000
    end
    object cdsArquivosEXTENSAO: TStringField
      DisplayLabel = 'Extens'#227'o'
      FieldName = 'EXTENSAO'
      Size = 10
    end
    object cdsArquivosCAMINHOCOMPLETO: TStringField
      FieldName = 'CAMINHOCOMPLETO'
      Size = 1260
    end
  end
  object dscArquivos: TDataSource
    AutoEdit = False
    DataSet = cdsArquivos
    Left = 248
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.zip'
    Filter = 'Arquivos Compactados|*.zip'
    Left = 552
    Top = 296
  end
end

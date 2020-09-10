object frmGitHubPesquisa: TfrmGitHubPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisar usu'#225'rio GitHub'
  ClientHeight = 257
  ClientWidth = 417
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
  object lblUsuario: TLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object btnPesquisar: TSpeedButton
    Left = 344
    Top = 24
    Width = 65
    Height = 22
    Caption = 'Pesquisar'
    Flat = True
    OnClick = btnPesquisarClick
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 24
    Width = 330
    Height = 21
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 401
    Height = 185
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.github.com/users/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 304
    Top = 40
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 304
    Top = 88
  end
  object RESTResponse: TRESTResponse
    Left = 304
    Top = 136
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = FDMemTable
    FieldDefs = <>
    Response = RESTResponse
    Left = 304
    Top = 184
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 360
    Top = 40
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 360
    Top = 88
  end
end

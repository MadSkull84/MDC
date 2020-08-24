object frmLembretes: TfrmLembretes
  Left = 0
  Top = 0
  Caption = 'Lembretes'
  ClientHeight = 202
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDataDoLembrete: TLabel
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Data do Lembrete'
  end
  object lblLembrete: TLabel
    Left = 227
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Lembrete'
  end
  object btnAdicionar: TSpeedButton
    Left = 512
    Top = 24
    Width = 66
    Height = 22
    Caption = 'Adicionar'
    OnClick = btnAdicionarClick
  end
  object lblDados: TLabel
    Left = 8
    Top = 56
    Width = 50
    Height = 13
    Caption = 'Lembretes'
  end
  object lblHoraDoLembrete: TLabel
    Left = 112
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Hora do Lembrete'
  end
  object edtData: TDateTimePicker
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    Date = 44061.000000000000000000
    Format = 'dd/MM/yyyy'
    Time = 0.786998877316364100
    TabOrder = 0
  end
  object edtLembrete: TEdit
    Left = 227
    Top = 24
    Width = 278
    Height = 21
    MaxLength = 250
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 537
    Height = 120
    DataSource = dscLembretes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEMBRETE'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXECUTADO'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 552
    Top = 72
    Width = 25
    Height = 120
    DataSource = dscLembretes
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    Flat = True
    Kind = dbnVertical
    ConfirmDelete = False
    TabOrder = 3
  end
  object edtHora: TDateTimePicker
    Left = 112
    Top = 24
    Width = 97
    Height = 21
    Date = 44061.000000000000000000
    Format = 'HH:mm'
    Time = 0.836461215279996400
    Kind = dtkTime
    TabOrder = 4
  end
  object TrayIcon: TTrayIcon
    PopupMenu = PopupMenu
    OnDblClick = TrayIconDblClick
    Left = 312
    Top = 8
  end
  object ApplicationEvents: TApplicationEvents
    OnMinimize = ApplicationEventsMinimize
    Left = 352
    Top = 8
  end
  object PopupMenu: TPopupMenu
    Left = 392
    Top = 8
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = Abrir1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
  end
  object cdsLembretes: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'idxDataHora'
        Fields = 'Data;Hora'
      end>
    IndexName = 'idxDataHora'
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 80
    object cdsLembretesDATA: TStringField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsLembretesHORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
    end
    object cdsLembretesLEMBRETE: TStringField
      DisplayLabel = 'Lembrete'
      FieldName = 'LEMBRETE'
      Size = 250
    end
    object cdsLembretesEXECUTADO: TBooleanField
      DisplayLabel = 'Executado'
      FieldName = 'EXECUTADO'
    end
  end
  object dscLembretes: TDataSource
    AutoEdit = False
    DataSet = cdsLembretes
    Left = 104
    Top = 120
  end
  object NotificationCenter: TNotificationCenter
    OnReceiveLocalNotification = NotificationCenterReceiveLocalNotification
    Left = 432
    Top = 8
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 472
    Top = 8
  end
end

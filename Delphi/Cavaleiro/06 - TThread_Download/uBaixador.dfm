object frmBaixador: TfrmBaixador
  Left = 0
  Top = 0
  Caption = 'Baixador'
  ClientHeight = 97
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
  object btnBaixar: TSpeedButton
    Left = 8
    Top = 48
    Width = 401
    Height = 22
    Caption = 'Baixar'
    Flat = True
    OnClick = btnBaixarClick
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 93
    Height = 13
    Caption = 'URL para download'
  end
  object edtURL: TEdit
    Left = 8
    Top = 24
    Width = 401
    Height = 21
    TabOrder = 0
    Text = 'http://www.telmaxbr.net.br/download/dwl/100MEGA.zip'
  end
  object pgbProgresso: TProgressBar
    Left = 8
    Top = 72
    Width = 401
    Height = 17
    Smooth = True
    TabOrder = 1
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 376
    Top = 8
  end
end

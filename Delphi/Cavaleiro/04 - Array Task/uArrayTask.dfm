object frmArrayTask: TfrmArrayTask
  Left = 0
  Top = 0
  Caption = 'Listagem de diret'#243'rios'
  ClientHeight = 385
  ClientWidth = 874
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
  object lblDiretorio01: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Diret'#243'rio - 01'
  end
  object btnDiretorio01: TSpeedButton
    Left = 264
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = btnDiretorio01Click
  end
  object lblDiretorio02: TLabel
    Left = 296
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Diret'#243'rio - 02'
  end
  object btnDiretorio02: TSpeedButton
    Left = 552
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = btnDiretorio02Click
  end
  object lblDiretorio03: TLabel
    Left = 584
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Diret'#243'rio - 03'
  end
  object btnDiretorio03: TSpeedButton
    Left = 840
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    OnClick = btnDiretorio03Click
  end
  object btnLerConteudo: TSpeedButton
    Left = 8
    Top = 360
    Width = 858
    Height = 22
    Caption = 'Ler conte'#250'do dos diret'#243'rios'
    Flat = True
    OnClick = btnLerConteudoClick
  end
  object edtDiretorio01: TEdit
    Left = 8
    Top = 24
    Width = 249
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object memDiretorio01: TMemo
    Left = 8
    Top = 48
    Width = 281
    Height = 305
    ReadOnly = True
    TabOrder = 1
  end
  object edtDiretorio02: TEdit
    Left = 296
    Top = 24
    Width = 249
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object memDiretorio02: TMemo
    Left = 296
    Top = 48
    Width = 281
    Height = 305
    ReadOnly = True
    TabOrder = 3
  end
  object edtDiretorio03: TEdit
    Left = 584
    Top = 24
    Width = 249
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object memDiretorio03: TMemo
    Left = 584
    Top = 48
    Width = 281
    Height = 305
    ReadOnly = True
    TabOrder = 5
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoPathMustExist]
    Left = 264
    Top = 64
  end
end

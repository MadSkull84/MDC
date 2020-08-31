object frmPrimos: TfrmPrimos
  Left = 0
  Top = 0
  Caption = 'Primos'
  ClientHeight = 297
  ClientWidth = 201
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
  object btnListarPrimos: TSpeedButton
    Left = 8
    Top = 8
    Width = 185
    Height = 22
    Caption = 'Listar Primos'
    Flat = True
    OnClick = btnListarPrimosClick
  end
  object memPrimos: TMemo
    Left = 8
    Top = 36
    Width = 185
    Height = 256
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end

object frmValidaEmail: TfrmValidaEmail
  Left = 0
  Top = 0
  Caption = 'Validar e-mail'
  ClientHeight = 55
  ClientWidth = 393
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
  object lblEmail: TLabel
    Left = 8
    Top = 8
    Width = 28
    Height = 13
    Caption = 'e-mail'
  end
  object btnValidarEmail: TSpeedButton
    Left = 336
    Top = 24
    Width = 49
    Height = 22
    Caption = 'Validar'
    OnClick = btnValidarEmailClick
  end
  object edtEmail: TEdit
    Left = 8
    Top = 24
    Width = 322
    Height = 21
    TabOrder = 0
  end
end

object frmConsultaCEP: TfrmConsultaCEP
  Left = 0
  Top = 0
  Caption = 'Consultar CEP'
  ClientHeight = 158
  ClientWidth = 433
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
  object btnConsultar: TSpeedButton
    Left = 136
    Top = 24
    Width = 58
    Height = 22
    Caption = 'Consultar'
    Flat = True
    OnClick = btnConsultarClick
  end
  object lblLogradouro: TLabel
    Left = 8
    Top = 56
    Width = 135
    Height = 25
    Caption = 'Logradouro: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBairro: TLabel
    Left = 8
    Top = 80
    Width = 78
    Height = 25
    Caption = 'Bairro: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUF: TLabel
    Left = 8
    Top = 128
    Width = 42
    Height = 25
    Caption = 'UF: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCidade: TLabel
    Left = 8
    Top = 104
    Width = 85
    Height = 25
    Caption = 'Cidade: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCEP: TLabel
    Left = 8
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object edtCEP: TMaskEdit
    Left = 8
    Top = 24
    Width = 119
    Height = 21
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 0
    Text = '87014-010'
  end
end

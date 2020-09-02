object frmEnvioEmail: TfrmEnvioEmail
  Left = 0
  Top = 0
  Caption = 'Envio de e-mail'
  ClientHeight = 451
  ClientWidth = 634
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 634
    Height = 451
    ActivePage = tsFormulario
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 635
    object tsFormulario: TTabSheet
      Caption = 'Formul'#225'rio'
      ExplicitWidth = 627
      object lblAssunto: TLabel
        Left = 16
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Assunto'
      end
      object lblMensagem: TLabel
        Left = 16
        Top = 104
        Width = 51
        Height = 13
        Caption = 'Mensagem'
      end
      object lbl: TLabel
        Left = 16
        Top = 288
        Width = 36
        Height = 13
        Caption = 'Anexos'
      end
      object btnEnviar: TSpeedButton
        Left = 16
        Top = 384
        Width = 593
        Height = 22
        Caption = 'Enviar'
        Flat = True
        OnClick = btnEnviarClick
      end
      object lblDestinatario: TLabel
        Left = 16
        Top = 24
        Width = 58
        Height = 13
        Caption = 'Destinat'#225'rio'
      end
      object edtAssunto: TEdit
        Left = 16
        Top = 80
        Width = 593
        Height = 21
        TabOrder = 1
      end
      object memMensagem: TMemo
        Left = 16
        Top = 120
        Width = 593
        Height = 161
        TabOrder = 2
      end
      object lbxAnexos: TListBox
        Left = 16
        Top = 304
        Width = 593
        Height = 73
        ItemHeight = 13
        TabOrder = 3
      end
      object edtDestinario: TEdit
        Left = 16
        Top = 40
        Width = 593
        Height = 21
        TabOrder = 0
      end
    end
    object tsConfiguracoes: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      ExplicitWidth = 627
      object lblSMTP: TLabel
        Left = 16
        Top = 24
        Width = 26
        Height = 13
        Caption = 'SMTP'
      end
      object lblUsuario: TLabel
        Left = 16
        Top = 64
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object lblSenha: TLabel
        Left = 160
        Top = 64
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object lvlPorta: TLabel
        Left = 304
        Top = 64
        Width = 26
        Height = 13
        Caption = 'Porta'
      end
      object edtSMTP: TEdit
        Left = 16
        Top = 40
        Width = 409
        Height = 21
        TabOrder = 0
      end
      object edtSenha: TEdit
        Left = 160
        Top = 80
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
      end
      object edtPorta: TEdit
        Left = 304
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtUsuario: TEdit
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':465'
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 488
    Top = 56
  end
  object IdSMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    Port = 465
    SASLMechanisms = <>
    UseTLS = utUseImplicitTLS
    Left = 488
    Top = 96
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 488
    Top = 136
  end
end

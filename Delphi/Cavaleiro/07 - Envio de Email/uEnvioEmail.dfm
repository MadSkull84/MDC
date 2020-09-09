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
  OnCreate = FormCreate
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
    object tsFormulario: TTabSheet
      Caption = 'Formul'#225'rio'
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
        Left = 504
        Top = 384
        Width = 105
        Height = 22
        Caption = 'Enviar'
        Flat = True
        OnClick = btnEnviarClick
      end
      object lblDestinatario: TLabel
        Left = 16
        Top = 24
        Width = 216
        Height = 13
        Caption = 'Destinat'#225'rio(aceita somente um destinat'#225'rio)'
      end
      object btnArquivos: TSpeedButton
        Left = 16
        Top = 384
        Width = 105
        Height = 22
        Caption = 'Carregar Arquivos'
        Flat = True
        OnClick = btnArquivosClick
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
      object lblMetodo: TLabel
        Left = 16
        Top = 104
        Width = 36
        Height = 13
        Caption = 'M'#233'todo'
      end
      object lblModo: TLabel
        Left = 160
        Top = 104
        Width = 26
        Height = 13
        Caption = 'Modo'
      end
      object edtSMTP: TEdit
        Left = 16
        Top = 40
        Width = 409
        Height = 21
        TabOrder = 0
        Text = 'smtp.gmail.com'
      end
      object edtSenha: TEdit
        Left = 160
        Top = 80
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
        Text = 'mdc2020delphi'
      end
      object edtPorta: TEdit
        Left = 304
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '465'
      end
      object edtUsuario: TEdit
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'mdc.delphi'
      end
      object cbbMetodo: TComboBox
        Left = 16
        Top = 120
        Width = 121
        Height = 21
        ItemIndex = 1
        TabOrder = 4
        Text = 'SSL v2.3'
        Items.Strings = (
          'SSL v2'
          'SSL v2.3'
          'SSL v3'
          'TLS v1'
          'TLS v1.1'
          'TLS v1.2')
      end
      object cbbModo: TComboBox
        Left = 160
        Top = 120
        Width = 121
        Height = 21
        ItemIndex = 1
        TabOrder = 5
        Text = 'Client'
        Items.Strings = (
          'Unassigned'
          'Client'
          'Server'
          'Both')
      end
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 588
    Top = 32
  end
end

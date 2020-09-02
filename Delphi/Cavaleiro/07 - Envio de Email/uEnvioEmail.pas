unit uEnvioEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  IdMessage, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText,
  IdAttachmentFile;

type
  TfrmEnvioEmail = class(TForm)
    PageControl1: TPageControl;
    tsFormulario: TTabSheet;
    tsConfiguracoes: TTabSheet;
    lblAssunto: TLabel;
    edtAssunto: TEdit;
    memMensagem: TMemo;
    lbxAnexos: TListBox;
    lblMensagem: TLabel;
    lbl: TLabel;
    btnEnviar: TSpeedButton;
    lblSMTP: TLabel;
    edtSMTP: TEdit;
    edtSenha: TEdit;
    edtPorta: TEdit;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lvlPorta: TLabel;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    lblDestinatario: TLabel;
    edtDestinario: TEdit;
    procedure btnEnviarClick(Sender: TObject);
  private
    procedure AplicarConfiguracoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;

implementation

{$R *.dfm}

procedure TfrmEnvioEmail.AplicarConfiguracoes;
begin
  IdSMTP.Port     := StrToIntDef(edtPorta.Text, 0);
  IdSMTP.Host     := edtSMTP.Text;
  IdSMTP.Username := edtUsuario.Text;
  IdSMTP.Password := edtSenha.Text;
end;

procedure TfrmEnvioEmail.btnEnviarClick(Sender: TObject);
var
 lIdText: TIdText;
begin
  try
    AplicarConfiguracoes;

    IdMessage.From.Address := edtUsuario.Text;
    IdMessage.From.Name := '';
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := edtDestinario.Text;
    IdMessage.Subject := edtAssunto.Text;
    IdMessage.Encoding := meMIME;


    lIdText := TIdText.Create(IdMessage.MessageParts);
    lIdText.Body.Add(memMensagem.Text);
    lIdText.ContentType := 'text/html; charset=iso-8859-1';

    //  TIdAttachmentFile.Create(IdMessage.MessageParts, 'c:\anexo.zip');

    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' +
          E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Erro ao enviar a mensagem: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
  end;
end;

end.

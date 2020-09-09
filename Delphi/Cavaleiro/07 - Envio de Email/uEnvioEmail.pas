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
    lblDestinatario: TLabel;
    edtDestinario: TEdit;
    btnArquivos: TSpeedButton;
    OpenDialog: TOpenDialog;
    cbbMetodo: TComboBox;
    cbbModo: TComboBox;
    lblMetodo: TLabel;
    lblModo: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnArquivosClick(Sender: TObject);
  private
    procedure AplicarConfiguracoesIdSMTP(poIdSMTP: TIdSMTP);
    procedure AplicarConfiguracoesIdMessage(poIdMessage: TIdMessage);
    procedure AplicarConfiguracoesIdSSLIOHandler(
      poIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL);
    procedure GerarIdText(poIdText: TIdText);
    procedure AdicionarAnexos(poIdMessage: TIdMessage);
    procedure EnviarEmail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;

implementation

{$R *.dfm}

procedure TfrmEnvioEmail.AplicarConfiguracoesIdSMTP(poIdSMTP: TIdSMTP);
begin
  poIdSMTP.AuthType  := satDefault;
  poIdSMTP.UseTLS    := utUseImplicitTLS;
  poIdSMTP.Port      := StrToIntDef(edtPorta.Text, 0);
  poIdSMTP.Host      := edtSMTP.Text;
  poIdSMTP.Username  := edtUsuario.Text;
  poIdSMTP.Password  := edtSenha.Text;
end;

procedure TfrmEnvioEmail.AplicarConfiguracoesIdSSLIOHandler(
  poIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL);
begin
  poIdSSLIOHandlerSocket.SSLOptions.Method := TIdSSLVersion(cbbMetodo.ItemIndex);
  poIdSSLIOHandlerSocket.SSLOptions.Mode   := TIdSSLMode(cbbModo.ItemIndex);
end;

procedure TfrmEnvioEmail.AplicarConfiguracoesIdMessage(poIdMessage: TIdMessage);
begin
  poIdMessage.From.Address           := edtUsuario.Text;
  poIdMessage.From.Name              := edtUsuario.Text;
  poIdMessage.ReplyTo.EMailAddresses := poIdMessage.From.Address;
  poIdMessage.Recipients.Add.Text    := edtDestinario.Text;
  poIdMessage.Subject                := edtAssunto.Text;
  poIdMessage.Encoding               := meMIME;
end;

procedure TfrmEnvioEmail.GerarIdText(poIdText: TIdText);
begin
  poIdText.Body.Add(memMensagem.Text);
  poIdText.ContentType := 'text/html; charset=iso-8859-1';
end;

procedure TfrmEnvioEmail.AdicionarAnexos(poIdMessage: TIdMessage);
var
  lArquivo: string;
begin
  for lArquivo in lbxAnexos.Items do
    TIdAttachmentFile.Create(poIdMessage.MessageParts, lArquivo);
end;

procedure TfrmEnvioEmail.btnArquivosClick(Sender: TObject);
var
  lArquivo: string;
begin
  lbxAnexos.Clear;
  if not OpenDialog.Execute() then
    Exit;

  for lArquivo in OpenDialog.Files do
  begin
    if FileExists(lArquivo) then
      lbxAnexos.Items.Add(lArquivo);
  end;
end;

procedure TfrmEnvioEmail.btnEnviarClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(procedure begin EnviarEmail end).start();
end;

procedure TfrmEnvioEmail.EnviarEmail;
var
 lIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
 lIdSMTP: TIdSMTP;
 lIdText: TIdText;
 lIdMessage: TIdMessage;
begin
  lIdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  lIdSMTP               := TIdSMTP.Create(Self);
  lIdMessage            := TIdMessage.Create(Self);
  try
    AplicarConfiguracoesIdSSLIOHandler(lIdSSLIOHandlerSocket);

    lIdSMTP.IOHandler := lIdSSLIOHandlerSocket;
    AplicarConfiguracoesIdSMTP(lIdSMTP);

    AplicarConfiguracoesIdMessage(lIdMessage);

    lIdText := TIdText.Create(lIdMessage.MessageParts);
    GerarIdText(lIdText);

    AdicionarAnexos(lIdMessage);

    try
      lIdSMTP.Connect;
      lIdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        Application.MessageBox('Erro na conexão\autenticação', 'Erro', MB_ICONERROR + MB_OK);
        Exit;
      end;
    end;

    try
      lIdSMTP.Send(lIdMessage);
      Application.MessageBox('E-mail enviado com sucesso!', 'Informação', MB_ICONINFORMATION + MB_OK);
    except
      Application.MessageBox('Erro ao enviar o e-mail.', 'Erro', MB_ICONERROR + MB_OK);
    end;
  finally
    lIdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(lIdMessage);
    FreeAndNil(lIdSSLIOHandlerSocket);
    FreeAndNil(lIdSMTP);
  end;
end;

procedure TfrmEnvioEmail.FormCreate(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
end;

end.

{
07 - Neste exercício, você deverá criar uma aplicação VCL para envio de e-mails
     utilizando o Indy.
     O formulário deverá disponibilizar campos de texto para informar o endereço
     SMTP, usuário, senha, porta e configurações de SSL.
     Além disso, adicione também um campo para informar o anexo e um componente
     TMemo para informar o corpo da mensagem, no qual poderá aceitar comandos HTML.
     Faça a chamada do envio do e-mail em uma Anonymous Thread.

Autor: Eder Correia Lira
}

program EnvioEmail;

uses
  Vcl.Forms,
  uEnvioEmail in 'uEnvioEmail.pas' {frmEnvioEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEnvioEmail, frmEnvioEmail);
  Application.Run;
end.

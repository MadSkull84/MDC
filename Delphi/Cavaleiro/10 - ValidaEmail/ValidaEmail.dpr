{
10 - Em uma aplicação VCL, faça a importação do WSDL do site RegExLib (http://regexlib.com/WebServices.asmx?WSDL).
     Este WebService contém um catálogo de expressões regulares para serem utilizadas.
     Faça um acesso ao WebService e consulte a expressão regular nº 3122,
     referente a validação de e-mails.
     Em seguida, utilize essa expressão para validar um endereço de e-mail
     informado pelo usuário, apresentando o texto "e-mail válido" ou
     "e-mail inválido" conforme o resultado.

Autor: Eder Correia Lira
}

program ValidaEmail;

uses
  Vcl.Forms,
  uValidaEmail in 'uValidaEmail.pas' {frmValidaEmail},
  WebServices in 'WebServices.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmValidaEmail, frmValidaEmail);
  Application.Run;
end.

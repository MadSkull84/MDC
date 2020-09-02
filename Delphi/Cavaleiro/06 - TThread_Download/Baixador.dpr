{
06 - Em uma aplicação VCL, declare uma classe Thread responsável por fazer o
     download de um arquivo qualquer da internet.
     Em seguida, em um formulário, adicione um campo de texto para que o usuário
     informe o endereço do arquivo, e uma barra de progresso para exibir o
     progresso do download.
     A classe TThread deverá ser utilizada para baixar o arquivo e atualizar a
     barra de progresso sem travar a aplicação.

Autor: Eder Correia Lira
}
program Baixador;

uses
  Vcl.Forms,
  uBaixador in 'uBaixador.pas' {frmBaixador},
  uThreadBaixador in 'uThreadBaixador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBaixador, frmBaixador);
  Application.Run;
end.

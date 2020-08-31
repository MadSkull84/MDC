{
05 - Em uma aplicação console ou VCL, faça um laço de repetição de 1 até 1 milhão
     listando os números primos encontrados, utilizando o TParallel da biblioteca
     System.Threading para paralelizar as iterações.

Autor: Eder Correia Lira
}
program Primos;

uses
  Vcl.Forms,
  uPrimos in 'uPrimos.pas' {frmPrimos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrimos, frmPrimos);
  Application.Run;
end.

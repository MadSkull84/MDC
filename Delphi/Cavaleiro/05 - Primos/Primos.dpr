{
05 - Em uma aplica��o console ou VCL, fa�a um la�o de repeti��o de 1 at� 1 milh�o
     listando os n�meros primos encontrados, utilizando o TParallel da biblioteca
     System.Threading para paralelizar as itera��es.

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

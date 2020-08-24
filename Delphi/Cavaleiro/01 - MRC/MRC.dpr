{
 01 - Em uma aplica��o console, defina duas Interfaces, chamadas
      IRepositorioNuvem e IRepositorioArquivo.
      Ambas devem declarar o m�todo "SalvarDados".
      Em seguida, declare uma classe que implemente as duas Interfaces e
      codifique o m�todo "SalvarDados" de cada Interface.
      Use o conceito de Method Resolution Clause para tratar o
      conflito de nomes de m�todos iguais.

 Autor: Eder Correia Lira
}

program MRC;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uRepositorioNuvem in 'uRepositorioNuvem.pas',
  uRepositorioArquivo in 'uRepositorioArquivo.pas',
  uRepositorio in 'uRepositorio.pas';

var
  loRepositorio: TRepositorio;

begin
  ReportMemoryLeaksOnShutdown := True;

  loRepositorio := TRepositorio.Create;
  try
    loRepositorio.SalvarDadosNuvem;
    loRepositorio.SalvarDadosArquivo;
  finally
    FreeAndNil(loRepositorio);
  end;
end.

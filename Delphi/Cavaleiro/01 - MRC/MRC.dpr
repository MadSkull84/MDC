{
 01 - Em uma aplicação console, defina duas Interfaces, chamadas
      IRepositorioNuvem e IRepositorioArquivo.
      Ambas devem declarar o método "SalvarDados".
      Em seguida, declare uma classe que implemente as duas Interfaces e
      codifique o método "SalvarDados" de cada Interface.
      Use o conceito de Method Resolution Clause para tratar o
      conflito de nomes de métodos iguais.

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

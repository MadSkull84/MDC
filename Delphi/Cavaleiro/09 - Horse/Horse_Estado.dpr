{
09 - Fa�a o download e instala��o do framework Horse (https://github.com/HashLoad/horse)
    para criar uma API no Delphi. Essa API dever� exportar duas rotas:
     /estados : retorna uma lista com o nome de todos os estados do Brasil;
     /estado/:id : retorna o nome, sigla, regi�o e capital do estado referente ao ID informado.
    Use a p�gina do Wikipedia para definir os IDs:
    https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil

Autor: Eder Correia Lira
}

program Horse_Estado;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse,
  uEstado in 'uEstado.pas',
  uListaEstados in 'uListaEstados.pas';

procedure Servidor(Horse: THorse);
begin
  Writeln(Format('Servidor rodando em %s:%d', [Horse.Host, Horse.Port]));
end;

begin
  THorse.Listen(9000, '127.0.0.1', Servidor);
end.

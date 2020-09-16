{
09 - Faça o download e instalação do framework Horse (https://github.com/HashLoad/horse)
    para criar uma API no Delphi. Essa API deverá exportar duas rotas:
     /estados : retorna uma lista com o nome de todos os estados do Brasil;
     /estado/:id : retorna o nome, sigla, região e capital do estado referente ao ID informado.
    Use a página do Wikipedia para definir os IDs:
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

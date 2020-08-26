{
03 - Desenvolva uma aplica��o VCL que fa�a a compacta��o de arquivos utilizando
     a classe TZipFile.
     Para isso, no formul�rio principal, permita que o usu�rio possa selecionar
     os arquivos que deseja compactar, bem como o caminho e nome do arquivo
     compactado que ser� criado.
     A opera��o deve observar as seguintes regras e comportamentos:
      * Arquivos com extens�o .EXE n�o podem ser selecionados (exiba uma mensagem ao usu�rio);
      * Caso o arquivo que ser� criado j� exista, deve ser sobrescrito sem confirma��o;
      * O progresso da compacta��o deve ser exibido em uma barra de progresso.

Autor: Eder Correia Lira
}

program ArquivoZip;

uses
  Vcl.Forms,
  uArquivoZip in 'uArquivoZip.pas' {frmArquivoZip};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmArquivoZip, frmArquivoZip);
  Application.Run;
end.

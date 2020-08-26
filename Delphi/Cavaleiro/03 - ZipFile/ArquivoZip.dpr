{
03 - Desenvolva uma aplicação VCL que faça a compactação de arquivos utilizando
     a classe TZipFile.
     Para isso, no formulário principal, permita que o usuário possa selecionar
     os arquivos que deseja compactar, bem como o caminho e nome do arquivo
     compactado que será criado.
     A operação deve observar as seguintes regras e comportamentos:
      * Arquivos com extensão .EXE não podem ser selecionados (exiba uma mensagem ao usuário);
      * Caso o arquivo que será criado já exista, deve ser sobrescrito sem confirmação;
      * O progresso da compactação deve ser exibido em uma barra de progresso.

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

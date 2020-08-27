{
04 - Em uma aplicação VCL, declare uma array de Tasks de 3 posições.
     Cada posição deste array deverá realizar a leitura de um diretório
     informado pelo usuário e listar todos os arquivos em um componente TMemo.
     Portanto, a aplicação deverá ter 3 componentes TMemo e 3 componentes TEdit
     para que o usuário informe os diretórios.
     Durante a leitura dos diretórios, a aplicação não poderá ficar travada,
     já que as Tasks deverão ser executadas paralelamente.
     Para testar a aplicação, informe diretórios com grandes quantidades de
     arquivos, como a pasta do Windows ou do Microsoft Office.

Autor: Eder Correia Lira
}
program Array_Task;

uses
  Vcl.Forms,
  uArrayTask in 'uArrayTask.pas' {frmArrayTask};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmArrayTask, frmArrayTask);
  Application.Run;
end.

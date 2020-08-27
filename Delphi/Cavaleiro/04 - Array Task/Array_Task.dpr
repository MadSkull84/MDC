{
04 - Em uma aplica��o VCL, declare uma array de Tasks de 3 posi��es.
     Cada posi��o deste array dever� realizar a leitura de um diret�rio
     informado pelo usu�rio e listar todos os arquivos em um componente TMemo.
     Portanto, a aplica��o dever� ter 3 componentes TMemo e 3 componentes TEdit
     para que o usu�rio informe os diret�rios.
     Durante a leitura dos diret�rios, a aplica��o n�o poder� ficar travada,
     j� que as Tasks dever�o ser executadas paralelamente.
     Para testar a aplica��o, informe diret�rios com grandes quantidades de
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

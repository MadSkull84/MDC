{
18 - Crie uma aplica��o VCL que funcione como um �notificador de lembretes�.
     O usu�rio poder� informar a data (dd/mm/yyyy), hor�rio (hh:mm) e descri��o
     de quantos lembretes desejar.
     Ao minimizar, a aplica��o dever� ficar na bandeja do sistema (system tray).
     Utilize um TTimer para comparar a data/hora atual com o lembrete e,
     quando for o hor�rio correspondente, exiba uma notifica��o no Windows com
     o componente TNotificationCenter.
     Ao clicar na notifica��o, a aplica��o dever� ser restaurada e exibida para
     o usu�rio.

Autor: Eder Correia Lira
}

program Lembretes;

uses
  Vcl.Forms,
  uLembretes in 'uLembretes.pas' {frmLembretes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLembretes, frmLembretes);
  Application.Run;
end.

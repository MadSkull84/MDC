program Baixador;

uses
  Vcl.Forms,
  uBaixador in 'uBaixador.pas' {Form1},
  uThreadBaixador in 'uThreadBaixador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

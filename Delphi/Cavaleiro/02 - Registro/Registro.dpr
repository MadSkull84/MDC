program Registro;

uses
  Vcl.Forms,
  uRegistro in 'uRegistro.pas' {frmRegistro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistro, frmRegistro);
  Application.Run;
end.

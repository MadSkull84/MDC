program Array_DML;

uses
  Vcl.Forms,
  uArray_DML in 'uArray_DML.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program Array_DML;

uses
  Vcl.Forms,
  uArray_DML in 'uArray_DML.pas' {frmArray_DML};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmArray_DML, frmArray_DML);
  Application.Run;
end.

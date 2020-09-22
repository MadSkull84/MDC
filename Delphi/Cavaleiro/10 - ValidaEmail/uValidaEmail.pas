unit uValidaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, WebServices;

type
  TfrmValidaEmail = class(TForm)
    lblEmail: TLabel;
    edtEmail: TEdit;
    btnValidarEmail: TSpeedButton;
    procedure btnValidarEmailClick(Sender: TObject);
  private
    { Private declarations }
    function PegarExpressao(const pnIdExpressao: integer): RegExpDetails;
  public
    { Public declarations }
  end;

var
  frmValidaEmail: TfrmValidaEmail;

implementation

uses System.RegularExpressions;

{$R *.dfm}

function TfrmValidaEmail.PegarExpressao(
  const pnIdExpressao: integer): RegExpDetails;
begin
  result := GetWebservicesSoap(True).getRegExpDetails(pnIdExpressao);
end;

procedure TfrmValidaEmail.btnValidarEmailClick(Sender: TObject);
var
  Expressao: RegExpDetails;
begin
  Expressao := PegarExpressao(3122);

  if TRegEx.IsMatch(EdtEmail.Text, Expressao.regular_expression) then
    Application.MessageBox('O e-mail informado é valido!','Informação', MB_ICONINFORMATION + MB_OK)
  else
    Application.MessageBox('O e-mail informado é invalido!','Informação', MB_ICONINFORMATION + MB_OK);
end;

end.

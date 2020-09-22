unit uConsultaCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AtendeCliente1, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmConsultaCEP = class(TForm)
    btnConsultar: TSpeedButton;
    lblLogradouro: TLabel;
    lblBairro: TLabel;
    lblUF: TLabel;
    lblCidade: TLabel;
    lblCEP: TLabel;
    edtCEP: TMaskEdit;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCEP: TfrmConsultaCEP;

implementation

{$R *.dfm}

procedure TfrmConsultaCEP.btnConsultarClick(Sender: TObject);
var
  Endereco: enderecoERP;
begin
   Endereco := GetAtendeCliente(True).ConsultaCEP(edtCEP.text);
   lblLogradouro.Caption := 'Logradouro: ' + Endereco.end_;
   lblBairro.Caption     := 'Bairro: ' + Endereco.bairro;
   lblCidade.Caption     := 'Cidade: ' + Endereco.cidade;
   lblUF.Caption         := 'UF: ' + Endereco.uf;
end;

end.

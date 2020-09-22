{
11 - Crie uma aplica��o VCL que permita a consulta dos dados de endere�o atrav�s do CEP.
     Para isso, importe o WSDL dos Correios (https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl).
     No formul�rio, adicione um campo de texto para informar o CEP e apresente
     os dados do endere�o (logradouro, bairro, cidade e UF).

Autor: Eder Correia Lira
}

program ConsultaCEP;

uses
  Vcl.Forms,
  uConsultaCEP in 'uConsultaCEP.pas' {frmConsultaCEP},
  AtendeCliente1 in 'AtendeCliente1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConsultaCEP, frmConsultaCEP);
  Application.Run;
end.

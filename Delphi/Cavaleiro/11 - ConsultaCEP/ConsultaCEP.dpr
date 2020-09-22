{
11 - Crie uma aplicação VCL que permita a consulta dos dados de endereço através do CEP.
     Para isso, importe o WSDL dos Correios (https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl).
     No formulário, adicione um campo de texto para informar o CEP e apresente
     os dados do endereço (logradouro, bairro, cidade e UF).

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

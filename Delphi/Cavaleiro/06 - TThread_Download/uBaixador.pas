unit uBaixador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  uThreadBaixador;

type
  TfrmBaixador = class(TForm)
    IdHTTP: TIdHTTP;
    edtURL: TEdit;
    btnBaixar: TSpeedButton;
    pgbProgresso: TProgressBar;
    Label1: TLabel;
    procedure btnBaixarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixador: TfrmBaixador;

implementation

{$R *.dfm}

procedure TfrmBaixador.btnBaixarClick(Sender: TObject);
begin
  TThreadBaixador.Create(edtURL, btnBaixar, pgbProgresso, IdHTTP);
end;

end.

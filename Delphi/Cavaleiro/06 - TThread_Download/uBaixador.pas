unit uBaixador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  uThreadBaixador;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  ltBaixador: TThreadBaixador;
begin
  ltBaixador := TThreadBaixador.Create(Edit1.Text, ProgressBar1, IdHTTP1);
  ltBaixador.Start;
end;

end.

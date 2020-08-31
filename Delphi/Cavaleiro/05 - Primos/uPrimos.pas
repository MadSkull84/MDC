unit uPrimos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, System.Threading,
  System.Math;

type
  TfrmPrimos = class(TForm)
    btnListarPrimos: TSpeedButton;
    memPrimos: TMemo;
    procedure btnListarPrimosClick(Sender: TObject);
  private
    { Private declarations }
    function EhPrimo(const nPosicao: integer): boolean;
    procedure ListarPrimos;
  public
    { Public declarations }
  end;

var
  frmPrimos: TfrmPrimos;

implementation

{$R *.dfm}

function TfrmPrimos.EhPrimo(const nPosicao: integer): boolean;
var
  i, liDivisoes: integer;
begin
  Result := false;
  liDivisoes := ZeroValue;
  for i := 1 to nPosicao do
    if (nPosicao mod i) = ZeroValue then
      Inc(liDivisoes);

  if liDivisoes = 2 then
    Result := true;
end;

procedure TfrmPrimos.ListarPrimos;
var
  i: integer;
begin
  memPrimos.Clear;
  TParallel.For(0, 1000000,
            procedure (i: integer)
            begin
              TThread.Queue(TThread.CurrentThread,
                procedure
                begin
                  if EhPrimo(i) then
                    memPrimos.Lines.Add(i.ToString);
                end)
            end);
end;

procedure TfrmPrimos.btnListarPrimosClick(Sender: TObject);
begin
  ListarPrimos;
end;

end.

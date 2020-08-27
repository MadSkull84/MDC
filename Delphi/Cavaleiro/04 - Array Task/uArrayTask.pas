unit uArrayTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, System.Math,
  System.Threading;

type
  TfrmArrayTask = class(TForm)
    lblDiretorio01: TLabel;
    edtDiretorio01: TEdit;
    memDiretorio01: TMemo;
    btnDiretorio01: TSpeedButton;
    lblDiretorio02: TLabel;
    edtDiretorio02: TEdit;
    memDiretorio02: TMemo;
    btnDiretorio02: TSpeedButton;
    lblDiretorio03: TLabel;
    edtDiretorio03: TEdit;
    memDiretorio03: TMemo;
    btnDiretorio03: TSpeedButton;
    FileOpenDialog: TFileOpenDialog;
    btnLerConteudo: TSpeedButton;
    procedure btnDiretorio01Click(Sender: TObject);
    procedure btnDiretorio02Click(Sender: TObject);
    procedure btnDiretorio03Click(Sender: TObject);
    procedure btnLerConteudoClick(Sender: TObject);
  private
    { Private declarations }
    function SelecionarDiretorio: string;
    function ValidaDiretorios: boolean;
    procedure LimparMemos;
    procedure ListaDiretorio(const psDiretorio: string; pmMemoSaida: TMemo);
    procedure ListarDiretorios;
  public
    { Public declarations }
  end;

var
  frmArrayTask: TfrmArrayTask;

implementation

{$R *.dfm}

procedure TfrmArrayTask.btnDiretorio01Click(Sender: TObject);
begin
  edtDiretorio01.Text := SelecionarDiretorio;
end;

procedure TfrmArrayTask.btnDiretorio02Click(Sender: TObject);
begin
  edtDiretorio02.Text := SelecionarDiretorio;
end;

procedure TfrmArrayTask.btnDiretorio03Click(Sender: TObject);
begin
  edtDiretorio03.Text := SelecionarDiretorio;
end;

procedure TfrmArrayTask.btnLerConteudoClick(Sender: TObject);
begin
  if ValidaDiretorios then
    ListarDiretorios;
end;

procedure TfrmArrayTask.LimparMemos;
begin
  memDiretorio01.Clear;
  memDiretorio02.Clear;
  memDiretorio03.Clear;
end;

procedure TfrmArrayTask.ListaDiretorio(const psDiretorio: string;
  pmMemoSaida: TMemo);
var
  lSearchRec: TSearchRec;
begin
  if FindFirst(psDiretorio + '*.*', faAnyFile, lSearchRec) = 0 then
  begin
    repeat
      if (lSearchRec.Attr = faDirectory) then
        Continue;
      pmMemoSaida.Lines.Add(lSearchRec.Name);
    until FindNext(lSearchRec) <> ZeroValue;
    FindClose(lSearchRec);
  end;
end;

procedure TfrmArrayTask.ListarDiretorios;
var
 lTasks: array [0..2] of ITask;
begin
  LimparMemos;

  lTasks[0] := TTask.Create(procedure begin ListaDiretorio(edtDiretorio01.Text, memDiretorio01) end);
  lTasks[0].Start;

  lTasks[1] := TTask.Create(procedure begin ListaDiretorio(edtDiretorio02.Text, memDiretorio02) end);
  lTasks[1].Start;

  lTasks[2] := TTask.Create(procedure begin ListaDiretorio(edtDiretorio03.Text, memDiretorio03) end);
  lTasks[2].Start;
end;

function TfrmArrayTask.SelecionarDiretorio: string;
var lsDiretorio: string;
begin
  lsDiretorio := EmptyStr;
  if FileOpenDialog.Execute then
  begin
    lsDiretorio := FileOpenDialog.FileName;
    if not lsDiretorio.EndsWith('\') then
      lsDiretorio := lsDiretorio + '\';
  end;
  result := lsDiretorio;
end;

function TfrmArrayTask.ValidaDiretorios: boolean;
begin
  result := DirectoryExists(edtDiretorio01.Text) and
            DirectoryExists(edtDiretorio02.Text) and
            DirectoryExists(edtDiretorio03.Text);
end;

end.

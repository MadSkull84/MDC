unit uArray_DML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.Diagnostics;

type
  TForm1 = class(TForm)
    FDConnection: TFDConnection;
    lblCaminhoDoArquivo: TLabel;
    edtCaminhoDoArquivo: TEdit;
    btnSelecionarArquivo: TSpeedButton;
    OpenDialog1: TOpenDialog;
    grdDados: TDBGrid;
    lblDados: TLabel;
    fdqImportacao: TFDQuery;
    dsrDados: TDataSource;
    btnImportar: TSpeedButton;
    fdqConsulta: TFDQuery;
    fdqConsultaID: TIntegerField;
    fdqConsultaNOME: TStringField;
    fdqConsultaCIDADE: TStringField;
    fdqConsultaEMAIL: TStringField;
    fdqConsultaDATANASC: TDateField;
    fdqConsultaPROFISSAO: TStringField;
    fdqConsultaCARTAO: TStringField;
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSelecionarArquivoClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute() then
    edtCaminhoDoArquivo.Text := OpenDialog1.FileName;
end;

procedure TForm1.btnImportarClick(Sender: TObject);
var
  lListaDosRegistros: TStringList;
  lListaDosValores: TStringList;
  lLinha: integer;
  lTempo: TStopwatch;
begin
  if not FileExists(edtCaminhoDoArquivo.Text) then
  begin
    Application.MessageBox('O arquivo informado não existe.', 'Importação Array DML',MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if fdqConsulta.Active then
    fdqConsulta.Close;

  if fdqImportacao.Active then
    fdqImportacao.Close;

  lTempo := TStopwatch.StartNew;

  lListaDosRegistros := TStringList.Create;

  lListaDosValores := TStringList.Create;
  try
    lListaDosRegistros.LoadFromFile(edtCaminhoDoArquivo.Text);

    fdqImportacao.Params.ArraySize := lListaDosRegistros.Count;

    lListaDosValores.StrictDelimiter := True;
    lListaDosValores.Delimiter := ';';

    for lLinha := 0 to Pred(lListaDosRegistros.Count) do
    begin
      lListaDosValores.DelimitedText := lListaDosRegistros[lLinha];

      fdqImportacao.ParamByName('ID').AsIntegers[lLinha]       := StrToIntDef(lListaDosValores[0], 0);
      fdqImportacao.ParamByName('NOME').AsStrings[lLinha]      := lListaDosValores[1];
      fdqImportacao.ParamByName('CIDADE').AsStrings[lLinha]    := lListaDosValores[2];
      fdqImportacao.ParamByName('EMAIL').AsStrings[lLinha]     := lListaDosValores[3];
      fdqImportacao.ParamByName('DATANASC').AsDates[lLinha]    := StrToDateDef(lListaDosValores[4], Date);
      fdqImportacao.ParamByName('PROFISSAO').AsStrings[lLinha] := lListaDosValores[5];
      fdqImportacao.ParamByName('CARTAO').AsStrings[lLinha]    := lListaDosValores[6];
    end;

    fdqImportacao.Execute(lListaDosRegistros.Count, 0);
  finally
    fdqConsulta.Open();

    lListaDosValores.Free;
    lListaDosRegistros.Free;

    lTempo.Stop;

    ShowMessage('Tempo decorrido em milisegundos: ' + IntToStr(lTempo.ElapsedMilliseconds));
  end;
end;

end.

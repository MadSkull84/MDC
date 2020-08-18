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
    FDConnection1: TFDConnection;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    SpeedButton2: TSpeedButton;
    FDQuery1ID: TIntegerField;
    FDQuery1NOME: TStringField;
    FDQuery1CIDADE: TStringField;
    FDQuery1EMAIL: TStringField;
    FDQuery1DATANASC: TDateField;
    FDQuery1PROFISSAO: TStringField;
    FDQuery1CARTAO: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute() then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  lStringListFile: TStringList;
  lStringListLine: TStringList;
  lCounter: integer;
  lTempo: TStopwatch;
begin
  lTempo := TStopwatch.StartNew;

  lStringListFile := TStringList.Create;

  lStringListLine := TStringList.Create;
  try
    lStringListFile.LoadFromFile(Edit1.Text);

    FDQuery1.Params.ArraySize := lStringListFile.Count;

    lStringListLine.StrictDelimiter := True;
    lStringListLine.Delimiter := ';';

    for lCounter := 0 to Pred(lStringListFile.Count) do
    begin
      lStringListLine.DelimitedText := lStringListFile[lCounter];

      FDQuery1.ParamByName('ID').AsIntegers[lCounter] := StrToIntDef(lStringListLine[0], 0);
      FDQuery1.ParamByName('NOME').AsStrings[lCounter] := lStringListLine[1];
      FDQuery1.ParamByName('CIDADE').AsStrings[lCounter] := lStringListLine[2];
      FDQuery1.ParamByName('EMAIL').AsStrings[lCounter] := lStringListLine[3];
      FDQuery1.ParamByName('DATANASC').AsDates[lCounter] := StrToDateDef(lStringListLine[4], Date);
      FDQuery1.ParamByName('PROFISSAO').AsStrings[lCounter] := lStringListLine[5];
      FDQuery1.ParamByName('CARTAO').AsStrings[lCounter] := lStringListLine[6];
    end;

    FDQuery1.Execute(lStringListFile.Count, 0);
  finally
    lStringListLine.Free;
    lStringListFile.Free;
  end;

  lTempo.Stop;

  ShowMessage('Time elapsed: ' + IntToStr(lTempo.ElapsedMilliseconds));
end;

end.

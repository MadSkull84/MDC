unit uArquivoZip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.Math, System.Zip;


const
  EXT_INVALIDAS: TArray<string> = ['.EXE','.MSI'];

type
  TfrmArquivoZip = class(TForm)
    btnSelecionarArquivos: TSpeedButton;
    OpenDialog: TOpenDialog;
    cdsArquivos: TClientDataSet;
    cdsArquivosARQUIVO: TStringField;
    cdsArquivosCAMINHO: TStringField;
    cdsArquivosEXTENSAO: TStringField;
    dscArquivos: TDataSource;
    dbgArquivos: TDBGrid;
    lblArquivoSaida: TLabel;
    edtNomeArquivoSaida: TEdit;
    btnArquivoSaida: TSpeedButton;
    SaveDialog: TSaveDialog;
    btnGerarArquivo: TSpeedButton;
    cdsArquivosCAMINHOCOMPLETO: TStringField;
    pgbProgresso: TProgressBar;
    procedure btnSelecionarArquivosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnArquivoSaidaClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    FBCampactar: integer;
    FBProcessados: integer;
    function ObterTamanhoArquivo(const NomeArquivo: string): integer;
    function ValidarExtensao(const psExtensao: string): boolean;
    procedure EventoOnProgress(Sender: TObject; FileName: string;
      Header: TZipHeader; Position: Int64);
  public
    { Public declarations }
  end;

var
  frmArquivoZip: TfrmArquivoZip;

implementation

{$R *.dfm}

function TfrmArquivoZip.ObterTamanhoArquivo(const NomeArquivo: string): integer;
var
  lStreamArquivo: TFileStream;
begin
  lStreamArquivo := TFileStream.Create(NomeArquivo, fmOpenRead);
  try
    result := lStreamArquivo.Size;
  finally
     FreeAndNil(lStreamArquivo);
  end;
end;


function TfrmArquivoZip.ValidarExtensao(const psExtensao: string): boolean;
var
  lsExtensao: string;
begin
  Result := true;
  for lsExtensao in EXT_INVALIDAS do
  begin
    if lsExtensao = psExtensao then
    begin
      Result := false;
      Break;
    end;
  end;
end;

procedure TfrmArquivoZip.EventoOnProgress(Sender: TObject; FileName: string;
  Header: TZipHeader; Position: Int64);
var
  lnPorcentagemGeral: real;
begin
  lnPorcentagemGeral := (FBProcessados + Position) / (FBCampactar * 100);
  pgbProgresso.Position := Trunc(lnPorcentagemGeral);
  Application.ProcessMessages;
end;

procedure TfrmArquivoZip.btnArquivoSaidaClick(Sender: TObject);
begin
  if SaveDialog.Execute() then
    edtNomeArquivoSaida.Text := SaveDialog.FileName;
end;

procedure TfrmArquivoZip.btnGerarArquivoClick(Sender: TObject);
var
  lZipFile: TZipFile;
begin
  lZipFile := TZipFile.Create;
  try
    FBProcessados := ZeroValue;
    FBCampactar   := ZeroValue;

    lZipFile.OnProgress := EventoOnProgress;
    lZipFile.Open(edtNomeArquivoSaida.Text, zmWrite);

    cdsArquivos.First;
    while not cdsArquivos.Eof do
    begin
      FBCampactar := ObterTamanhoArquivo(cdsArquivosCAMINHOCOMPLETO.AsString);
      cdsArquivos.Next;
    end;

    cdsArquivos.First;
    while not cdsArquivos.Eof do
    begin
      lZipFile.Add(cdsArquivosCAMINHOCOMPLETO.AsString);

      FBProcessados := FBProcessados +
        lZipFile.FileInfo[Pred(lZipFile.FileCount)].UncompressedSize;

      cdsArquivos.Next;
    end;

    Application.MessageBox('Compactação concluída!', 'Informação', MB_ICONINFORMATION + MB_OK);
  finally

    FreeAndNil(lZipFile);
  end;
end;

procedure TfrmArquivoZip.btnSelecionarArquivosClick(Sender: TObject);
var
  lArquivo: string;
  lArquivosInvalidos: TStringList;
begin
  lArquivosInvalidos := TStringList.Create;
  try
    cdsArquivos.EmptyDataSet;
    if OpenDialog.Execute() then
    begin
      for lArquivo in OpenDialog.Files do
      begin
        if (not ValidarExtensao(UpperCase(ExtractFileExt(lArquivo)))) then
        begin
          lArquivosInvalidos.Add(ExtractFileName(lArquivo));
          Continue;
        end;

        cdsArquivos.Insert;
        cdsArquivosARQUIVO.AsString := ExtractFileName(lArquivo);
        cdsArquivosCAMINHO.AsString := ExtractFilePath(lArquivo);
        cdsArquivosEXTENSAO.AsString := ExtractFileExt(lArquivo);
        cdsArquivosCAMINHOCOMPLETO.AsString := lArquivo;
        cdsArquivos.Post;
      end;
    end;
  finally
    if lArquivosInvalidos.Count > ZeroValue then

    Application.MessageBox(PWideChar('Os arquivos abaixo não podem ser incluídos no arquivo compactado a ser gerado!' + #13#10 + lArquivosInvalidos.Text), 'Atenção', MB_ICONINFORMATION + MB_OK);
    FreeAndNil(lArquivosInvalidos);
  end;
end;

procedure TfrmArquivoZip.FormCreate(Sender: TObject);
begin
  cdsArquivos.CreateDataSet;
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
end;

end.

unit uArquivoZip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.Math, System.Zip,
  Vcl.ExtCtrls, Vcl.DBCtrls;


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
    dbnArquivos: TDBNavigator;
    procedure btnSelecionarArquivosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnArquivoSaidaClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    FBCampactar: int64;
    FBProcessados: int64;
    function ObterTamanhoArquivo(const NomeArquivo: string): int64;
    function ValidarExtensao(const psExtensao: string): boolean;
    function ValidarArquivosSelecionados: boolean;
    function ValidarArquivoSaida: boolean;
    procedure ObterTamanhoArquivos;
    procedure EventoOnProgress(Sender: TObject; FileName: string;
      Header: TZipHeader; Position: Int64);
    procedure CompactarArquivos;
    procedure AdicionarArquivos(const psListaArquivos: TStrings);
  public
    { Public declarations }
  end;

var
  frmArquivoZip: TfrmArquivoZip;

implementation

{$R *.dfm}

function TfrmArquivoZip.ObterTamanhoArquivo(const NomeArquivo: string): int64;
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

procedure TfrmArquivoZip.ObterTamanhoArquivos;
begin
  FBCampactar := ZeroValue;
  cdsArquivos.DisableControls;
  try
    cdsArquivos.First;
    while not cdsArquivos.Eof do
    begin
      FBCampactar := FBCampactar + ObterTamanhoArquivo(cdsArquivosCAMINHOCOMPLETO.AsString);
      cdsArquivos.Next;
    end;
  finally
    cdsArquivos.EnableControls;
  end;
end;

function TfrmArquivoZip.ValidarArquivoSaida: boolean;
begin
  result := (Trim(edtNomeArquivoSaida.Text) <> EmptyStr) and
            (UpperCase(ExtractFileExt(edtNomeArquivoSaida.Text)) = '.ZIP');
end;

function TfrmArquivoZip.ValidarArquivosSelecionados: boolean;
begin
  result := cdsArquivos.RecordCount > ZeroValue;
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
  Application.ProcessMessages;
  pgbProgresso.Position := Trunc((FBProcessados + Position) / (FBCampactar * 100));
end;

procedure TfrmArquivoZip.AdicionarArquivos(const psListaArquivos: TStrings);
var
  lArquivo: string;
  lArquivosInvalidos: TStringList;
begin
  lArquivosInvalidos := TStringList.Create;
  try
    cdsArquivos.EmptyDataSet;

    for lArquivo in psListaArquivos do
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
  finally
    if lArquivosInvalidos.Count > ZeroValue then
      Application.MessageBox(PWideChar('Os arquivos abaixo não podem ser incluídos no arquivo compactado a ser gerado!' + #13#10 + lArquivosInvalidos.Text), 'Atenção', MB_ICONINFORMATION + MB_OK);
    FreeAndNil(lArquivosInvalidos);
  end;
end;

procedure TfrmArquivoZip.btnArquivoSaidaClick(Sender: TObject);
begin
  if SaveDialog.Execute() then
    edtNomeArquivoSaida.Text := SaveDialog.FileName;
end;

procedure TfrmArquivoZip.btnGerarArquivoClick(Sender: TObject);
begin
  if not ValidarArquivoSaida then
  begin
    Application.MessageBox('O arquivo de saída informado não é valido.', 'Atenção', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if not ValidarArquivosSelecionados then
  begin
    Application.MessageBox('Não existem arquivos selecionados.', 'Atenção', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  CompactarArquivos;
end;

procedure TfrmArquivoZip.btnSelecionarArquivosClick(Sender: TObject);
begin
  if OpenDialog.Execute() then
     AdicionarArquivos(OpenDialog.Files);
end;

procedure TfrmArquivoZip.CompactarArquivos;
var
  lZipFile: TZipFile;
begin
  lZipFile := TZipFile.Create;
  try
    pgbProgresso.Position := ZeroValue;
    FBProcessados         := ZeroValue;

    ObterTamanhoArquivos;

    lZipFile.OnProgress := EventoOnProgress;
    lZipFile.Open(edtNomeArquivoSaida.Text, zmWrite);

    cdsArquivos.DisableControls;
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
    cdsArquivos.EnableControls;
    FreeAndNil(lZipFile);
  end;
end;

procedure TfrmArquivoZip.FormCreate(Sender: TObject);
begin
  cdsArquivos.CreateDataSet;
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
end;

end.

unit uThreadBaixador;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TThreadBaixador = class(TThread)
  private
    FBarraProgresso: TProgressBar;
    FIdhttp: TIdHTTP;
    FURL: string;
    procedure Trabalhando(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure ComencandoTrabalho(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
  protected
    procedure Execute; override;
  public
    constructor Create(const pURL: string; pBarraProgresso: TProgressBar;
      pIdHTTP: TIdHTTP);
  end;

implementation

{ TContador }

procedure TThreadBaixador.ComencandoTrabalho(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  FBarraProgresso.Max := AWorkCountMax;
end;

procedure TThreadBaixador.Trabalhando(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  FBarraProgresso.Position := AWorkCount;
end;

constructor TThreadBaixador.Create(const pURL: string; pBarraProgresso: TProgressBar;
  pIdHTTP: TIdHTTP);
begin
  inherited Create(true);
  FURL:= pURL;
  FBarraProgresso := pBarraProgresso;
  FIdhttp := pIdHTTP;
end;

procedure TThreadBaixador.Execute;
var
  lArquivoDownload: TFileStream;
begin
  lArquivoDownload := TFileStream.Create(ExtractFilePath(Application.ExeName)+
                                         'Arquivo' +
                                         ExtractFileExt(FURL), fmCreate);
  try
    FIdhttp.OnWork := Trabalhando;
    FIdhttp.OnWorkBegin := ComencandoTrabalho;
    FIdhttp.Get(FURL, lArquivoDownload);
  finally
    FreeAndNil(lArquivoDownload);
  end;
end;

end.

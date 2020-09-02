unit uThreadBaixador;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, System.Math;

type
  TThreadBaixador = class(TThread)
  private
    FBarraProgresso: TProgressBar;
    FIdhttp: TIdHTTP;
    FEditURL: TEdit;
    FBotaoBaixar: TSpeedButton;
    procedure Trabalhando(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure ComencandoTrabalho(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HabilitaComponentes(const pbHabilitar: boolean);
    procedure Baixar;
  protected
    procedure Execute; override;
  public
    constructor Create(pEditURL: TEdit; pBotaoBaixar: TSpeedButton;
      pBarraProgresso: TProgressBar; pIdHTTP: TIdHTTP);
    destructor Destroy; override;
  end;

implementation

{ TContador }

procedure TThreadBaixador.Baixar;
var
  lArquivoDownload: TFileStream;
begin
  lArquivoDownload := TFileStream.Create(ExtractFilePath(Application.ExeName)+
                                         'Arquivo' +
                                         ExtractFileExt(FEditURL.Text), fmCreate);
  try
    FBarraProgresso.Position := ZeroValue;
    FIdhttp.OnWork := Trabalhando;
    FIdhttp.OnWorkBegin := ComencandoTrabalho;
    FIdhttp.Get(FEditURL.Text, lArquivoDownload);
  finally
    ShowMessage('Download concluído!');
    FreeAndNil(lArquivoDownload);
  end;
end;

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

procedure TThreadBaixador.HabilitaComponentes(const pbHabilitar: boolean);
begin
  FEditURL.Enabled := pbHabilitar;
  FBotaoBaixar.Enabled := pbHabilitar;
end;

constructor TThreadBaixador.Create(pEditURL: TEdit; pBotaoBaixar: TSpeedButton;
  pBarraProgresso: TProgressBar; pIdHTTP: TIdHTTP);
begin
  inherited Create;
  FEditURL        := pEditURL;
  FBotaoBaixar    := pBotaoBaixar;
  FBarraProgresso := pBarraProgresso;
  FIdhttp         := pIdHTTP;
  FreeOnTerminate := True;
end;

destructor TThreadBaixador.Destroy;
begin
  HabilitaComponentes(True);
  inherited;
end;

procedure TThreadBaixador.Execute;
begin
  HabilitaComponentes(False);
  Baixar;
end;

end.

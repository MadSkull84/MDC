{
02 - Desenvolva uma aplicação VCL capaz de listar os programas instalados no
     computador através da leitura do registro do Windows.
     Para isso, utilize a classe TRegistry e apresente, em uma TDBGrid,
     o nome do programa, versão e a empresa.

Autor: Eder Correia Lira
}
unit uRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.Registry, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmRegistro = class(TForm)
    btnListarProgramas: TSpeedButton;
    cdsProgramas: TClientDataSet;
    cdsProgramasPROGRAMA: TStringField;
    cdsProgramasVERSAO: TStringField;
    cdsProgramasEMPRESA: TStringField;
    dbgProgramas: TDBGrid;
    dscProgramas: TDataSource;
    procedure btnListarProgramasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LimparDados;
    procedure InserirRegistro(const pRegistro: TRegistry);
  public
    { Public declarations }
  end;

var
  frmRegistro: TfrmRegistro;

implementation

{$R *.dfm}

procedure TfrmRegistro.FormCreate(Sender: TObject);
begin
  cdsProgramas.CreateDataSet;
end;

procedure TfrmRegistro.InserirRegistro(const pRegistro: TRegistry);
begin
  cdsProgramas.Insert;
  cdsProgramasPROGRAMA.AsString := pRegistro.ReadString('DisplayName');
  cdsProgramasVERSAO.AsString   := pRegistro.ReadString('DisplayVersion');
  cdsProgramasEMPRESA.AsString  := pRegistro.ReadString('Publisher');
  cdsProgramas.Post;
end;

procedure TfrmRegistro.LimparDados;
begin
  cdsProgramas.EmptyDataSet;
end;

procedure TfrmRegistro.btnListarProgramasClick(Sender: TObject);
const
  UNINST_PATH = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall';
var
  lRegistro: TRegistry;
  lChaves: TStringList;
  lChave: string;
begin
  lRegistro := TRegistry.Create;
  lChaves := TStringList.Create;
  try
    LimparDados;

    lRegistro.RootKey := HKEY_LOCAL_MACHINE;
    if (not lRegistro.OpenKeyReadOnly(UNINST_PATH)) then
      exit;

    lRegistro.GetKeyNames(lChaves);
    lRegistro.CloseKey;
    for lChave in lChaves do
    begin
      if (not lRegistro.OpenKeyReadOnly(Format('%s\%s', [UNINST_PATH, lChave]))) then
        continue;

      if (lRegistro.ReadString('DisplayName') = EmptyStr) then
      begin
        lRegistro.CloseKey;
        continue;
      end;

      InserirRegistro(lRegistro);
      lRegistro.CloseKey;
    end;
  finally
    FreeAndNil(lRegistro);
    FreeAndNil(lChaves);
  end;
end;

end.

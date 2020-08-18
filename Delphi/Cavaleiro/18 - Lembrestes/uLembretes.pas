unit uLembretes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.Notification, System.DateUtils;

type
  TfrmLembretes = class(TForm)
    TrayIcon: TTrayIcon;
    ApplicationEvents: TApplicationEvents;
    PopupMenu: TPopupMenu;
    Abrir1: TMenuItem;
    Fechar1: TMenuItem;
    N1: TMenuItem;
    edtData: TDateTimePicker;
    lblDataDoLembrete: TLabel;
    lblLembrete: TLabel;
    edtLembrete: TEdit;
    cdsLembretes: TClientDataSet;
    cdsLembretesData: TDateField;
    cdsLembretesHora: TTimeField;
    cdsLembretesLembrete: TStringField;
    btnAdicionar: TSpeedButton;
    DBGrid1: TDBGrid;
    lblDados: TLabel;
    dscLembretes: TDataSource;
    DBNavigator1: TDBNavigator;
    NotificationCenter: TNotificationCenter;
    Timer: TTimer;
    lblHoraDoLembrete: TLabel;
    edtHora: TDateTimePicker;
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirAplicacao;
  public
    { Public declarations }
  end;

var
  frmLembretes: TfrmLembretes;

implementation

{$R *.dfm}

procedure TfrmLembretes.AbrirAplicacao;
begin
  TrayIcon.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TfrmLembretes.Abrir1Click(Sender: TObject);
begin
  AbrirAplicacao;
end;

procedure TfrmLembretes.ApplicationEventsMinimize(Sender: TObject);
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  TrayIcon.Visible := True;
  TrayIcon.Animate := True;
  TrayIcon.ShowBalloonHint;
end;

procedure TfrmLembretes.btnAdicionarClick(Sender: TObject);
begin
  cdsLembretes.Insert;
  cdsLembretesData.AsDateTime := edtData.Date;
  cdsLembretesHora.AsDateTime := edtHora.Time;
  cdsLembretesLembrete.AsString := edtLembrete.Text;
  cdsLembretes.Post;
end;

procedure TfrmLembretes.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLembretes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsLembretes.SaveToFile(ExtractFilePath(Application.ExeName) + 'Lembretes.XML');
end;

procedure TfrmLembretes.FormCreate(Sender: TObject);
begin
  cdsLembretes.CreateDataSet;
  if FileExists(ExtractFilePath(Application.ExeName) + 'Lembretes.XML') then
    cdsLembretes.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Lembretes.XML');

  edtData.Date := Date;
  edtHora.Time := Time;
end;

procedure TfrmLembretes.TimerTimer(Sender: TObject);
var
  lNotificacao: TNotification;
  lHora: word;
  lMinuto: word;
  lSegundo: word;
  lMileSegundo: word;
  lHoraFormatada: string;
begin
  DecodeTime(Time, lHora, lMinuto, lSegundo, lMileSegundo);
  lHoraFormatada := IntToStr(lHora) + ':' + IntToStr(lMinuto);
  if not cdsLembretes.Locate('Data;Hora', VarArrayOf([Date, lHoraFormatada]), [loCaseInsensitive]) then
    Exit;

  lNotificacao := NotificationCenter.CreateNotification;

  if not Assigned(lNotificacao) then
    Exit;

  try
    lNotificacao.Name := 'L' + cdsLembretesData.AsString+cdsLembretesHora.AsString;
    lNotificacao.Title := 'Lembrete!';
    lNotificacao.AlertBody := cdsLembretesLembrete.AsString;
    NotificationCenter.PresentNotification(lNotificacao);
  finally
    FreeAndNil(lNotificacao);
  end;
end;

procedure TfrmLembretes.TrayIconDblClick(Sender: TObject);
begin
  AbrirAplicacao;
end;

end.

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
    btnAdicionar: TSpeedButton;
    DBGrid1: TDBGrid;
    lblDados: TLabel;
    dscLembretes: TDataSource;
    DBNavigator1: TDBNavigator;
    NotificationCenter: TNotificationCenter;
    Timer: TTimer;
    lblHoraDoLembrete: TLabel;
    edtHora: TDateTimePicker;
    cdsLembretesDATA: TStringField;
    cdsLembretesHORA: TStringField;
    cdsLembretesLEMBRETE: TStringField;
    cdsLembretesEXECUTADO: TBooleanField;
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure NotificationCenterReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
  private
    { Private declarations }
    procedure AbrirAplicacao;
    procedure GerarLembrete;
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
  cdsLembretesDATA.AsString := FormatDateTime('DD/MM/YYY', edtData.Date);
  cdsLembretesHORA.AsString := FormatDateTime('HH:MM', edtHora.Time);
  cdsLembretesLEMBRETE.AsString := edtLembrete.Text;
  cdsLembretesEXECUTADO.AsBoolean := false;
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

procedure TfrmLembretes.GerarLembrete;
var
  lNotificacao: TNotification;
begin
  lNotificacao := NotificationCenter.CreateNotification;
  try
    if not Assigned(lNotificacao) then
      Exit;

    lNotificacao.Name := 'L' + cdsLembretesData.AsString+cdsLembretesHora.AsString;
    lNotificacao.Title := 'Lembrete!';
    lNotificacao.AlertBody := cdsLembretesLembrete.AsString;
    NotificationCenter.PresentNotification(lNotificacao);
  finally
    cdsLembretes.Edit;
    cdsLembretesEXECUTADO.AsBoolean := true;
    cdsLembretes.Post;
    FreeAndNil(lNotificacao);
  end;
end;

procedure TfrmLembretes.NotificationCenterReceiveLocalNotification(
  Sender: TObject; ANotification: TNotification);
begin
  AbrirAplicacao;
end;

procedure TfrmLembretes.TimerTimer(Sender: TObject);
begin
  cdsLembretes.DisableControls;
  cdsLembretes.Filter := 'DATA = ' + QuotedStr(FormatDateTime('DD/MM/YYY', Date)) +
                         ' and HORA = ' + QuotedStr(FormatDateTime('HH:MM', Time)) +
                         ' and EXECUTADO = ' + BoolToStr(false);
  cdsLembretes.Filtered := true;

  while not cdsLembretes.Eof do
  begin
    GerarLembrete;
    cdsLembretes.Next;
  end;

  cdsLembretes.Filter := EmptyStr;
  cdsLembretes.Filtered := false;
  cdsLembretes.EnableControls;
end;

procedure TfrmLembretes.TrayIconDblClick(Sender: TObject);
begin
  AbrirAplicacao;
end;

end.

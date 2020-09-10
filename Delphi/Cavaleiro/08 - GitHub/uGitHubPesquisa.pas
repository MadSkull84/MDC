unit uGitHubPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TfrmGitHubPesquisa = class(TForm)
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    btnPesquisar: TSpeedButton;
    DBGrid1: TDBGrid;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FDMemTable: TFDMemTable;
    DataSource: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGitHubPesquisa: TfrmGitHubPesquisa;

implementation

{$R *.dfm}

procedure TfrmGitHubPesquisa.btnPesquisarClick(Sender: TObject);
begin
  RESTRequest.Resource := edtUsuario.Text;
  RESTRequest.Execute;
end;

end.

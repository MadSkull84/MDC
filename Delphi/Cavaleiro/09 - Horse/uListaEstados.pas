unit uListaEstados;

interface

uses System.SysUtils, System.Generics.Collections, System.Json, REST.Json,
  REST.Json.Interceptors, uEstado, Horse, Horse.Commons;

implementation

var
  FLista_Estados: TObjectList<TEstado>;

procedure Estado(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  lSigla: string;
  lEstado: TEstado;
  lJSON: string;
begin
  lJSON  := EmptyStr;
  lSigla := Req.Params.Items['id'];

  for lEstado in FLista_Estados do
  begin
    if lEstado.Sigla = lSigla then
    begin
      lJSON := TJson.ObjectToJsonString(lEstado);
      break;
    end;
  end;

  if lJSON = EmptyStr then
    Res.Status(THTTPStatus.NoContent)
  else
    Res.Send(lJSON).Status(THTTPStatus.OK);
end;

procedure Estados(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  lEstado: TEstado;
  lJSON: TJSONValue;
  lJSONArray: TJSONArray;
begin
  lJSONArray := TJSONArray.Create;
  try
    for lEstado in FLista_Estados do
    begin
      lJSON := TJson.ObjectToJsonObject(lEstado);
      lJSONArray.AddElement(lJSON);
    end;
    Res.Send(lJSONArray.ToJSON).Status(THTTPStatus.OK);
  finally
    FreeAndNil(lJSONArray);
  end;
end;

procedure InicializaEstados;
begin
  FLista_Estados := TObjectList<TEstado>.Create;
  FLista_Estados.Add(TEstado.Create('Acre','AC','Rio Branco','Norte'));
  FLista_Estados.Add(TEstado.Create('Alagoas','AL','Macei�','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Amap�','AP','Macap�','Norte'));
  FLista_Estados.Add(TEstado.Create('Amazonas','AM','Manaus','Norte'));
  FLista_Estados.Add(TEstado.Create('Bahia','BA','Salvador','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Cear�','CE','Fortaleza','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Distrito Federal','DF','Bras�lia','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Esp�rito Santo','ES','Vit�ria','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Goi�s','GO','Goi�nia','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Maranh�o','MA','S�o Lu�s','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Mato Grosso','MT','Cuiab�','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Mato Grosso do Sul','MS','Campo Grande','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Minas Gerais','MG','Belo Horizonte','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Par�','PA','Bel�m','Norte'));
  FLista_Estados.Add(TEstado.Create('Para�ba','PB','Jo�o Pessoa','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Paran�','PR','Curitiba','Sul'));
  FLista_Estados.Add(TEstado.Create('Pernambuco','PE','Recife','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Piau�','PI','Teresina','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Rio de Janeiro','RJ','Rio de Janeiro','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Rio Grande do Norte','RN','Natal','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Rio Grande do Sul','RS','Porto Alegre','Sul'));
  FLista_Estados.Add(TEstado.Create('Rond�nia','RO','Porto Velho','Norte'));
  FLista_Estados.Add(TEstado.Create('Roraima','RR','Boa Vista','Norte'));
  FLista_Estados.Add(TEstado.Create('Santa Catarina','SC','Florian�polis','Sul'));
  FLista_Estados.Add(TEstado.Create('S�o Paulo','SP','S�o Paulo','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Sergipe','SE','Aracaju','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Tocantins','TO','Palmas','Norte'));
end;

initialization
  InicializaEstados;
  THorse.Get('/estados', Estados);
  THorse.Get('/estado/:id', Estado);

end.

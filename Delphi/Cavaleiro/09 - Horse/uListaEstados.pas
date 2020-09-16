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
  FLista_Estados.Add(TEstado.Create('Alagoas','AL','Maceió','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Amapá','AP','Macapá','Norte'));
  FLista_Estados.Add(TEstado.Create('Amazonas','AM','Manaus','Norte'));
  FLista_Estados.Add(TEstado.Create('Bahia','BA','Salvador','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Ceará','CE','Fortaleza','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Distrito Federal','DF','Brasília','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Espírito Santo','ES','Vitória','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Goiás','GO','Goiânia','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Maranhão','MA','São Luís','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Mato Grosso','MT','Cuiabá','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Mato Grosso do Sul','MS','Campo Grande','Centro-Oeste'));
  FLista_Estados.Add(TEstado.Create('Minas Gerais','MG','Belo Horizonte','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Pará','PA','Belém','Norte'));
  FLista_Estados.Add(TEstado.Create('Paraíba','PB','João Pessoa','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Paraná','PR','Curitiba','Sul'));
  FLista_Estados.Add(TEstado.Create('Pernambuco','PE','Recife','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Piauí','PI','Teresina','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Rio de Janeiro','RJ','Rio de Janeiro','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Rio Grande do Norte','RN','Natal','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Rio Grande do Sul','RS','Porto Alegre','Sul'));
  FLista_Estados.Add(TEstado.Create('Rondônia','RO','Porto Velho','Norte'));
  FLista_Estados.Add(TEstado.Create('Roraima','RR','Boa Vista','Norte'));
  FLista_Estados.Add(TEstado.Create('Santa Catarina','SC','Florianópolis','Sul'));
  FLista_Estados.Add(TEstado.Create('São Paulo','SP','São Paulo','Sudeste'));
  FLista_Estados.Add(TEstado.Create('Sergipe','SE','Aracaju','Nordeste'));
  FLista_Estados.Add(TEstado.Create('Tocantins','TO','Palmas','Norte'));
end;

initialization
  InicializaEstados;
  THorse.Get('/estados', Estados);
  THorse.Get('/estado/:id', Estado);

end.

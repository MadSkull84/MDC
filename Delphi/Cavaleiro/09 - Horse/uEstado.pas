unit uEstado;

interface

uses REST.Json.Types;

type
  TEstado = Class
  private
    [JsonName('sigla')]
    FSigla: string;
    [JsonName('nome')]
    FNome: string;
    [JsonName('regiao')]
    FRegiao: string;
    [JsonName('capital')]
    FCapital: string;
  public
    property Sigla: string read FSigla write FSigla;
    property Nome: string read FNome write FNome;
    property Regiao: string read FRegiao write FRegiao;
    property Capital: string read FCapital write FCapital;
    constructor Create(const psNome, psSigla, psCapital, psRegiao: string);
  End;

implementation

{ TEstado }

constructor TEstado.Create(const psNome, psSigla, psCapital, psRegiao: string);
begin
  FSigla := psSigla;
  FNome := psNome;
  FRegiao := psRegiao;
  FCapital := psCapital;
end;

end.

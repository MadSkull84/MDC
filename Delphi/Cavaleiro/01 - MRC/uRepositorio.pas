unit uRepositorio;

interface

uses uRepositorioNuvem, uRepositorioArquivo;

type
  TRepositorio = class(TInterfacedObject, IRepositorioNuvem, IRepositorioArquivo)
  private
    procedure IRepositorioNuvem.SalvarDados = SalvarDadosNuvem;
    procedure IRepositorioArquivo.SalvarDados = SalvarDadosArquivo;
  public
    procedure SalvarDadosNuvem;
    procedure SalvarDadosArquivo;
  end;

implementation

{ Repositorio }

procedure TRepositorio.SalvarDadosArquivo;
begin
  Writeln('Interface IRepositorioArquivo');
  Writeln('SalvarDadosArquivo');
end;

procedure TRepositorio.SalvarDadosNuvem;
begin
  Writeln('Interface IRepositorioNuvem');
  Writeln('SalvarDadosNuvem');
end;

end.

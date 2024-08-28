unit uClienteModel;

interface

uses
  System.SysUtils;

Type
  TCliente = class
  private
    FID: Integer;
    FDocumento: String;
    FNome: String;
    FTipo: string;
    FTelefone: String;
    procedure SetNome(const Value: String);
  protected
  public
    property ID         : Integer read FID Write FID;
    property Nome       : String read FNome write SetNome;
    property Tipo       : string read FTipo Write FTipo;
    property Documento  : String read FDocumento Write FDocumento;
    property Telefone   : String read FTelefone Write FTelefone;

  published
    { published declarations }
  end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('O nome precisa ser preenchido');
  FNome := Value;
end;

end.

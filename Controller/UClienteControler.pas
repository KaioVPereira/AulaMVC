unit UClienteControler;

interface

uses uClienteModel, UdmCliente;
  type TClienteController = class
       public
         constructor create;
         destructor Destroy; Override;
         function Inserir           (oCliente : TCliente; var sErro : String): Boolean;
         function Alterar           (oCliente : TCliente; var sErro : String): Boolean;
         function Excluir           (oCliente : TCliente; var sErro : String): Boolean;
         procedure CarregarCliente  (oCliente : TCliente; iCodigo : Integer);
         procedure Pesquisar        (Nome:String);
       end;

implementation

uses
  System.SysUtils;

{ TClienteController }

function TClienteController.Alterar(oCliente: TCliente;
  var sErro: String): Boolean;
begin
  result := dmCliente.Alterar(oCliente,sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: TCliente;
  iCodigo: Integer);
begin
  dmCliente.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteController.create;
begin
  //dmCliente := TdmCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  //FreeAndNil(dmCliente);
  inherited;
end;

function TClienteController.Excluir(oCliente: TCliente;
  var sErro: String): Boolean;
begin
  result := dmCliente.Excluir(oCliente, sErro);
end;

function TClienteController.Inserir(oCliente: TCliente; var sErro: String): Boolean;
begin
  result := dmCliente.Inserir(oCliente,sErro);
end;

procedure TClienteController.Pesquisar(Nome: String);
begin
  dmCliente.Pesquisar(Nome);
end;

end.

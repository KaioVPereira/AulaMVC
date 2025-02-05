unit UdmCliente;

interface

uses
  System.SysUtils, System.Classes, UdmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uClienteModel;

type
  TdmCliente = class(TDataModule)
    qryPesquisar: TFDQuery;
    qryInserir: TFDQuery;
    qryAlterar: TFDQuery;
    qryExcluir: TFDQuery;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarID: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarTIPO: TStringField;
    cdsPesquisarDOCUMENTO: TStringField;
    cdsPesquisarTELEFONE: TStringField;
    qryPesquisarID: TIntegerField;
    qryPesquisarNOME: TStringField;
    qryPesquisarTIPO: TStringField;
    qryPesquisarDOCUMENTO: TStringField;
    qryPesquisarTELEFONE: TStringField;
  private
    { Private declarations }
  public
    procedure Pesquisar       (Nome:String);
    procedure CarregarCliente (oCliente : Tcliente; iCodigo : Integer);
    Function  Inserir         (oCliente : TCliente; out sErro : String): Boolean;
    Function  Alterar         (oCliente : TCliente; out sErro : String): Boolean;
    Function  Excluir         (oCliente : Tcliente; out sErro : String): Boolean;
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCliente }

function TdmCliente.Alterar(oCliente: TCliente; out sErro: String): Boolean;
begin
  with oCliente, qryAlterar do
  begin
    Params[0].AsString  := Nome;
    Params[1].AsString  := Tipo;
    Params[2].AsString  := Documento;
    Params[3].AsString  := Telefone;
    Params[4].AsInteger := ID;
    try
      ExecSQL;
      Result := true;
    Except on E: Exception do
    begin
      sErro   := 'Ocorreu um erro ao tentar alterar o cliente' + sLineBreak + E.Message;
      Result  := False;
    end;

    end;

  end;
end;

procedure TdmCliente.CarregarCliente(oCliente: Tcliente; iCodigo: Integer);
var
  sqlCliente : TFDQuery;
begin
  sqlCliente := TFDQuery.Create(nil);
  try
    with sqlCliente do
    begin
      Connection := dmConexao.fdConexao;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM CLIENTES WHERE (ID ='+ IntToStr(iCodigo)+')';
      Open();
      with oCliente do
      begin
        ID          := FieldByName('ID').AsInteger;
        Nome        := FieldByName('NOME').AsString;
        Tipo        := FieldByName('TIPO').AsString;
        Documento   := FieldByName('DOCUMENTO').AsString;
        Telefone    := FieldByName('TELEFONE').AsAnsiString;
      end;
    end;

  finally
    sqlCliente.Free;
  end;
end;

function TdmCliente.Excluir(oCliente: Tcliente; out sErro: String): Boolean;
begin
  with oCliente, qryExcluir do
  begin
    Params[0].AsInteger := ID;
    TRY
      ExecSQL;
      Result := True;
    Except on E : Exception do
    begin
      sErro := 'Ocorreu um erro ao tentar excluir o cliente' + sLineBreak + E.Message;
      Result := False;
    end;

    END;
  end;
end;

function TdmCliente.Inserir(oCliente: TCliente; out sErro: String): Boolean;
begin
  with qryInserir, oCliente do
  begin
    Params[0].AsString := Nome;
    Params[1].AsString := Tipo;
    Params[2].AsString := Documento;
    Params[3].AsString := Telefone;

    try
      ExecSQL;
      Result := True;
    Except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir cliente: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TdmCliente.Pesquisar(Nome: String);
begin
  qryPesquisar.Close;
  qryPesquisar.Params[0].AsString := '%' + Nome + '%';
  qryPesquisar.Open;
  qryPesquisar.First;
end;

end.

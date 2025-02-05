unit U_FrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, UClienteControler, uClienteModel,
  UdmCliente;

type
  tOperacao = (opNovo, opAlterar, opNavegar);

  TFrm_CadCliente = class(TForm)
    Pnl_Rodape: TPanel;
    Btn_Fechar: TButton;
    pgControl: TPageControl;
    tbPes: TTabSheet;
    tbDados: TTabSheet;
    pnl_Filtro: TPanel;
    lbedt_Busca: TLabeledEdit;
    btn_Buscar: TButton;
    pnl_BtnsPesquisar: TPanel;
    btn_Novo: TButton;
    btn_Detalhar: TButton;
    btn_Excluir: TButton;
    DBGrid1: TDBGrid;
    dsPesquisar: TDataSource;
    edt_Codigo: TLabeledEdit;
    edtName: TLabeledEdit;
    cbTipo: TComboBox;
    edtDocumento: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    lbTipo: TLabel;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_BuscarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_DetalharClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Foperacao : tOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles (aOperacao : tOperacao);
  public
    { Public declarations }

  end;

var
  Frm_CadCliente: TFrm_CadCliente;

implementation

{$R *.dfm}

procedure TFrm_CadCliente.Alterar;
var
  oCliente            : TCliente;
  oClienteController  : TClienteController;
  sErro               : String;
begin
  oCliente            := TCliente.Create;
  oClienteController  := TClienteController.create;
  try
    with oCliente do
    begin
      ID        := StrToIntDef(edt_Codigo.Text, 0);
      Nome      := edtName.Text;
      Tipo      := cbTipo.Text;
      Documento := edtDocumento.Text;
      Telefone  := edtTelefone.Text;
    end;

    if not oClienteController.Alterar(oCliente, sErro) then
    raise Exception.Create(sErro);

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;

end;

procedure TFrm_CadCliente.btnAlterarClick(Sender: TObject);
begin
  Foperacao := opAlterar;
  HabilitarControles(opAlterar)
end;

procedure TFrm_CadCliente.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFrm_CadCliente.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TFrm_CadCliente.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFrm_CadCliente.btn_BuscarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrm_CadCliente.btn_DetalharClick(Sender: TObject);
begin
  Detalhar;
  HabilitarControles(opNavegar);
end;

procedure TFrm_CadCliente.btn_ExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrm_CadCliente.Btn_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CadCliente.btn_NovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TFrm_CadCliente.CarregarCliente;
  var
    oClienteController : TClienteController;
    oCliente : TCliente;

begin
    oClienteController  := TClienteController.create;
    oCliente            := TCliente.Create;
  try
    oClienteController.CarregarCliente(oCliente, dsPesquisar.DataSet.FieldByName('ID').AsInteger);
    With oCliente do
    begin
      edt_Codigo.Text   := IntToStr(ID);
      edtName.Text      := Nome;
      edtDocumento.Text := Documento;
      edtTelefone.Text  := Telefone;
      cbTipo.Text       := Tipo;
    end;
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;

end;

procedure TFrm_CadCliente.Configuracoes;
begin
  tbPes.TabVisible:= False;
  tbDados.TabVisible:= False;
  pgControl.ActivePage := tbPes;
end;

procedure TFrm_CadCliente.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrm_CadCliente.Detalhar;
begin
  CarregarCliente;
  HabilitarControles(opNavegar);
  Foperacao := opNavegar;
  pgControl.ActivePage := tbDados;
end;

procedure TFrm_CadCliente.Excluir;
var
  oCliente           : TCliente;
  oClienteController : TClienteController;
  sErro              : string;
begin
  oCliente            := TCliente.Create;
  oClienteController  := TClienteController.create;
  try
    with oCliente do
    begin
      ID := dsPesquisar.DataSet.FieldByName('ID').AsInteger;
    end;
    if MessageDlg('Deseja realmente excluir o registro ?', mtConfirmation,[mbyes, mbNo ],0)=IDYES then
    begin
      if not oClienteController.Excluir(oCliente, sErro) then
        raise Exception.Create(sErro);
      oClienteController.Pesquisar(lbedt_Busca.Text);

    end;

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;

end;

procedure TFrm_CadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dmCliente);
end;

procedure TFrm_CadCliente.FormCreate(Sender: TObject);
begin
  dmCliente := TdmCliente.Create(nil);
end;

procedure TFrm_CadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrm_CadCliente.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TFrm_CadCliente.Gravar;
var
  oClienteController : TClienteController;
begin
  oClienteController := TClienteController.create;
  TRY
    case Foperacao  of
      opNovo    :Inserir;
      opAlterar  :Alterar;
    end;
    Pesquisar;
  FINALLY
    FreeAndNil(oClienteController);
  END;
end;

procedure TFrm_CadCliente.HabilitarControles(aOperacao: tOperacao);
begin
  case aOperacao of
    opNovo,opAlterar:
    begin
      edtName.Enabled       := True;
      edtDocumento.Enabled  := True;
      edtTelefone.Enabled   := True;
      cbTipo.Enabled        := True;
      btnListar.Enabled     := False;
      Btn_Fechar.Enabled    := False;
      btnAlterar.Enabled    := False;
      btnGravar.Enabled     := True;
      btnCancelar.Enabled   := True;
    end;

    opNavegar:
    begin
      edtName.Enabled       := False;
      edtDocumento.Enabled  := False;
      edtTelefone.Enabled   := False;
      cbTipo.Enabled        := False;
      btnListar.Enabled     := True;
      Btn_Fechar.Enabled    := True;
      btnAlterar.Enabled    := True;
      btnGravar.Enabled     := False;
      btnCancelar.Enabled   := False;
    end;
  end;
end;

procedure TFrm_CadCliente.Inserir;
var
  oCliente            : TCliente;
  oClienteController  : TClienteController;
  sErro               : String;
begin
  oCliente            := TCliente.Create;
  oClienteController  := TClienteController.create;
  try
    wITH oCliente DO
    BEGIN
      NOME        := edtName.Text;
      Tipo        := cbTipo.Text;
      Documento   := edtDocumento.Text;
      Telefone    := edtTelefone.Text;
    END;

    if not oClienteController.Inserir(oCliente, sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;
end;

procedure TFrm_CadCliente.Listar;
begin
  pgControl.ActivePage := tbPes;
end;

procedure TFrm_CadCliente.Novo;
begin
  Foperacao := opNovo;
  pgControl.ActivePage := tbDados;
end;

procedure TFrm_CadCliente.Pesquisar;
var
  oClienteController  : TClienteController;
begin
  oClienteController := TClienteController.create;
  TRY
    oClienteController.Pesquisar(lbedt_Busca.Text);
  FINALLY
    FreeAndNil(oClienteController);
  END;
end;

end.

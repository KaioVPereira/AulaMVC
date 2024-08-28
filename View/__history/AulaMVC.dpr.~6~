program AulaMVC;

uses
  Vcl.Forms,
  U_FrmPrincipal in 'U_FrmPrincipal.pas' {Frm_Principal},
  U_FrmCadCliente in 'U_FrmCadCliente.pas' {Frm_CadCliente},
  uClienteModel in '..\Model\uClienteModel.pas',
  UClienteControler in '..\Controller\UClienteControler.pas',
  UdmConexao in '..\Dao\UdmConexao.pas' {dmConexao: TDataModule},
  UdmCliente in '..\Dao\UdmCliente.pas' {dmCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.

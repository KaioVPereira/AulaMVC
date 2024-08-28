unit U_FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, U_FrmCadCliente;

type
  TFrm_Principal = class(TForm)
    Btn_Cliente: TButton;
    procedure Btn_ClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

procedure TFrm_Principal.Btn_ClienteClick(Sender: TObject);
begin
  if not Assigned(Frm_CadCliente) then
  begin
    Frm_CadCliente := TFrm_CadCliente.Create(self);
    try
      Frm_CadCliente.ShowModal;
    finally
      FreeAndNil(Frm_CadCliente)
    end;
  end;

end;

end.

unit ConhecFrete.Controller.Cliente;

interface

uses
   Forms
  ,Classes
  ,Vcl.Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCte;

type
  IControllerCteCliente = interface
  ['{04483F73-16D0-4268-BB18-1B900C309A8B}']
    procedure Iniciar(pParentOwner :TForm);
  end;

  TControllerCteCliente = class(TInterfacedObject, IControllerCteCliente)
  private
    FOwnerMain :TForm;
    FOwnerTopMenu :TForm;

    FItemMenuActive :TpMenuCte;
    FItemRegraActive :TpRegra;
    FItemSimularActive :TpSimular;

    FDadosCte :TfrmSimplificadoDadosCte;

    procedure OrganizarItensMenu(pItemMenu :TpMenuCte);
    procedure OrganizarItensDadosCte;
    procedure OrganizarItensMotoristaCte;
    procedure OrganizarItensParametrosCte;
    procedure OrganizarItensTomadorCte;
    procedure OrganizarItensDefinrRegraCte;
    procedure OrganizarItensDadosSeguroPedagioCte;

    procedure OnClickMultiplosRem(Sender :TObject);
    procedure OnClickMultiplosDest(Sender :TObject);
    procedure OnClickDadosCte(Sender :TObject);
    procedure OnClickMesmoCNPJ(Sender :TObject);
    procedure OnClickTomadorCte(Sender :TObject);
    procedure OnClickDadosSeguroCte(Sender :TObject);
    procedure OnClickParamsGeraisCte(Sender :TObject);
    procedure OnClickMotoristaCte(Sender :TObject);
    procedure OnClickNovoCteSimplificado(Sender :TObject);
    procedure OnClickSimularCteSimplificado(Sender :TObject);
    procedure OnClickDefinirRegra(Sender :TObject);
    procedure OnClickInfoRegraCte(Sender :TObject);
    procedure OnClickOkInfoRegraCte(Sender :TObject);

    procedure OnMouseLeaveOkInfoRegra(Sender: TObject);
    procedure OnMouseLeaveMultiplosRem(Sender: TObject);
    procedure OnMouseLeaveMultiplosDest(Sender: TObject);
    procedure OnMouseLeaveNovoCte(Sender: TObject);
    procedure OnMouseLeaveSimularCte(Sender: TObject);
    procedure OnMouseLeaveDadosCte(Sender: TObject);
    procedure OnMouseLeaveTomadorCte(Sender: TObject);
    procedure OnMouseLeaveDadosSeguroCte(Sender: TObject);
    procedure OnMouseLeaveParamsGeraisCte(Sender: TObject);
    procedure OnMouseLeaveMotoristaCte(Sender: TObject);
    procedure OnMouseMoveItem(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveOkInfoRegra(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveMultiplosRem(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveMultiplosDest(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveItemNovo(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveItemDefinirRegra(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMoveItemSimulador(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  public
    procedure Iniciar(pParentOwner :TForm);
    procedure CloseDadosCte;
    procedure DestruirForms;

    class function New(pFormOwner :TForm) :IControllerCteCliente; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
  end;

implementation

uses
   ConhecFrete.Forms.Cte.FormMainCte
  ,ConhecFrete.Forms.Cte.MenuCte;

{ TControllerCteCliente }

procedure TControllerCteCliente.CloseDadosCte;
begin
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    Close;
  end;
  FDadosCte.Close;
end;

constructor TControllerCteCliente.Create(pFormOwner: TForm);
begin
  FOwnerTopMenu := pFormOwner;
  FDadosCte := TfrmSimplificadoDadosCte.Create(nil);
end;

destructor TControllerCteCliente.Destroy;
begin
  inherited;
end;

procedure TControllerCteCliente.DestruirForms;
begin
  FreeAndNil(FOwnerTopMenu);
  FreeAndNil(FDadosCte);
end;

procedure TControllerCteCliente.Iniciar(pParentOwner :TForm);
begin
  FOwnerMain := pParentOwner;
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    Parent :=  TfrmMainCte(FOwnerMain).pnlTop;
    lblTitulo.Caption := 'Gerar conhecimento de Frete por Cliente';
    pnlDadosCte.Color := TColor($FAE6E6);
    Show;

    pnlTomador.OnClick        := OnClickTomadorCte;
    pnlDadosCte.OnClick       := OnClickDadosCte;
    pnlMotorista.OnClick      := OnClickMotoristaCte;
    pnlParametrosCte.OnClick  := OnClickParamsGeraisCte;
    pnlDadosSeguroCte.OnClick := OnClickDadosSeguroCte;

    OnClickDadosCte(pnlDadosCte);
  end;
end;

class function TControllerCteCliente.New(pFormOwner: TForm): IControllerCteCliente;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerCteCliente.OnClickDadosCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteCliente.OnClickDadosSeguroCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosSegPedagio;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteCliente.OnClickDefinirRegra(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickMesmoCNPJ(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickMotoristaCte(Sender: TObject);
begin
  FItemMenuActive := tpMotorista;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteCliente.OnClickMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickNovoCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickOkInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickParamsGeraisCte(Sender: TObject);
begin
  FItemMenuActive := tpParamsCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteCliente.OnClickSimularCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnClickTomadorCte(Sender: TObject);
begin
  FItemMenuActive := tpTomador;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteCliente.OnMouseLeaveDadosCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveDadosSeguroCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveMotoristaCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveNovoCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveOkInfoRegra(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveParamsGeraisCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveSimularCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseLeaveTomadorCte(Sender: TObject);
begin

end;

procedure TControllerCteCliente.OnMouseMoveItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveItemDefinirRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveItemNovo(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveItemSimulador(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveMultiplosDest(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveMultiplosRem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OnMouseMoveOkInfoRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteCliente.OrganizarItensDadosCte;
begin
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clGradientInactiveCaption;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;

  with TfrmMainCte(FOwnerMain), FDadosCte do
  begin
    Parent := pnlMain;
    Show;
  end;
end;

procedure TControllerCteCliente.OrganizarItensDadosSeguroPedagioCte;
begin
  FDadosCte.Close;
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clGradientInactiveCaption;
  end;
end;

procedure TControllerCteCliente.OrganizarItensDefinrRegraCte;
begin

end;

procedure TControllerCteCliente.OrganizarItensMenu(pItemMenu: TpMenuCte);
begin
  case pItemMenu of
    tpDadosCte:        OrganizarItensDadosCte;
    tpParamsCte:       OrganizarItensParametrosCte;
    tpMotorista:       OrganizarItensMotoristaCte;
    tpTomador:         OrganizarItensTomadorCte;
    tpDefinirRegra:    OrganizarItensDefinrRegraCte;
    tpDadosSegPedagio: OrganizarItensDadosSeguroPedagioCte;
  end;
end;

procedure TControllerCteCliente.OrganizarItensMotoristaCte;
begin
  FDadosCte.Close;
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clGradientInactiveCaption;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteCliente.OrganizarItensParametrosCte;
begin
  FDadosCte.Close;
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clGradientInactiveCaption;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteCliente.OrganizarItensTomadorCte;
begin
  FDadosCte.Close;
  with TfrmTopMenuCte(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clGradientInactiveCaption;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

end.

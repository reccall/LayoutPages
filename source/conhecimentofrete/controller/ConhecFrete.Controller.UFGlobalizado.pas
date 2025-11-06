unit ConhecFrete.Controller.UFGlobalizado;

interface

uses
   Forms
  ,Classes
  ,Vcl.Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCteSimplificado;

type
  IControllerCteUFGlobalizado = interface
  ['{A61D6C80-ACA2-4D87-935B-61F33940B17F}']
    procedure Iniciar(pParentOwner :TForm);
  end;

  TControllerCteUFGlobalizado = class(TInterfacedObject, IControllerCteUFGlobalizado)
  private
    FOwnerMain :TForm;
    FOwnerTopMenu :TForm;

    FItemMenuActive :TpMenuCte;
    FItemRegraActive :TpRegra;
    FItemSimularActive :TpSimular;

    FDadosCte :TfrmDadosCteSimplificado;

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

    class function New(pFormOwner :TForm) :IControllerCteUFGlobalizado; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
  end;

implementation

uses
   ConhecFrete.Forms.Cte.FormMainCte
  ,ConhecFrete.Forms.Cte.UFGlobalizado.TopMenuUFGlobalizado;

{ TControllerCteUFGlobalizado }

procedure TControllerCteUFGlobalizado.CloseDadosCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    Close;
  end;
  FDadosCte.Close;
end;

constructor TControllerCteUFGlobalizado.Create(pFormOwner: TForm);
begin
  FOwnerTopMenu := pFormOwner;
  FDadosCte := TfrmDadosCteSimplificado.Create(nil);
end;

destructor TControllerCteUFGlobalizado.Destroy;
begin

  inherited;
end;

procedure TControllerCteUFGlobalizado.DestruirForms;
begin
  FreeAndNil(FDadosCte);
end;

procedure TControllerCteUFGlobalizado.Iniciar(pParentOwner :TForm);
begin
  FOwnerMain := pParentOwner;
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    Parent :=  TfrmMainCte(FOwnerMain).pnlTop;
    lblTitulo.Caption := 'Gerar conhecimento de Frete por UF (Globalizado)';
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

class function TControllerCteUFGlobalizado.New(pFormOwner: TForm): IControllerCteUFGlobalizado;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerCteUFGlobalizado.OnClickDadosCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteUFGlobalizado.OnClickDadosSeguroCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosSegPedagio;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteUFGlobalizado.OnClickDefinirRegra(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickMesmoCNPJ(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickMotoristaCte(Sender: TObject);
begin
  FItemMenuActive := tpMotorista;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteUFGlobalizado.OnClickMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickNovoCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickOkInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickParamsGeraisCte(Sender: TObject);
begin
  FItemMenuActive := tpParamsCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteUFGlobalizado.OnClickSimularCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnClickTomadorCte(Sender: TObject);
begin
  FItemMenuActive := tpTomador;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveDadosCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveDadosSeguroCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveMotoristaCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveNovoCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveOkInfoRegra(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveParamsGeraisCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveSimularCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseLeaveTomadorCte(Sender: TObject);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveItemDefinirRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveItemNovo(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveItemSimulador(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveMultiplosDest(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveMultiplosRem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OnMouseMoveOkInfoRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteUFGlobalizado.OrganizarItensDadosCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
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

procedure TControllerCteUFGlobalizado.OrganizarItensDadosSeguroPedagioCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clGradientInactiveCaption;
  end;
end;

procedure TControllerCteUFGlobalizado.OrganizarItensDefinrRegraCte;
begin

end;

procedure TControllerCteUFGlobalizado.OrganizarItensMenu(pItemMenu: TpMenuCte);
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

procedure TControllerCteUFGlobalizado.OrganizarItensMotoristaCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clGradientInactiveCaption;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteUFGlobalizado.OrganizarItensParametrosCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clGradientInactiveCaption;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteUFGlobalizado.OrganizarItensTomadorCte;
begin
  with TfrmTopMenuUFGlob(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clGradientInactiveCaption;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

end.


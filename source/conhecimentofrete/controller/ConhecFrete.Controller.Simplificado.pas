unit ConhecFrete.Controller.Simplificado;

interface

uses
   Forms
  ,Classes
  ,Vcl.Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCteSimplificado;

type
  IControllerSimplificado = interface
  ['{BBAFBECE-3996-4944-BB41-C74CD8C0F390}']
    procedure Iniciar(pParentOwner :TForm);
  end;

  TControllerCteSimplificado = class(TInterfacedObject, IControllerSimplificado)
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

    class function New(pFormOwner :TForm) :IControllerSimplificado; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
  end;

implementation

uses
   ConhecFrete.Forms.Cte.FormMainCte
  ,ConhecFrete.Forms.Cte.Simplificado.TopMenuSimplificado;

{ TControllerCteSimplificado }

procedure TControllerCteSimplificado.CloseDadosCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    Close;
  end;
  FDadosCte.Close;
end;

constructor TControllerCteSimplificado.Create(pFormOwner: TForm);
begin
  FOwnerTopMenu := pFormOwner;
  FDadosCte := TfrmDadosCteSimplificado.Create(nil);
end;

destructor TControllerCteSimplificado.Destroy;
begin

  inherited;
end;

procedure TControllerCteSimplificado.DestruirForms;
begin
  FreeAndNil(FOwnerTopMenu);
  FreeAndNil(FDadosCte);
end;

procedure TControllerCteSimplificado.Iniciar(pParentOwner :TForm);
begin
  FOwnerMain := pParentOwner;
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    Parent :=  TfrmMainCte(FOwnerMain).pnlTop;
    lblTitulo.Caption := 'Gerar conhecimento de Frete Simplificado';
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

class function TControllerCteSimplificado.New(pFormOwner: TForm): IControllerSimplificado;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerCteSimplificado.OnClickDadosCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteSimplificado.OnClickDadosSeguroCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosSegPedagio;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteSimplificado.OnClickDefinirRegra(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickMesmoCNPJ(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickMotoristaCte(Sender: TObject);
begin
  FItemMenuActive := tpMotorista;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteSimplificado.OnClickMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickNovoCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickOkInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickParamsGeraisCte(Sender: TObject);
begin
  FItemMenuActive := tpParamsCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteSimplificado.OnClickSimularCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnClickTomadorCte(Sender: TObject);
begin
  FItemMenuActive := tpTomador;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteSimplificado.OnMouseLeaveDadosCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveDadosSeguroCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveMotoristaCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveNovoCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveOkInfoRegra(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveParamsGeraisCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveSimularCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseLeaveTomadorCte(Sender: TObject);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveItemDefinirRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveItemNovo(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveItemSimulador(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveMultiplosDest(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveMultiplosRem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OnMouseMoveOkInfoRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteSimplificado.OrganizarItensDadosCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
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

procedure TControllerCteSimplificado.OrganizarItensDadosSeguroPedagioCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clGradientInactiveCaption;
  end;
end;

procedure TControllerCteSimplificado.OrganizarItensDefinrRegraCte;
begin

end;

procedure TControllerCteSimplificado.OrganizarItensMenu(pItemMenu: TpMenuCte);
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

procedure TControllerCteSimplificado.OrganizarItensMotoristaCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clGradientInactiveCaption;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteSimplificado.OrganizarItensParametrosCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clGradientInactiveCaption;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteSimplificado.OrganizarItensTomadorCte;
begin
  with TfrmTopMenuSimplificado(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clGradientInactiveCaption;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

end.

unit ConhecFrete.Controller.Regiao;

interface

uses
   Forms
  ,Classes
  ,Vcl.Controls
  ,Vcl.Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCte;

type
  IControllerCteRegiao = interface
  ['{BDD3FD4C-F8AD-46BF-9E7A-C4CADAD3A7E6}']
    procedure Iniciar(pParentOwner :TForm);
  end;

  TControllerCteRegiao = class(TInterfacedObject, IControllerCteRegiao)
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

    class function New(pFormOwner :TForm) :IControllerCteRegiao; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
  end;

implementation

uses
   ConhecFrete.Forms.Cte.FormMainCte
  ,ConhecFrete.Forms.Cte.Regiao.TopMenuRegiao;

{ TControllerCteRegiao }

procedure TControllerCteRegiao.CloseDadosCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    Close;
  end;
  FDadosCte.Close;
end;

constructor TControllerCteRegiao.Create(pFormOwner: TForm);
begin
  FOwnerTopMenu := pFormOwner;
  FDadosCte := TfrmDadosCteSimplificado.Create(nil);
end;

destructor TControllerCteRegiao.Destroy;
begin

  inherited;
end;

procedure TControllerCteRegiao.DestruirForms;
begin
  FreeAndNil(FOwnerTopMenu);
  FreeAndNil(FDadosCte);
end;

procedure TControllerCteRegiao.Iniciar(pParentOwner :TForm);
begin
  FOwnerMain := pParentOwner;
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    Parent :=  TfrmMainCte(FOwnerMain).pnlTop;
    lblTitulo.Caption := 'Gerar conhecimento de Frete por Região';
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

class function TControllerCteRegiao.New(pFormOwner: TForm): IControllerCteRegiao;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerCteRegiao.OnClickDadosCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteRegiao.OnClickDadosSeguroCte(Sender: TObject);
begin
  FItemMenuActive := tpDadosSegPedagio;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteRegiao.OnClickDefinirRegra(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickMesmoCNPJ(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickMotoristaCte(Sender: TObject);
begin
  FItemMenuActive := tpMotorista;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteRegiao.OnClickMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickNovoCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickOkInfoRegraCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickParamsGeraisCte(Sender: TObject);
begin
  FItemMenuActive := tpParamsCte;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteRegiao.OnClickSimularCteSimplificado(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnClickTomadorCte(Sender: TObject);
begin
  FItemMenuActive := tpTomador;
  OrganizarItensMenu(FItemMenuActive);
end;

procedure TControllerCteRegiao.OnMouseLeaveDadosCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveDadosSeguroCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveMotoristaCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveMultiplosDest(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveMultiplosRem(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveNovoCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveOkInfoRegra(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveParamsGeraisCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveSimularCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseLeaveTomadorCte(Sender: TObject);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveItemDefinirRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveItemNovo(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveItemSimulador(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveMultiplosDest(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveMultiplosRem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OnMouseMoveOkInfoRegra(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TControllerCteRegiao.OrganizarItensDadosCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
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

procedure TControllerCteRegiao.OrganizarItensDadosSeguroPedagioCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clGradientInactiveCaption;
  end;
end;

procedure TControllerCteRegiao.OrganizarItensDefinrRegraCte;
begin

end;

procedure TControllerCteRegiao.OrganizarItensMenu(pItemMenu: TpMenuCte);
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

procedure TControllerCteRegiao.OrganizarItensMotoristaCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clGradientInactiveCaption;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteRegiao.OrganizarItensParametrosCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clGradientInactiveCaption;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

procedure TControllerCteRegiao.OrganizarItensTomadorCte;
begin
  with TfrmTopMenuRegiao(FOwnerTopMenu) do
  begin
    pnlDadosCte.Color          := clWhite;
    pnlTomador.Color           := clGradientInactiveCaption;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
  end;
end;

end.

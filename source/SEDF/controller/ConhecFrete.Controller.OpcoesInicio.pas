unit ConhecFrete.Controller.OpcoesInicio;

interface

uses
   Classes
  ,Windows
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Graphics
  ,System.SysUtils
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.Motorista
  ,ConhecFrete.Forms.Cte.Tomador
  ,ConhecFrete.Forms.Cte.Parametros
  ,ConhecFrete.Forms.Cte.RegiaoDadosCte
  ,ConhecFrete.Forms.Cte.Cliente.DadosCte
  ,ConhecFrete.Forms.Cte.DadosPedagioSeguro
  ,ConhecFrete.Forms.Cte.UFGlobalizado.DadosCte
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCte
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.View.Componentes.OpcoesGerarCte;

type
  IControllerOpcoesInicio = interface
  ['{9DC885CF-A37E-40E3-898A-CE05D04D8050}']
    procedure Iniciar;
  end;

  TControllerOpcoesCte = class(TInterfacedObject, IControllerOpcoesInicio)
  private
    FFormCte  :TForm;
    FFormOwner :TForm;
    FMenuPrincipal :TForm;
    FMenuEmissaoFiscal :TForm;
    FCmpTituloOpcao :TForm;

    FOpcaoCteAtive :TpOpcaoCte;
    FOpcoesCteItens :TFormOpcoesItensCte;
    FBotoesBarraCte :TCmpOpcoesGerarCte;

    FDadosCteRegiao :TfrmRegiaoDadosCte;
    FDadosCteCliente :TfrmClienteDadosCte;
    FDadosCteSimplificado :TfrmSimplificadoDadosCte;
    FDadosCteUFGlobalizado :TfrmUFGlobalizadoDadosCte;

    FCteTomador :TfrmTomador;
    FCteMotorista :TfrmCteMotorista;
    FCteParametros :TfrmCteParametros;
    FCteSeguroPedagio :TfrmDadosPedagioSeguro;

    procedure OnClickCteCliente(Sender :TObject);
    procedure OnClickCteRegiao(Sender :TObject);

    procedure OnClickCteSimplificado(Sender :TObject);
    procedure OnClickCteUFGlobalizado(Sender :TObject);
    procedure OnClickCteSituacaoCarreg(Sender :TObject);

    procedure OnClickDadosCte(Sender :TObject);
    procedure OnClickTomadorCte(Sender :TObject);
    procedure OnClickDadosSeguroCte(Sender :TObject);
    procedure OnClickParamsGeraisCte(Sender :TObject);
    procedure OnClickMotoristaCte(Sender :TObject);
    procedure OnClickInicioCte(Sender :TObject);

    procedure IniciarTelaItensCte(pTipoCte :TpOpcaoCte);

  public
    procedure Iniciar;
    procedure DestruirForms;
    procedure CloseFormsMenuCadastros;

  class function New(pArrayFormsCte :array of TForm) :IControllerOpcoesInicio overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.OpcoesInicio;

{ ControllerPrincipal }

constructor TControllerOpcoesCte.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte           := pArrayFormsCte[Ord(tpFormCte)];
  FFormOwner         := pArrayFormsCte[Ord(tpOwner)];
  FMenuPrincipal     := pArrayFormsCte[Ord(tpMenuPrincipal)];
  FCmpTituloOpcao    := pArrayFormsCte[Ord(tpCmpTitulo)];
  FMenuEmissaoFiscal := pArrayFormsCte[Ord(tpMenuEmissaoFiscal)];

  FCteTomador            := TfrmTomador.Create(nil);
  FCteMotorista          := TfrmCteMotorista.Create(nil);
  FCteParametros         := TfrmCteParametros.Create(nil);
  FOpcoesCteItens        := TFormOpcoesItensCte.Create(nil);
  FDadosCteRegiao        := TfrmRegiaoDadosCte.Create(nil);
  FDadosCteCliente       := TfrmClienteDadosCte.Create(nil);

  FCteSeguroPedagio      := TfrmDadosPedagioSeguro.Create(nil);
  FDadosCteSimplificado  := TfrmSimplificadoDadosCte.Create(nil);
  FDadosCteUFGlobalizado := TfrmUFGlobalizadoDadosCte.Create(nil);

  FBotoesBarraCte := TCmpOpcoesGerarCte.Create(nil);
  aFormsCte[Ord(tpBarraBotoes)] := FBotoesBarraCte;

  aFormsCte[Ord(tpFormOpcoesItensCte)] := FOpcoesCteItens;

  with TfrmCtePrincipal(FFormOwner) do
  begin
    pnlMainTopRight.Visible := False;
    TfrmCteOpcoesInicio(FFormCte).Parent := pnlMain;
  end;
end;

destructor TControllerOpcoesCte.Destroy;
begin
  inherited;
  with TfrmCteOpcoesInicio(FFormCte) do
  begin
    FreeAndNil(FController);
  end;
end;

procedure TControllerOpcoesCte.DestruirForms;
begin
  FCteTomador.FController.DestroyComponents;
  FCteMotorista.FController.DestroyComponents;
  FCteParametros.FController.DestroyComponents;
  FDadosCteRegiao.FController.DestroyComponents;
  FDadosCteCliente.FController.DestroyComponents;
  FCteSeguroPedagio.FController.DestroyComponents;
  FDadosCteSimplificado.FController.DestroyComponents;
  FDadosCteUFGlobalizado.FController.DestroyComponents;

  FreeAndNil(FCteTomador);
  FreeAndNil(FCteMotorista);
  FreeAndNil(FCteParametros);
  FreeAndNil(FBotoesBarraCte);
  FreeAndNil(FDadosCteRegiao);
  FreeAndNil(FDadosCteCliente);
  FreeAndNil(FCteSeguroPedagio);
  FreeAndNil(FDadosCteSimplificado);
  FreeAndNil(FDadosCteUFGlobalizado);
  FreeAndNil(FOpcoesCteItens);
end;

procedure TControllerOpcoesCte.Iniciar;
begin
 with TfrmCtePrincipal(FFormOwner) do
 begin
   FBotoesBarraCte.Parent := pnlBotoes;
   FBotoesBarraCte.pnlInicio.OnClick := OnClickInicioCte;
   FBotoesBarraCte.Show;
 end;

  with FOpcoesCteItens do
  begin
    pnlTomador.OnClick        := OnClickTomadorCte;
    pnlDadosCte.OnClick       := OnClickDadosCte;
    pnlMotorista.OnClick      := OnClickMotoristaCte;
    pnlParametrosCte.OnClick  := OnClickParamsGeraisCte;
    pnlDadosSeguroCte.OnClick := OnClickDadosSeguroCte;
  end;

  with TfrmCtePrincipal(FFormOwner) do
  begin
    pnlMainTopRight.Visible := False;
    TfrmCteOpcoesInicio(FFormCte).Parent := pnlMain;
  end;

  with TfrmCteOpcoesInicio(FFormCte) do
  begin
    MakeRounded(pnlBtnCliente,10);
    MakeRounded(pnlBtnClienteB,10);
    MakeRounded(pnlBtnRegiao,10);
    MakeRounded(pnlBtnRegiaoB,10);
    MakeRounded(pnlBtnUFGlob,10);
    MakeRounded(pnlBtnUFGlobB,10);
    MakeRounded(pnlBtnSimplificado,10);
    MakeRounded(pnlBtnSimplificadoB,10);
    MakeRounded(pnlBtnSituCarreg,10);
    MakeRounded(pnlBtnSituCarregB,10);

    pnlBtnRegiao.OnMouseMove        := OnMouseMoveItem;
    pnlBtnRegiao.OnMouseLeave       := OnMouseLeaveItem;
    pnlBtnUFGlob.OnMouseMove        := OnMouseMoveItem;
    pnlBtnUFGlob.OnMouseLeave       := OnMouseLeaveItem;
    pnlBtnCliente.OnMouseMove       := OnMouseMoveItem;
    pnlBtnCliente.OnMouseLeave      := OnMouseLeaveItem;
    pnlBtnSituCarreg.OnMouseMove    := OnMouseMoveItem;
    pnlBtnSituCarreg.OnMouseLeave   := OnMouseLeaveItem;
    pnlBtnSimplificado.OnMouseMove  := OnMouseMoveItem;
    pnlBtnSimplificado.OnMouseLeave := OnMouseLeaveItem;

    pnlBtnRegiao.OnClick       := OnClickCteRegiao;
    pnlBtnUFGlob.OnClick       := OnClickCteUFGlobalizado;
    pnlBtnCliente.OnClick      := OnClickCteCliente;
    pnlBtnSimplificado.OnClick := OnClickCteSimplificado;
    pnlBtnSituCarreg.OnClick   := OnClickCteSituacaoCarreg;
    Show;
  end;
end;

procedure TControllerOpcoesCte.IniciarTelaItensCte(pTipoCte :TpOpcaoCte);
begin
  with TfrmCteOpcoesInicio(FFormCte) do
  begin
    Close;
  end;
  FOpcoesCteItens.pnlTomadorG.Visible := pTipoCte in [tpCteCliente, tpCteSimplificado];

  with TCmpTLabelTitulo(FCmpTituloOpcao) do
  begin
    case pTipoCte of
      tpCteCliente:
      begin
        lblTitulo.Caption := 'Gerar conhecimento de Frete por Cliente';
      end;
      tpCteRegiao:        lblTitulo.Caption := 'Gerar conhecimento de Frete por Região';
      tpCteSimplificado:  lblTitulo.Caption := 'Gerar conhecimento de Frete Simplificado';
      tpCteUFGlobalizado: lblTitulo.Caption := 'Gerar conhecimento de Frete por UF(Globalizado)';
    end;
  end;

  with TfrmCtePrincipal(FFormOwner) do
  begin
    pnlMainTopRight.Visible := True;
    FOpcoesCteItens.Parent := pnlMain;
    FOpcoesCteItens.Show;
  end;
  OnClickDadosCte(FOpcoesCteItens.pnlDadosCte);
end;

class function TControllerOpcoesCte.New(pArrayFormsCte :array of TForm) :IControllerOpcoesInicio;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerOpcoesCte.OnClickCteCliente(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteCliente;
  IniciarTelaItensCte(FOpcaoCteAtive);
end;

procedure TControllerOpcoesCte.OnClickCteRegiao(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteRegiao;
  IniciarTelaItensCte(tpCteRegiao);
end;

procedure TControllerOpcoesCte.OnClickCteSimplificado(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteSimplificado;
  IniciarTelaItensCte(tpCteSimplificado);
end;

procedure TControllerOpcoesCte.OnClickCteSituacaoCarreg(Sender: TObject);
begin
  //
end;

procedure TControllerOpcoesCte.OnClickCteUFGlobalizado(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteUFGlobalizado;
  IniciarTelaItensCte(tpCteUFGlobalizado);
end;

procedure TControllerOpcoesCte.OnClickInicioCte(Sender: TObject);
begin
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FController.SetItemActive(pnlEmissor);
  end;

  if not Assigned(FMenuEmissaoFiscal) then
  begin
    FMenuEmissaoFiscal := aFormsCte[Ord(tpMenuEmissaoFiscal)];
  end;

  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    Close;
  end;

  with TfrmCtePrincipal(FFormOwner), TCmpTLabelTitulo(FCmpTituloOpcao) do
  begin
    pnlMainTopRight.Visible := False;
    lblTitulo.Caption := 'Opções de emissão do CT-e';
  end;

  FOpcoesCteItens.Close;
  with TfrmCteOpcoesInicio(FFormCte) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerOpcoesCte.OnClickDadosCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteMotorista.Close;
  FCteParametros.Close;
  FCteSeguroPedagio.Close;
  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlDadosCte);

    case FOpcaoCteAtive  of
      tpCteCliente:
      begin
        FDadosCteRegiao.Close;
        FDadosCteSimplificado.Close;
        FDadosCteUFGlobalizado.Close;

        if FDadosCteCliente.Showing then
          Exit;

        FDadosCteCliente.Parent := pnlMain;
        FDadosCteCliente.Show;
      end;

      tpCteRegiao:
      begin
        FDadosCteCliente.Close;
        FDadosCteSimplificado.Close;
        FDadosCteUFGlobalizado.Close;

        if FDadosCteCliente.Showing then
          Exit;
        FDadosCteRegiao.Parent := pnlMain;
        FDadosCteRegiao.Show;
      end;

      tpCteSimplificado:
      begin
        FDadosCteRegiao.Close;
        FDadosCteCliente.Close;
        FDadosCteUFGlobalizado.Close;

        if FDadosCteCliente.Showing then
          Exit;
        FDadosCteSimplificado.Parent := pnlMain;
        FDadosCteSimplificado.Show;
      end;

      tpCteUFGlobalizado:
      begin
        FDadosCteRegiao.Close;
        FDadosCteCliente.Close;
        FDadosCteSimplificado.Close;

        if FDadosCteCliente.Showing then
          Exit;
        FDadosCteUFGlobalizado.Parent := pnlMain;
        FDadosCteUFGlobalizado.Show;
      end;
    end;
  end;
end;

procedure TControllerOpcoesCte.OnClickDadosSeguroCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteParametros.Close;
  FCteMotorista.Close;

  if FCteSeguroPedagio.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlDadosSeguroCte);

    case FOpcaoCteAtive of
      tpCteRegiao:        FDadosCteRegiao.Close;
      tpCteCliente:       FDadosCteCliente.Close;
      tpCteSimplificado:  FDadosCteSimplificado.Close;
      tpCteUFGlobalizado: FDadosCteUFGlobalizado.Close;
    end;
    FCteSeguroPedagio.Parent := pnlMain;
    FCteSeguroPedagio.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickMotoristaCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteParametros.Close;
  FCteSeguroPedagio.Close;

  if FCteMotorista.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlMotorista);

    case FOpcaoCteAtive of
      tpCteRegiao:        FDadosCteRegiao.Close;
      tpCteCliente:       FDadosCteCliente.Close;
      tpCteSimplificado:  FDadosCteSimplificado.Close;
      tpCteUFGlobalizado: FDadosCteUFGlobalizado.Close;
    end;
    FCteMotorista.Parent := pnlMain;
    FCteMotorista.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickParamsGeraisCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteSeguroPedagio.Close;
  FCteMotorista.Close;

   if FCteParametros.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlParametrosCte);

    case FOpcaoCteAtive of
      tpCteRegiao:        FDadosCteRegiao.Close;
      tpCteCliente:       FDadosCteCliente.Close;
      tpCteSimplificado:  FDadosCteSimplificado.Close;
      tpCteUFGlobalizado: FDadosCteUFGlobalizado.Close;
    end;
    FCteParametros.Parent := pnlMain;
    FCteParametros.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickTomadorCte(Sender: TObject);
begin
  FCteParametros.Close;
  FCteSeguroPedagio.Close;
  FCteMotorista.Close;

  if FCteTomador.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlTomador);

    case FOpcaoCteAtive of
      tpCteRegiao:        FDadosCteRegiao.Close;
      tpCteCliente:       FDadosCteCliente.Close;
      tpCteSimplificado:  FDadosCteSimplificado.Close;
      tpCteUFGlobalizado: FDadosCteUFGlobalizado.Close;
    end;
    FCteTomador.Parent := pnlMain;
    FCteTomador.Show;
  end;
end;

procedure TControllerOpcoesCte.CloseFormsMenuCadastros;
begin
  FBotoesBarraCte.Close;
  FOpcoesCteItens.Close;
  with TfrmCteOpcoesInicio(FFormCte) do
  begin
    Close;
  end;
end;

end.
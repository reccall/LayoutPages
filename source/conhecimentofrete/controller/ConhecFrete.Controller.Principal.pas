unit ConhecFrete.Controller.Principal;

interface

uses
   Classes
  ,Windows
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.View.Componentes.CardInfoUserCte
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.Motorista
  ,ConhecFrete.Forms.Cte.Tomador
  ,ConhecFrete.Forms.Cte.Parametros
  ,ConhecFrete.Forms.Cte.RegiaoDadosCte
  ,ConhecFrete.Forms.Cte.Cliente.DadosCte
  ,ConhecFrete.Forms.Cte.DadosPedagioSeguro
  ,ConhecFrete.Forms.Cte.UFGlobalizado.DadosCte
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCte
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.View.Componentes.OpcoesGerarCte;

type
  IControllerPrincipal = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
  end;

  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
  private
    FOpcaoCteAtive :TpOpcaoCte;
    FItemMenuActive :TpMenuCte;
    FItemRegraActive :TpRegra;
    FItemSimularActive :TpSimular;

    FFormOwner: TForm;
    FOpcoesCte :TfrmCteOpcoesInicio;
    FCmpTituloOpcao :TCmpTLabelTitulo;
    FCmpCardInfoUser :TCmpCardInfoUserCte;
    FOpcoesCteItens :TFormOpcoesItensCte;
    FBotoesBarraCte :TCmpOpcoesGerarCte;

    FMenuPrincipal :TFormMenuPrincipal;
    FMenuCadastros :TFormMenuCadastros;
    FMenuEmissaoFiscal :TFormMenuEmissaoFiscal;

    FDadosCteRegiao :TfrmRegiaoDadosCte;
    FDadosCteCliente :TfrmClienteDadosCte;
    FDadosCteSimplificado :TfrmSimplificadoDadosCte;
    FDadosCteUFGlobalizado :TfrmUFGlobalizadoDadosCte;

    FCteTomador :TfrmTomador;
    FCteMotorista :TfrmCteMotorista;
    FCteParametros :TfrmCteParametros;
    FCteSeguroPedagio :TfrmDadosPedagioSeguro;

    //MenuCadastros
    procedure OnClickCadMarcas(Sender :TObject);
    procedure OnClickCadProdutos(Sender :TObject);
    procedure OnClickCadServicos(Sender :TObject);
    procedure OnClickCadClientes(Sender :TObject);
    procedure OnClickCadUnidMedida(Sender :TObject);
    procedure OnClickCadFornecedores(Sender :TObject);
    procedure OnClickCadTransportadoras(Sender :TObject);

    procedure OnClickCardUserInfo(Sender :TObject);
    procedure OnClickInicioCte(Sender :TObject);
    procedure OnClickCteCliente(Sender :TObject);
    procedure OnClickCteRegiao(Sender :TObject);
    procedure OnClickMenuCadastros(Sender :TObject);
    procedure OnClickMenuEmissaoFiscal(Sender :TObject);
    procedure OnClickCteSimplificado(Sender :TObject);
    procedure OnClickCteUFGlobalizado(Sender :TObject);
    procedure OnClickCteSituacaoCarreg(Sender :TObject);

    procedure OnClickDadosCte(Sender :TObject);
    procedure OnClickTomadorCte(Sender :TObject);
    procedure OnClickDadosSeguroCte(Sender :TObject);
    procedure OnClickParamsGeraisCte(Sender :TObject);
    procedure OnClickMotoristaCte(Sender :TObject);

    procedure IniciarTelaItensCte(pTipoCte :TpOpcaoCte);
    procedure CloseFormsMenuCadastros;
  public
    FCtePrincipal :TfrmCtePrincipal;

    procedure Iniciar;
    procedure DestruirForms;

  class function New(pFormOwner :TForm) :IControllerPrincipal; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Background;

{ ControllerPrincipal }

constructor TControllerPrincipal.Create(pFormOwner: TForm);
begin
  FFormOwner             := pFormOwner;
  FOpcoesCte             := TfrmCteOpcoesInicio.Create(nil);
  FCteTomador            := TfrmTomador.Create(nil);
  FCteMotorista          := TfrmCteMotorista.Create(nil);
  FCtePrincipal          := TfrmCtePrincipal.Create(nil);
  FMenuPrincipal         := TFormMenuPrincipal.Create(nil);
  FMenuCadastros         := TFormMenuCadastros.Create(nil);
  FCteParametros         := TfrmCteParametros.Create(nil);
  FBotoesBarraCte        := TCmpOpcoesGerarCte.Create(nil);;
  FOpcoesCteItens        := TFormOpcoesItensCte.Create(nil);
  FDadosCteRegiao        := TfrmRegiaoDadosCte.Create(nil);
  FDadosCteCliente       := TfrmClienteDadosCte.Create(nil);
  FCmpCardInfoUser       := TCmpCardInfoUserCte.Create(nil);
  FCteSeguroPedagio      := TfrmDadosPedagioSeguro.Create(nil);
  FMenuEmissaoFiscal     := TFormMenuEmissaoFiscal.Create(nil);
  FDadosCteSimplificado  := TfrmSimplificadoDadosCte.Create(nil);
  FDadosCteUFGlobalizado := TfrmUFGlobalizadoDadosCte.Create(nil);

  FCmpTituloOpcao := TCmpTLabelTitulo.Create(nil);
  FCmpTituloOpcao.lblTitulo.Caption := 'Opções de emissão do CT-e';
  with FCtePrincipal do
  begin
    pnlMainTopRight.Visible := False;
    FOpcoesCte.Parent := pnlMain;
    FCmpCardInfoUser.Parent := pnlUserInfo;
    FCmpTituloOpcao.Parent  := pnlMainTop;
  end;
end;

destructor TControllerPrincipal.Destroy;
begin
  inherited;
end;

procedure TControllerPrincipal.DestruirForms;
begin
  TFormCteBackground(FFormOwner).Close;
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
  FreeAndNil(FMenuPrincipal);
  FreeAndNil(FMenuCadastros);
  FreeAndNil(FCteParametros);
  FreeAndNil(FBotoesBarraCte);
  FreeAndNil(FDadosCteRegiao);
  FreeAndNil(FDadosCteCliente);
  FreeAndNil(FCteSeguroPedagio);
  FreeAndNil(FDadosCteSimplificado);
  FreeAndNil(FDadosCteUFGlobalizado);
  FreeAndNil(FOpcoesCteItens);
  FreeAndNil(FCmpTituloOpcao);
  FreeAndNil(FMenuEmissaoFiscal);
  FCmpCardInfoUser.Close;
  FCtePrincipal.Close;
  with TFormCteBackground(FFormOwner) do
  begin
    FreeAndNil(FController);
  end;
  FreeAndNil(FCmpCardInfoUser);
  FreeAndNil(FCtePrincipal);
end;

procedure TControllerPrincipal.Iniciar;
begin
  FMenuPrincipal.pnlEmissor.Color := TColor($FAE6E6);
  FCmpCardInfoUser.lblUserName.Caption := 'KAMAYURI NUNES-SAAD';
  FCmpCardInfoUser.pnlUser.OnClick := OnClickCardUserInfo;

  with FOpcoesCteItens do
  begin
    pnlTomador.OnClick        := OnClickTomadorCte;
    pnlDadosCte.OnClick       := OnClickDadosCte;
    pnlMotorista.OnClick      := OnClickMotoristaCte;
    pnlParametrosCte.OnClick  := OnClickParamsGeraisCte;
    pnlDadosSeguroCte.OnClick := OnClickDadosSeguroCte;
  end;

  with FOpcoesCte do
  begin
    pnlBtnRegiao.OnClick       := OnClickCteRegiao;
    pnlBtnUFGlob.OnClick       := OnClickCteUFGlobalizado;
    pnlBtnCliente.OnClick      := OnClickCteCliente;
    pnlBtnSimplificado.OnClick := OnClickCteSimplificado;
    pnlBtnSituCarreg.OnClick   := OnClickCteSituacaoCarreg;
  end;

  with TFormCteBackground(FFormOwner)  do
  begin
    FCtePrincipal.Parent := pnlMain;
    Show;
  end;

  with FCtePrincipal do
  begin
    FMenuPrincipal.Parent  := pnlMenu;
    FBotoesBarraCte.Parent := pnlBotoes;
    FBotoesBarraCte.pnlInicio.OnClick := OnClickInicioCte;
  end;

  with FMenuPrincipal do
  begin
    pnlEmissor.OnClick   := OnClickMenuEmissaoFiscal;
    pnlCadastros.OnClick := OnClickMenuCadastros;
  end;

  with FMenuEmissaoFiscal do
  begin
    pnlCte.OnClick := OnClickInicioCte;
  end;

  with FMenuCadastros do
  begin
    pnlMarcas.OnClick     := OnClickCadMarcas;
    pnlFornec.OnClick     := OnClickCadFornecedores;
    pnlTransp.OnClick     := OnClickCadTransportadoras;
    pnlProdutos.OnClick   := OnClickCadProdutos;
    pnlServicos.OnClick   := OnClickCadServicos;
    pnlClientes.OnClick   := OnClickCadClientes;
    pnlUnidMedida.OnClick := OnClickCadUnidMedida;
  end;

  FBotoesBarraCte.Show;
  FOpcoesCte.Show;
  FCtePrincipal.Show;
  FCmpCardInfoUser.Show;
  FCmpTituloOpcao.Show;
  FMenuPrincipal.Show;
end;

procedure TControllerPrincipal.IniciarTelaItensCte(pTipoCte :TpOpcaoCte);
begin
  FOpcoesCte.Close;
  FOpcoesCteItens.pnlTomadorG.Visible := pTipoCte in [tpCteCliente, tpCteSimplificado];

  case pTipoCte of
    tpCteCliente:
    begin
      FCmpTituloOpcao.lblTitulo.Caption := 'Gerar conhecimento de Frete por Cliente';
    end;
    tpCteRegiao:        FCmpTituloOpcao.lblTitulo.Caption := 'Gerar conhecimento de Frete por Região';
    tpCteSimplificado:  FCmpTituloOpcao.lblTitulo.Caption := 'Gerar conhecimento de Frete Simplificado';
    tpCteUFGlobalizado: FCmpTituloOpcao.lblTitulo.Caption := 'Gerar conhecimento de Frete por UF(Globalizado)';
  end;

  with FCtePrincipal do
  begin
    pnlMainTopRight.Visible := True;
    FOpcoesCteItens.Parent := pnlMain;
    FOpcoesCteItens.Show;
  end;
  OnClickDadosCte(FOpcoesCteItens.pnlDadosCte);
end;

class function TControllerPrincipal.New(pFormOwner: TForm): IControllerPrincipal;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerPrincipal.OnClickCardUserInfo(Sender: TObject);
begin
  DestruirForms;
end;

procedure TControllerPrincipal.OnClickCteCliente(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteCliente;
  IniciarTelaItensCte(FOpcaoCteAtive);
end;

procedure TControllerPrincipal.OnClickCteRegiao(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteRegiao;
  IniciarTelaItensCte(tpCteRegiao);
end;

procedure TControllerPrincipal.OnClickCteSimplificado(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteSimplificado;
  IniciarTelaItensCte(tpCteSimplificado);
end;

procedure TControllerPrincipal.OnClickCteSituacaoCarreg(Sender: TObject);
begin
  with FormCteBackground do
  begin
    WindowState := wsMinimized;
  end;
end;

procedure TControllerPrincipal.OnClickCteUFGlobalizado(Sender: TObject);
begin
  FOpcaoCteAtive := tpCteUFGlobalizado;
  IniciarTelaItensCte(tpCteUFGlobalizado);
end;

procedure TControllerPrincipal.OnClickInicioCte(Sender: TObject);
begin
  FMenuEmissaoFiscal.Close;
  with FCtePrincipal do
  begin
    pnlMainTopRight.Visible := False;
    FCmpTituloOpcao.lblTitulo.Caption := 'Opções de emissão do CT-e';
    FOpcoesCte.Close;
  end;
  FOpcoesCteItens.Close;
  FOpcoesCte.Show;
  FBotoesBarraCte.Show;
end;

procedure TControllerPrincipal.OnClickDadosCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteMotorista.Close;
  FCteParametros.Close;
  FCteSeguroPedagio.Close;
  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlDadosCte);
    pnlDadosCte.Color          := clGradientInactiveCaption;
    pnlTomador.Color           := clWhite;
    pnlMotorista.Color         := clWhite;
    pnlParametrosCte.Color     := clWhite;
    pnlDadosSeguroCte.Color    := clWhite;
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

procedure TControllerPrincipal.OnClickDadosSeguroCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteParametros.Close;
  FCteMotorista.Close;

  if FCteSeguroPedagio.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlDadosSeguroCte);
    pnlDadosCte.Color       := clWhite;
    pnlTomador.Color        := clWhite;
    pnlMotorista.Color      := clWhite;
    pnlParametrosCte.Color  := clWhite;
    pnlDadosSeguroCte.Color := clGradientInactiveCaption;

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

procedure TControllerPrincipal.OnClickMenuCadastros(Sender: TObject);
begin
  FMenuCadastros.FControl := 0;
  FMenuEmissaoFiscal.Close;

  FMenuCadastros.Top    := FCtePrincipal.pnlMain.Top+100;
  FMenuCadastros.Left   := FCtePrincipal.pnlMenu.Left+FMenuPrincipal.pnlBackEmissor.Width+20;
  FMenuCadastros.BringToFront;
  FMenuCadastros.Show;
end;

procedure TControllerPrincipal.OnClickMenuEmissaoFiscal(Sender: TObject);
begin
  FMenuCadastros.FControl := 0;
  FMenuCadastros.Close;

  FMenuEmissaoFiscal.Top    := FCtePrincipal.pnlMain.Top+150;
  FMenuEmissaoFiscal.Left   := FCtePrincipal.pnlMenu.Left+FMenuPrincipal.pnlBackEmissor.Width + 20;
  FMenuEmissaoFiscal.BringToFront;
  FMenuEmissaoFiscal.Show;
end;

procedure TControllerPrincipal.OnClickMotoristaCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteParametros.Close;
  FCteSeguroPedagio.Close;

  if FCteMotorista.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlMotorista);
    pnlDadosCte.Color       := clWhite;
    pnlTomador.Color        := clWhite;
    pnlMotorista.Color      := clGradientInactiveCaption;
    pnlParametrosCte.Color  := clWhite;
    pnlDadosSeguroCte.Color := clWhite;

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

procedure TControllerPrincipal.OnClickParamsGeraisCte(Sender: TObject);
begin
  FCteTomador.Close;
  FCteSeguroPedagio.Close;
  FCteMotorista.Close;

   if FCteParametros.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlParametrosCte);
    pnlDadosCte.Color       := clWhite;
    pnlTomador.Color        := clWhite;
    pnlMotorista.Color      := clWhite;
    pnlParametrosCte.Color  := clGradientInactiveCaption;
    pnlDadosSeguroCte.Color := clWhite;

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

procedure TControllerPrincipal.OnClickTomadorCte(Sender: TObject);
begin
  FCteParametros.Close;
  FCteSeguroPedagio.Close;
  FCteMotorista.Close;

  if FCteTomador.Showing then
    Exit;

  with FOpcoesCteItens do
  begin
    FController.SetItemActive(pnlTomador);
    pnlDadosCte.Color       := clWhite;
    pnlTomador.Color        := clGradientInactiveCaption;
    pnlMotorista.Color      := clWhite;
    pnlParametrosCte.Color  := clWhite;
    pnlDadosSeguroCte.Color := clWhite;

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

procedure TControllerPrincipal.OnClickCadProdutos(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlProdutos.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadClientes(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlClientes.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadServicos(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlServicos.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadFornecedores(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlFornec.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadMarcas(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlMarcas.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadTransportadoras(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlTransp.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadUnidMedida(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlUnidMedida.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.CloseFormsMenuCadastros;
begin
  FBotoesBarraCte.Close;
  FMenuCadastros.Close;
  FOpcoesCte.Close;
  FOpcoesCteItens.Close;
end;

end.

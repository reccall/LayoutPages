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
  ,LayoutPages.View.Componentes.MenuImage
  ,ConhecFrete.View.Componentes.CardInfoUserCte
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerPrincipal = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
  end;

  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
  private
    FWidthMenuImg :Integer;
    FFormOwner: TForm;
    FMenuCadasros: TForm;
    FMenuEmissaoFiscal: TForm;
    FCmpMenuImg :TCmpMenuImage;
    FMenuItensImagens :TFormMenuItensImagens;
    FCmpTituloOpcao :TCmpTLabelTitulo;
    FCmpCardInfoUser :TCmpCardInfoUserCte;
    FImageDefault :TImage;

    procedure OnClickCardUserInfo(Sender :TObject);
    procedure OnClickLogoImage(Sender :TObject);
    procedure OnClickMenuImage(Sender :TObject);

    procedure CloseForms;
    procedure CloseMenus(pResetItemMenu :Boolean);
    procedure SetActiveDefaultImage;
  public
    FCtePrincipal :TfrmCtePrincipal;
    FMenuPrincipal :TFormMenuPrincipal;

    procedure Iniciar;
    procedure DestruirForms;

  class function New(pFormOwner :TForm) :IControllerPrincipal; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
    ConhecFrete.Forms.Cte.OpcoesInicio
   ,ConhecFrete.Forms.Cte.Background
   ,ConhecFrete.Forms.Cte.MenuCadastros
   ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
   ,ConhecFrete.Forms.Cte.CadastroMarcas
   ,ConhecFrete.Forms.Cte.CadastroServicos
   ,ConhecFrete.Forms.Cte.CadastroProdutos
   ,ConhecFrete.Forms.Cte.CadastroClientes
   ,ConhecFrete.Forms.Cte.CadastroFornecedores
   ,ConhecFrete.Forms.Cte.CadastroTransportadoras
   ,ConhecFrete.Forms.Cte.CadastroUnidadesDeMedida
   ,LayoutPages.View.Componentes.BotoesBarraOpcoes;

{ ControllerPrincipal }

procedure TControllerPrincipal.CloseForms;
begin
  if Assigned(aFormsCte[Ord(tpFormCte)]) then
  begin
    aFormsCte[Ord(tpFormCte)].Close;
    aFormsCte[Ord(tpBarraBotoes)].Close;
    aFormsCte[Ord(tpFormOpcoesItensCte)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroProduto)]) then
  begin
    if aFormsCte[Ord(tpCadastroProduto)].Showing then
      aFormsCte[Ord(tpCadastroProduto)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroMarcas)]) then
  begin
    if aFormsCte[Ord(tpCadastroMarcas)].Showing then
      aFormsCte[Ord(tpCadastroMarcas)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroServicos)]) then
  begin
    if aFormsCte[Ord(tpCadastroServicos)].Showing then
      aFormsCte[Ord(tpCadastroServicos)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroClientes)]) then
  begin
    if aFormsCte[Ord(tpCadastroClientes)].Showing then
      aFormsCte[Ord(tpCadastroClientes)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroFornecedores)]) then
  begin
    if aFormsCte[Ord(tpCadastroFornecedores)].Showing then
      aFormsCte[Ord(tpCadastroFornecedores)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroTransportadoras)]) then
  begin
    if aFormsCte[Ord(tpCadastroTransportadoras)].Showing then
      aFormsCte[Ord(tpCadastroTransportadoras)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]) then
  begin
    if aFormsCte[Ord(tpCadastroUnidadesDeMedida)].Showing then
      aFormsCte[Ord(tpCadastroUnidadesDeMedida)].Close;
  end;
  CloseMenus(True);
end;

procedure TControllerPrincipal.CloseMenus(pResetItemMenu :Boolean);
begin
  FMenuCadasros := aFormsCte[Ord(tpMenuCadastros)];
  if Assigned(FMenuCadasros) then
  begin
    with TFormMenuCadastros(FMenuCadasros) do
    begin
      if pResetItemMenu then
        FController.SetOpcaoMenuItemCad(pnlRightNFe);
      Close;
    end;
  end;

  FMenuEmissaoFiscal := aFormsCte[Ord(tpMenuEmissaoFiscal)];
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      if pResetItemMenu then
        FController.SetOpcaoMenuItem(pnlRightNFe);
      Close;
    end;
  end;
end;

constructor TControllerPrincipal.Create(pFormOwner: TForm);
var
  SetTyperForms:TpForms;
begin
  FFormOwner := pFormOwner;
  SetTyperForms := High(TpForms);
  SetLength(aFormsCte, Ord(SetTyperForms));

  FCmpMenuImg       := TCmpMenuImage.Create(nil);
  FCmpCardInfoUser  := TCmpCardInfoUserCte.Create(nil);

  FCmpTituloOpcao := TCmpTLabelTitulo.Create(nil);
  aFormsCte[Ord(tpCmpTitulo)] := FCmpTituloOpcao;

  FCtePrincipal := TfrmCtePrincipal.Create(nil);
  aFormsCte[Ord(tpOwner)] := FCtePrincipal;

  FMenuPrincipal := TFormMenuPrincipal.Create(aFormsCte);
  aFormsCte[Ord(tpMenuPrincipal)] := FMenuPrincipal;

  with FCtePrincipal do
  begin
    FWidthMenuImg := pnlBackMenu.Width;
    pnlMainTopRight.Visible := False;
    FCmpCardInfoUser.Parent := pnlUserInfo;
    FCmpTituloOpcao.Parent  := pnlMainTop;
  end;
end;

destructor TControllerPrincipal.Destroy;
begin
  FreeAndNil(TFormCteBackground(FFormOwner).FController);
  inherited;
end;

procedure TControllerPrincipal.DestruirForms;
var
  iIdx :Integer;
begin
  TFormCteBackground(FFormOwner).Close;
  for iIdx := Low(aFormsCte) to High(aFormsCte) do
  begin
    case TpForms(Ord(iIdx)) of

      tpMenuPrincipal:
      begin
        if Assigned(aFormsCte[Ord(tpMenuPrincipal)]) then
        begin
          aFormsCte[Ord(tpMenuPrincipal)].Close;
          aFormsCte[Ord(tpMenuPrincipal)].Free;
          aFormsCte[Ord(tpMenuPrincipal)] := nil;
          FCmpTituloOpcao := nil;
          //FreeAndNil(FMenuPrincipal);
        end;
      end;

      tpMenuEmissaoFiscal:
      begin
        if Assigned(aFormsCte[Ord(tpMenuEmissaoFiscal)]) then
        begin
          aFormsCte[Ord(tpMenuEmissaoFiscal)].Close;
          //aFormsCte[Ord(tpMenuEmissaoFiscal)].Free;
          aFormsCte[Ord(tpMenuEmissaoFiscal)] := nil;
          FCmpTituloOpcao := nil;
        end;
      end;

      tpMenuCadastros:
      begin
        if Assigned(aFormsCte[Ord(tpMenuCadastros)]) then
        begin
          aFormsCte[Ord(tpMenuCadastros)].Close;
          //aFormsCte[Ord(tpMenuCadastros)].Free;
          aFormsCte[Ord(tpMenuCadastros)] := nil;
          FCmpTituloOpcao := nil;
        end;
      end;

      tpCmpTitulo:
      begin
        if Assigned(aFormsCte[Ord(tpCmpTitulo)]) then
        begin
          aFormsCte[Ord(tpCmpTitulo)].Close;
          aFormsCte[Ord(tpCmpTitulo)].Free;
          aFormsCte[Ord(tpCmpTitulo)] := nil;
          FCmpTituloOpcao := nil;
        end;
      end;

      tpFormCte:
      begin
        if Assigned(aFormsCte[Ord(tpFormCte)]) then
        begin
          with TfrmCteOpcoesInicio(aFormsCte[Ord(tpFormCte)]) do
          begin
            FController.DestruirForms;
            aFormsCte[Ord(tpFormCte)].Close;
            //aFormsCte[Ord(tpFormCte)].Free;
            aFormsCte[Ord(tpFormCte)] := nil;
          end;
        end;
      end;

      tpMenuItensImagens:
      begin
        with TFormMenuItensImagens(aFormsCte[Ord(tpMenuItensImagens)]) do
        begin
          FController.DestroyComponents;
          aFormsCte[Ord(tpMenuItensImagens)].Close;
          aFormsCte[Ord(tpMenuItensImagens)].Free;
          aFormsCte[Ord(tpMenuItensImagens)] := nil;
          //FMenuItensImagens.Free;
          FMenuItensImagens := nil;
        end;
      end;

      tpBarraBotoes:
      begin
        if Assigned(aFormsCte[Ord(tpBarraBotoes)]) then
        begin
          aFormsCte[Ord(tpBarraBotoes)].Close;
          //aFormsCte[Ord(tpBarraBotoes)].Free;
          aFormsCte[Ord(tpBarraBotoes)] := nil;
          FCmpTituloOpcao := nil;
        end;
      end;

      tpFormOpcoesItensCte:
      begin
         if Assigned(aFormsCte[Ord(tpFormOpcoesItensCte)]) then
        begin
          aFormsCte[Ord(tpFormOpcoesItensCte)].Close;
          //aFormsCte[Ord(tpFormOpcoesItensCte)].Free;
          aFormsCte[Ord(tpFormOpcoesItensCte)] := nil;
          FCmpTituloOpcao := nil;
        end;
      end;

      tpCadastroMarcas:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroMarcas)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroMarcas)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroMarcas)].Close;
            aFormsCte[Ord(tpCadastroMarcas)].Free;
            aFormsCte[Ord(tpCadastroMarcas)] := nil;
          end;
        end;
      end;

      tpCadastroServicos:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroServicos)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroServicos)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroServicos)].Close;
            aFormsCte[Ord(tpCadastroServicos)].Free;
            aFormsCte[Ord(tpCadastroServicos)] := nil;
          end;
        end;
      end;

      tpCadastroProduto:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroProduto)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroProduto)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroProduto)].Close;
            aFormsCte[Ord(tpCadastroProduto)].Free;
            aFormsCte[Ord(tpCadastroProduto)] := nil;
          end;
        end;
      end;

      tpCadastroClientes:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroClientes)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroClientes)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroClientes)].Close;
            aFormsCte[Ord(tpCadastroClientes)].Free;
            aFormsCte[Ord(tpCadastroClientes)] := nil;
          end;
        end;
      end;

      tpCadastroFornecedores:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroFornecedores)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroFornecedores)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroFornecedores)].Close;
            aFormsCte[Ord(tpCadastroFornecedores)].Free;
            aFormsCte[Ord(tpCadastroFornecedores)] := nil;
          end;
        end;
      end;

      tpCadastroTransportadoras:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroTransportadoras)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroTransportadoras)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroTransportadoras)].Close;
            aFormsCte[Ord(tpCadastroTransportadoras)].Free;
            aFormsCte[Ord(tpCadastroTransportadoras)] := nil;
          end;
        end;
      end;

      tpCadastroUnidadesDeMedida:
      begin
        if Assigned(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]) then
        begin
          with TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]) do
          begin
            FController.DestroyComponents;
            aFormsCte[Ord(tpCadastroUnidadesDeMedida)].Close;
            aFormsCte[Ord(tpCadastroUnidadesDeMedida)].Free;
            aFormsCte[Ord(tpCadastroUnidadesDeMedida)] := nil;
          end;
        end;
      end;
    end;
  end;

  FreeAndNil(FCmpMenuImg);
  FCmpCardInfoUser.Close;
  FreeAndNil(FCmpCardInfoUser);

  aFormsCte[Ord(tpOwner)].Close;
  aFormsCte[Ord(tpOwner)].Free;
  aFormsCte[Ord(tpOwner)] := nil;
  FCtePrincipal := nil;
  aFormsCte := nil;
end;

procedure TControllerPrincipal.Iniciar;
begin
  FCmpTituloOpcao.lblTitulo.Caption := 'SEDF - Início';
  with FCmpCardInfoUser do
  begin
    lblUserName.Caption := 'KAMAYURI NUNES-SAAD';
    pnlUser.OnClick := OnClickCardUserInfo;
  end;

  with TFormCteBackground(FFormOwner)  do
  begin
    FCtePrincipal.Parent := pnlMain;
    Show;
  end;

  with FCtePrincipal do
  begin
    pnlBackMenu.Width := 270;
    FCmpMenuImg.Image1.OnClick := OnClickMenuImage;
    FCmpMenuImg.Parent := pnlTopMenu;
    Image1.OnClick := OnClickLogoImage;
    FMenuPrincipal.Parent := pnlMenu;
    CloseForms;

    if Assigned(FMenuItensImagens) then
    begin
      if FMenuItensImagens.Showing then
      begin
        FMenuPrincipal.Close;
      end;
    end
    else
      FMenuPrincipal.Show;
    Show;
  end;
  FCmpMenuImg.Show;
  FCmpCardInfoUser.Show;
  FCmpTituloOpcao.Show;
end;

class function TControllerPrincipal.New(pFormOwner: TForm): IControllerPrincipal;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerPrincipal.OnClickCardUserInfo(Sender: TObject);
begin
  DestruirForms;
end;

procedure TControllerPrincipal.OnClickLogoImage(Sender: TObject);
begin
  if FCmpTituloOpcao.lblTitulo.Caption = 'SEDF - Início' then
    Exit;
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FController.SetItemActive(pnlBackMenu);
  end;
  SetActiveDefaultImage;
  Iniciar;
end;

procedure TControllerPrincipal.OnClickMenuImage(Sender: TObject);
begin
  CloseMenus(False);
  if FCmpTituloOpcao.lblTitulo.Caption = 'SEDF - Início' then
  begin
    SetActiveDefaultImage;
  end;
  with FCtePrincipal do
  begin
    if FMenuPrincipal.Showing then
    begin
      if not Assigned(aFormsCte[Ord(tpMenuItensImagens)]) then
      begin
        FMenuItensImagens := TFormMenuItensImagens.Create(aFormsCte);
        aFormsCte[Ord(tpMenuItensImagens)] := FMenuItensImagens;
      end
      else
      begin
        FMenuItensImagens := TFormMenuItensImagens(aFormsCte[Ord(tpMenuItensImagens)]);
      end;

      //pnlBackMenu.Width := 347;//200;
      FMenuPrincipal.Close;
      FMenuItensImagens.Parent := pnlMenu;
      FMenuItensImagens.Show;
    end
    else
    if FMenuItensImagens.Showing then
    begin
      //pnlBackMenu.Width := 347;//FWidthMenuImg;
      FMenuItensImagens.Close;
      FMenuPrincipal.Parent := pnlMenu;
      FMenuPrincipal.Show;
    end;
  end;
end;

procedure TControllerPrincipal.SetActiveDefaultImage;
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := TFormMenuItensImagens(aFormsCte[Ord(tpMenuItensImagens)]);
  end;

  if Assigned(FMenuItensImagens) then
  begin
    with TFormMenuItensImagens(FMenuItensImagens) do
    begin
      try
        FImageDefault := TImage.Create(nil);
        FImageDefault.Name := 'ImgDefault';
        FController.SetActiveImage(FImageDefault);
      finally
        FreeAndNil(FImageDefault);
      end;
    end;
  end;
end;

end.

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
    FCmpMenuImg :TCmpMenuImage;
    FMenuItensImagens :TFormMenuItensImagens;
    FCmpTituloOpcao :TCmpTLabelTitulo;
    FCmpCardInfoUser :TCmpCardInfoUserCte;
    FImageDefault :TImage;

    procedure OnClickCardUserInfo(Sender :TObject);
    procedure OnClickLogoImage(Sender :TObject);
    procedure OnClickMenuImage(Sender :TObject);
    procedure CloseForms;
    procedure CloseMenus;
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
  CloseMenus;
end;

procedure TControllerPrincipal.CloseMenus;
begin
  if Assigned(aFormsCte[Ord(tpMenuCadastros)]) then
  begin
    aFormsCte[Ord(tpMenuCadastros)].Close;
  end;

  if Assigned(aFormsCte[Ord(tpMenuEmissaoFiscal)]) then
  begin
    aFormsCte[Ord(tpMenuEmissaoFiscal)].Close;
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
begin
  TFormCteBackground(FFormOwner).Close;
  if Assigned(aFormsCte[Ord(tpFormCte)]) then
  begin
    with TfrmCteOpcoesInicio(aFormsCte[Ord(tpFormCte)]) do
    begin
      FController.DestruirForms;
      FreeAndNil(TfrmCteOpcoesInicio(aFormsCte[Ord(tpFormCte)]));
    end;
  end;

  aFormsCte := nil;
  FreeAndNil(FCmpMenuImg);
  FreeAndNil(FMenuItensImagens);
  FreeAndNil(FCmpTituloOpcao);
  FCmpCardInfoUser.Close;
  FreeAndNil(FCmpCardInfoUser);
  FreeAndNil(FMenuPrincipal);
  FCtePrincipal.Close;
  FreeAndNil(FCtePrincipal);
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
  try
    if FCmpTituloOpcao.lblTitulo.Caption = 'SEDF - Início' then
      Exit;

    with TFormMenuPrincipal(FMenuPrincipal) do
    begin
      FController.SetItemActive(pnlBackMenu);
    end;
    if Assigned(FMenuItensImagens) then
    begin
      with TFormMenuItensImagens(FMenuItensImagens) do
      begin
        FImageDefault := TImage.Create(nil);
        FImageDefault.Name := 'ImgDefault';
        FController.SetActiveImage(FImageDefault);
      end;
    end;
    Iniciar;
  finally
    if Assigned(FImageDefault) then
    begin
      FreeAndNil(FImageDefault);
    end;
  end;
end;

procedure TControllerPrincipal.OnClickMenuImage(Sender: TObject);
begin
  CloseMenus;
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

      pnlBackMenu.Width := 200;
      FMenuPrincipal.Close;
      FMenuItensImagens.Parent := pnlMenu;
      FMenuItensImagens.Show;
    end
    else
    if FMenuItensImagens.Showing then
    begin
      pnlBackMenu.Width := FWidthMenuImg;
      FMenuItensImagens.Close;
      FMenuPrincipal.Parent := pnlMenu;
      FMenuPrincipal.Show;
    end;
  end;
end;

end.

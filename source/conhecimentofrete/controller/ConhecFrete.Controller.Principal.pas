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
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerPrincipal = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
  end;

  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
  private
    FWidthTeste :Integer;
    FFormOwner: TForm;
    FCmpMenuImg :TCmpMenuImage;
    FMenuItensImagens :TFormMenuItensImagens;
    FCmpTituloOpcao :TCmpTLabelTitulo;
    FCmpCardInfoUser :TCmpCardInfoUserCte;
    FMenuCadastros :TFormMenuCadastros;

    procedure OnClickCardUserInfo(Sender :TObject);
    procedure OnClickLogoImage(Sender :TObject);
    procedure OnClickMenuImage(Sender :TObject);
  public
    FCtePrincipal :TfrmCtePrincipal;
    FMenuPrincipal :TFormMenuPrincipal;
    FMenuEmissaoFiscal :TFormMenuEmissaoFiscal;

    procedure Iniciar;
    procedure DestruirForms;

  class function New(pFormOwner :TForm) :IControllerPrincipal; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
    ConhecFrete.Forms.Cte.OpcoesInicio
   ,ConhecFrete.Forms.Cte.Background;

{ ControllerPrincipal }

constructor TControllerPrincipal.Create(pFormOwner: TForm);
var
  SetTyperForms:TpForms;
begin
  FFormOwner := pFormOwner;
  SetTyperForms := High(TpForms);
  SetLength(aFormsCte, Ord(SetTyperForms));

  FCmpMenuImg       := TCmpMenuImage.Create(nil);
  FCmpCardInfoUser  := TCmpCardInfoUserCte.Create(nil);

  FCtePrincipal := TfrmCtePrincipal.Create(nil);
  aFormsCte[Ord(tpOwner)] := FCtePrincipal;

  FCmpTituloOpcao := TCmpTLabelTitulo.Create(nil);
  aFormsCte[Ord(tpCmpTitulo)] := FCmpTituloOpcao;

  FMenuEmissaoFiscal := TFormMenuEmissaoFiscal.Create(aFormsCte);
  aFormsCte[Ord(tpMenuEmissaoFiscal)] := FMenuEmissaoFiscal;

  FMenuCadastros  := TFormMenuCadastros.Create(aFormsCte);
  aFormsCte[Ord(tpMenuCadastros)] := FMenuCadastros;

  FMenuItensImagens := TFormMenuItensImagens.Create(aFormsCte);
  aFormsCte[Ord(tpMenuItensImagens)] := FMenuItensImagens;

  FMenuPrincipal := TFormMenuPrincipal.Create(aFormsCte);
  aFormsCte[Ord(tpMenuPrincipal)] := FMenuPrincipal;

  with FCtePrincipal do
  begin
    FWidthTeste := pnlBackMenu.Width;
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
  FreeAndNil(FMenuCadastros);
  FreeAndNil(FMenuEmissaoFiscal);
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
    Show;
  end;
  FCmpMenuImg.Show;
  FCmpCardInfoUser.Show;
  FCmpTituloOpcao.Show;
  FMenuPrincipal.Show;
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
  if Assigned(aFormsCte[Ord(tpFormCte)]) then
  begin
    if aFormsCte[Ord(tpBarraBotoes)].Showing then
      aFormsCte[Ord(tpBarraBotoes)].Close;

    if aFormsCte[Ord(tpFormOpcoesItensCte)].Showing then
      aFormsCte[Ord(tpFormOpcoesItensCte)].Close;

    if aFormsCte[Ord(tpFormCte)].Showing then
      aFormsCte[Ord(tpFormCte)].Close;
  end;
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FController.SetItemActive(pnlBackMenu);
  end;
  Iniciar;
end;

procedure TControllerPrincipal.OnClickMenuImage(Sender: TObject);
begin
  with FCtePrincipal do
  begin
    if FMenuPrincipal.Showing then
    begin
      pnlBackMenu.Width := 200;
      FMenuPrincipal.Close;
      FMenuItensImagens.Parent := pnlMenu;
      FMenuItensImagens.Show;
    end
    else
    if FMenuItensImagens.Showing then
    begin
      pnlBackMenu.Width := FWidthTeste;
      FMenuItensImagens.Close;
      FMenuPrincipal.Parent := pnlMenu;
      FMenuPrincipal.Show;
    end;
  end;
end;

end.

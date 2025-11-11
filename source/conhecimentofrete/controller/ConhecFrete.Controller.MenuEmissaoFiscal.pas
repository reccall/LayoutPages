unit ConhecFrete.Controller.MenuEmissaoFiscal;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,System.UITypes
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuEmissaoFiscal = interface
  ['{58308178-912B-4AC8-8AF0-A7EF97C05D2C}']
    procedure Iniciar;
  end;

  TControllerMenuEmissaoFiscal = class(TInterfacedObject, IControllerMenuEmissaoFiscal)
  private
    FFormCte   :TForm;
    FCtePrincipal :TForm;
    FOpcoesCteItens :TForm;
    FMenuPrincipal :TForm;
    FCmpTituloOpcao :TForm;
    FMenuItensImagens :TForm;
    FMenuEmissaoFiscal :TForm;

    procedure Iniciar;

    procedure OnClickInicioCte(Sender :TObject);
    procedure OnFormMouseLeave(Sender: TObject);
  public
  class function New(pArrayForms: array of TForm) :IControllerMenuEmissaoFiscal overload;
    constructor Create(pArrayForms: array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,LayoutPages.View.Componentes.TLabelTitulo;

{ TControllerMenuEmissaoFiscal }

constructor TControllerMenuEmissaoFiscal.Create(pArrayForms :array of TForm);
begin
  FFormCte          := pArrayForms[Ord(tpFormCte)];
  FCtePrincipal     := pArrayForms[Ord(tpOwner)];
  FMenuPrincipal    := pArrayForms[Ord(tpMenuPrincipal)];
  FCmpTituloOpcao   := pArrayForms[Ord(tpCmpTitulo)];
  FOpcoesCteItens   := pArrayForms[Ord(tpFormOpcoesItensCte)];
  FMenuItensImagens := pArrayForms[Ord(tpMenuItensImagens)];
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := TFormMenuItensImagens.Create(aFormsCte);
    aFormsCte[Ord(tpMenuItensImagens)] := FMenuItensImagens;
  end;
end;

destructor TControllerMenuEmissaoFiscal.Destroy;
begin
  inherited;
end;

procedure TControllerMenuEmissaoFiscal.Iniciar;
begin
  if not Assigned(FMenuEmissaoFiscal) then
  begin
    FMenuEmissaoFiscal := aFormsCte[Ord(tpMenuEmissaoFiscal)];
  end;
  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    pnlCte.OnClick       := OnClickInicioCte;
    pnlCte.OnMouseMove   := OnMouseMoveItem;
    pnlCte.OnMouseLeave  := OnMouseLeaveItem;
    pnlNFe.OnMouseMove   := OnMouseMoveItem;
    pnlNFe.OnMouseLeave  := OnMouseLeaveItem;
    pnlNFSe.OnMouseMove  := OnMouseMoveItem;
    pnlNFSe.OnMouseLeave := OnMouseLeaveItem;
    pnlNFCe.OnMouseMove  := OnMouseMoveItem;
    pnlNFCe.OnMouseLeave := OnMouseLeaveItem;
    OnMouseLeave := OnFormMouseLeave;
    Show;
  end;
end;

class function TControllerMenuEmissaoFiscal.New(pArrayForms: array of TForm): IControllerMenuEmissaoFiscal;
begin
  Result := Self.Create(pArrayForms);
end;

procedure TControllerMenuEmissaoFiscal.OnClickInicioCte(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if not Assigned(FFormCte) then
  begin
    FFormCte := aFormsCte[Ord(tpFormCte)];

    if not Assigned(FFormCte) then
    begin
      FFormCte := TfrmCteOpcoesInicio.Create(aFormsCte);
      aFormsCte[Ord(tpFormCte)] := FFormCte;
    end;
  end;

  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgEmissaoFiscal);
  end;

  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FController.SetItemActive(pnlEmissor);
  end;

  FMenuEmissaoFiscal.Close;

  with TfrmCtePrincipal(FCtePrincipal), TCmpTLabelTitulo(FCmpTituloOpcao) do
  begin
    pnlMainTopRight.Visible := False;
    lblTitulo.Caption := 'Opções de emissão do CT-e';
  end;

  if not Assigned(FOpcoesCteItens) then
  begin
    FOpcoesCteItens := aFormsCte[Ord(tpFormOpcoesItensCte)];

    if not Assigned(FOpcoesCteItens) then
      Exit;
  end;

  FOpcoesCteItens.Close;
  if not Assigned(FFormCte) then
  begin
    FFormCte := aFormsCte[Ord(tpFormCte)];
  end;

  TfrmCteOpcoesInicio(FFormCte).FController.Iniciar;
  Screen.Cursor := crDefault;
end;

procedure TControllerMenuEmissaoFiscal.OnFormMouseLeave(Sender: TObject);
begin
  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    Close;
  end;
end;

end.

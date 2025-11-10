unit ConhecFrete.Controller.MenuCadastros;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuCadastros = interface
  ['{8866F3F1-E545-4534-B300-02BC02893DF8}']
    procedure Iniciar;
    procedure CloseFormsMenuCadastros;
  end;

  TControllerMenuCadastros = class(TInterfacedObject, IControllerMenuCadastros)
  private
    FFormOwner: TForm;
    FCmpTitulo :TForm;
    FOpcoesCte :TForm;
    FMenuPrincipal :TForm;
    FMenuItensImagens :TForm;

    procedure OnClickCadMarcas(Sender :TObject);
    procedure OnClickCadProdutos(Sender :TObject);
    procedure OnClickCadServicos(Sender :TObject);
    procedure OnClickCadClientes(Sender :TObject);
    procedure OnClickCadUnidMedida(Sender :TObject);
    procedure OnClickCadFornecedores(Sender :TObject);
    procedure OnClickCadTransportadoras(Sender :TObject);

    procedure OnFormMouseLeave(Sender :TObject);
    procedure CloseFormsMenuCadastros;

    procedure Iniciar;
    public
  class function New(pArrayFormsCte :array of TForm) :IControllerMenuCadastros overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.MenuItensImagens;

{ TControllerMenuCadastros }

procedure TControllerMenuCadastros.CloseFormsMenuCadastros;
begin
  if not Assigned(FOpcoesCte) then
  begin
    FOpcoesCte := aFormsCte[Ord(tpFormCte)];
  end;

  if Assigned(FOpcoesCte) then
  begin
    with TfrmCteOpcoesInicio(FOpcoesCte) do
    begin
      FController.CloseFormsMenuCadastros;
      Close;
    end;
  end;
  TFormMenuCadastros(FFormOwner).Close;
end;

constructor TControllerMenuCadastros.Create(pArrayFormsCte :array of TForm);
begin
  FFormOwner     := pArrayFormsCte[Ord(tpMenuCadastros)];
  FCmpTitulo     := pArrayFormsCte[Ord(tpCmpTitulo)];
  FOpcoesCte     := pArrayFormsCte[Ord(tpFormCte)];
  FMenuPrincipal := pArrayFormsCte[Ord(tpMenuPrincipal)];
  FMenuItensImagens := pArrayFormsCte[Ord(tpMenuItensImagens)];
end;

destructor TControllerMenuCadastros.Destroy;
begin
  with TFormMenuCadastros(FFormOwner) do
  begin
    Close;
    FreeAndNil(FController);
  end;
end;

procedure TControllerMenuCadastros.Iniciar;
begin
  with TFormMenuCadastros(FFormOwner) do
  begin
    FControl := 0;
    pnlMarcas.OnMouseMove      := OnMouseMoveItem;
    pnlMarcas.OnMouseLeave     := OnMouseLeaveItem;
    pnlFornec.OnMouseMove      := OnMouseMoveItem;
    pnlFornec.OnMouseLeave     := OnMouseLeaveItem;
    pnlTransp.OnMouseMove      := OnMouseMoveItem;
    pnlTransp.OnMouseLeave     := OnMouseLeaveItem;
    pnlProdutos.OnMouseMove    := OnMouseMoveItem;
    pnlProdutos.OnMouseLeave   := OnMouseLeaveItem;
    pnlServicos.OnMouseMove    := OnMouseMoveItem;
    pnlServicos.OnMouseLeave   := OnMouseLeaveItem;
    pnlClientes.OnMouseMove    := OnMouseMoveItem;
    pnlClientes.OnMouseLeave   := OnMouseLeaveItem;
    pnlUnidMedida.OnMouseMove  := OnMouseMoveItem;
    pnlUnidMedida.OnMouseLeave := OnMouseLeaveItem;

    pnlMarcas.OnClick     := OnClickCadMarcas;
    pnlFornec.OnClick     := OnClickCadFornecedores;
    pnlTransp.OnClick     := OnClickCadTransportadoras;
    pnlProdutos.OnClick   := OnClickCadProdutos;
    pnlServicos.OnClick   := OnClickCadServicos;
    pnlClientes.OnClick   := OnClickCadClientes;
    pnlUnidMedida.OnClick := OnClickCadUnidMedida;

    OnMouseLeave := OnFormMouseLeave;
  end;
end;

class function TControllerMenuCadastros.New(pArrayFormsCte :array of TForm): IControllerMenuCadastros;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerMenuCadastros.OnClickCadClientes(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlClientes.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadFornecedores(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlFornec.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadMarcas(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlMarcas.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadProdutos(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlProdutos.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadServicos(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlServicos.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadTransportadoras(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlTransp.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadUnidMedida(Sender: TObject);
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;
  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo) do
  begin
    FController.SetItemActive(pnlCadastros);

    lblTitulo.Caption := TFormMenuCadastros(FFormOwner).pnlUnidMedida.Caption;
    CloseFormsMenuCadastros;
  end;
end;

procedure TControllerMenuCadastros.OnFormMouseLeave(Sender: TObject);
begin
  with TFormMenuCadastros(FFormOwner) do
  begin
    if FControl = 1 then
    begin
      Close;
      FControl := 0;
    end;
    Inc(FControl);
  end;
end;

end.

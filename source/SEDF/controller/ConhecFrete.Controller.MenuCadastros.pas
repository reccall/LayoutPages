unit ConhecFrete.Controller.MenuCadastros;

interface

uses
   Forms
  ,Math
  ,Graphics
  ,Winapi.Windows
  ,System.SysUtils
  ,Vcl.ExtCtrls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuCadastros = interface
  ['{8866F3F1-E545-4534-B300-02BC02893DF8}']
    procedure Iniciar;
    procedure CloseFormsMenuCadastros;
    procedure SetOpcaoMenuItemCad(pPanel :TPanel);
  end;

  TControllerMenuCadastros = class(TInterfacedObject, IControllerMenuCadastros)
  private
    FCmpTitulo :TForm;
    FOpcoesCte :TForm;
    FMenuCadastros: TForm;
    FMenuPrincipal :TForm;
    FMenuItensImagens :TForm;
    FMenuEmissaoFiscal: TForm;
    FormOpcoesItensCte :TForm;
    FSetOpcaoItemMenuCad :TPanel;

    FFormCadastroMarcas :TForm;
    FFormCadastroServicos :TForm;
    FFormCadastroProdutos :TForm;
    FFormCadastroClientes :TForm;
    FFormCadastroUnidMedidas :TForm;
    FFormCadastroFornecedores :TForm;
    FFormCadastroTransportadoras :TForm;

    procedure OnClickCadMarcas(Sender :TObject);
    procedure OnClickCadProdutos(Sender :TObject);
    procedure OnClickCadServicos(Sender :TObject);
    procedure OnClickCadClientes(Sender :TObject);
    procedure OnClickCadUnidMedida(Sender :TObject);
    procedure OnClickCadFornecedores(Sender :TObject);
    procedure OnClickCadTransportadoras(Sender :TObject);

    procedure OnMouseLeaveItemN(Sender :TObject); overload;
    procedure OnFormMouseLeave(Sender :TObject);
    procedure CloseFormsMenuCadastros;
    procedure SetOpcaoMenuItemCad(pPanel :TPanel);

    function GetFormMenuEmissaoFiscal :TForm;

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
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.CadastroMarcas
  ,ConhecFrete.Forms.Cte.CadastroServicos
  ,ConhecFrete.Forms.Cte.CadastroClientes
  ,ConhecFrete.Forms.Cte.CadastroProdutos
  ,ConhecFrete.Forms.Cte.CadastroFornecedores
  ,ConhecFrete.Forms.Cte.CadastroTransportadoras
  ,ConhecFrete.Forms.Cte.CadastroUnidadesDeMedida;

{ TControllerMenuCadastros }

procedure TControllerMenuCadastros.CloseFormsMenuCadastros;
begin
  if Assigned(aFormsCte[Ord(tpCadastroMarcas)]) then
  begin
    if aFormsCte[Ord(tpCadastroMarcas)].Showing then
      aFormsCte[Ord(tpCadastroMarcas)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroClientes)]) then
  begin
    if aFormsCte[Ord(tpCadastroClientes)].Showing then
      aFormsCte[Ord(tpCadastroClientes)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroProduto)]) then
  begin
    if aFormsCte[Ord(tpCadastroProduto)].Showing then
      aFormsCte[Ord(tpCadastroProduto)].Close;
  end;
  if Assigned(aFormsCte[Ord(tpCadastroServicos)]) then
  begin
    if aFormsCte[Ord(tpCadastroServicos)].Showing then
      aFormsCte[Ord(tpCadastroServicos)].Close;
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

  if not Assigned(FormOpcoesItensCte) then
  begin
    FormOpcoesItensCte := aFormsCte[Ord(tpFormOpcoesItensCte)];
  end;

  if Assigned(FormOpcoesItensCte) then
  begin
    if FormOpcoesItensCte.Showing then
      TFormOpcoesItensCte(FormOpcoesItensCte).Close;
  end;

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
  TFormMenuCadastros(FMenuCadastros).Close;
end;

constructor TControllerMenuCadastros.Create(pArrayFormsCte :array of TForm);
begin
  FMenuCadastros     := pArrayFormsCte[Ord(tpMenuCadastros)];
  FCmpTitulo         := pArrayFormsCte[Ord(tpCmpTitulo)];
  FOpcoesCte         := pArrayFormsCte[Ord(tpFormCte)];
  FMenuPrincipal     := pArrayFormsCte[Ord(tpMenuPrincipal)];
  FormOpcoesItensCte := pArrayFormsCte[Ord(tpFormOpcoesItensCte)];

  FMenuItensImagens := pArrayFormsCte[Ord(tpMenuItensImagens)];
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := TFormMenuItensImagens.Create(aFormsCte);
    aFormsCte[Ord(tpMenuItensImagens)] := FMenuItensImagens;
  end;
end;

destructor TControllerMenuCadastros.Destroy;
begin
  with TFormMenuCadastros(FMenuCadastros) do
  begin
    Close;
    FreeAndNil(FController);
  end;
end;

function TControllerMenuCadastros.GetFormMenuEmissaoFiscal: TForm;
begin
  Result := FMenuEmissaoFiscal;
  if not Assigned(FMenuEmissaoFiscal) then
    Result := aFormsCte[Ord(tpMenuEmissaoFiscal)];
end;

procedure TControllerMenuCadastros.Iniciar;
begin
  with TFormMenuCadastros(FMenuCadastros) do
  begin
    FControl := 0;
    pnlMarcas.OnMouseMove      := OnMouseMoveItem;
    pnlMarcas.OnMouseLeave     := OnMouseLeaveItemN;
    pnlFornec.OnMouseMove      := OnMouseMoveItem;
    pnlFornec.OnMouseLeave     := OnMouseLeaveItemN;
    pnlTransp.OnMouseMove      := OnMouseMoveItem;
    pnlTransp.OnMouseLeave     := OnMouseLeaveItemN;
    pnlProdutos.OnMouseMove    := OnMouseMoveItem;
    pnlProdutos.OnMouseLeave   := OnMouseLeaveItemN;
    pnlServicos.OnMouseMove    := OnMouseMoveItem;
    pnlServicos.OnMouseLeave   := OnMouseLeaveItemN;
    pnlClientes.OnMouseMove    := OnMouseMoveItem;
    pnlClientes.OnMouseLeave   := OnMouseLeaveItemN;
    pnlUnidMedida.OnMouseMove  := OnMouseMoveItem;
    pnlUnidMedida.OnMouseLeave := OnMouseLeaveItemN;

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

procedure TControllerMenuCadastros.OnClickCadProdutos(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroProduto)]) then
  begin
    if TFormCadastrosProdutos(aFormsCte[Ord(tpCadastroProduto)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlProdutos.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroProdutos) then
  begin
    FFormCadastroProdutos := TFormCadastrosProdutos.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroProduto)] := FFormCadastroProdutos;
  end
  else
  begin
    with TFormCadastrosProdutos(FFormCadastroProdutos) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroProdutos := aFormsCte[Ord(tpCadastroProduto)];
    end;
  end;

  with TFormCadastrosProdutos(FFormCadastroProdutos) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadClientes(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroClientes)]) then
  begin
    if TFormCadastrosClientes(aFormsCte[Ord(tpCadastroClientes)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlClientes.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroClientes) then
  begin
    FFormCadastroClientes := TFormCadastrosClientes.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroClientes)] := FFormCadastroClientes;
  end
  else
  begin
    with TFormCadastrosClientes(FFormCadastroClientes) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroClientes := aFormsCte[Ord(tpCadastroClientes)];
    end;
  end;

  with TFormCadastrosClientes(FFormCadastroClientes) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadFornecedores(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroFornecedores)]) then
  begin
    if TFormCadastrosClientes(aFormsCte[Ord(tpCadastroFornecedores)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlFornec.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroFornecedores) then
  begin
    FFormCadastroFornecedores := TFormCadastrosFornecedores.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroFornecedores)] := FFormCadastroFornecedores;
  end
  else
  begin
    with TFormCadastrosFornecedores(FFormCadastroFornecedores) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroFornecedores := aFormsCte[Ord(tpCadastroFornecedores)];
    end;
  end;

  with TFormCadastrosFornecedores(FFormCadastroFornecedores) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadMarcas(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroMarcas)]) then
  begin
    if TFormCadastrosMarcas(aFormsCte[Ord(tpCadastroMarcas)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlMarcas.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroMarcas) then
  begin
    FFormCadastroMarcas := TFormCadastrosMarcas.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroMarcas)] := FFormCadastroMarcas;
  end
  else
  begin
    with TFormCadastrosMarcas(FFormCadastroMarcas) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroMarcas := aFormsCte[Ord(tpCadastroMarcas)];
    end;
  end;

  with TFormCadastrosMarcas(FFormCadastroMarcas) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadServicos(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroServicos)]) then
  begin
    if TFormCadastrosServicos(aFormsCte[Ord(tpCadastroServicos)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlServicos.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroServicos) then
  begin
    FFormCadastroServicos := TFormCadastrosServicos.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroServicos)] := FFormCadastroServicos;
  end
  else
  begin
    with TFormCadastrosServicos(FFormCadastroServicos) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroServicos := aFormsCte[Ord(tpCadastroServicos)];
    end;
  end;

  with TFormCadastrosServicos(FFormCadastroServicos) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadTransportadoras(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroTransportadoras)]) then
  begin
    if TFormCadastrosTransportadoras(aFormsCte[Ord(tpCadastroTransportadoras)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlTransp.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroTransportadoras) then
  begin
    FFormCadastroTransportadoras := TFormCadastrosTransportadoras.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroTransportadoras)] := FFormCadastroTransportadoras;
  end
  else
  begin
    with TFormCadastrosTransportadoras(FFormCadastroTransportadoras) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroTransportadoras := aFormsCte[Ord(tpCadastroTransportadoras)];
    end;
  end;

  with TFormCadastrosTransportadoras(FFormCadastroTransportadoras) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnClickCadUnidMedida(Sender: TObject);
begin
  if Assigned(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]) then
  begin
    if TFormCadastrosUnidadesDeMedida(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]).Showing then
    begin
      Exit;
    end;
  end;
  SetOpcaoMenuItemCad(TPanel(Sender));
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgCadastros);
  end;
  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal), TCmpTLabelTitulo(FCmpTitulo)do
  begin
    FController.SetItemActive(pnlCadastros);
    lblTitulo.Caption := TFormMenuCadastros(FMenuCadastros).pnlUnidMedida.Caption;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(Sender));
    end;
  end;

  if not Assigned(FFormCadastroUnidMedidas) then
  begin
    FFormCadastroUnidMedidas := TFormCadastrosUnidadesDeMedida.Create(aFormsCte);
    aFormsCte[Ord(tpCadastroUnidadesDeMedida)] := FFormCadastroUnidMedidas;
  end
  else
  begin
    with TFormCadastrosUnidadesDeMedida(FFormCadastroUnidMedidas) do
    begin
      scrlbxMain.VertScrollBar.Position := 0;
      FFormCadastroUnidMedidas := aFormsCte[Ord(tpCadastroUnidadesDeMedida)];
    end;
  end;

  with TFormCadastrosUnidadesDeMedida(FFormCadastroUnidMedidas) do
  begin
    FController.Iniciar;
  end;
end;

procedure TControllerMenuCadastros.OnFormMouseLeave(Sender: TObject);
begin
  with TFormMenuCadastros(FMenuCadastros) do
  begin
    if FControl = 1 then
    begin
      Close;
      FControl := 0;
    end;
    Inc(FControl);
  end;
end;

procedure TControllerMenuCadastros.OnMouseLeaveItemN(Sender: TObject);
begin
  if FSetOpcaoItemMenuCad <> TPanel(Sender) then
    TPanel(Sender).Color := clWhite;
end;

procedure TControllerMenuCadastros.SetOpcaoMenuItemCad(pPanel: TPanel);
begin
  FSetOpcaoItemMenuCad := pPanel;

  with TFormMenuCadastros(FMenuCadastros) do
  begin
    pnlMarcas.Color     := IfThen(FSetOpcaoItemMenuCad = pnlMarcas,TColor($FAE6E6), clWhite);
    pnlFornec.Color     := IfThen(FSetOpcaoItemMenuCad = pnlFornec,TColor($FAE6E6), clWhite);
    pnlTransp.Color     := IfThen(FSetOpcaoItemMenuCad = pnlTransp,TColor($FAE6E6), clWhite);
    pnlProdutos.Color   := IfThen(FSetOpcaoItemMenuCad = pnlProdutos,TColor($FAE6E6), clWhite);
    pnlServicos.Color   := IfThen(FSetOpcaoItemMenuCad = pnlServicos,TColor($FAE6E6), clWhite);
    pnlClientes.Color   := IfThen(FSetOpcaoItemMenuCad = pnlClientes,TColor($FAE6E6), clWhite);
    pnlUnidMedida.Color := IfThen(FSetOpcaoItemMenuCad = pnlUnidMedida,TColor($FAE6E6), clWhite);
  end;
end;

end.

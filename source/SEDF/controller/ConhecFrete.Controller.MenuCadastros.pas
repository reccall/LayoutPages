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

    procedure IniciarInformacoesFormMenu(pSender: TObject; pFormMenu :TpForms);

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

procedure TControllerMenuCadastros.IniciarInformacoesFormMenu(pSender: TObject; pFormMenu: TpForms);
begin
  SetOpcaoMenuItemCad(TPanel(pSender));
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
    with TFormMenuCadastros(FMenuCadastros) do
    begin
      case pFormMenu of
        tpCadastroMarcas:           lblTitulo.Caption := pnlMarcas.Caption;
        tpCadastroProduto:          lblTitulo.Caption := pnlProdutos.Caption;
        tpCadastroClientes:         lblTitulo.Caption := pnlClientes.Caption ;
        tpCadastroServicos:         lblTitulo.Caption := pnlServicos.Caption;
        tpCadastroFornecedores:     lblTitulo.Caption := pnlFornec.Caption;
        tpCadastroTransportadoras:  lblTitulo.Caption := pnlTransp.Caption;
        tpCadastroUnidadesDeMedida: lblTitulo.Caption := pnlUnidMedida.Caption;
      end;
    end;
    CloseFormsMenuCadastros;
  end;

  FMenuEmissaoFiscal := GetFormMenuEmissaoFiscal;
  if Assigned(FMenuEmissaoFiscal) then
  begin
    with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
    begin
      FController.SetOpcaoMenuItem(TPanel(pSender));
    end;
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

  IniciarInformacoesFormMenu(Sender, tpCadastroProduto);

  if Assigned(FFormCadastroProdutos) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroProduto)]);
    FFormCadastroProdutos := nil;
  end;
  FFormCadastroProdutos := TFormCadastrosProdutos.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroProduto)] := FFormCadastroProdutos;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroClientes);
  
  if Assigned(FFormCadastroClientes) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroClientes)]);
    FFormCadastroClientes := nil;
  end;
  FFormCadastroClientes := TFormCadastrosClientes.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroClientes)] := FFormCadastroClientes;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroFornecedores);

  if Assigned(FFormCadastroFornecedores) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroFornecedores)]);
    FFormCadastroFornecedores := nil;
  end;
  FFormCadastroFornecedores := TFormCadastrosFornecedores.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroFornecedores)] := FFormCadastroFornecedores;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroMarcas);

  if Assigned(FFormCadastroMarcas) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroMarcas)]);
    FFormCadastroMarcas := nil;
  end;
  FFormCadastroMarcas := TFormCadastrosMarcas.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroMarcas)] := FFormCadastroMarcas;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroServicos);

  if Assigned(FFormCadastroServicos) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroServicos)]);
    FFormCadastroServicos := nil;
  end;
  FFormCadastroServicos := TFormCadastrosServicos.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroServicos)] := FFormCadastroServicos;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroTransportadoras);

  if Assigned(FFormCadastroTransportadoras) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroTransportadoras)]);
    FFormCadastroTransportadoras := nil;
  end;
  FFormCadastroTransportadoras := TFormCadastrosTransportadoras.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroTransportadoras)] := FFormCadastroTransportadoras;

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

  IniciarInformacoesFormMenu(Sender, tpCadastroUnidadesDeMedida);

  if Assigned(FFormCadastroUnidMedidas) then
  begin
    FreeAndNil(aFormsCte[Ord(tpCadastroUnidadesDeMedida)]);
    FFormCadastroUnidMedidas := nil;
  end;
  FFormCadastroUnidMedidas := TFormCadastrosUnidadesDeMedida.Create(aFormsCte);
  aFormsCte[Ord(tpCadastroUnidadesDeMedida)] := FFormCadastroUnidMedidas;

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

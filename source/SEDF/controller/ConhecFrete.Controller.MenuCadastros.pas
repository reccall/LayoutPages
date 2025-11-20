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
    FFormCteCadastro :TForm;
    FSetOpcaoItemMenuCad :TPanel;

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

    function GetActiveForm :TpForms;

    procedure IniciarInformacoesFormMenu(pSender: TObject; pFormMenu :TpForms);
    procedure IniciarFormCadastros(pOpcaoCadastro :TpForms);
    procedure Iniciar;
    public
  class function New(pArrayFormsCte :array of TForm) :IControllerMenuCadastros overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.Cadastros;

{ TControllerMenuCadastros }

procedure TControllerMenuCadastros.CloseFormsMenuCadastros;
begin
  if Assigned(aFormsCte[Ord(tpCteCadastros)]) then
  begin
    with TFormCteCadastros(aFormsCte[Ord(tpCteCadastros)]) do
    begin
      if Showing then
      begin
        FController.ResetComponentsItens;
        Close;
      end;
    end;
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

function TControllerMenuCadastros.GetActiveForm :TpForms;
begin
  if Assigned(TFormCteCadastros(aFormsCte[Ord(tpCteCadastros)])) then
  begin
    with TFormCteCadastros(aFormsCte[Ord(tpCteCadastros)]) do
    begin
      Result := FController.GetFormOwner;
    end;
  end
  else
  begin
    Result := tpFDefault;
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

procedure TControllerMenuCadastros.IniciarFormCadastros(pOpcaoCadastro :TpForms);
begin
  if not Assigned(aFormsCte[Ord(tpCteCadastros)]) then
  begin
    aFormsCte[Ord(tpCteCadastros)] := TFormCteCadastros.Create(aFormsCte);
    FFormCteCadastro := aFormsCte[Ord(tpCteCadastros)];
  end;
  with TFormCteCadastros(aFormsCte[Ord(tpCteCadastros)]) do
  begin
    FController.SetFormOwner(pOpcaoCadastro).Iniciar;
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
        tpCadastroProdutos:         lblTitulo.Caption := pnlProdutos.Caption;
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

  if not Assigned(aFormsCte[Ord(tpCmpControlGrid)]) then
  begin
    aFormsCte[Ord(tpCmpControlGrid)] := TCmpGridControl.Create(nil);
  end;

  if not Assigned(aFormsCte[Ord(tpCmpTituloDescSimples)]) then
  begin
    aFormsCte[Ord(tpCmpTituloDescSimples)] := TCmpTituloDescSimples.Create(nil);
  end;
end;

class function TControllerMenuCadastros.New(pArrayFormsCte :array of TForm): IControllerMenuCadastros;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerMenuCadastros.OnClickCadProdutos(Sender: TObject);
begin
  if GetActiveForm = tpCadastroProdutos then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroProdutos);
  IniciarFormCadastros(tpCadastroProdutos);
end;

procedure TControllerMenuCadastros.OnClickCadClientes(Sender: TObject);
begin
  if GetActiveForm = tpCadastroClientes then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroClientes);
  IniciarFormCadastros(tpCadastroClientes);
end;

procedure TControllerMenuCadastros.OnClickCadFornecedores(Sender: TObject);
begin
  if GetActiveForm = tpCadastroFornecedores then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroFornecedores);
  IniciarFormCadastros(tpCadastroFornecedores);
end;

procedure TControllerMenuCadastros.OnClickCadMarcas(Sender: TObject);
begin
  if GetActiveForm = tpCadastroMarcas then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroMarcas);
  IniciarFormCadastros(tpCadastroMarcas);
end;

procedure TControllerMenuCadastros.OnClickCadServicos(Sender: TObject);
begin
  if GetActiveForm = tpCadastroServicos then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroServicos);
  IniciarFormCadastros(tpCadastroServicos);
end;

procedure TControllerMenuCadastros.OnClickCadTransportadoras(Sender: TObject);
begin
  if GetActiveForm = tpCadastroTransportadoras then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroTransportadoras);
  IniciarFormCadastros(tpCadastroTransportadoras);
end;

procedure TControllerMenuCadastros.OnClickCadUnidMedida(Sender: TObject);
begin
  if GetActiveForm = tpCadastroUnidadesDeMedida then
    Exit;
  IniciarInformacoesFormMenu(Sender, tpCadastroUnidadesDeMedida);
  IniciarFormCadastros(tpCadastroUnidadesDeMedida);
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

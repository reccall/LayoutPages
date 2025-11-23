unit ConhecFrete.Controller.Cadastros;

interface

uses
   Forms
  ,Winapi.Windows
  ,Winapi.Messages
  ,Graphics
  ,Dialogs
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.Marcas
  ,ConhecFrete.Controller.Servicos
  ,ConhecFrete.Controller.Clientes
  ,ConhecFrete.Controller.Produtos
  ,ConhecFrete.Controller.Fornecedores
  ,ConhecFrete.Controller.Transportadoras
  ,ConhecFrete.Controller.UnidadesDeMedida;

type
  IControllerCadastros = interface
  ['{1924679B-498C-4482-AB31-D628C4D6743C}']
    procedure Iniciar;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    function GetFormOwner :TpForms;
    function SetFormOwner(pFormOwnerCadastro :TpForms) :IControllerCadastros;
  end;

  TControllerCadastros = class(TInterfacedObject, IControllerCadastros)
  private
    FPosition :Integer;
    FTpOwnerCadastro :TpForms;

    FFormCte :TForm;
    FCmpFormGrid :TForm;
    FFormCadastros :TForm;
    FCmpEditTexto :TForm;
    FCmpCabCadastro :TForm;
    FCmpControlGrid :TForm;
    FPanelConsultaPesq :TForm;

    FControllerMarcas :IControllerMarcas;
    FControllerServicos :IControllerServicos;
    FControllerClientes :IControllerClientes;
    FControllerProdutos :IControllerProdutos;
    FControllerFornecedores :IControllerFornecedores;
    FControllerTranportadoras :IControllerTransportadoras;
    FControllerUnidadesDeMedida :IControllerUnidadesDeMedida;

    procedure Iniciar;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure SetInterfaces;
    procedure SetVariaveisArray;
    procedure SetArrayItens;
    procedure OnClickConsulta(Sender :TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    function GetFormOwner :TpForms;
    function SetFormOwner(pFormOwnerCadastro :TpForms) :IControllerCadastros;
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  public

  class function New(pArrayFormsCte :array of TForm) :IControllerCadastros overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.PanelConsultaPesq
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,LayoutPages.View.Componentes.CabecalhoCadastroPrincipal;

{ TControllerCadastros }

constructor TControllerCadastros.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte            := pArrayFormsCte[Ord(tpOwner)];
  FFormCadastros      := pArrayFormsCte[Ord(tpCteCadastros)];
  FTpOwnerCadastro    := tpFDefault;

  aFormsCte[Ord(tpCmpFormGrid)]          := TCmpFormGrid.Create(nil);
  aFormsCte[Ord(tpCmpEditTexto)]         := TCmpEditTexto.Create(nil);
  aFormsCte[Ord(tpCmpControlGrid)]       := TCmpGridControl.Create(nil);
  aFormsCte[Ord(tpCmpCabCadastros)]      := TCmpCabCadastros.Create(nil);
  aFormsCte[Ord(tpCmpTituloDescSimples)] := TCmpTituloDescSimples.Create(nil);
end;

class function TControllerCadastros.New(pArrayFormsCte :array of TForm): IControllerCadastros;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastros.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  SetInterfaces;
  SetVariaveisArray;
  with TFormCteCadastros(FFormCadastros) do
  begin
    if not FCmpCabCadastro.Showing then
    begin
      FCmpCabCadastro.Parent := pnlCadTop;
      with TCmpCabCadastros(FCmpCabCadastro) do
      begin
        FCmpControlGrid.Parent := pnlControlGrid;
        MakeRounded(pnlConsulta,20);
        MakeRounded(pnlRegiaoPesq,20);
        imgLupa.OnClick := OnClickConsulta;
        pnlIncluirRegistro.OnClick := OnClickInserirRegistro;
      end;
    end;
    with TCmpCabCadastros(FCmpCabCadastro), TCmpEditTexto(FCmpEditTexto) do
    begin

      FCmpEditTexto.Parent := pnlRegiaoPesq;
      edtPesquisa.Text := EmptyStr;
    end;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetArrayItens;
    with TCmpGridControl(FCmpControlGrid) do
    begin
      chkControl.Checked := False;
      chkControl.OnClick := OnClickCheckBox;
    end;

    Show;
    FCmpControlGrid.Show;
    FCmpCabCadastro.Show;
    FCmpEditTexto.Show;
    FCmpControlGrid.SetFocus;
    with TCmpFormGrid(FCmpFormGrid) do
    begin
      ApplicationEvents1.OnMessage := ApplicationEvents1Message;
      MakeRounded(pnlCmpGridTop,10);
      scrlbxCmpMain.Realign;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TControllerCadastros.OnClickCheckBox(Sender: TObject);
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerMarcas.OnClickCheckBox(Sender);
    tpCadastroProdutos:         FControllerProdutos.OnClickCheckBox(Sender);
    tpCadastroServicos:         FControllerServicos.OnClickCheckBox(Sender);
    tpCadastroClientes:         FControllerClientes.OnClickCheckBox(Sender);
    tpCadastroFornecedores:     FControllerFornecedores.OnClickCheckBox(Sender);
    tpCadastroTransportadoras:  FControllerTranportadoras.OnClickCheckBox(Sender);
    tpCadastroUnidadesDeMedida: FControllerUnidadesDeMedida.OnClickCheckBox(Sender);
  end;
end;

procedure TControllerCadastros.OnClickConsulta(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerMarcas.OnClickConsulta(Sender);
    tpCadastroProdutos:         FControllerProdutos.OnClickConsulta(Sender);
    tpCadastroClientes:         FControllerClientes.OnClickConsulta(Sender);
    tpCadastroServicos:         FControllerServicos.OnClickConsulta(Sender);
    tpCadastroFornecedores:     FControllerFornecedores.OnClickConsulta(Sender);
    tpCadastroTransportadoras:  FControllerTranportadoras.OnClickConsulta(Sender);
    tpCadastroUnidadesDeMedida: FControllerUnidadesDeMedida.OnClickConsulta(Sender);
  end;
  Screen.Cursor := crDefault;
end;

procedure TControllerCadastros.OnClickInserirRegistro(Sender: TObject);
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerMarcas.OnClickInserirRegistro(Sender);
    tpCadastroProdutos:         FControllerProdutos.OnClickInserirRegistro(Sender);
    tpCadastroClientes:         FControllerClientes.OnClickInserirRegistro(Sender);
    tpCadastroServicos:         FControllerServicos.OnClickInserirRegistro(Sender);
    tpCadastroFornecedores:     FControllerFornecedores.OnClickInserirRegistro(Sender);
    tpCadastroTransportadoras:  FControllerTranportadoras.OnClickInserirRegistro(Sender);
    tpCadastroUnidadesDeMedida: FControllerUnidadesDeMedida.OnClickInserirRegistro(Sender);
  end;
end;

procedure TControllerCadastros.ResetComponentsItens;
begin
  if Assigned(FControllerMarcas) then
    FControllerMarcas.ResetComponentsItens;
  if Assigned(FControllerProdutos) then
    FControllerProdutos.ResetComponentsItens;
  if Assigned(FControllerClientes) then
    FControllerClientes.ResetComponentsItens;
  if Assigned(FControllerServicos) then
    FControllerServicos.ResetComponentsItens;
  if Assigned(FControllerFornecedores) then
    FControllerFornecedores.ResetComponentsItens;
  if Assigned(FControllerTranportadoras) then
    FControllerTranportadoras.ResetComponentsItens;
  if Assigned(FControllerUnidadesDeMedida) then
    FControllerUnidadesDeMedida.ResetComponentsItens;
end;

procedure TControllerCadastros.SetArrayItens;
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerMarcas.SetItensMarcas;
    tpCadastroProdutos:         FControllerProdutos.SetItensProdutos;
    tpCadastroClientes:         FControllerClientes.SetItensClientes;
    tpCadastroServicos:         FControllerServicos.SetItensServicos;
    tpCadastroFornecedores:     FControllerFornecedores.SetItensFornecedores;
    tpCadastroTransportadoras:  FControllerTranportadoras.SetItensTransportadoras;
    tpCadastroUnidadesDeMedida: FControllerUnidadesDeMedida.SetItensUnidadesDeMedida;
  end;
end;

function TControllerCadastros.SetFormOwner(pFormOwnerCadastro :TpForms) :IControllerCadastros;
begin
  Result := Self;
  FTpOwnerCadastro := pFormOwnerCadastro;
end;

procedure TControllerCadastros.SetInterfaces;
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:
    begin
      if not Assigned(FControllerMarcas) then
        FControllerMarcas := TControllerMarcas.New(aFormsCte);
    end;
    tpCadastroServicos:
    begin
      if not Assigned(FControllerServicos) then
        FControllerServicos := TControllerServicos.New(aFormsCte);
    end;
    tpCadastroProdutos:
    begin
      if not Assigned(FControllerProdutos) then
        FControllerProdutos := TControllerProdutos.New(aFormsCte);
    end;
    tpCadastroClientes:
    begin
      if not Assigned(FControllerClientes) then
        FControllerClientes := TControllerClientes.New(aFormsCte);
    end;
    tpCadastroFornecedores:
    begin
      if not Assigned(FControllerFornecedores) then
        FControllerFornecedores := TControllerFornecedores.New(aFormsCte);
    end;
    tpCadastroTransportadoras:
    begin
      if not Assigned(FControllerTranportadoras) then
        FControllerTranportadoras := TControllerTransportadoras.New(aFormsCte);
    end;
    tpCadastroUnidadesDeMedida:
    begin
      if not Assigned(FControllerUnidadesDeMedida) then
        FControllerUnidadesDeMedida := TControllerUnidadesDeMedida.New(aFormsCte);
    end;
  end;
end;

procedure TControllerCadastros.SetVariaveisArray;
begin
  if not Assigned(FCmpFormGrid) then
    FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
  if not Assigned(FCmpCabCadastro) then
    FCmpCabCadastro := aFormsCte[Ord(tpCmpCabCadastros)];
  if not Assigned(FCmpControlGrid) then
    FCmpControlGrid := aFormsCte[Ord(tpCmpControlGrid)];
  if not Assigned(FCmpEditTexto) then
    FCmpEditTexto := aFormsCte[Ord(tpCmpEditTexto)];
end;

destructor TControllerCadastros.Destroy;
begin
  with TFormCteCadastros(FFormCadastros) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastros.DestroyComponents;
begin
  ResetComponentsItens;
  FCmpEditTexto.Close;
  FreeAndNil(FCmpEditTexto);
  FPanelConsultaPesq.Close;
  FreeAndNil(FPanelConsultaPesq);
  FCmpControlGrid.Close;
  FreeAndNil(FCmpControlGrid);
  FCmpFormGrid.Close;
  FreeAndNil(FCmpFormGrid);
  FCmpCabCadastro.Close;
  FreeAndNil(FCmpCabCadastro);
end;

function TControllerCadastros.GetFormOwner: TpForms;
begin
  Result := FTpOwnerCadastro;
end;

procedure TControllerCadastros.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  i: SmallInt;
begin
  inherited;
  with TCmpFormGrid(FCmpFormGrid) do
  begin
    if Msg.message = WM_MOUSEWHEEL then
    begin
      FPosition := scrlbxCmpMain.VertScrollBar.Position;
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      i := HiWord(Msg.wParam) ;
      if i > 0 then
      begin
        Msg.wParam := VK_UP;
        Dec(FPosition,20);
      end
      else
      begin
        Msg.wParam := VK_DOWN;
        Inc(FPosition,20);
      end;
      Handled := False;

      scrlbxCmpMain.VertScrollBar.Position := FPosition;
    end;
  end;
end;

end.

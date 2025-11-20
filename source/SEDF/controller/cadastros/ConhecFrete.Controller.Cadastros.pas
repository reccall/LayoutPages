unit ConhecFrete.Controller.Cadastros;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.Cadastros.Marcas
  ,ConhecFrete.Controller.Cadastros.Servicos
  ,ConhecFrete.Controller.Cadastros.Clientes
  ,ConhecFrete.Controller.Cadastros.Produtos
  ,ConhecFrete.Controller.Cadastros.Fornecedores
  ,ConhecFrete.Controller.Cadastros.Transportadoras
  ,ConhecFrete.Controller.Cadastros.UnidadesDeMedida;

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
    FFormCte :TForm;
    FFormCadastros :TForm;
    FCmpControlGrid :TForm;
    FCmpTituloPrincipal :TForm;
    FCmpTituloDescSimples :TForm;

    FTpOwnerCadastro :TpForms;

    FControllerCadastrosMarcas :IControllerCadastrosMarcas;
    FControllerCadastrosServicos :IControllerCadastrosServicos;
    FControllerCadastrosClientes :IControllerCadastrosClientes;
    FControllerCadastrosProdutos :IControllerCadastrosProdutos;
    FControllerCadastrosFornecedores :IControllerCadastrosFornecedores;
    FControllerCadastrosTranportadoras :IControllerCadastrosTransportadoras;
    FControllerCadastrosUnidadesDeMedida :IControllerCadastrosUnidadesDeMedida;

    procedure Iniciar;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure SetInterfaces;
    procedure SetArrayItens;
    procedure OnClickCheckBox(Sender :TObject);
    function GetFormOwner :TpForms;
    function SetFormOwner(pFormOwnerCadastro :TpForms) :IControllerCadastros;
  public

  class function New(pArrayFormsCte :array of TForm) :IControllerCadastros overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples;

{ TControllerCadastros }

constructor TControllerCadastros.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte            := pArrayFormsCte[Ord(tpOwner)];
  FFormCadastros      := pArrayFormsCte[Ord(tpCteCadastros)];
  FTpOwnerCadastro    := tpFDefault;
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];

  if not Assigned(aFormsCte[Ord(tpCmpControlGrid)]) then
  begin
    aFormsCte[Ord(tpCmpControlGrid)] := TCmpGridControl.Create(nil);
  end;
  FCmpControlGrid := aFormsCte[Ord(tpCmpControlGrid)];

  if not Assigned(aFormsCte[Ord(tpCmpTituloDescSimples)]) then
  begin
    aFormsCte[Ord(tpCmpTituloDescSimples)] := TCmpTituloDescSimples.Create(nil);
  end;
  FCmpTituloDescSimples := aFormsCte[Ord(tpCmpTituloDescSimples)];

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
  FCmpControlGrid.Close;
  FreeAndNil(FCmpControlGrid);
end;

function TControllerCadastros.GetFormOwner: TpForms;
begin
  Result := FTpOwnerCadastro;
end;

procedure TControllerCadastros.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  SetInterfaces;
  with TFormCteCadastros(FFormCadastros)  do
  begin
    FCmpControlGrid.Parent := pnlControlGrid;
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetArrayItens;
    TCmpGridControl(FCmpControlGrid).chkControl.Checked := False;
    TCmpGridControl(FCmpControlGrid).chkControl.OnClick := OnClickCheckBox;
    Show;
    FCmpControlGrid.Show;
  end;
  Screen.Cursor := crDefault;
end;

class function TControllerCadastros.New(pArrayFormsCte :array of TForm): IControllerCadastros;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastros.OnClickCheckBox(Sender: TObject);
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerCadastrosMarcas.OnClickCheckBox(Sender);
    tpCadastroProdutos:         FControllerCadastrosProdutos.OnClickCheckBox(Sender);
    tpCadastroServicos:         FControllerCadastrosServicos.OnClickCheckBox(Sender);
    tpCadastroClientes:         FControllerCadastrosClientes.OnClickCheckBox(Sender);
    tpCadastroFornecedores:     FControllerCadastrosFornecedores.OnClickCheckBox(Sender);
    tpCadastroTransportadoras:  FControllerCadastrosTranportadoras.OnClickCheckBox(Sender);
    tpCadastroUnidadesDeMedida: FControllerCadastrosUnidadesDeMedida.OnClickCheckBox(Sender);
  end;
end;

procedure TControllerCadastros.ResetComponentsItens;
begin
  if Assigned(FControllerCadastrosMarcas) then
    FControllerCadastrosMarcas.ResetComponentsItens;
  if Assigned(FControllerCadastrosProdutos) then
    FControllerCadastrosProdutos.ResetComponentsItens;
  if Assigned(FControllerCadastrosClientes) then
    FControllerCadastrosClientes.ResetComponentsItens;
  if Assigned(FControllerCadastrosServicos) then
    FControllerCadastrosServicos.ResetComponentsItens;
  if Assigned(FControllerCadastrosFornecedores) then
    FControllerCadastrosFornecedores.ResetComponentsItens;
  if Assigned(FControllerCadastrosTranportadoras) then
    FControllerCadastrosTranportadoras.ResetComponentsItens;
  if Assigned(FControllerCadastrosUnidadesDeMedida) then
    FControllerCadastrosUnidadesDeMedida.ResetComponentsItens;
end;

procedure TControllerCadastros.SetArrayItens;
begin
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerCadastrosMarcas.SetItensMarcas;
    tpCadastroProdutos:         FControllerCadastrosProdutos.SetItensProdutos;
    tpCadastroClientes:         FControllerCadastrosClientes.SetItensClientes;
    tpCadastroServicos:         FControllerCadastrosServicos.SetItensServicos;
    tpCadastroFornecedores:     FControllerCadastrosFornecedores.SetItensFornecedores;
    tpCadastroTransportadoras:  FControllerCadastrosTranportadoras.SetItensTransportadoras;
    tpCadastroUnidadesDeMedida: FControllerCadastrosUnidadesDeMedida.SetItensUnidadesDeMedida;
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
      if not Assigned(FControllerCadastrosMarcas) then
        FControllerCadastrosMarcas := TControllerCadastrosMarcas.New(aFormsCte);
    end;
    tpCadastroServicos:
    begin
      if not Assigned(FControllerCadastrosServicos) then
        FControllerCadastrosServicos := TControllerCadastrosServicos.New(aFormsCte);
    end;
    tpCadastroProdutos:
    begin
      if not Assigned(FControllerCadastrosProdutos) then
        FControllerCadastrosProdutos := TControllerCadastrosProdutos.New(aFormsCte);
    end;
    tpCadastroClientes:
    begin
      if not Assigned(FControllerCadastrosClientes) then
        FControllerCadastrosClientes := TControllerCadastrosClientes.New(aFormsCte);
    end;
    tpCadastroFornecedores:
    begin
      if not Assigned(FControllerCadastrosFornecedores) then
        FControllerCadastrosFornecedores := TControllerCadastrosFornecedores.New(aFormsCte);
    end;
    tpCadastroTransportadoras:
    begin
      if not Assigned(FControllerCadastrosTranportadoras) then
        FControllerCadastrosTranportadoras := TControllerCadastrosTransportadoras.New(aFormsCte);
    end;
    tpCadastroUnidadesDeMedida:
    begin
      if not Assigned(FControllerCadastrosUnidadesDeMedida) then
        FControllerCadastrosUnidadesDeMedida := TControllerCadastrosUnidadesDeMedida.New(aFormsCte);
    end;
  end;
end;

end.

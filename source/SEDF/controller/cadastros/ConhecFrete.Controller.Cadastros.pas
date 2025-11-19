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
  end;

  TControllerCadastros = class(TInterfacedObject, IControllerCadastros)
  private
    FFormCte :TForm;
    FFormCadastros :TForm;
    FTpOwnerCadastro :TpForms;
    FCmpTituloPrincipal :TForm;
    FCmpTitulo :TForm;
    FCmpControlGrid :TForm;

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
    procedure SetArrayItens;
    procedure OnClickCheckBox(Sender :TObject);
  public

  class function New(pFormOwnerCadastro :TpForms; pArrayFormsCte :array of TForm) :IControllerCadastros overload;
    constructor Create(pFormOwnerCadastro :TpForms; pArrayFormsCte :array of TForm); overload;
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

constructor TControllerCadastros.Create(pFormOwnerCadastro :TpForms; pArrayFormsCte :array of TForm);
begin
  FFormCte            := pArrayFormsCte[Ord(tpOwner)];
  FTpOwnerCadastro    := pFormOwnerCadastro;
  FFormCadastros      := pArrayFormsCte[Ord(tpCadastros)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FCmpTitulo          := TCmpTituloDescSimples.Create(nil);
  if not Assigned(aFormsCte[Ord(tpCmpControlGrid)]) then
  begin
    aFormsCte[Ord(tpCmpControlGrid)] := TCmpGridControl.Create(nil);
  end;
  FCmpControlGrid := aFormsCte[Ord(tpCmpControlGrid)];

  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerCadastrosMarcas           := TControllerCadastrosMarcas.New(aFormsCte);
    tpCadastroServicos:         FControllerCadastrosServicos         := TControllerCadastrosServicos.New(aFormsCte);
    tpCadastroProdutos:         FControllerCadastrosProdutos         := TControllerCadastrosProdutos.New(aFormsCte);
    tpCadastroClientes:         FControllerCadastrosClientes         := TControllerCadastrosClientes.New(aFormsCte);
    tpCadastroFornecedores:     FControllerCadastrosFornecedores     := TControllerCadastrosFornecedores.New(aFormsCte);
    tpCadastroTransportadoras:  FControllerCadastrosTranportadoras   := TControllerCadastrosTransportadoras.New(aFormsCte);
    tpCadastroUnidadesDeMedida: FControllerCadastrosUnidadesDeMedida := TControllerCadastrosUnidadesDeMedida.New(aFormsCte);
  end;
end;

destructor TControllerCadastros.Destroy;
begin
  with TFormCteCadastros(FTpOwnerCadastro) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastros.DestroyComponents;
begin
  ResetComponentsItens;
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
  FCmpControlGrid.Close;
  FreeAndNil(FCmpControlGrid);
end;

procedure TControllerCadastros.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCteCadastros(FTpOwnerCadastro) do
  begin
    FCmpControlGrid.Parent := pnlControlGrid;
    TCmpGridControl(FCmpControlGrid).chkControl.OnClick := OnClickCheckBox;
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTitulo.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetArrayItens;
    Show;
    FCmpTitulo.Show;
    FCmpControlGrid.Show;
  end;
  Screen.Cursor := crDefault;
end;

class function TControllerCadastros.New(pFormOwnerCadastro :TpForms; pArrayFormsCte :array of TForm): IControllerCadastros;
begin
  Result := Self.Create(pFormOwnerCadastro,pArrayFormsCte);
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
  case FTpOwnerCadastro of
    tpCadastroMarcas:           FControllerCadastrosMarcas.ResetComponentsItens;
    tpCadastroProdutos:         FControllerCadastrosProdutos.ResetComponentsItens;
    tpCadastroClientes:         FControllerCadastrosClientes.ResetComponentsItens;
    tpCadastroServicos:         FControllerCadastrosServicos.ResetComponentsItens;
    tpCadastroFornecedores:     FControllerCadastrosFornecedores.ResetComponentsItens;
    tpCadastroTransportadoras:  FControllerCadastrosTranportadoras.ResetComponentsItens;
    tpCadastroUnidadesDeMedida: FControllerCadastrosUnidadesDeMedida.ResetComponentsItens;
  end;
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

end.

unit ConhecFrete.Controller.Cadastros.Produtos;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosProdutos = interface
  ['{E1E4251F-26BC-4BE5-B9D3-47DEB4A0B66F}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosProdutos = class(TInterfacedObject, IControllerCadastrosProdutos)
  private
    FFormCte :TForm;
    FCmpTitulo :TForm;
    FFormCadProdutos :TForm;

    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosProdutos overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroProdutos
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal;

{ TControllerCadastrosProdutos }

constructor TControllerCadastrosProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadProdutos := pArrayFormsCte[Ord(tpCadastroProduto)];
end;

destructor TControllerCadastrosProdutos.Destroy;
begin
  with TFormCadastrosProdutos(FFormCadProdutos) do
  begin
    FreeAndNil(FController);
    Close;
  end;
end;

procedure TControllerCadastrosProdutos.DestroyComponents;
begin

end;

procedure TControllerCadastrosProdutos.Iniciar;
begin
  with TFormCadastrosProdutos(FFormCadProdutos) do
  begin
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    Show;
  end;
end;

class function TControllerCadastrosProdutos.New(pArrayFormsCte :array of TForm): IControllerCadastrosProdutos;
begin
  Result := Self.Create(pArrayFormsCte);
end;

end.

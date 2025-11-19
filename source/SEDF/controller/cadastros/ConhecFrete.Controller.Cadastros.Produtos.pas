unit ConhecFrete.Controller.Cadastros.Produtos;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosProdutos = interface
  ['{E1E4251F-26BC-4BE5-B9D3-47DEB4A0B66F}']
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
    procedure ResetComponentsItens;
    procedure DestroyComponents;
  end;

  TControllerCadastrosProdutos = class(TInterfacedObject, IControllerCadastrosProdutos)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadProdutos :TForm;
    FCmpTitulo :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadProd :array of TForm;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosProdutos overload;
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
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosProdutos }

constructor TControllerCadastrosProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadProdutos := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := TCmpBarraTituloCadastroProdutos.Create(nil);
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
end;

destructor TControllerCadastrosProdutos.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosProdutos.DestroyComponents;
begin
  ResetComponentsItens;
end;

class function TControllerCadastrosProdutos.New(pArrayFormsCte :array of TForm): IControllerCadastrosProdutos;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosProdutos.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    with TCmpBarraTituloCadastroProdutos(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroProdutos(aCmpItensCadProd[iIdx]) do
    begin
      if Assigned(aCmpItensCadProd[iIdx]) then
      begin
        chkItem.Checked := chkControl.Checked;
        case chkItem.Checked of
          True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
          False: OnMouseLeaveItem(pnlMainCad);
        end;
      end;
    end;
  end;
end;

procedure TControllerCadastrosProdutos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  FCmpTitulo.Close;
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    FreeAndNil(aCmpItensCadProd[iIdx]);
  end;
end;

procedure TControllerCadastrosProdutos.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadProdutos) do
  begin
    FCmpTitulo.Parent := pnlTopMainCad;
    SetLength(aCmpItensCadProd,20);
    for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
    begin
      if not Assigned(aCmpItensCadProd[iIdx]) then
      begin
        aCmpItensCadProd[iIdx] := TCmpBarraItemCadastroProdutos.Create(nil);
        aCmpItensCadProd[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadProd[iIdx].Show;
    end;
    FCmpTitulo.Show;
  end;
end;

end.

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
    procedure Iniciar;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
  end;

  TControllerCadastrosProdutos = class(TInterfacedObject, IControllerCadastrosProdutos)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadProdutos :TForm;
    FCmpTituloCadProd :TForm;
    
    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
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
   ConhecFrete.Forms.Cte.CadastroProdutos
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosProdutos }

constructor TControllerCadastrosProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadProdutos := pArrayFormsCte[Ord(tpCadastroProduto)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosProdutos.Destroy;
begin
  with TFormCadastrosProdutos(FFormCadProdutos) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosProdutos.DestroyComponents;
begin
  ResetComponentsItens;
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosProdutos.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosProdutos(FFormCadProdutos) do
  begin
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTituloCadProd.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetItensProdutos;
    Show;
    FCmpTituloCadProd.Show;
  end;
  Screen.Cursor := crDefault;
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
    with TCmpBarraTituloCadastroProdutos(FCmpTituloCadProd),
         TCmpBarraItemCadastroProdutos(aCmpItensCadProd[iIdx]) do
    begin
      //chkItem.Checked := chkTituloSelect.Checked;
      case chkItem.Checked of
        True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
        False: OnMouseLeaveItem(pnlMainCad);
      end;
    end;
  end;
end;

procedure TControllerCadastrosProdutos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    FreeAndNil(aCmpItensCadProd[iIdx]);
  end;
end;

procedure TControllerCadastrosProdutos.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosProdutos(FFormCadProdutos) do
  begin
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
  end;
end;

end.

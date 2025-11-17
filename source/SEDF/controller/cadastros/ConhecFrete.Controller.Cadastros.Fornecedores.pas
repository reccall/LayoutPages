unit ConhecFrete.Controller.Cadastros.Fornecedores;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosFornecedores = interface
  ['{9AAAEAD9-D607-439E-A431-409DA5605D4D}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosFornecedores = class(TInterfacedObject, IControllerCadastrosFornecedores)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadFornecedores :TForm;
    FCmpTituloCadProd :TForm;

    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosFornecedores overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroFornecedores
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosFornecedores }

constructor TControllerCadastrosFornecedores.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadFornecedores := pArrayFormsCte[Ord(tpCadastroFornecedores)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosFornecedores.Destroy;
begin
  with TFormCadastrosFornecedores(FFormCadFornecedores) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosFornecedores.DestroyComponents;
begin
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosFornecedores.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosFornecedores(FFormCadFornecedores) do
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

class function TControllerCadastrosFornecedores.New(pArrayFormsCte :array of TForm): IControllerCadastrosFornecedores;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosFornecedores.OnClickCheckBox(Sender: TObject);
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

procedure TControllerCadastrosFornecedores.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosFornecedores(FFormCadFornecedores) do
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

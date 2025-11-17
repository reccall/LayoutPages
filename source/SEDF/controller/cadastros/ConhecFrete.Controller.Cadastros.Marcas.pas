unit ConhecFrete.Controller.Cadastros.Marcas;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosMarcas = interface
  ['{00A26260-D4A1-46F5-8967-453D25542D5E}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosMarcas = class(TInterfacedObject, IControllerCadastrosMarcas)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadMarcas :TForm;
    FCmpTituloCadProd :TForm;

    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosMarcas overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroMarcas
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosMarcas }

constructor TControllerCadastrosMarcas.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadMarcas := pArrayFormsCte[Ord(tpCadastroMarcas)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosMarcas.Destroy;
begin
  with TFormCadastrosMarcas(FFormCadMarcas) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosMarcas.DestroyComponents;
begin
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosMarcas.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosMarcas(FFormCadMarcas) do
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

class function TControllerCadastrosMarcas.New(pArrayFormsCte :array of TForm): IControllerCadastrosMarcas;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosMarcas.OnClickCheckBox(Sender: TObject);
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

procedure TControllerCadastrosMarcas.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosMarcas(FFormCadMarcas) do
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

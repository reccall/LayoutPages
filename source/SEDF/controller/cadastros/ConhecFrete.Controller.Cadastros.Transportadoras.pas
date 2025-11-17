unit ConhecFrete.Controller.Cadastros.Transportadoras;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosTransportadoras = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosTransportadoras = class(TInterfacedObject, IControllerCadastrosTransportadoras)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadTransportadoras :TForm;
    FCmpTituloCadProd :TForm;

    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosTransportadoras overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroTransportadoras
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosTransportadoras }

constructor TControllerCadastrosTransportadoras.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadTransportadoras := pArrayFormsCte[Ord(tpCadastroTransportadoras)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosTransportadoras.Destroy;
begin
  with TFormCadastrosTransportadoras(FFormCadTransportadoras) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosTransportadoras.DestroyComponents;
begin
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosTransportadoras.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosTransportadoras(FFormCadTransportadoras) do
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

class function TControllerCadastrosTransportadoras.New(pArrayFormsCte :array of TForm): IControllerCadastrosTransportadoras;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosTransportadoras.OnClickCheckBox(Sender: TObject);
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

procedure TControllerCadastrosTransportadoras.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosTransportadoras(FFormCadTransportadoras) do
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

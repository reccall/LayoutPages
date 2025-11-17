unit ConhecFrete.Controller.Cadastros.Servicos;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosServicos = interface
  ['{1924679B-498C-4482-AB31-D628C4D6743C}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosServicos = class(TInterfacedObject, IControllerCadastrosServicos)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadServicos :TForm;
    FCmpTituloCadProd :TForm;

    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosServicos overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroServicos
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosServicos }

constructor TControllerCadastrosServicos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadServicos := pArrayFormsCte[Ord(tpCadastroServicos)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosServicos.Destroy;
begin
  with TFormCadastrosServicos(FFormCadServicos) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosServicos.DestroyComponents;
begin
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosServicos.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosServicos(FFormCadServicos) do
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

class function TControllerCadastrosServicos.New(pArrayFormsCte :array of TForm): IControllerCadastrosServicos;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosServicos.OnClickCheckBox(Sender: TObject);
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

procedure TControllerCadastrosServicos.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosServicos(FFormCadServicos) do
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

unit ConhecFrete.Controller.Cadastros.Clientes;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosClientes = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosClientes = class(TInterfacedObject, IControllerCadastrosClientes)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadClientes :TForm;
    FCmpTituloCadProd :TForm;

    aCmpItensCadProd :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosClientes overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroClientes
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

{ TControllerCadastrosClientes }

constructor TControllerCadastrosClientes.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadClientes := pArrayFormsCte[Ord(tpCadastroClientes)];
  FCmpTituloCadProd := TCmpBarraTituloCadastroProdutos.Create(nil);
end;

destructor TControllerCadastrosClientes.Destroy;
begin
  with TFormCadastrosClientes(FFormCadClientes) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosClientes.DestroyComponents;
begin
  FCmpTituloCadProd.Close;
  FreeAndNil(FCmpTituloCadProd);
end;

procedure TControllerCadastrosClientes.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosClientes(FFormCadClientes) do
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

class function TControllerCadastrosClientes.New(pArrayFormsCte :array of TForm): IControllerCadastrosClientes;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosClientes.OnClickCheckBox(Sender: TObject);
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

procedure TControllerCadastrosClientes.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosClientes(FFormCadClientes) do
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

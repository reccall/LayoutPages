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
    FCmpTitulo :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadTransportadoras :TForm;

    aCmpItensCadTransportadoras :array of TForm;
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
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroTransportadoras;

{ TControllerCadastrosTransportadoras }

constructor TControllerCadastrosTransportadoras.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadTransportadoras := pArrayFormsCte[Ord(tpCadastroTransportadoras)];
  FCmpTitulo := TCmpTituloDescSimples.Create(nil);
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
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosTransportadoras.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosTransportadoras(FFormCadTransportadoras) do
  begin
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTitulo.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetItensProdutos;
    Show;
    FCmpTitulo.Show;
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
  for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpBarraItemTransportadoras(aCmpItensCadTransportadoras[iIdx]) do
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
    SetLength(aCmpItensCadTransportadoras,20);
    for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
    begin
      if not Assigned(aCmpItensCadTransportadoras[iIdx]) then
      begin
        aCmpItensCadTransportadoras[iIdx] := TCmpBarraItemTransportadoras.Create(nil);
        TCmpBarraItemTransportadoras(aCmpItensCadTransportadoras[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadTransportadoras[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadTransportadoras[iIdx].Show;
    end;
  end;
end;

end.

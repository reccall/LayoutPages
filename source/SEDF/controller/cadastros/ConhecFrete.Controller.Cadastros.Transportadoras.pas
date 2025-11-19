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
    procedure SetItensTransportadoras;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
    procedure DestroyComponents;
  end;

  TControllerCadastrosTransportadoras = class(TInterfacedObject, IControllerCadastrosTransportadoras)
  private
    FFormCte :TForm;
    FCmpTitulo :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadTransportadoras :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadTransportadoras :array of TForm;
    procedure DestroyComponents;
    procedure SetItensTransportadoras;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosTransportadoras overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroTransportadoras;

{ TControllerCadastrosTransportadoras }

constructor TControllerCadastrosTransportadoras.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadTransportadoras := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
end;

destructor TControllerCadastrosTransportadoras.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosTransportadoras.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
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
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroTransportadoras(aCmpItensCadTransportadoras[iIdx]) do
    begin
      if Assigned(aCmpItensCadTransportadoras[iIdx]) then
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

procedure TControllerCadastrosTransportadoras.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
  begin
    FreeAndNil(aCmpItensCadTransportadoras[iIdx]);
  end;
end;

procedure TControllerCadastrosTransportadoras.SetItensTransportadoras;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadTransportadoras) do
  begin
    FCmpTitulo.Parent := pnlTopMainCad;
    SetLength(aCmpItensCadTransportadoras,20);
    for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
    begin
      if not Assigned(aCmpItensCadTransportadoras[iIdx]) then
      begin
        aCmpItensCadTransportadoras[iIdx] := TCmpBarraItemCadastroTransportadoras.Create(nil);
        TCmpBarraItemCadastroTransportadoras(aCmpItensCadTransportadoras[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadTransportadoras[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadTransportadoras[iIdx].Show;
    end;
    FCmpTitulo.Show;
  end;
end;

end.

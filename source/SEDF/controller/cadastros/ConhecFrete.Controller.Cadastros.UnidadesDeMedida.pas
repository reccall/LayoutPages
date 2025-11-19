unit ConhecFrete.Controller.Cadastros.UnidadesDeMedida;

interface

uses
   Forms
  ,Graphics
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosUnidadesDeMedida = interface
  ['{A644751A-BEE8-41E3-8EB9-CE17234B8D85}']
    procedure SetItensUnidadesDeMedida;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
    procedure DestroyComponents;
  end;

  TControllerCadastrosUnidadesDeMedida = class(TInterfacedObject, IControllerCadastrosUnidadesDeMedida)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadUnidadesDeMedida :TForm;
    FCmpTitulo :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadUnidadesDeMedida :array of TForm;
    procedure DestroyComponents;
    procedure SetItensUnidadesDeMedida;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosUnidadesDeMedida overload;
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
  ,ConhecFrete.View.Componentes.BarraItemCadastroUnidadesDeMedida;

{ TControllerCadastrosUnidadesDeMedida }

constructor TControllerCadastrosUnidadesDeMedida.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadUnidadesDeMedida := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
end;

destructor TControllerCadastrosUnidadesDeMedida.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosUnidadesDeMedida.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

class function TControllerCadastrosUnidadesDeMedida.New(pArrayFormsCte :array of TForm): IControllerCadastrosUnidadesDeMedida;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCadastrosUnidadesDeMedida.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]) do
    begin
      if Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
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

procedure TControllerCadastrosUnidadesDeMedida.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
  begin
    FreeAndNil(aCmpItensCadUnidadesDeMedida[iIdx]);
  end;
end;

procedure TControllerCadastrosUnidadesDeMedida.SetItensUnidadesDeMedida;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadUnidadesDeMedida) do
  begin
    FCmpTitulo.Parent := pnlTopMainCad;
    SetLength(aCmpItensCadUnidadesDeMedida,20);
    for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
    begin
      if not Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
      begin
        aCmpItensCadUnidadesDeMedida[iIdx] := TCmpBarraItemCadastroUnidadesDeMedida.Create(nil);
        TCmpBarraItemCadastroUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadUnidadesDeMedida[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadUnidadesDeMedida[iIdx].Show;
    end;
    FCmpTitulo.Show;
  end;
end;

end.

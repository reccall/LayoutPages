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
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerCadastrosUnidadesDeMedida = class(TInterfacedObject, IControllerCadastrosUnidadesDeMedida)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadUnidadesDeMedida :TForm;
    FCmpTitulo :TForm;

    aCmpItensCadUnidadesDeMedida :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensProdutos;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosUnidadesDeMedida overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.CadastroUnidadesDeMedida
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroUnidadesDeMedida;

{ TControllerCadastrosUnidadesDeMedida }

constructor TControllerCadastrosUnidadesDeMedida.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadUnidadesDeMedida := pArrayFormsCte[Ord(tpCadastroUnidadesDeMedida)];
  FCmpTitulo := TCmpTituloDescSimples.Create(nil);
end;

destructor TControllerCadastrosUnidadesDeMedida.Destroy;
begin
  with TFormCadastrosUnidadesDeMedida(FFormCadUnidadesDeMedida) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerCadastrosUnidadesDeMedida.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosUnidadesDeMedida.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosUnidadesDeMedida(FFormCadUnidadesDeMedida) do
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
         TCmpBarraItemUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]) do
    begin
      //chkItem.Checked := chkTituloSelect.Checked;
      case chkItem.Checked of
        True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
        False: OnMouseLeaveItem(pnlMainCad);
      end;
    end;
  end;
end;

procedure TControllerCadastrosUnidadesDeMedida.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCadastrosUnidadesDeMedida(FFormCadUnidadesDeMedida) do
  begin
    SetLength(aCmpItensCadUnidadesDeMedida,20);
    for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
    begin
      if not Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
      begin
        aCmpItensCadUnidadesDeMedida[iIdx] := TCmpBarraItemUnidadesDeMedida.Create(nil);
        TCmpBarraItemUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadUnidadesDeMedida[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadUnidadesDeMedida[iIdx].Show;
    end;
  end;
end;

end.

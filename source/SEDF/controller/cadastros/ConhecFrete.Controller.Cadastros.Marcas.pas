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
    procedure SetItensMarcas;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
  end;

  TControllerCadastrosMarcas = class(TInterfacedObject, IControllerCadastrosMarcas)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadMarcas :TForm;
    FCmpTitulo :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadMarcas :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensMarcas;
    procedure ResetComponentsItens;
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
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroMarcas;

{ TControllerCadastrosMarcas }

constructor TControllerCadastrosMarcas.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadMarcas := pArrayFormsCte[Ord(tpCadastroMarcas)];
  FCmpTitulo := TCmpTituloDescSimples.Create(nil);
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
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosMarcas.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosMarcas(FFormCadMarcas) do
  begin
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTitulo.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetItensMarcas;
    Show;
    FCmpTitulo.Show;
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
  for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroMarcas(aCmpItensCadMarcas[iIdx]) do
    begin
      chkItem.Checked := chkControl.Checked;
      case chkItem.Checked of
        True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
        False: OnMouseLeaveItem(pnlMainCad);
      end;
    end;
  end;
end;

procedure TControllerCadastrosMarcas.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
  begin
    FreeAndNil(aCmpItensCadMarcas[iIdx]);
  end;
end;

procedure TControllerCadastrosMarcas.SetItensMarcas;
var
  iIdx :Integer;
begin
  with TFormCadastrosMarcas(FFormCadMarcas) do
  begin
    SetLength(aCmpItensCadMarcas,20);
    for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
    begin
      if not Assigned(aCmpItensCadMarcas[iIdx]) then
      begin
        aCmpItensCadMarcas[iIdx] := TCmpBarraItemCadastroMarcas.Create(nil);
        TCmpBarraItemCadastroMarcas(aCmpItensCadMarcas[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadMarcas[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadMarcas[iIdx].Show;
    end;
  end;
end;

end.

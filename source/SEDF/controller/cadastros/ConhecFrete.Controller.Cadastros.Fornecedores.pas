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
    procedure SetItensFornecedores;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
    procedure DestroyComponents;
  end;

  TControllerCadastrosFornecedores = class(TInterfacedObject, IControllerCadastrosFornecedores)
  private
    FFormCte :TForm;
    FCmpTitulo :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadFornecedores :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadFornecedores :array of TForm;
    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetItensFornecedores;
    procedure ResetComponentsItens;
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
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroFornecedores;

{ TControllerCadastrosFornecedores }

constructor TControllerCadastrosFornecedores.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadFornecedores := pArrayFormsCte[Ord(tpCadastroFornecedores)];
  FCmpTitulo := TCmpTituloDescSimples.Create(nil);
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
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
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosFornecedores.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosFornecedores(FFormCadFornecedores) do
  begin
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTitulo.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetItensFornecedores;
    Show;
    FCmpTitulo.Show;
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
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]) do
    begin
      chkItem.Checked := chkControl.Checked;
      case chkItem.Checked of
        True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
        False: OnMouseLeaveItem(pnlMainCad);
      end;
    end;
  end;
end;

procedure TControllerCadastrosFornecedores.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    FreeAndNil(aCmpItensCadFornecedores[iIdx]);
  end;
end;

procedure TControllerCadastrosFornecedores.SetItensFornecedores;
var
  iIdx :Integer;
begin
  with TFormCadastrosFornecedores(FFormCadFornecedores) do
  begin
    SetLength(aCmpItensCadFornecedores,20);
    for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
    begin
      if not Assigned(aCmpItensCadFornecedores[iIdx]) then
      begin
        aCmpItensCadFornecedores[iIdx] := TCmpBarraItemCadastroFornecedores.Create(nil);
        TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadFornecedores[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadFornecedores[iIdx].Show;
    end;
  end;
end;

end.

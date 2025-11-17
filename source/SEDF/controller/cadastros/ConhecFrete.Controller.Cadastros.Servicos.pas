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
    procedure ResetComponentsItens;
    procedure DestroyComponents;
  end;

  TControllerCadastrosServicos = class(TInterfacedObject, IControllerCadastrosServicos)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadServicos :TForm;
    FCmpTitulo :TForm;

    procedure Iniciar;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure SetItensServicos;
    procedure OnClickCheckBox(Sender :TObject);
  public
    aCmpItensCadServ :array of TForm;
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
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroServicos;

{ TControllerCadastrosServicos }

constructor TControllerCadastrosServicos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadServicos := pArrayFormsCte[Ord(tpCadastroServicos)];
  FCmpTitulo := TCmpTituloDescSimples.Create(nil);
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
  ResetComponentsItens;
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosServicos.Iniciar;
begin
  Screen.Cursor := crHourGlass;
  with TFormCadastrosServicos(FFormCadServicos) do
  begin
    MakeRounded(pnlConsulta,20);
    MakeRounded(pnlRegiaoPesq,20);
    MakeRounded(pnlTopMainCad,10);
    FCmpTitulo.Parent := pnlTopMainCad;
    Parent := TfrmCtePrincipal(FFormCte).pnlMain;
    SetItensServicos;
    Show;
    FCmpTitulo.Show;
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
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpBarraItemServicos(aCmpItensCadServ[iIdx]) do
    begin
      //chkItem.Checked := chkTituloSelect.Checked;
      case chkItem.Checked of
        True:  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
        False: OnMouseLeaveItem(pnlMainCad);
      end;
    end;
  end;
end;

procedure TControllerCadastrosServicos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    FreeAndNil(aCmpItensCadServ[iIdx]);
  end;
end;

procedure TControllerCadastrosServicos.SetItensServicos;
var
  iIdx :Integer;
begin
  with TFormCadastrosServicos(FFormCadServicos) do
  begin
    SetLength(aCmpItensCadServ,20);
    for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
    begin
      if not Assigned(aCmpItensCadServ[iIdx]) then
      begin
        aCmpItensCadServ[iIdx] := TCmpBarraItemServicos.Create(nil);
        TCmpBarraItemServicos(aCmpItensCadServ[iIdx]).lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        aCmpItensCadServ[iIdx].Parent := scrlbxMain;
      end;
      aCmpItensCadServ[iIdx].Show;
    end;
  end;
end;

end.

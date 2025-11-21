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
    procedure SetItensServicos;
    procedure OnClickCheckBox(Sender :TObject);
    procedure ResetComponentsItens;
    procedure DestroyComponents;
  end;

  TControllerCadastrosServicos = class(TInterfacedObject, IControllerCadastrosServicos)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadServicos :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpControlGrid :TForm;

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
   ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroServicos;

{ TControllerCadastrosServicos }

constructor TControllerCadastrosServicos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadServicos := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
end;

destructor TControllerCadastrosServicos.Destroy;
begin
  with TFormCteCadastros(FFormCadServicos) do
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
  FCmpControlGrid.Close;
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
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroServicos(aCmpItensCadServ[iIdx]) do
    begin
      if Assigned(aCmpItensCadServ[iIdx]) then
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

procedure TControllerCadastrosServicos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  FCmpTitulo.Close;
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    FreeAndNil(aCmpItensCadServ[iIdx]);
  end;
  aCmpItensCadServ := nil;
end;

procedure TControllerCadastrosServicos.SetItensServicos;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadServicos), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadServ,20);
    for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
    begin
      if not Assigned(aCmpItensCadServ[iIdx]) then
      begin
        aCmpItensCadServ[iIdx] := TCmpBarraItemCadastroServicos.Create(nil);
        with TCmpBarraItemCadastroServicos(aCmpItensCadServ[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'SV - '+FormatFloat('000000',High(aCmpItensCadServ) - iIdx);
        end;
        aCmpItensCadServ[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadServ[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

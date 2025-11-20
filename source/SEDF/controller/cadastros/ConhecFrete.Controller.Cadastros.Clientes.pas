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
    procedure SetItensClientes;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
    procedure DestroyComponents;
  end;

  TControllerCadastrosClientes = class(TInterfacedObject, IControllerCadastrosClientes)
  private
    FFormCte :TForm;
    FCmpTituloPrincipal :TForm;
    FFormCadClientes :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpControlGrid :TForm;

    aCmpItensCadClientes :array of TForm;
    procedure DestroyComponents;
    procedure SetItensClientes;
    procedure ResetComponentsItens;
    procedure OnClickCheckBox(Sender :TObject);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosClientes overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroClientes;

{ TControllerCadastrosClientes }

constructor TControllerCadastrosClientes.Create(pArrayFormsCte :array of TForm);
begin
  FFormCte   := pArrayFormsCte[Ord(tpOwner)];
  FCmpTituloPrincipal := pArrayFormsCte[Ord(tpCmpTitulo)];
  FFormCadClientes := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
end;

destructor TControllerCadastrosClientes.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosClientes.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
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
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    with TCmpTituloDescSimples(aCmpItensCadClientes),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroClientes(aCmpItensCadClientes[iIdx]) do
    begin
      if Assigned(aCmpItensCadClientes[iIdx]) then
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

procedure TControllerCadastrosClientes.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    FreeAndNil(aCmpItensCadClientes[iIdx]);
  end;
end;

procedure TControllerCadastrosClientes.SetItensClientes;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadClientes), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadClientes,20);
    for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
    begin
      if not Assigned(aCmpItensCadClientes[iIdx]) then
      begin
        aCmpItensCadClientes[iIdx] := TCmpBarraItemCadastroClientes.Create(nil);
        with TCmpBarraItemCadastroClientes(aCmpItensCadClientes[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'CL - '+FormatFloat('000000',High(aCmpItensCadClientes) - iIdx);
        end;
        aCmpItensCadClientes[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadClientes[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

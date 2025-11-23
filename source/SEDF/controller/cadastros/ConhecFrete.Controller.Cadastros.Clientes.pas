unit ConhecFrete.Controller.Cadastros.Clientes;

interface

uses
   Forms
  ,Graphics
  ,Dialogs
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,ConhecFrete.Controller.Consultas
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCadastrosClientes = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure SetItensClientes;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerCadastrosClientes = class(TInterfacedObject, IControllerCadastrosClientes)
  private
    FFormCadClientes :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadClientes :array of TForm;
    procedure DestroyComponents;
    procedure SetItensClientes;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
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
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroClientes;

{ TControllerCadastrosClientes }

constructor TControllerCadastrosClientes.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadClientes := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
    with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
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

procedure TControllerCadastrosClientes.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerCadastrosClientes.OnClickInserirRegistro(Sender :TObject);
begin

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

procedure TControllerCadastrosClientes.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Clientes');
end;

procedure TControllerCadastrosClientes.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    FreeAndNil(aCmpItensCadClientes[iIdx]);
  end;
  aCmpItensCadClientes := nil;
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

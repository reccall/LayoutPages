unit ConhecFrete.Controller.Clientes;

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
  IControllerClientes = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensClientes;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerClientes = class(TInterfacedObject, IControllerClientes)
  private
    FFormCadClientes :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadClientes :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensClientes;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerClientes overload;
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

{ TControllerClientes }

constructor TControllerClientes.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadClientes := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerClientes.Destroy;
begin
  inherited;
end;

procedure TControllerClientes.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerClientes.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerClientes.OnClickInserirRegistro(Sender :TObject);
begin

end;

class function TControllerClientes.New(pArrayFormsCte :array of TForm): IControllerClientes;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerClientes.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
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

procedure TControllerClientes.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Clientes');
end;

procedure TControllerClientes.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    FreeAndNil(aCmpItensCadClientes[iIdx]);
  end;
  aCmpItensCadClientes := nil;
end;

procedure TControllerClientes.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerClientes.SetEvents;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerClientes.SetItensClientes;
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

unit ConhecFrete.Controller.Cadastros.Marcas;

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
  IControllerCadastrosMarcas = interface
  ['{00A26260-D4A1-46F5-8967-453D25542D5E}']
    procedure DestroyComponents;
    procedure SetItensMarcas;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerCadastrosMarcas = class(TInterfacedObject, IControllerCadastrosMarcas)
  private
    FFormCadMarcas :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadMarcas :array of TForm;
    procedure DestroyComponents;
    procedure SetItensMarcas;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosMarcas overload;
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
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroMarcas;

{ TControllerCadastrosMarcas }

constructor TControllerCadastrosMarcas.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadMarcas := pArrayFormsCte[Ord(tpCteCadastros)];
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

destructor TControllerCadastrosMarcas.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosMarcas.DestroyComponents;
begin
  FCmpTitulo.Close;
end;

procedure TControllerCadastrosMarcas.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerCadastrosMarcas.OnClickInserirRegistro(Sender :TObject);
begin

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
      if Assigned(aCmpItensCadMarcas[iIdx]) then
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

procedure TControllerCadastrosMarcas.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Marcas');
end;

procedure TControllerCadastrosMarcas.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
  begin
    FreeAndNil(aCmpItensCadMarcas[iIdx]);
  end;
  aCmpItensCadMarcas := nil;
end;

procedure TControllerCadastrosMarcas.SetItensMarcas;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadMarcas), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadMarcas,20);
    for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
    begin
      if not Assigned(aCmpItensCadMarcas[iIdx]) then
      begin
        aCmpItensCadMarcas[iIdx] := TCmpBarraItemCadastroMarcas.Create(nil);
        with TCmpBarraItemCadastroMarcas(aCmpItensCadMarcas[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'MR - '+FormatFloat('000000',High(aCmpItensCadMarcas) - iIdx);
        end;
        aCmpItensCadMarcas[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadMarcas[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

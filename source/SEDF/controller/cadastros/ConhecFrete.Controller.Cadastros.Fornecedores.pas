unit ConhecFrete.Controller.Cadastros.Fornecedores;

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
  IControllerCadastrosFornecedores = interface
  ['{9AAAEAD9-D607-439E-A431-409DA5605D4D}']
    procedure SetItensFornecedores;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerCadastrosFornecedores = class(TInterfacedObject, IControllerCadastrosFornecedores)
  private
    FCmpTitulo :TForm;
    FFormCadFornecedores :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadFornecedores :array of TForm;
    procedure DestroyComponents;
    procedure SetItensFornecedores;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerCadastrosFornecedores overload;
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
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroFornecedores;

{ TControllerCadastrosFornecedores }

constructor TControllerCadastrosFornecedores.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadFornecedores := pArrayFormsCte[Ord(tpCteCadastros)];
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

destructor TControllerCadastrosFornecedores.Destroy;
begin
  inherited;
end;

procedure TControllerCadastrosFornecedores.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerCadastrosFornecedores.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerCadastrosFornecedores.OnClickInserirRegistro(Sender :TObject);
begin

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
      if Assigned(aCmpItensCadFornecedores[iIdx]) then
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

procedure TControllerCadastrosFornecedores.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Fornecedores');
end;

procedure TControllerCadastrosFornecedores.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    FreeAndNil(aCmpItensCadFornecedores[iIdx]);
  end;
  aCmpItensCadFornecedores := nil;
end;

procedure TControllerCadastrosFornecedores.SetItensFornecedores;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadFornecedores), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadFornecedores,20);
    for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
    begin
      if not Assigned(aCmpItensCadFornecedores[iIdx]) then
      begin
        aCmpItensCadFornecedores[iIdx] := TCmpBarraItemCadastroFornecedores.Create(nil);
        with TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'FN - '+FormatFloat('000000',High(aCmpItensCadFornecedores) - iIdx);
        end;
        aCmpItensCadFornecedores[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadFornecedores[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

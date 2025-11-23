unit ConhecFrete.Controller.UnidadesDeMedida;

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
  IControllerUnidadesDeMedida = interface
  ['{A644751A-BEE8-41E3-8EB9-CE17234B8D85}']
    procedure SetItensUnidadesDeMedida;
    procedure ResetComponentsItens;
    procedure DestroyComponents;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerUnidadesDeMedida = class(TInterfacedObject, IControllerUnidadesDeMedida)
  private
    FFormCadUnidadesDeMedida :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadUnidadesDeMedida :array of TForm;
    procedure DestroyComponents;
    procedure SetItensUnidadesDeMedida;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerUnidadesDeMedida overload;
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
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroUnidadesDeMedida;

{ TControllerUnidadesDeMedida }

constructor TControllerUnidadesDeMedida.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadUnidadesDeMedida := pArrayFormsCte[Ord(tpCteCadastros)];
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

destructor TControllerUnidadesDeMedida.Destroy;
begin
  inherited;
end;

procedure TControllerUnidadesDeMedida.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerUnidadesDeMedida.edtPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerUnidadesDeMedida.OnClickInserirRegistro(Sender :TObject);
begin

end;

class function TControllerUnidadesDeMedida.New(pArrayFormsCte :array of TForm): IControllerUnidadesDeMedida;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerUnidadesDeMedida.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]) do
    begin
      if Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
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

procedure TControllerUnidadesDeMedida.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Unidade de Medida');
end;

procedure TControllerUnidadesDeMedida.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
  begin
    FreeAndNil(aCmpItensCadUnidadesDeMedida[iIdx]);
  end;
  aCmpItensCadUnidadesDeMedida := nil;
end;

procedure TControllerUnidadesDeMedida.SetItensUnidadesDeMedida;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadUnidadesDeMedida), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadUnidadesDeMedida,20);
    for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
    begin
      if not Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
      begin
        aCmpItensCadUnidadesDeMedida[iIdx] := TCmpBarraItemCadastroUnidadesDeMedida.Create(nil);
        with TCmpBarraItemCadastroUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'UN - '+FormatFloat('000000',High(aCmpItensCadUnidadesDeMedida) - iIdx);
        end;
        aCmpItensCadUnidadesDeMedida[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadUnidadesDeMedida[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

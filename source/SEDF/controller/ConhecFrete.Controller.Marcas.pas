unit ConhecFrete.Controller.Marcas;

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
  IControllerMarcas = interface
  ['{00A26260-D4A1-46F5-8967-453D25542D5E}']
    procedure SetEvents;
    procedure SetItensMarcas;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerMarcas = class(TInterfacedObject, IControllerMarcas)
  private
    FFormCadMarcas :TForm;
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadMarcas :array of TForm;
    procedure SetEvents;
    procedure SetItensMarcas;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerMarcas overload;
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

{ TControllerMarcas }

constructor TControllerMarcas.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadMarcas := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerMarcas.Destroy;
begin
  inherited;
end;

procedure TControllerMarcas.DestroyComponents;
begin
  FCmpTitulo.Close;
end;

procedure TControllerMarcas.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerMarcas.OnClickInserirRegistro(Sender :TObject);
begin

end;

class function TControllerMarcas.New(pArrayFormsCte :array of TForm): IControllerMarcas;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerMarcas.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
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

procedure TControllerMarcas.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  FCmpFormGrid.Close;
  ShowMessage('Up Marcas');
end;

procedure TControllerMarcas.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
  begin
    FreeAndNil(aCmpItensCadMarcas[iIdx]);
  end;
  aCmpItensCadMarcas := nil;
end;

procedure TControllerMarcas.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerMarcas.SetEvents;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerMarcas.SetItensMarcas;
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

unit ConhecFrete.Controller.Transportadoras;

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
  IControllerTransportadoras = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure SetItensTransportadoras;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerTransportadoras = class(TInterfacedObject, IControllerTransportadoras)
  private
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormCadTransportadoras :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadTransportadoras :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure SetItensTransportadoras;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerTransportadoras overload;
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
  ,ConhecFrete.View.Componentes.BarraItemCadastroTransportadoras;

{ TControllerTransportadoras }

constructor TControllerTransportadoras.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadTransportadoras := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerTransportadoras.Destroy;
begin
  inherited;
end;

procedure TControllerTransportadoras.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerTransportadoras.edtPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerTransportadoras.OnClickInserirRegistro(Sender :TObject);
begin

end;

class function TControllerTransportadoras.New(pArrayFormsCte :array of TForm): IControllerTransportadoras;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerTransportadoras.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
  for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroTransportadoras(aCmpItensCadTransportadoras[iIdx]) do
    begin
      if Assigned(aCmpItensCadTransportadoras[iIdx]) then
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

procedure TControllerTransportadoras.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  ShowMessage('Up Transportadoras');
end;

procedure TControllerTransportadoras.ResetComponentsItens;
var
  iIdx :Integer;
begin
  for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
  begin
    FreeAndNil(aCmpItensCadTransportadoras[iIdx]);
  end;
  aCmpItensCadTransportadoras := nil;
end;

procedure TControllerTransportadoras.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerTransportadoras.SetEvents;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerTransportadoras.SetItensTransportadoras;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadTransportadoras), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
    SetLength(aCmpItensCadTransportadoras,20);
    for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
    begin
      if not Assigned(aCmpItensCadTransportadoras[iIdx]) then
      begin
        aCmpItensCadTransportadoras[iIdx] := TCmpBarraItemCadastroTransportadoras.Create(nil);
        with TCmpBarraItemCadastroTransportadoras(aCmpItensCadTransportadoras[iIdx]) do
        begin
          lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
          lblCodigo.Caption := 'TR - '+FormatFloat('000000',High(aCmpItensCadTransportadoras) - iIdx);
        end;
        aCmpItensCadTransportadoras[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadTransportadoras[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

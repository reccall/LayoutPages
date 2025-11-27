unit ConhecFrete.Controller.Transportadoras;

interface

uses
   Forms
  ,Graphics
  ,Dialogs
  ,System.Classes
  ,System.SysUtils
  ,Vcl.Controls
  ,Vcl.ExtCtrls
  ,ConhecFrete.Controller.FormGrid
  ,ConhecFrete.Controller.Consultas
  ,ConhecFrete.Controller.PesquisaNaoEncontrada
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
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormLoadingCSS :TForm;
    FFormCadTransportadoras :TForm;

    FTimer :TTimer;

    FControllerFormGrid :IControllerFormGrid;
    FControllerConsultas :IControllerConsultas;
    FControllerPesquisaNaoEncontrada :IControllerPesquisaNaoEncontrada;

    aCmpItensCadTransportadoras :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure SetItensTransportadoras;
    procedure AbrirFormCarregando;
    procedure SetFindResults;

    procedure OnTimerLoading(Sender :TObject);
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
    function FindRegister :Boolean;
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerTransportadoras overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroTransportadoras;

{ TControllerTransportadoras }

procedure TControllerTransportadoras.AbrirFormCarregando;
begin
  FTimer.Enabled := True;
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FFormCadTransportadoras) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

constructor TControllerTransportadoras.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadTransportadoras := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerFormGrid := TControllerFormGrid.New(pArrayFormsCte);
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  FControllerPesquisaNaoEncontrada := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerTransportadoras.Destroy;
begin
  inherited;
  FControllerFormGrid := nil;
  FControllerConsultas := nil;
  FControllerPesquisaNaoEncontrada := nil;
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

function TControllerTransportadoras.FindRegister: Boolean;
begin
   Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    ResetComponentsItens;
    AbrirFormCarregando;
  end;
end;

procedure TControllerTransportadoras.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerTransportadoras.OnTimerLoading(Sender: TObject);
begin
  SetFindResults;
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
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerPesquisaNaoEncontrada.Iniciar;
  Screen.Cursor := crDefault;
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
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 1800;
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerTransportadoras.SetFindResults;
var
  iIdx :Integer;
begin
  FTimer.Interval := 1000;
  FTimer.Enabled := False;
  SetLength(aCmpItensCadTransportadoras,15);
  for iIdx := Low(aCmpItensCadTransportadoras) to High(aCmpItensCadTransportadoras) do
  begin
    if not Assigned(aCmpItensCadTransportadoras[iIdx]) then
    begin
      aCmpItensCadTransportadoras[iIdx] := TCmpBarraItemCadastroTransportadoras.Create(nil);
      with TCmpBarraItemCadastroTransportadoras(aCmpItensCadTransportadoras[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
        lblCodigo.Caption := 'TR - '+FormatFloat('000000',High(aCmpItensCadTransportadoras) - iIdx);
      end;
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadTransportadoras);
  FCmpControlGrid.Show;
end;

procedure TControllerTransportadoras.SetItensTransportadoras;
var
  iIdx :Integer;
begin
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
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadTransportadoras);
end;

end.

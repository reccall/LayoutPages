unit ConhecFrete.Controller.UnidadesDeMedida;

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
  IControllerUnidadesDeMedida = interface
  ['{A644751A-BEE8-41E3-8EB9-CE17234B8D85}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure SetItensUnidadesDeMedida;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerUnidadesDeMedida = class(TInterfacedObject, IControllerUnidadesDeMedida)
  private

    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormLoadingCSS :TForm;
    FFormCadUnidadesDeMedida :TForm;

    FTimer :TTimer;

    FControllerFormGrid :IControllerFormGrid;
    FControllerConsultas :IControllerConsultas;
    FControllerPesquisaNaoEncontrada :IControllerPesquisaNaoEncontrada;

    aCmpItensCadUnidadesDeMedida :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure SetItensUnidadesDeMedida;
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
  class function New(pArrayFormsCte :array of TForm) :IControllerUnidadesDeMedida overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroUnidadesDeMedida;

{ TControllerUnidadesDeMedida }

procedure TControllerUnidadesDeMedida.AbrirFormCarregando;
begin
  FTimer.Enabled := True;
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FFormCadUnidadesDeMedida) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

constructor TControllerUnidadesDeMedida.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadUnidadesDeMedida := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerFormGrid := TControllerFormGrid.New(pArrayFormsCte);
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  FControllerPesquisaNaoEncontrada := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerUnidadesDeMedida.Destroy;
begin
  inherited;
  FControllerFormGrid := nil;
  FControllerConsultas := nil;
  FControllerPesquisaNaoEncontrada := nil;
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

function TControllerUnidadesDeMedida.FindRegister: Boolean;
begin
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    ResetComponentsItens;
    AbrirFormCarregando;
  end;
end;


procedure TControllerUnidadesDeMedida.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerUnidadesDeMedida.OnTimerLoading(Sender: TObject);
begin
  SetFindResults;
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
  X := 0;
  Y := 0;
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
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerPesquisaNaoEncontrada.Iniciar;
  Screen.Cursor := crDefault;
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

procedure TControllerUnidadesDeMedida.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerUnidadesDeMedida.SetEvents;
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

procedure TControllerUnidadesDeMedida.SetFindResults;
var
  iIdx :Integer;
begin
  FTimer.Interval := 1000;
  FTimer.Enabled := False;
  SetLength(aCmpItensCadUnidadesDeMedida,15);
  for iIdx := Low(aCmpItensCadUnidadesDeMedida) to High(aCmpItensCadUnidadesDeMedida) do
  begin
    if not Assigned(aCmpItensCadUnidadesDeMedida[iIdx]) then
    begin
      aCmpItensCadUnidadesDeMedida[iIdx] := TCmpBarraItemCadastroUnidadesDeMedida.Create(nil);
      with TCmpBarraItemCadastroUnidadesDeMedida(aCmpItensCadUnidadesDeMedida[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
        lblCodigo.Caption := 'UN - '+FormatFloat('000000',High(aCmpItensCadUnidadesDeMedida) - iIdx);
      end;
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadUnidadesDeMedida);
  FCmpControlGrid.Show;
end;

procedure TControllerUnidadesDeMedida.SetItensUnidadesDeMedida;
var
  iIdx :Integer;
begin
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
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadUnidadesDeMedida);
end;

end.

unit ConhecFrete.Controller.Marcas;

interface

uses
   Forms
  ,Graphics
  ,Dialogs
  ,Vcl.Controls
  ,Vcl.ExtCtrls
  ,System.Classes
  ,System.SysUtils
  ,ConhecFrete.Controller.FormGrid
  ,ConhecFrete.Controller.Consultas
  ,ConhecFrete.Controller.PesquisaNaoEncontrada
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
    FCmpTitulo :TForm;
    FCmpEditTexto :TForm;
    FFormCadMarcas :TForm;
    FCmpControlGrid :TForm;
    FFormLoadingCSS :TForm;

    FTimer :TTimer;

    FControllerFormGrid :IControllerFormGrid;
    FControllerConsultas :IControllerConsultas;
    FControllerPesquisaNaoEncontrada :IControllerPesquisaNaoEncontrada;

    aCmpItensCadMarcas :array of TForm;
    procedure SetEvents;
    procedure SetItensMarcas;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
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
  class function New(pArrayFormsCte :array of TForm) :IControllerMarcas overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroMarcas;

{ TControllerMarcas }

procedure TControllerMarcas.AbrirFormCarregando;
begin
  FTimer.Enabled := True;
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FFormCadMarcas) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

constructor TControllerMarcas.Create(pArrayFormsCte :array of TForm);
begin
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FFormCadMarcas := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerFormGrid := TControllerFormGrid.New(pArrayFormsCte);
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  FControllerPesquisaNaoEncontrada := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerMarcas.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FControllerFormGrid := nil;
  FControllerConsultas := nil;
  FControllerPesquisaNaoEncontrada := nil;
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

function TControllerMarcas.FindRegister: Boolean;
begin
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    ResetComponentsItens;
    AbrirFormCarregando;
  end;
end;

procedure TControllerMarcas.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerMarcas.OnTimerLoading(Sender: TObject);
begin
  SetFindResults;
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
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerPesquisaNaoEncontrada.Iniciar;
  Screen.Cursor := crDefault;
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
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 1800;
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerMarcas.SetFindResults;
var
  iIdx :Integer;
begin
  FTimer.Interval := 1000;
  FTimer.Enabled := False;
  SetLength(aCmpItensCadMarcas,15);
  for iIdx := Low(aCmpItensCadMarcas) to High(aCmpItensCadMarcas) do
  begin
    if not Assigned(aCmpItensCadMarcas[iIdx]) then
    begin
      aCmpItensCadMarcas[iIdx] := TCmpBarraItemCadastroMarcas.Create(nil);
      with TCmpBarraItemCadastroMarcas(aCmpItensCadMarcas[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
        lblCodigo.Caption := 'MR - '+FormatFloat('000000',High(aCmpItensCadMarcas) - iIdx);
      end;
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadMarcas);
  FCmpControlGrid.Show;
end;

procedure TControllerMarcas.SetItensMarcas;
var
  iIdx :Integer;
begin
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
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadMarcas);
end;

end.

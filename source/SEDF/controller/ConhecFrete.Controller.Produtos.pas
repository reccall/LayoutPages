unit ConhecFrete.Controller.Produtos;

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
  IControllerProdutos = interface
  ['{E1E4251F-26BC-4BE5-B9D3-47DEB4A0B66F}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensProdutos;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerProdutos = class(TInterfacedObject, IControllerProdutos)
  private
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormCadProdutos :TForm;
    FFormLoadingCSS :TForm;

    FTimer :TTimer;

    FControllerFormGrid :IControllerFormGrid;
    FControllerConsultas :IControllerConsultas;
    FControllerPesquisaNaoEncontrada :IControllerPesquisaNaoEncontrada;

    aCmpItensCadProd :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensProdutos;
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
  class function New(pArrayFormsCte :array of TForm) :IControllerProdutos overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.View.Componentes.BarraItemCadastroProdutos
  ,ConhecFrete.View.Componentes.BarraTituloCadastroProdutos
  ,LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TLabelTitulo;

{ TControllerProdutos }

procedure TControllerProdutos.AbrirFormCarregando;
begin
  FTimer.Enabled := True;
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FFormCadProdutos) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

constructor TControllerProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadProdutos := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := TCmpBarraTituloCadastroProdutos.Create(nil);
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerFormGrid := TControllerFormGrid.New(pArrayFormsCte);
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  FControllerPesquisaNaoEncontrada := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerProdutos.Destroy;
begin
  inherited;
  FControllerFormGrid := nil;
  FControllerConsultas := nil;
  FControllerPesquisaNaoEncontrada := nil;
end;

procedure TControllerProdutos.DestroyComponents;
begin
  ResetComponentsItens;
end;

procedure TControllerProdutos.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

function TControllerProdutos.FindRegister: Boolean;
begin
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    ResetComponentsItens;
    AbrirFormCarregando;
  end;
end;

procedure TControllerProdutos.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerProdutos.OnTimerLoading(Sender: TObject);
begin
  SetFindResults;
end;

class function TControllerProdutos.New(pArrayFormsCte :array of TForm): IControllerProdutos;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerProdutos.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    with TCmpBarraTituloCadastroProdutos(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroProdutos(aCmpItensCadProd[iIdx]) do
    begin
      if Assigned(aCmpItensCadProd[iIdx]) then
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

procedure TControllerProdutos.OnClickConsulta(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerPesquisaNaoEncontrada.Iniciar;
  Screen.Cursor := crDefault;
end;

procedure TControllerProdutos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  FCmpTitulo.Close;
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    FreeAndNil(aCmpItensCadProd[iIdx]);
  end;
  aCmpItensCadProd := nil;
end;

procedure TControllerProdutos.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerProdutos.SetEvents;
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

procedure TControllerProdutos.SetFindResults;
var
  iIdx :Integer;
begin
  FTimer.Interval := 1000;
  FTimer.Enabled := False;

  SetLength(aCmpItensCadProd,15);
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    if not Assigned(aCmpItensCadProd[iIdx]) then
    begin
      aCmpItensCadProd[iIdx] := TCmpBarraItemCadastroProdutos.Create(nil);
      with TCmpBarraItemCadastroProdutos(aCmpItensCadProd[iIdx]) do
      begin
        lblCodigo.Caption := 'PR - '+FormatFloat('000000',High(aCmpItensCadProd) - iIdx);
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
      end;
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadProd);
  FCmpControlGrid.Show;
end;

procedure TControllerProdutos.SetItensProdutos;
var
  iIdx :Integer;
begin
  SetLength(aCmpItensCadProd,20);
  for iIdx := Low(aCmpItensCadProd) to High(aCmpItensCadProd) do
  begin
    if not Assigned(aCmpItensCadProd[iIdx]) then
    begin
      aCmpItensCadProd[iIdx] := TCmpBarraItemCadastroProdutos.Create(nil);
      with TCmpBarraItemCadastroProdutos(aCmpItensCadProd[iIdx]) do
      begin
        lblCodigo.Caption := 'PR - '+FormatFloat('000000',High(aCmpItensCadProd) - iIdx);
      end;
    end;
  end;
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aCmpItensCadProd);
end;

end.

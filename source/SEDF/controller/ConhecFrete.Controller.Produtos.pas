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
  ,ConhecFrete.Controller.Consultas
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

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadProd :array of TForm;
    procedure SetEvents;
    procedure SetItensProdutos;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
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
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid;

{ TControllerProdutos }

constructor TControllerProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FCmpTitulo           := TCmpBarraTituloCadastroProdutos.Create(nil);
  FCmpEditTexto        := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid      := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FFormCadProdutos     := pArrayFormsCte[Ord(tpCteCadastros)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerProdutos.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FControllerConsultas := nil;
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
  Application.ProcessMessages;
  TCmpFormGrid(FCmpFormGrid).Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadProd);
  aCmpItensCadProd := nil;
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    FControllerConsultas.AbrirFormCarregando;
    SetFindResults;
    FTimer.Enabled := True;
  end;
end;

procedure TControllerProdutos.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerProdutos.OnTimerLoading(Sender: TObject);
begin
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadProd).SetFindResults;
  FTimer.Enabled := False;
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
    FControllerConsultas.SetNotFoundResults;
  Screen.Cursor := crDefault;
end;

procedure TControllerProdutos.ResetComponentsItens;
begin
  FCmpTitulo.Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadProd);
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
  FTimer.Interval := 500;

  FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
end;

procedure TControllerProdutos.SetFindResults;
var
  iIdx :Integer;
begin
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
end;

procedure TControllerProdutos.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
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
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadProd).SetFindResults;
end;

end.

unit ConhecFrete.Controller.Produtos;

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
    FFormPesquisaNaoEncontrada :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadProd :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensProdutos;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
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
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Forms.PesquisaNaoEcontrada;

{ TControllerProdutos }

constructor TControllerProdutos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadProdutos := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := TCmpBarraTituloCadastroProdutos.Create(nil);
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  if not Assigned(aFormsCte[Ord(tpFormPesqNaoEncontrada)]) then
    aFormsCte[Ord(tpFormPesqNaoEncontrada)] := TFormPesquisaNaoEncontrada.Create(pArrayFormsCte);
  FFormPesquisaNaoEncontrada := aFormsCte[Ord(tpFormPesqNaoEncontrada)];
  SetEvents;
end;

destructor TControllerProdutos.Destroy;
begin
  inherited;
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

procedure TControllerProdutos.OnClickInserirRegistro(Sender :TObject);
begin

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
  FControllerConsultas.OnClickConsulta(Sender);
  with TFormPesquisaNaoEncontrada(FFormPesquisaNaoEncontrada) do
  begin
    FController.Iniciar;
  end;
  ShowMessage('Up Produtos');
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
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerProdutos.SetItensProdutos;
var
  iIdx :Integer;
begin
  with TFormCteCadastros(FFormCadProdutos), TCmpFormGrid(FCmpFormGrid) do
  begin
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    FCmpTitulo.Parent := pnlCmpGridTop;
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
        aCmpItensCadProd[iIdx].Parent := scrlbxCmpMain;
      end;
      aCmpItensCadProd[iIdx].Show;
    end;
    FCmpTitulo.Show;
    FCmpFormGrid.Show;
  end;
end;

end.

unit ConhecFrete.Controller.Servicos;

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
  IControllerServicos = interface
  ['{1924679B-498C-4482-AB31-D628C4D6743C}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensServicos;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);

  end;

  TControllerServicos = class(TInterfacedObject, IControllerServicos)
  private
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormCadServicos :TForm;
    FFormPesquisaNaoEncontrada :TForm;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadServ :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensServicos;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
  public

  class function New(pArrayFormsCte :array of TForm) :IControllerServicos overload;
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
  ,LayoutPages.View.Forms.PesquisaNaoEcontrada
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroServicos;

{ TControllerServicos }

constructor TControllerServicos.Create(pArrayFormsCte :array of TForm);
begin
  FFormCadServicos := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpTitulo := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  if not Assigned(aFormsCte[Ord(tpFormPesqNaoEncontrada)]) then
    aFormsCte[Ord(tpFormPesqNaoEncontrada)] := TFormPesquisaNaoEncontrada.Create(pArrayFormsCte);
  FFormPesquisaNaoEncontrada := aFormsCte[Ord(tpFormPesqNaoEncontrada)];
  SetEvents;
end;

destructor TControllerServicos.Destroy;
begin
  with TFormCteCadastros(FFormCadServicos) do
  begin
    if Assigned(FController) then
      FreeAndNil(FController);
  end;
end;

procedure TControllerServicos.DestroyComponents;
begin
  ResetComponentsItens;
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
  FCmpControlGrid.Close;
end;

procedure TControllerServicos.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

procedure TControllerServicos.OnClickInserirRegistro(Sender :TObject);
begin

end;

class function TControllerServicos.New(pArrayFormsCte :array of TForm): IControllerServicos;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerServicos.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroServicos(aCmpItensCadServ[iIdx]) do
    begin
      if Assigned(aCmpItensCadServ[iIdx]) then
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

procedure TControllerServicos.OnClickConsulta(Sender: TObject);
begin
  FControllerConsultas.OnClickConsulta(Sender);
  with TFormPesquisaNaoEncontrada(FFormPesquisaNaoEncontrada) do
  begin
    FController.Iniciar;
  end;
  ShowMessage('Up Servicos');
end;

procedure TControllerServicos.ResetComponentsItens;
var
  iIdx :Integer;
begin
  FCmpTitulo.Close;
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    FreeAndNil(aCmpItensCadServ[iIdx]);
  end;
  aCmpItensCadServ := nil;
end;

procedure TControllerServicos.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerServicos.SetEvents;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
end;

procedure TControllerServicos.SetItensServicos;
var
  iIdx :Integer;
begin
  SetLength(aCmpItensCadServ,20);
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    if not Assigned(aCmpItensCadServ[iIdx]) then
    begin
      aCmpItensCadServ[iIdx] := TCmpBarraItemCadastroServicos.Create(nil);
      with TCmpBarraItemCadastroServicos(aCmpItensCadServ[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblCodigo.Caption := 'SV - '+FormatFloat('000000',High(aCmpItensCadServ) - iIdx);
      end;
    end;
  end;

  with TCmpFormGrid(FCmpFormGrid) do
  begin
    FController.SetItensGrid(FCmpTitulo, aCmpItensCadServ);
  end;
end;

end.

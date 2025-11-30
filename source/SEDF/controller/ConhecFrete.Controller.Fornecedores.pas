unit ConhecFrete.Controller.Fornecedores;

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
  IControllerFornecedores = interface
  ['{9AAAEAD9-D607-439E-A431-409DA5605D4D}']
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure SetItensFornecedores;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerFornecedores = class(TInterfacedObject, IControllerFornecedores)
  private
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormCadFornecedores :TForm;

    FTimer :TTimer;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadFornecedores :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure SetItensFornecedores;
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
  class function New(pArrayFormsCte :array of TForm) :IControllerFornecedores overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroFornecedores;

{ TControllerFornecedores }

constructor TControllerFornecedores.Create(pArrayFormsCte :array of TForm);
begin
  FCmpTitulo           := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto        := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid      := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  FFormCadFornecedores := pArrayFormsCte[Ord(tpCteCadastros)];
  SetEvents;
end;

destructor TControllerFornecedores.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FControllerConsultas := nil;
end;

procedure TControllerFornecedores.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerFornecedores.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

function TControllerFornecedores.FindRegister: Boolean;
begin
  Application.ProcessMessages;
  TCmpFormGrid(FCmpFormGrid).Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadFornecedores);
  aCmpItensCadFornecedores := nil;
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    FControllerConsultas.AbrirFormCarregando;
    SetFindResults;
    FTimer.Enabled := True;
  end;
end;

procedure TControllerFornecedores.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerFornecedores.OnTimerLoading(Sender: TObject);
begin
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadFornecedores).SetFindResults;
  FTimer.Enabled := False;
end;

class function TControllerFornecedores.New(pArrayFormsCte :array of TForm): IControllerFornecedores;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerFornecedores.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    with TCmpTituloDescSimples(FCmpTitulo),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]) do
    begin
      if Assigned(aCmpItensCadFornecedores[iIdx]) then
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

procedure TControllerFornecedores.OnClickConsulta(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerConsultas.SetNotFoundResults;
  Screen.Cursor := crDefault;
end;

procedure TControllerFornecedores.ResetComponentsItens;
begin
  FCmpTitulo.Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadFornecedores);
  aCmpItensCadFornecedores := nil;
end;

procedure TControllerFornecedores.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerFornecedores.SetEvents;
begin
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 500;

  FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
end;

procedure TControllerFornecedores.SetFindResults;
var
  iIdx :Integer;
begin
  SetLength(aCmpItensCadFornecedores,15);
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    if not Assigned(aCmpItensCadFornecedores[iIdx]) then
    begin
      aCmpItensCadFornecedores[iIdx] := TCmpBarraItemCadastroFornecedores.Create(nil);
      with TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
        lblCodigo.Caption := 'FN - '+FormatFloat('000000',High(aCmpItensCadFornecedores) - iIdx);
      end;
    end;
  end;
end;

procedure TControllerFornecedores.SetItensFornecedores;
var
  iIdx :Integer;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
  SetLength(aCmpItensCadFornecedores,20);
  for iIdx := Low(aCmpItensCadFornecedores) to High(aCmpItensCadFornecedores) do
  begin
    if not Assigned(aCmpItensCadFornecedores[iIdx]) then
    begin
      aCmpItensCadFornecedores[iIdx] := TCmpBarraItemCadastroFornecedores.Create(nil);
      with TCmpBarraItemCadastroFornecedores(aCmpItensCadFornecedores[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblCodigo.Caption := 'FN - '+FormatFloat('000000',High(aCmpItensCadFornecedores) - iIdx);
      end;
    end;
  end;
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadFornecedores).SetFindResults;
end;

end.

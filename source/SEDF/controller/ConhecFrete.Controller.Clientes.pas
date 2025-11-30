unit ConhecFrete.Controller.Clientes;

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
  IControllerClientes = interface
  ['{B9DAA2F4-9EF9-410C-88F0-A63B693CE845}']
    procedure SetEvents;
    procedure SetItensClientes;
    procedure SetClearPesquisa;
    procedure DestroyComponents;
    procedure ResetComponentsItens;
    procedure OnClickConsulta(Sender: TObject);
    procedure OnClickCheckBox(Sender :TObject);
    procedure OnClickInserirRegistro(Sender :TObject);
  end;

  TControllerClientes = class(TInterfacedObject, IControllerClientes)
  private
    FCmpTitulo :TForm;
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FFormCadClientes :TForm;

    FTimer :TTimer;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadClientes :array of TForm;
    procedure SetEvents;
    procedure SetClearPesquisa;
    procedure SetItensClientes;
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
  class function New(pArrayFormsCte :array of TForm) :IControllerClientes overload;
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
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroClientes;

{ TControllerClientes }

constructor TControllerClientes.Create(pArrayFormsCte :array of TForm);
begin
  FCmpTitulo       := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto    := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid  := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FFormCadClientes := pArrayFormsCte[Ord(tpCteCadastros)];
  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerClientes.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FControllerConsultas := nil;
end;

procedure TControllerClientes.DestroyComponents;
begin
  FCmpTitulo.Close;
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerClientes.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    13: OnClickConsulta(Sender);
  end;
end;

function TControllerClientes.FindRegister: Boolean;
begin
  Application.ProcessMessages;
  TCmpFormGrid(FCmpFormGrid).Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadClientes);
  aCmpItensCadClientes := nil;
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    FControllerConsultas.AbrirFormCarregando;
    SetFindResults;
    FTimer.Enabled := True;
  end;
end;

procedure TControllerClientes.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerClientes.OnTimerLoading(Sender: TObject);
begin
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadClientes).SetFindResults;
  FTimer.Enabled := False;
end;

class function TControllerClientes.New(pArrayFormsCte :array of TForm): IControllerClientes;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerClientes.OnClickCheckBox(Sender: TObject);
var
  iIdx :Integer;
  Shift: TShiftState;
  X, Y: Integer;
begin
  X := 0;
  Y := 0;
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    with TCmpTituloDescSimples(aCmpItensCadClientes),
         TCmpGridControl(FCmpControlGrid),
         TCmpBarraItemCadastroClientes(aCmpItensCadClientes[iIdx]) do
    begin
      if Assigned(aCmpItensCadClientes[iIdx]) then
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

procedure TControllerClientes.OnClickConsulta(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerConsultas.SetNotFoundResults;
  Screen.Cursor := crDefault;
end;

procedure TControllerClientes.ResetComponentsItens;
begin
  FCmpTitulo.Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadClientes);
  aCmpItensCadClientes := nil;
end;

procedure TControllerClientes.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerClientes.SetEvents;
begin
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 500;

  FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
end;

procedure TControllerClientes.SetFindResults;
var
  iIdx :Integer;
begin
  SetLength(aCmpItensCadClientes,15);
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    if not Assigned(aCmpItensCadClientes[iIdx]) then
    begin
      aCmpItensCadClientes[iIdx] := TCmpBarraItemCadastroClientes.Create(nil);
      with TCmpBarraItemCadastroClientes(aCmpItensCadClientes[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
        lblCodigo.Caption := 'CL - '+FormatFloat('000000',High(aCmpItensCadClientes) - iIdx);
      end;
    end;
  end;
end;

procedure TControllerClientes.SetItensClientes;
var
  iIdx :Integer;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
  SetLength(aCmpItensCadClientes,20);
  for iIdx := Low(aCmpItensCadClientes) to High(aCmpItensCadClientes) do
  begin
    if not Assigned(aCmpItensCadClientes[iIdx]) then
    begin
      aCmpItensCadClientes[iIdx] := TCmpBarraItemCadastroClientes.Create(nil);
      with TCmpBarraItemCadastroClientes(aCmpItensCadClientes[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblCodigo.Caption := 'CL - '+FormatFloat('000000',High(aCmpItensCadClientes) - iIdx);
      end;
    end;
  end;
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadClientes).SetFindResults;
end;

end.

unit ConhecFrete.Controller.Servicos;

interface

uses
   Forms
  ,Graphics
  ,Dialogs
  ,Vcl.Controls
  ,Vcl.ExtCtrls
  ,System.Classes
  ,System.SysUtils
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

    FTimer :TTimer;

    FControllerConsultas :IControllerConsultas;

    aCmpItensCadServ :array of TForm;
    procedure SetEvents;
    procedure SetItensServicos;
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

  class function New(pArrayFormsCte :array of TForm) :IControllerServicos overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Forms.Cte.Principal
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,LayoutPages.View.Componentes.FormGrid
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Componentes.TituloDescricaoSimples
  ,ConhecFrete.View.Componentes.BarraItemCadastroServicos;

{ TControllerServicos }

constructor TControllerServicos.Create(pArrayFormsCte :array of TForm);
begin
  FCmpTitulo       := pArrayFormsCte[Ord(tpCmpTituloDescSimples)];
  FCmpEditTexto    := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid  := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FFormCadServicos := pArrayFormsCte[Ord(tpCteCadastros)];

  FControllerConsultas := TControllerConsultas.New(pArrayFormsCte);
  SetEvents;
end;

destructor TControllerServicos.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FControllerConsultas := nil;
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

function TControllerServicos.FindRegister: Boolean;
begin
  Application.ProcessMessages;
  TCmpFormGrid(FCmpFormGrid).Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadServ);
  aCmpItensCadServ := nil;
  Result := UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text) = 'MASTER';
  if Result then
  begin
    FControllerConsultas.AbrirFormCarregando;
    SetFindResults;
    FTimer.Enabled := True;
  end;
end;

procedure TControllerServicos.OnClickInserirRegistro(Sender :TObject);
begin

end;

procedure TControllerServicos.OnTimerLoading(Sender: TObject);
begin
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadServ).SetFindResults;
  FTimer.Enabled := False;
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
  Screen.Cursor := crHourGlass;
  FControllerConsultas.OnClickConsulta(Sender);
  if not FindRegister then
    FControllerConsultas.SetNotFoundResults;
  Screen.Cursor := crDefault;
end;

procedure TControllerServicos.ResetComponentsItens;
begin
  FCmpTitulo.Close;
  FControllerConsultas.ResetComponentsItens(aCmpItensCadServ);
  aCmpItensCadServ := nil;
end;

procedure TControllerServicos.SetClearPesquisa;
begin
  FControllerConsultas.SetClearPesquisa;
end;

procedure TControllerServicos.SetEvents;
begin
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 500;

  FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
end;

procedure TControllerServicos.SetFindResults;
var
  iIdx :Integer;
begin
  SetLength(aCmpItensCadServ,15);
  for iIdx := Low(aCmpItensCadServ) to High(aCmpItensCadServ) do
  begin
    if not Assigned(aCmpItensCadServ[iIdx]) then
    begin
      aCmpItensCadServ[iIdx] := TCmpBarraItemCadastroServicos.Create(nil);
      with TCmpBarraItemCadastroServicos(aCmpItensCadServ[iIdx]) do
      begin
        lblAtivo.Left := TCmpTituloDescSimples(FCmpTitulo).lblAtivo.Left;
        lblCodigo.Caption := 'SV - '+FormatFloat('000000',High(aCmpItensCadServ) - iIdx);
        lblDesc.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;
      end;
    end;
  end;
end;
procedure TControllerServicos.SetItensServicos;
var
  iIdx :Integer;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.OnKeyDown := edtPesquisaKeyDown;
  end;
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
  FControllerConsultas.SetParamsFormGrid(FCmpTitulo, aCmpItensCadServ).SetFindResults;
end;

end.

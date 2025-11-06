unit ConhecFrete.Controller.OpcoesCteInicio;

interface

uses
   Forms
  ,Graphics
  ,Vcl.ExtCtrls
  ,Vcl.Controls
  ,System.Classes
  ,System.SysUtils
  ,ConhecFrete.Forms.Cte.FormMainCte
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.Simplificado.DadosCte
  ,LayoutPages.View.Componentes.BotoesBarraClose
  ,LayoutPages.View.Componentes.BotoesBarraOpcoes;

type
  IControllerOpcoesCte = interface
  ['{1410E864-A9E7-4E66-B69E-EEFB32F4742D}']
    procedure Iniciar;
    procedure DestroyForms;
  end;

  TControllerOpcoesCte = class(TInterfacedObject, IControllerOpcoesCte)
  private
    FFormOwner: TForm;
    FParentOwner :TWinControl;
    FLayoutMain :TfrmMainCte;

    FControllerMenuCte :TControllerMenuCte;
    FCmpBotoesBarra :TCmpBotoesBarra;
    FCmpBotoesBarraClose :TCmpBotoesBarraClose;

    procedure OnClickCloseForm(Sender :TObject);
    procedure OnClickRegiao(Sender :TObject);
    procedure OnClickClienteOpen(Sender :TObject);
    procedure OnClickClienteClose(Sender :TObject);
    procedure OnClickUFGlobalizado(Sender :TObject);
    procedure OnClickSimplificado(Sender :TObject);

    procedure OnMouseLeaveItem(Sender :TObject);
    procedure OnMouseMoveItem(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  public
    procedure Iniciar;
    procedure DestroyForms;
  class function New(pFormOwner :TForm) :IControllerOpcoesCte; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Background
  ,ConhecFrete.Forms.Cte.OpcoesInicio;

{ TControllerOpcoesCte }

constructor TControllerOpcoesCte.Create(pFormOwner: TForm);
begin
  FFormOwner           := pFormOwner;
  FLayoutMain          := TfrmMainCte.Create(nil);
  FCmpBotoesBarra      := TCmpBotoesBarra.Create(nil);
  FControllerMenuCte   := TControllerMenuCte.Create(TFormOpcoesItensCte.Create(nil));
  FCmpBotoesBarraClose := TCmpBotoesBarraClose.Create(nil);
end;

destructor TControllerOpcoesCte.Destroy;
begin
  inherited;
end;

procedure TControllerOpcoesCte.DestroyForms;
begin
  with FControllerMenuCte do
  begin
    DestruirForms;
    FreeAndNil(FControllerMenuCte);
  end;

  FreeAndNil(FCmpBotoesBarra);
  FreeAndNil(FCmpBotoesBarraClose);
  FreeAndNil(FLayoutMain);
end;

procedure TControllerOpcoesCte.Iniciar;
begin
  with FCmpBotoesBarra do
  begin
    pnlInicio.OnClick := OnClickClienteOpen;
    pnlInicio.OnMouseMove := OnMouseMoveItem;
    pnlInicio.OnMouseLeave := OnMouseLeaveItem;

    pnlGerarCte.OnMouseMove := OnMouseMoveItem;
    pnlGerarCte.OnMouseLeave := OnMouseLeaveItem;

    pnlSimu.OnMouseMove := OnMouseMoveItem;
    pnlSimu.OnMouseLeave := OnMouseLeaveItem;
  end;

  with TfrmCteOpcoesInicio(FFormOwner), FCmpBotoesBarraClose do
  begin
    pnlSair.OnClick := OnClickCloseForm;
    pnlSair.OnMouseMove := OnMouseMoveItem;
    pnlSair.OnMouseLeave := OnMouseLeaveItem;
    //Parent := pnlBottom;
    //Show;
  end;
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    FParentOwner := TfrmCteOpcoesInicio(FFormOwner).Parent;

    pnlBtnCliente.OnClick := OnClickClienteClose;
    pnlBtnCliente.OnMouseMove := OnMouseMoveItem;
    pnlBtnCliente.OnMouseLeave := OnMouseLeaveItem;

    pnlBtnRegiao.OnClick := OnClickRegiao;
    pnlBtnRegiao.OnMouseMove := OnMouseMoveItem;
    pnlBtnRegiao.OnMouseLeave := OnMouseLeaveItem;

    pnlBtnUFGlob.OnClick     := OnClickUFGlobalizado;
    pnlBtnUFGlob.OnMouseMove := OnMouseMoveItem;
    pnlBtnUFGlob.OnMouseLeave := OnMouseLeaveItem;

    pnlBtnSimplificado.OnClick     := OnClickSimplificado;
    pnlBtnSimplificado.OnMouseMove := OnMouseMoveItem;
    pnlBtnSimplificado.OnMouseLeave := OnMouseLeaveItem;

    pnlBtnSituCarreg.OnMouseMove := OnMouseMoveItem;
    pnlBtnSituCarreg.OnMouseLeave := OnMouseLeaveItem;
  end;
end;

class function TControllerOpcoesCte.New(pFormOwner: TForm): IControllerOpcoesCte;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerOpcoesCte.OnClickClienteOpen(Sender: TObject);
begin
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    FControllerMenuCte.CloseDadosCte;
    FCmpBotoesBarra.Close;
    Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickCloseForm(Sender: TObject);
begin
  with FormCteBackground do
  begin
    Close;
  end;
end;

procedure TControllerOpcoesCte.OnClickClienteClose(Sender: TObject);
begin
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    Close;
  end;

  with FLayoutMain  do
  begin
    Parent := FParentOwner;
    Show;
    FControllerMenuCte.IniciarCliente(FLayoutMain);
    FCmpBotoesBarra.Parent := pnlBottom;
    FCmpBotoesBarra.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickRegiao(Sender: TObject);
begin
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    Close;
  end;

  with FLayoutMain  do
  begin
    Parent := FParentOwner;
    Show;
    FControllerMenuCte.IniciarRegiao(FLayoutMain);
    FCmpBotoesBarra.Parent := pnlBottom;
    FCmpBotoesBarra.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickSimplificado(Sender: TObject);
begin
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    Close;
  end;

  with FLayoutMain  do
  begin
    Parent := FParentOwner;
    Show;
    FControllerMenuCte.IniciarSimplificado(FLayoutMain);
    FCmpBotoesBarra.Parent := pnlBottom;
    FCmpBotoesBarra.Show;
  end;
end;

procedure TControllerOpcoesCte.OnClickUFGlobalizado(Sender: TObject);
begin
  with TfrmCteOpcoesInicio(FFormOwner) do
  begin
    Close;
  end;

  with FLayoutMain  do
  begin
    Parent := FParentOwner;
    Show;
    FControllerMenuCte.IniciarUFGlobalizado(FLayoutMain);
    FCmpBotoesBarra.Parent := pnlBottom;
    FCmpBotoesBarra.Show;
  end;
end;

procedure TControllerOpcoesCte.OnMouseLeaveItem(Sender: TObject);
begin
  TPanel(Sender).Color := clWhite;
end;

procedure TControllerOpcoesCte.OnMouseMoveItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TPanel(Sender).Color := TColor($FAE6E6);
end;

end.

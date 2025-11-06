unit ConhecFrete.Controller.OpcoesItens;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,Vcl.ExtCtrls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerOpcoesItens = interface
  ['{0104C606-D83B-414F-9EFC-01E879901C88}']
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);
  end;

  TControllerOpcoesItens = class(TInterfacedObject, IControllerOpcoesItens)
  private
    FFormOwner: TForm;
    FPanelActive :TPanel;
    procedure OnMouseLeaveItemN(Sender :TObject);
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);
  public
  class function New(pFormOwner :TForm) :IControllerOpcoesItens;
    constructor Create(pFormOwner :TForm);
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.OpcoesItens;

{ TControllerOpcoesItens }

constructor TControllerOpcoesItens.Create(pFormOwner: TForm);
begin
  FFormOwner := pFormOwner;
end;

destructor TControllerOpcoesItens.Destroy;
begin
  with TFormOpcoesItensCte(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
end;

procedure TControllerOpcoesItens.Iniciar;
begin
  with TFormOpcoesItensCte(FFormOwner) do
  begin
    pnlTomador.OnMouseMove         := OnMouseMoveItem;
    pnlTomador.OnMouseLeave        := OnMouseLeaveItemN;
    pnlDadosCte.OnMouseMove        := OnMouseMoveItem;
    pnlDadosCte.OnMouseLeave       := OnMouseLeaveItemN;
    pnlMotorista.OnMouseMove       := OnMouseMoveItem;
    pnlMotorista.OnMouseLeave      := OnMouseLeaveItemN;
    pnlParametrosCte.OnMouseMove   := OnMouseMoveItem;
    pnlParametrosCte.OnMouseLeave  := OnMouseLeaveItemN;
    pnlDadosSeguroCte.OnMouseMove  := OnMouseMoveItem;
    pnlDadosSeguroCte.OnMouseLeave := OnMouseLeaveItemN;
  end;
end;

class function TControllerOpcoesItens.New(pFormOwner: TForm): IControllerOpcoesItens;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerOpcoesItens.OnMouseLeaveItemN(Sender: TObject);
begin
  if FPanelActive <> TPanel(Sender) then
    TPanel(Sender).Color := clWhite;
end;

procedure TControllerOpcoesItens.SetItemActive(pParam :TPanel);
begin
  FPanelActive := pParam;
end;

end.

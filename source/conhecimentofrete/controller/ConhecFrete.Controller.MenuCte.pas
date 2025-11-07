unit ConhecFrete.Controller.MenuCte;

interface

uses
   Forms
  ,Graphics
  ,Classes
  ,Vcl.ExtCtrls
  ,Math
  ,System.SysUtils;

type
  IControllerMenuCte = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);
  end;

  TControllerMenuCte = class(TInterfacedObject, IControllerMenuCte)
  private
    FFormOwner: TForm;
    FPanelActive :TPanel;
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);
    procedure OnMouseLeaveItemN(Sender :TObject);
  public
  class function New(pFormOwner :TForm) :IControllerMenuCte overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.MenuPrincipal;

{ TControllerMenuCte }

constructor TControllerMenuCte.Create(pFormOwner: TForm);
begin
  FFormOwner := pFormOwner;
end;

destructor TControllerMenuCte.Destroy;
begin
  with TFormMenuPrincipal(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerMenuCte.Iniciar;
begin
  with TFormMenuPrincipal(FFormOwner) do
  begin
    pnlEmissor.OnMouseMove  := OnMouseMoveItem;
    pnlEmissor.OnMouseLeave := OnMouseLeaveItemN;

    pnlTutorial.OnMouseMove  := OnMouseMoveItem;
    pnlTutorial.OnMouseLeave := OnMouseLeaveItemN;

    pnlRelatorios.OnMouseMove  := OnMouseMoveItem;
    pnlRelatorios.OnMouseLeave := OnMouseLeaveItemN;

    pnlCadastros.OnMouseMove  := OnMouseMoveItem;
    pnlCadastros.OnMouseLeave := OnMouseLeaveItemN;

    pnlCertificadoDig.OnMouseMove  := OnMouseMoveItem;
    pnlCertificadoDig.OnMouseLeave := OnMouseLeaveItemN;
  end;
end;

class function TControllerMenuCte.New(pFormOwner: TForm): IControllerMenuCte;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerMenuCte.OnMouseLeaveItemN(Sender: TObject);
begin
   if FPanelActive <> TPanel(Sender) then
    TPanel(Sender).Color := clWhite;
end;

procedure TControllerMenuCte.SetItemActive(pParam: TPanel);
begin
  FPanelActive := pParam;
  with TFormMenuPrincipal(FFormOwner) do
  begin
    pnlEmissor.Color        := IfThen(FPanelActive = pnlEmissor,TColor($FAE6E6), clWhite);
    pnlTutorial.Color       := IfThen(FPanelActive = pnlTutorial,TColor($FAE6E6), clWhite);
    pnlCadastros.Color      := IfThen(FPanelActive = pnlCadastros,TColor($FAE6E6), clWhite);
    pnlRelatorios.Color     := IfThen(FPanelActive = pnlRelatorios,TColor($FAE6E6), clWhite);
    pnlCertificadoDig.Color := IfThen(FPanelActive = pnlCertificadoDig,TColor($FAE6E6), clWhite);
  end;
end;

end.

unit ConhecFrete.Controller.MenuCte;

interface

uses
   Forms
  ,Graphics
  ,Classes
  ,Vcl.ExtCtrls
  ,System.SysUtils;

type
  IControllerMenuCte = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
  end;

  TControllerMenuCte = class(TInterfacedObject, IControllerMenuCte)
  private
    FFormOwner: TForm;
    procedure Iniciar;
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
    //pnlEmissor.OnMouseLeave := OnMouseLeaveItem;

    pnlTutorial.OnMouseMove  := OnMouseMoveItem;
    pnlTutorial.OnMouseLeave := OnMouseLeaveItem;

    pnlRelatorios.OnMouseMove  := OnMouseMoveItem;
    pnlRelatorios.OnMouseLeave := OnMouseLeaveItem;

    pnlCadastros.OnMouseMove  := OnMouseMoveItem;
    pnlCadastros.OnMouseLeave := OnMouseLeaveItem;

    pnlCertificadoDig.OnMouseMove  := OnMouseMoveItem;
    pnlCertificadoDig.OnMouseLeave := OnMouseLeaveItem;
  end;
end;

class function TControllerMenuCte.New(pFormOwner: TForm): IControllerMenuCte;
begin
  Result := Self.Create(pFormOwner);
end;


end.

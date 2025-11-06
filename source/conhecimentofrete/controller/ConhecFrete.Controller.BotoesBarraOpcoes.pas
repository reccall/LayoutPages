unit ConhecFrete.Controller.BotoesBarraOpcoes;

interface

uses
   Forms
  ,Graphics
  ,Classes
  ,Vcl.ExtCtrls
  ,System.SysUtils;

type
  IControllerBotoesBarraOpcoes = interface
  ['{938ECA84-2E44-479B-B60B-1C9D6971325E}']
    procedure Iniciar;
  end;

  TControllerBotoesBarraOpcoes = class(TInterfacedObject, IControllerBotoesBarraOpcoes)
  private
    FFormOwner: TForm;
    procedure Iniciar;
  public
  class function New(pFormOwner :TForm) :IControllerBotoesBarraOpcoes overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.View.Componentes.OpcoesGerarCte;

{ TControllerBotoesBarraOpcoes }

constructor TControllerBotoesBarraOpcoes.Create(pFormOwner: TForm);
begin
  FFormOwner := pFormOwner;
end;

destructor TControllerBotoesBarraOpcoes.Destroy;
begin
  with TCmpOpcoesGerarCte(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerBotoesBarraOpcoes.Iniciar;
begin
  with TCmpOpcoesGerarCte(FFormOwner) do
  begin
    pnlInicio.OnMouseMove  := OnMouseMoveItem;
    pnlInicio.OnMouseLeave := OnMouseLeaveItem;

    pnlGerarCte.OnMouseMove  := OnMouseMoveItem;
    pnlGerarCte.OnMouseLeave := OnMouseLeaveItem;

    pnlSimu.OnMouseMove  := OnMouseMoveItem;
    pnlSimu.OnMouseLeave := OnMouseLeaveItem;
  end;
end;

class function TControllerBotoesBarraOpcoes.New(pFormOwner: TForm): IControllerBotoesBarraOpcoes;
begin
  Result := Self.Create(pFormOwner);
end;

end.

unit ConhecFrete.Controller.CardsInicio;

interface

uses
   Forms
  ,Windows
  ,Vcl.ExtCtrls
  ,Vcl.AppEvnts
  ,System.Classes
  ,System.SysUtils
  ,Winapi.Messages
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerCardsInicio = interface
  ['{71C55B1D-D385-43EB-BB58-4044FDA66F13}']
    procedure IniciarNFe;
    procedure IniciarCTe;
    procedure IniciarNFCe;
    procedure IniciarNFSe;

    procedure SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);
  end;

  TControllerCardsInicio = class(TInterfacedObject, IControllerCardsInicio)
  private
    FTimer :TTimer;
    FPosition :Integer;
    FFormLoadCSS :TForm;
    FCtePrincipal :TForm;
    FFormCardsInicio :TForm;

    procedure IniciarNFe;
    procedure IniciarCTe;
    procedure IniciarNFCe;
    procedure IniciarNFSe;

    procedure OnTimerInicio(Sender :TObject);
    procedure SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);
  public
    class function New(pArrayFormsCte :array of TForm) :IControllerCardsInicio overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
    destructor Destroy; override;
  end;

implementation

uses
   LayoutPages.View.Forms.LoadingCSS
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.CardsInicio;

{ TControllerCardsInicio }


constructor TControllerCardsInicio.Create(pArrayFormsCte: array of TForm);
begin
  FFormLoadCSS := aFormsCte[Ord(tpFormLoadingCSS)];
  FFormCardsInicio := aFormsCte[Ord(tpCteCardsInicio)];

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 2200;
  FTimer.OnTimer := OnTimerInicio;
  FTimer.Enabled := False;
end;

destructor TControllerCardsInicio.Destroy;
begin
  inherited Destroy;
end;

procedure TControllerCardsInicio.IniciarCTe;
begin

end;

procedure TControllerCardsInicio.IniciarNFCe;
begin

end;

procedure TControllerCardsInicio.IniciarNFe;
begin
  with TFormCardsInicio(FFormCardsInicio) do
  begin
    FFormLoadCSS.Parent := pnlMain;
    Show;
  end;
  FFormLoadCSS.Top  := 80;
  FFormLoadCSS.Left := 300;
  FFormLoadCSS.Show;
  FTimer.Enabled := True;
end;

procedure TControllerCardsInicio.IniciarNFSe;
begin

end;

class function TControllerCardsInicio.New(pArrayFormsCte: array of TForm): IControllerCardsInicio;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerCardsInicio.OnTimerInicio(Sender: TObject);
begin
  FFormLoadCSS.Close;
end;

procedure TControllerCardsInicio.SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);
begin

end;

end.

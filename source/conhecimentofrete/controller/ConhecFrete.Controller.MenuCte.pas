unit ConhecFrete.Controller.MenuCte;

interface

uses
   Forms
  ,Graphics
  ,Classes
  ,Vcl.ExtCtrls
  ,Math
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuCte = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);
  end;

  TControllerMenuCte = class(TInterfacedObject, IControllerMenuCte)
  private
    FCtePrincipal      :TForm;
    FMenuPrincipal     :TForm;
    FMenuCadastros     :TForm;
    FMenuItensImagens  :TForm;
    FMenuEmissaoFiscal :TForm;


    FPanelActive :TPanel;
    procedure Iniciar;
    procedure SetItemActive(pParam :TPanel);

    procedure OnClickTutorial(Sender :TObject);
    procedure OnClickRelatorios(Sender :TObject);
    procedure OnClickMenuCadastros(Sender :TObject);
    procedure OnClickCertificadoDig(Sender :TObject);
    procedure OnClickMenuEmissaoFiscal(Sender :TObject);

    procedure OnMouseLeaveItemN(Sender :TObject);
  public
  class function New(pArrayForms :array of TForm) :IControllerMenuCte overload;
    constructor Create(pArrayForms :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuPrincipal;

{ TControllerMenuCte }

constructor TControllerMenuCte.Create(pArrayForms :array of TForm);
begin
  FCtePrincipal  := pArrayForms[Ord(tpOwner)];
  FMenuPrincipal := pArrayForms[Ord(tpMenuPrincipal)];
end;

destructor TControllerMenuCte.Destroy;
begin
  if Assigned(FMenuCadastros) then
  begin
    FreeAndNil(TFormMenuCadastros(FMenuCadastros));
  end;

  if Assigned(FMenuEmissaoFiscal) then
  begin
    FreeAndNil(TFormMenuEmissaoFiscal(FMenuEmissaoFiscal));
  end;
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerMenuCte.Iniciar;
begin
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    MakeRounded(pnlCadastros,10);
    MakeRounded(pnlBackCad,10);
    MakeRounded(pnlEmissor,10);
    MakeRounded(pnlBackEmissor,10);
    MakeRounded(pnlTutorial,10);
    MakeRounded(pnlBackTutorial,10);
    MakeRounded(pnlRelatorios,10);
    MakeRounded(pnlBackRelatorios,10);
    MakeRounded(pnlCertificadoDig,10);
    MakeRounded(pnlBackCertificadoDig,10);

    pnlEmissor.OnClick      := OnClickMenuEmissaoFiscal;
    pnlEmissor.OnMouseMove  := OnMouseMoveItem;
    pnlEmissor.OnMouseLeave := OnMouseLeaveItemN;

    pnlTutorial.OnMouseMove  := OnMouseMoveItem;
    pnlTutorial.OnMouseLeave := OnMouseLeaveItemN;

    pnlRelatorios.OnMouseMove  := OnMouseMoveItem;
    pnlRelatorios.OnMouseLeave := OnMouseLeaveItemN;

    pnlCadastros.OnClick      := OnClickMenuCadastros;
    pnlCadastros.OnMouseMove  := OnMouseMoveItem;
    pnlCadastros.OnMouseLeave := OnMouseLeaveItemN;

    pnlCertificadoDig.OnMouseMove  := OnMouseMoveItem;
    pnlCertificadoDig.OnMouseLeave := OnMouseLeaveItemN;
  end;
end;

class function TControllerMenuCte.New(pArrayForms :array of TForm): IControllerMenuCte;
begin
  Result := Self.Create(pArrayForms);
end;

procedure TControllerMenuCte.OnClickCertificadoDig(Sender: TObject);
begin

end;

procedure TControllerMenuCte.OnClickRelatorios(Sender: TObject);
begin

end;

procedure TControllerMenuCte.OnClickTutorial(Sender: TObject);
begin

end;

procedure TControllerMenuCte.OnMouseLeaveItemN(Sender: TObject);
begin
  if FPanelActive <> TPanel(Sender) then
    TPanel(Sender).Color := clWhite;
end;

procedure TControllerMenuCte.SetItemActive(pParam: TPanel);
begin
  FPanelActive := pParam;
  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    pnlEmissor.Color        := IfThen(FPanelActive = pnlEmissor,TColor($FAE6E6), clWhite);
    pnlTutorial.Color       := IfThen(FPanelActive = pnlTutorial,TColor($FAE6E6), clWhite);
    pnlCadastros.Color      := IfThen(FPanelActive = pnlCadastros,TColor($FAE6E6), clWhite);
    pnlRelatorios.Color     := IfThen(FPanelActive = pnlRelatorios,TColor($FAE6E6), clWhite);
    pnlCertificadoDig.Color := IfThen(FPanelActive = pnlCertificadoDig,TColor($FAE6E6), clWhite);
  end;
end;

procedure TControllerMenuCte.OnClickMenuCadastros(Sender: TObject);
begin
  if not Assigned(FMenuCadastros) then
  begin
    FMenuCadastros := aFormsCte[Ord(tpMenuCadastros)];
    if not Assigned(FMenuCadastros) then
    begin
      FMenuCadastros  := TFormMenuCadastros.Create(aFormsCte);
      aFormsCte[Ord(tpMenuCadastros)] := FMenuCadastros;
    end;
  end;

  if Assigned(FMenuEmissaoFiscal) then
  begin
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Close;
  end;

  TFormMenuCadastros(FMenuCadastros).FControl := 0;

  with TfrmCtePrincipal(FCtePrincipal), TFormMenuPrincipal(FMenuPrincipal) do
  begin
    TFormMenuCadastros(FMenuCadastros).Top    := pnlMain.Top+100;
    TFormMenuCadastros(FMenuCadastros).Left   := pnlMenu.Left+pnlBackEmissor.Width+20;
    TFormMenuCadastros(FMenuCadastros).BringToFront;
    TFormMenuCadastros(FMenuCadastros).Show;
  end;
end;

procedure TControllerMenuCte.OnClickMenuEmissaoFiscal(Sender: TObject);
begin
  if not Assigned(FMenuEmissaoFiscal) then
  begin
    FMenuEmissaoFiscal := aFormsCte[Ord(tpMenuEmissaoFiscal)];
    if not Assigned(FMenuEmissaoFiscal) then
    begin
      FMenuEmissaoFiscal := TFormMenuEmissaoFiscal.Create(aFormsCte);
      aFormsCte[Ord(tpMenuEmissaoFiscal)] := FMenuEmissaoFiscal;
    end;
  end;

  if Assigned(FMenuCadastros) then
  begin
    with TFormMenuCadastros(FMenuCadastros) do
    begin
      FControl := 0;
      Close;
    end;
  end;

  with TfrmCtePrincipal(FCtePrincipal), TFormMenuPrincipal(FMenuPrincipal) do
  begin
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Top  := pnlMain.Top+150;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Left := pnlMenu.Left+ pnlBackEmissor.Width + 20;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).BringToFront;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Show;
  end;
end;

end.

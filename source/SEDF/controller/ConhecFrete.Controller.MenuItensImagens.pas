unit ConhecFrete.Controller.MenuItensImagens;

interface

uses
   Forms
  ,Math
  ,Graphics
  ,StrUtils
  ,System.SysUtils
  ,System.Classes
  ,Vcl.ExtCtrls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuItensImagens = interface
  ['{C0790719-E9F0-4F14-9176-65D9A3AE46E0}']
    procedure Iniciar;
    procedure SetActiveImage(pParam :TImage);
    procedure DestroyComponents;
  end;

  TControllerMenuItensImagens = class(TInterfacedObject, IControllerMenuItensImagens)
  private
    FActiveMenu :TImage;
    FCtePrincipal      :TForm;
    FMenuCadastros     :TForm;
    FMenuPrincipal     :TForm;
    FMenuEmissaoFiscal :TForm;
    FMenuItensImagens: TForm;

    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetActiveImage(pParam :TImage);

    function GetIdxImage(pParam :TImage; pEvent :String) :Integer;

    procedure OnClickMenuCadastros(Sender :TObject);
    procedure OnClickMenuEmissaoFiscal(Sender :TObject);

    procedure OnMouseLeaveImg(Sender: TObject);
    procedure OnMouseMoveImg(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  public
  class function New(pArrayForms: array of TForm) :IControllerMenuItensImagens overload;
    constructor Create(pArrayForms: array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuItensImagens;

{ TControllerMenuItensImagens }

constructor TControllerMenuItensImagens.Create(pArrayForms: array of TForm);
begin
  FCtePrincipal      := pArrayForms[Ord(tpOwner)];
  FMenuPrincipal     := pArrayForms[Ord(tpMenuPrincipal)];
  FMenuItensImagens  := pArrayForms[Ord(tpMenuItensImagens)];
end;

destructor TControllerMenuItensImagens.Destroy;
begin
  FActiveMenu := nil;
  inherited;
end;

procedure TControllerMenuItensImagens.DestroyComponents;
begin

end;

function TControllerMenuItensImagens.GetIdxImage(pParam :TImage; pEvent :String) :Integer;
begin
  Result := 0;
  case AnsiIndexText(pParam.Name,aImageNames) of
    0: Result := IfThen(pEvent = 'Move',0,1);
    1: Result := IfThen(pEvent = 'Move',2,3);
    2: Result := IfThen(pEvent = 'Move',4,5);
    3: Result := IfThen(pEvent = 'Move',6,7);
    4: Result := IfThen(pEvent = 'Move',8,9);
  end;
end;

procedure TControllerMenuItensImagens.Iniciar;
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;

  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    ImgCadastros.OnClick      := OnClickMenuCadastros;
    ImgCadastros.OnMouseMove  := OnMouseMoveImg;
    ImgCadastros.OnMouseLeave := OnMouseLeaveImg;

    ImgTutorial.OnMouseMove  := OnMouseMoveImg;
    ImgTutorial.OnMouseLeave := OnMouseLeaveImg;

    ImgEmissaoFiscal.OnClick      := OnClickMenuEmissaoFiscal;
    ImgEmissaoFiscal.OnMouseMove  := OnMouseMoveImg;
    ImgEmissaoFiscal.OnMouseLeave := OnMouseLeaveImg;

    ImgRelatorios.OnMouseMove  := OnMouseMoveImg;
    ImgRelatorios.OnMouseLeave := OnMouseLeaveImg;

    ImgCertDigital.OnMouseMove  := OnMouseMoveImg;
    ImgCertDigital.OnMouseLeave := OnMouseLeaveImg;
  end;
end;

class function TControllerMenuItensImagens.New(pArrayForms: array of TForm): IControllerMenuItensImagens;
begin
  Result := Self.Create(pArrayForms);
end;

procedure TControllerMenuItensImagens.OnClickMenuCadastros(Sender: TObject);
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
    TFormMenuCadastros(FMenuCadastros).Left   := pnlMenu.Left + TFormMenuItensImagens(FMenuItensImagens).Left + 130;
    TFormMenuCadastros(FMenuCadastros).BringToFront;
    TFormMenuCadastros(FMenuCadastros).Show;
  end;
end;

procedure TControllerMenuItensImagens.OnClickMenuEmissaoFiscal(Sender: TObject);
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
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Top  := pnlMain.Top+170;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Left := pnlMenu.Left + TFormMenuItensImagens(FMenuItensImagens).Left + 130;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).BringToFront;
    TFormMenuEmissaoFiscal(FMenuEmissaoFiscal).Show;
  end;
end;

procedure TControllerMenuItensImagens.OnMouseLeaveImg(Sender: TObject);
var
  bmp: TBitmap;
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;

  if TImage(Sender) <> FActiveMenu then
  begin
    bmp := TBitmap.Create;
    with TFormMenuItensImagens(FMenuItensImagens) do
    begin
      try
        ImageList1.GetBitmap(GetIdxImage(TImage(Sender),'Leave'), bmp);
        TImage(Sender).Picture.Assign(bmp);
      finally
        FreeAndNil(bmp);
      end;
    end;
  end;
  inherited;
end;

procedure TControllerMenuItensImagens.OnMouseMoveImg(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  bmp: TBitmap;
begin
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  bmp := TBitmap.Create;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    try ImageList1.GetBitmap(GetIdxImage(TImage(Sender),'Move'), bmp);
      TImage(Sender).Picture.Assign(bmp);
    finally
      FreeAndNil(bmp);
    end;
  end;
  inherited;
end;

procedure TControllerMenuItensImagens.SetActiveImage(pParam :TImage);
var
  Shift: TShiftState; X, Y: Integer;
begin
  X := 0;
  Y := 0;
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := aFormsCte[Ord(tpMenuItensImagens)];
  end;
  FActiveMenu := pParam;
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    OnMouseMoveImg(FActiveMenu,Shift,X,Y);
    OnMouseLeaveImg(ImgTutorial);
    OnMouseLeaveImg(ImgCadastros);
    OnMouseLeaveImg(ImgEmissaoFiscal);
    OnMouseLeaveImg(ImgRelatorios);
    OnMouseLeaveImg(ImgCertDigital);
  end;
end;

end.

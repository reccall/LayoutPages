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
    FMenuItensImagens: TForm;

    procedure Iniciar;
    procedure DestroyComponents;
    procedure SetActiveImage(pParam :TImage);

    function GetIdxImage(pParam :TImage; pEvent :String) :Integer;

    procedure OnMouseLeaveImg(Sender: TObject);
    procedure OnMouseMoveImg(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  public
  class function New(pArrayForms: array of TForm) :IControllerMenuItensImagens overload;
    constructor Create(pArrayForms: array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.MenuItensImagens;

{ TControllerMenuItensImagens }

constructor TControllerMenuItensImagens.Create(pArrayForms: array of TForm);
begin
  FMenuItensImagens := pArrayForms[Ord(tpMenuItensImagens)];
end;

destructor TControllerMenuItensImagens.Destroy;
begin
  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    Close;
  end;
  inherited;
end;

procedure TControllerMenuItensImagens.DestroyComponents;
begin

end;

function TControllerMenuItensImagens.GetIdxImage(pParam :TImage; pEvent :String) :Integer;
begin
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
    ImgCadastros.OnMouseMove  := OnMouseMoveImg;
    ImgCadastros.OnMouseLeave := OnMouseLeaveImg;

    ImgTutorial.OnMouseMove  := OnMouseMoveImg;
    ImgTutorial.OnMouseLeave := OnMouseLeaveImg;

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

procedure TControllerMenuItensImagens.OnMouseLeaveImg(Sender: TObject);
var
  bmp: TBitmap;
begin
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

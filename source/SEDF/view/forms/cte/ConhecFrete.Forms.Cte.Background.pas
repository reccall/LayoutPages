unit ConhecFrete.Forms.Cte.Background;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.Dialogs
  ,Vcl.ExtCtrls
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.Principal
  ,LayoutPages.View.Forms.BackgroundLayout;

type
  TFormCteBackground = class(TFormBackgroundLayout)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerPrincipal;
  end;

var
  FormCteBackground: TFormCteBackground;

implementation

{$R *.dfm}

procedure TFormCteBackground.FormCreate(Sender: TObject);
begin
  Top    := GetSystemMetrics(SM_YVIRTUALSCREEN) + 4;
  Left   := GetSystemMetrics(SM_XVIRTUALSCREEN) + 4;
  Width  := GetSystemMetrics(SM_CXSCREEN) - 10;
  Height := GetSystemMetrics(SM_CYSCREEN) - 80;

  pnlMain.Width := Width -6;
  pnlMain.Height := Height -6;
  inherited;
  FController := TControllerPrincipal.New(Self);
end;

procedure TFormCteBackground.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

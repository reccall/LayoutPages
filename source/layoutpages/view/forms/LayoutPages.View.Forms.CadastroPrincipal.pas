unit LayoutPages.View.Forms.CadastroPrincipal;

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
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,Vcl.ExtCtrls
  ,Vcl.AppEvnts
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormCadastrosPrincipal = class(TFormDefault)
    pnlBackMain: TPanel;
    pnlCadTop: TPanel;
    pnlMain: TPanel;
    scrlbxMain: TScrollBox;
    pnlConsulta: TPanel;
    lblConsulta: TLabel;
    pnlRegiaoPesq: TPanel;
    pnlIncluirRegistro: TPanel;
    lblInserir: TLabel;
    Image1: TImage;
    pnlTopMainCad: TPanel;
    ApplicationEvents1: TApplicationEvents;
    imgLupa: TImage;
    pnlMainBottom: TPanel;
    pnlControlGrid: TPanel;
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     FPosition :Integer;
  end;

implementation

{$R *.dfm}

procedure TFormCadastrosPrincipal.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  i: SmallInt;
begin
  inherited;
  if Msg.message = WM_MOUSEWHEEL then
  begin
    FPosition := scrlbxMain.VertScrollBar.Position;
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam) ;
    if i > 0 then
    begin
      Msg.wParam := VK_UP;
      Dec(FPosition,20);
    end
    else
    begin
      Msg.wParam := VK_DOWN;
      Inc(FPosition,20);
    end;
    Handled := False;
    //if FPosition < 0 then
      //FPosition := 0;

    scrlbxMain.VertScrollBar.Position := FPosition;
  end;
end;

end.

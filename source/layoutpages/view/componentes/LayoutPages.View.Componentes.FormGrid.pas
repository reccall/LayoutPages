unit LayoutPages.View.Componentes.FormGrid;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.StrUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Dialogs
  ,Vcl.AppEvnts
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpFormGrid = class(TFormDefault)
    pnlCmpGridTop: TPanel;
    pnlCmpGridMain: TPanel;
    scrlbxCmpMain: TScrollBox;
    ApplicationEvents1: TApplicationEvents;
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FPosition :Integer;
  end;

implementation

{$R *.dfm}

procedure TCmpFormGrid.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  i: SmallInt;
begin
  inherited;
  if Msg.message = WM_MOUSEWHEEL then
  begin
    FPosition := scrlbxCmpMain.VertScrollBar.Position;
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

    scrlbxCmpMain.VertScrollBar.Position := FPosition;
  end;
end;

end.

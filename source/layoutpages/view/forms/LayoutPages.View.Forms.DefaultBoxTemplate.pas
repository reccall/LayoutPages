unit LayoutPages.View.Forms.DefaultBoxTemplate;

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
  ,Vcl.ExtCtrls;

type
  TFormDefaultBoxTemplate = class(TForm)
    pnlBackground: TPanel;
    pnlTop: TPanel;
    pnlTopRightBack: TPanel;
    pnlTopLeftBack: TPanel;
    pnlTopCenter: TPanel;
    pnlBotom: TPanel;
    pnlBottomRight: TPanel;
    pnlBottomLeft: TPanel;
    pnlBottomCenter: TPanel;
    pnlMain: TPanel;
    pnlMainRight: TPanel;
    pnlMainLeft: TPanel;
    pnlMainCenter: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure MakeRounded(Control :TWinControl; pSize :Integer);
  end;

implementation

{$R *.dfm}

{ TfrmLayoutPrincipal }

procedure TFormDefaultBoxTemplate.FormShow(Sender: TObject);
var
  iIdx :Integer;
begin
  inherited;
  for iIdx := 0 to ComponentCount - 1 do
  begin
    if Components[iIdx] is TPanel then
    begin
      TPanel(Components[iIdx]).BevelOuter := bvNone;
    end;
  end;
end;

procedure TFormDefaultBoxTemplate.MakeRounded(Control: TWinControl; pSize: Integer);
var
  R :TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom,pSize,pSize);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r,-5,-5);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

end.

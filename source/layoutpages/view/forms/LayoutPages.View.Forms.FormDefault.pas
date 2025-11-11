unit LayoutPages.View.Forms.FormDefault;

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
  ,Vcl.Dialogs;

type
  TFormDefault = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MakeRounded(Control :TWinControl; pSize :Integer);
    procedure OnMouseLeaveItem(Sender :TObject); overload;
    procedure OnMouseMoveItem(Sender: TObject; Shift: TShiftState; X, Y: Integer); overload;
  end;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFormDefault.FormShow(Sender: TObject);
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

procedure TFormDefault.MakeRounded(Control: TWinControl; pSize: Integer);
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

procedure TFormDefault.OnMouseLeaveItem(Sender: TObject);
begin
  TPanel(Sender).Color := clWhite;
end;

procedure TFormDefault.OnMouseMoveItem(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  TPanel(Sender).Color := TColor($FAE6E6);
end;

end.

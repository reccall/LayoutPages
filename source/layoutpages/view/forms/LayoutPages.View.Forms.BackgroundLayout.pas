unit LayoutPages.View.Forms.BackgroundLayout;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormBackgroundLayout = class(TFormDefault)
    pnlMain: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFormBackgroundLayout.FormCreate(Sender: TObject);
begin
  inherited;
  MakeRounded(Self,10);
  MakeRounded(pnlMain,10);
end;

end.

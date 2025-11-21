unit LayoutPages.View.Forms.DefaultTemplate;

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
  ,Vcl.ComCtrls
  ,Vcl.ExtCtrls
  ,dxGDIPlusClasses
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormDefaultTemplate = class(TFormDefault)
    pnlBackMenu: TPanel;
    pnlMain: TPanel;
    pnlTop: TPanel;
    pnlMainTopB: TPanel;
    pnlMainLeft: TPanel;
    pnlMainTopLeft: TPanel;
    pnlMainTop: TPanel;
    pnlLogo: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormDefaultTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.

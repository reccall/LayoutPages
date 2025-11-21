unit LayoutPages.View.Componentes.ControlGrid;

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
  TCmpGridControl = class(TFormDefault)
    pnlBackCheckBox: TPanel;
    pnlCheckBox: TPanel;
    img1: TImage;
    chkControl: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpGridControl.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlCheckBox,10);
  MakeRounded(pnlBackCheckBox,10);
end;

end.

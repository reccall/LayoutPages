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
    pnlLinha: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    FPosition :Integer;
  end;

implementation

{$R *.dfm}

end.

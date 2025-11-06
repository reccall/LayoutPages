unit ConhecFrete.Forms.Cte.FormMainCte;

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
  TfrmMainCte = class(TFormDefault)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlMain: TPanel;
    pnlLeft: TPanel;
    pnlMenu: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmMainCte.FormShow(Sender: TObject);
begin
  inherited;
  //
end;

end.

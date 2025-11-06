unit ConhecFrete.Forms.Cte.MenuEmissaoFiscal;

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
  TFormMenuEmissaoFiscal = class(TFormDefault)
    pnlNFe: TPanel;
    pnlNFCe: TPanel;
    pnlCte: TPanel;
    pnlNFSe: TPanel;
    pnlRightNFe: TPanel;
    pnlRightNFCe: TPanel;
    pnlRightCte: TPanel;
    pnlRightNFSe: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormMenuEmissaoFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  pnlNFe.OnMouseMove  := OnMouseMoveItem;
  pnlNFe.OnMouseLeave := OnMouseLeaveItem;
  pnlCte.OnMouseMove  := OnMouseMoveItem;
  pnlCte.OnMouseLeave := OnMouseLeaveItem;
  pnlNFSe.OnMouseMove  := OnMouseMoveItem;
  pnlNFSe.OnMouseLeave := OnMouseLeaveItem;
  pnlNFCe.OnMouseMove  := OnMouseMoveItem;
  pnlNFCe.OnMouseLeave := OnMouseLeaveItem;
end;

procedure TFormMenuEmissaoFiscal.FormMouseLeave(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

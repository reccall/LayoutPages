unit ConhecFrete.Forms.Cte.CardsInicio;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormCardsInicio = class(TFormDefault)
    pnlPrincipalTop: TPanel;
    pnlNFeB: TPanel;
    pnlNFCeB: TPanel;
    pnlCteB: TPanel;
    pnlNFSeB: TPanel;
    pnlNFe: TPanel;
    pnlNFCe: TPanel;
    pnlCte: TPanel;
    pnlNFSe: TPanel;
    pnlMain: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFormCardsInicio.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlNFe,20);
  MakeRounded(pnlNFeB,20);
  MakeRounded(pnlNFSe,20);
  MakeRounded(pnlNFSeB,20);
  MakeRounded(pnlNFCe,20);
  MakeRounded(pnlNFCeB,20);
  MakeRounded(pnlCte,20);
  MakeRounded(pnlCteB,20);
end;

end.

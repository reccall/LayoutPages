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
  ,ConhecFrete.Controller.MenuEmissaoFiscal
  ,ConhecFrete.Model.Types.Constantes
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerMenuEmissaoFiscal;
    constructor Create(pArrayForms :array of TForm);
  end;

implementation

{$R *.dfm}

constructor TFormMenuEmissaoFiscal.Create(pArrayForms :array of TForm);
begin
  pArrayForms[Ord(tpMenuEmissaoFiscal)] := Self;
  Inherited Create(nil);
  FController := TControllerMenuEmissaoFiscal.New(aFormsCte);
end;

procedure TFormMenuEmissaoFiscal.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

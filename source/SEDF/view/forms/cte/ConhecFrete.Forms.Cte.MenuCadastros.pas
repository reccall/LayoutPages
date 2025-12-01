unit ConhecFrete.Forms.Cte.MenuCadastros;

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
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.MenuCadastros
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormMenuCadastros = class(TFormDefault)
    pnlProdutos: TPanel;
    pnlRightNFe: TPanel;
    pnlServicos: TPanel;
    pnlRightNFCe: TPanel;
    pnlMarcas: TPanel;
    pnlRightCte: TPanel;
    pnlUnidMedida: TPanel;
    pnlRightNFSe: TPanel;
    pnlClientes: TPanel;
    Panel2: TPanel;
    pnlFornec: TPanel;
    Panel4: TPanel;
    pnlTransp: TPanel;
    Panel6: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FControl :Integer;
    FController :IControllerMenuCadastros;

    constructor Create(pArrayForms :array of TForm); reintroduce;
    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TFormMenuCadastros.Create(pArrayForms: array of TForm);
begin
  pArrayForms[Ord(tpMenuCadastros)] := Self;
  inherited Create(nil);
  FController := TControllerMenuCadastros.New(pArrayForms);
end;

procedure TFormMenuCadastros.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

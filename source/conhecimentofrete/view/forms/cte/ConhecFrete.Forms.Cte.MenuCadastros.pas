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
    procedure FormCreate(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    FControl :Integer;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormMenuCadastros.FormCreate(Sender: TObject);
begin
  FControl := 0;
  inherited;
  pnlMarcas.OnMouseMove      := OnMouseMoveItem;
  pnlMarcas.OnMouseLeave     := OnMouseLeaveItem;
  pnlFornec.OnMouseMove      := OnMouseMoveItem;
  pnlFornec.OnMouseLeave     := OnMouseLeaveItem;
  pnlTransp.OnMouseMove      := OnMouseMoveItem;
  pnlTransp.OnMouseLeave     := OnMouseLeaveItem;
  pnlProdutos.OnMouseMove    := OnMouseMoveItem;
  pnlProdutos.OnMouseLeave   := OnMouseLeaveItem;
  pnlServicos.OnMouseMove    := OnMouseMoveItem;
  pnlServicos.OnMouseLeave   := OnMouseLeaveItem;
  pnlClientes.OnMouseMove    := OnMouseMoveItem;
  pnlClientes.OnMouseLeave   := OnMouseLeaveItem;
  pnlUnidMedida.OnMouseMove  := OnMouseMoveItem;
  pnlUnidMedida.OnMouseLeave := OnMouseLeaveItem;
end;

procedure TFormMenuCadastros.FormMouseLeave(Sender: TObject);
begin
  inherited;
  if FControl = 1 then
  begin
    Close;
    FControl := 0;
  end;
  Inc(FControl);
end;

end.

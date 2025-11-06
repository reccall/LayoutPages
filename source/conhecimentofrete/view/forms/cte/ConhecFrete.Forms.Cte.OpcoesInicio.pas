unit ConhecFrete.Forms.Cte.OpcoesInicio;

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
  ,Vcl.ExtCtrls
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmCteOpcoesInicio = class(TFormDefault)
    pnlBackButtons: TPanel;
    pnlBtnClienteB: TPanel;
    lblSit: TLabel;
    pnlLineInfo: TPanel;
    pnlBtnCliente: TPanel;
    pnlBtnRegiaoB: TPanel;
    pnlBtnRegiao: TPanel;
    pnlBtnUFGlobB: TPanel;
    pnlBtnUFGlob: TPanel;
    pnlBtnSimplificadoB: TPanel;
    pnlBtnSimplificado: TPanel;
    pnlBtnSituCarregB: TPanel;
    pnlBtnSituCarreg: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmCteOpcoesInicio.FormShow(Sender: TObject);
begin
  Inherited;
  MakeRounded(pnlBtnCliente,10);
  MakeRounded(pnlBtnClienteB,10);
  MakeRounded(pnlBtnRegiao,10);
  MakeRounded(pnlBtnRegiaoB,10);
  MakeRounded(pnlBtnUFGlob,10);
  MakeRounded(pnlBtnUFGlobB,10);
  MakeRounded(pnlBtnSimplificado,10);
  MakeRounded(pnlBtnSimplificadoB,10);
  MakeRounded(pnlBtnSituCarreg,10);
  MakeRounded(pnlBtnSituCarregB,10);

  pnlBtnRegiao.OnMouseMove        := OnMouseMoveItem;
  pnlBtnRegiao.OnMouseLeave       := OnMouseLeaveItem;
  pnlBtnUFGlob.OnMouseMove        := OnMouseMoveItem;
  pnlBtnUFGlob.OnMouseLeave       := OnMouseLeaveItem;
  pnlBtnCliente.OnMouseMove       := OnMouseMoveItem;
  pnlBtnCliente.OnMouseLeave      := OnMouseLeaveItem;
  pnlBtnSituCarreg.OnMouseMove    := OnMouseMoveItem;
  pnlBtnSituCarreg.OnMouseLeave   := OnMouseLeaveItem;
  pnlBtnSimplificado.OnMouseMove  := OnMouseMoveItem;
  pnlBtnSimplificado.OnMouseLeave := OnMouseLeaveItem;
end;

end.

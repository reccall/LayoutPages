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
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.OpcoesInicio
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
    FController :TControllerOpcoesCte;
    constructor Create(pArrayForms :array of TForm);

  end;

implementation

{$R *.dfm}

constructor TfrmCteOpcoesInicio.Create(pArrayForms :array of TForm);
begin
  pArrayForms[IndexSelf] := Self;
  inherited Create(nil);
  FController := TControllerOpcoesCte.Create(pArrayForms);
end;

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
  FController.Iniciar;
end;

end.

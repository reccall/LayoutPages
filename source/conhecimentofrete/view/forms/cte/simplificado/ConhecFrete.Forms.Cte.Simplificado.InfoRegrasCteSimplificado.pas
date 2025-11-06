unit ConhecFrete.Forms.Cte.Simplificado.InfoRegrasCteSimplificado;

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
  ,DateUtils;

type
  TfrmCteSimplificadoInfoRegras = class(TForm)
    pnlMainRegra: TPanel;
    lblTituloRegra: TLabel;
    lblItem1: TLabel;
    lblItem1_1: TLabel;
    lblItem2: TLabel;
    lblItem2_1: TLabel;
    lblItem3: TLabel;
    lblItem3_1: TLabel;
    lblItem5: TLabel;
    lblItem5_1: TLabel;
    pnlBackOk: TPanel;
    pnlOK: TPanel;
    lblfonte: TLabel;
    pnlLinePrinc: TPanel;
    procedure FormShow(Sender: TObject);
    procedure pnlMainRegraMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure MakeRounded(Control :TWinControl; pSize :Integer);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCteSimplificadoInfoRegras }

procedure TfrmCteSimplificadoInfoRegras.FormShow(Sender: TObject);
begin
  MakeRounded(Self, 10);
  MakeRounded(pnlOK, 10);
  MakeRounded(pnlBackOk, 10);
  MakeRounded(pnlMainRegra, 10);
  lblfonte.Caption := FOrmat('Gerado pelo Google Gemini - %d',[YearOf(Now)]);
end;

procedure TfrmCteSimplificadoInfoRegras.MakeRounded(Control: TWinControl;
  pSize: Integer);
var
  R :TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom,pSize,pSize);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r,-5,-5);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TfrmCteSimplificadoInfoRegras.pnlMainRegraMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.

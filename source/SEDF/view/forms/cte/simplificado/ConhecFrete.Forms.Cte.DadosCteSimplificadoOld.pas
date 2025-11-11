unit ConhecFrete.Forms.Cte.DadosCteSimplificadoOld;

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
  ,Vcl.Mask
  ,Vcl.DBCtrls
  ,Vcl.ExtCtrls
  ,Data.DB
  ,PesquisarEditButton
  ,cxGraphics
  ,cxControls
  ,cxLookAndFeels
  ,cxLookAndFeelPainters
  ,cxContainer
  ,cxEdit
  ,cxTextEdit
  ,RxDBCtrl
  ,RxToolEdit
  ,RxCurrEdit
  ,JvExMask
  ,JvToolEdit
  ,JvDBControls;

type
  TfrmCteSimplificadoDadosCte = class(TForm)
    lblFilialTransp: TLabel;
    cmbFilialTransp: TDBLookupComboBox;
    lblDtEmissao: TLabel;
    lblDados: TLabel;
    pnlLineDados: TPanel;
    DtEmissao: TDateEdit;
    cmbTipoServ: TComboBox;
    lblTipoServico: TLabel;
    lblVlFreteSimb: TLabel;
    lblDadosFinan: TLabel;
    pesqCobranca: TPesquisarEditButton;
    edtVlFreteSimb: TCurrencyEdit;
    pnlLineFinan: TPanel;
    DtVencFat: TDateEdit;
    lblDtvencFat: TLabel;
    edtPercFrete: TCurrencyEdit;
    lblPercFrete: TLabel;
    pnlMultiplos: TPanel;
    lblMult: TLabel;
    lblUF: TLabel;
    pnlBackDest: TPanel;
    pnlDest: TPanel;
    pnlBackRemet: TPanel;
    pnlReme: TPanel;
    pnlLineMulti: TPanel;
    cbbUF: TComboBox;
    edtNumCar: TCurrencyEdit;
    lblCarregamento: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure MakeRounded(Control :TWinControl; pSize :Integer);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCteSimplificadoDadosCte }

procedure TfrmCteSimplificadoDadosCte.FormShow(Sender: TObject);
begin
  MakeRounded(pnlDest, 10);
  MakeRounded(pnlBackDest, 10);
  MakeRounded(pnlReme, 10);
  MakeRounded(pnlBackRemet, 10);
end;

procedure TfrmCteSimplificadoDadosCte.MakeRounded(Control: TWinControl;
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

end.

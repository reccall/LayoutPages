unit ConhecFrete.Forms.Cte.BotoesSimulacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmCteBotoesSimulacao = class(TForm)
    pnlBtnLeft: TPanel;
    pnlLineDados: TPanel;
    pnlBackSimular: TPanel;
    pnlSimular: TPanel;
    pnlBackNovo: TPanel;
    pnlNovo: TPanel;
    pnlBackNfe: TPanel;
    pnlNFe: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MakeRounded(Control :TWinControl; pSize :Integer);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCteBotoesSimulacao }

procedure TfrmCteBotoesSimulacao.FormShow(Sender: TObject);
begin
  MakeRounded(pnlNovo, 10);
  MakeRounded(pnlBackNovo, 10);
  MakeRounded(pnlSimular, 10);
  MakeRounded(pnlBackSimular, 10);
  MakeRounded(pnlBackNfe, 10);
  MakeRounded(pnlNFe, 10);
end;

procedure TfrmCteBotoesSimulacao.MakeRounded(Control: TWinControl; pSize: Integer);
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

{*************************************************}
{                                                 }
{                     Winthor                     }
{                                                 }
{ Form que compões os componentes para            }
{ definir as regras para gerar o CTe Simplificado }
{ Autor: Luiz Fernando Cândido Machado            }
{ Data: 15/10/2025                                }
{*************************************************}

unit ConhecFrete.Forms.Cte.RegrasCteSimplificadoOld;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxRadioGroup,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxCheckBox;

type
  TfrmDefinirRegrasCte = class(TForm)
    dsNfeCarragamento: TDataSource;
    pnlMainTop: TPanel;
    pnlTop: TPanel;
    lblTitulo: TLabel;
    lblRem: TLabel;
    grpPrincipais: TGroupBox;
    lblRemNome: TLabel;
    lblDestNome: TLabel;
    pnlLinePrinc: TPanel;
    pnlMainBottom: TPanel;
    cxGridNfe: TcxGrid;
    cxGridNfeDBTableView1: TcxGridDBTableView;
    cxGridNfeDBTableView1Column2: TcxGridDBColumn;
    cxGridNfeDBTableView1Column3: TcxGridDBColumn;
    cxGridNfeLevel1: TcxGridLevel;
    pnlTopRight: TPanel;
    lblDest: TLabel;
    pnlBackInfoReg: TPanel;
    pnlInfoRegrasCteSimp: TPanel;
    cxGridNfeDBTableView1Column1: TcxGridDBColumn;
    cxGridNfeDBTableView1Column4: TcxGridDBColumn;
    cxGridNfeDBTableView1Column5: TcxGridDBColumn;
    cxGridNfeDBTableView1Column6: TcxGridDBColumn;
    cxGridNfeDBTableView1Column7: TcxGridDBColumn;
    cxGridNfeDBTableView1Column8: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MakeRounded(Control :TWinControl; pSize :Integer);
  public
    FNumTransacaoPrincipal :Double;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmDefinirRegrasCte }

procedure TfrmDefinirRegrasCte.FormShow(Sender: TObject);
begin
  MakeRounded(pnlBackInfoReg,10);
  MakeRounded(pnlInfoRegrasCteSimp,10);
end;

procedure TfrmDefinirRegrasCte.MakeRounded(Control: TWinControl;
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

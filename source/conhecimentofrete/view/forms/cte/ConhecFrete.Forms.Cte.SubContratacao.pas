unit ConhecFrete.Forms.Cte.SubContratacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxTextEdit, PesquisarEditButton;

type
  TfrmCteSimplificadoSubContratacao = class(TForm)
    scrlbxBackground: TScrollBox;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl14: TLabel;
    lbl13: TLabel;
    lbl15: TLabel;
    lbl17: TLabel;
    lbl16: TLabel;
    lbl9: TLabel;
    psqExpedidor: TPesquisarEditButton;
    psqRecebedor: TPesquisarEditButton;
    rgTipoPrestacao: TRadioGroup;
    edtChaveCteRef: TEdit;
    edtRazaoSocialCteRef: TEdit;
    edtCNPJCteRef: TEdit;
    edtIECteRef: TEdit;
    edtSerieDocCteRef: TEdit;
    edtSubSerieDocCteRef: TEdit;
    edtNumDocCteRef: TEdit;
    edtUFDocCteRef: TEdit;
    lblDados: TLabel;
    pnlLineDados: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

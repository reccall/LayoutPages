unit ConhecFrete.Forms.Cte.Parametros;

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
  ,LayoutPages.View.Forms.FormDefault
  ,ConhecFrete.Controller.Parametros;

type
  TfrmCteParametros = class(TFormDefault)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlparams_cb_percfreteregiao: TPanel;
    pnlparams_cb_tipofretedespacho: TPanel;
    pnlparams_cbTributFilVenda: TPanel;
    pnlparams_chbCalcPorKG: TPanel;
    pnlparams_chbGerarTransf: TPanel;
    pnlparams_chbGerConhecNFvirtualCliente: TPanel;
    pnlparams_chbInformaDadosPedagio: TPanel;
    pnlparams_chkReducaoBaseIcmsPorCliente: TPanel;
    pnlparams_ckbUtilizarEndEntPed: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerParametros;
  end;

implementation

{$R *.dfm}

procedure TfrmCteParametros.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerParametros.New(Self);
end;

procedure TfrmCteParametros.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

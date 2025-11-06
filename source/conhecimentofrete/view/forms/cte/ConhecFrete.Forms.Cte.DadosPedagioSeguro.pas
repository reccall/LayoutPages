unit ConhecFrete.Forms.Cte.DadosPedagioSeguro;

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
  ,LayoutPages.View.Forms.FormDefault
  ,ConhecFrete.Controller.DadosPedagioSeguro;

type
  TfrmDadosPedagioSeguro = class(TFormDefault)
    pnlMain: TPanel;
    pnlDadosSeguro: TPanel;
    pnlTopSeguro: TPanel;
    pnlRespSeguro: TPanel;
    pnlNumApSeguro: TPanel;
    pnlNomeSeg: TPanel;
    pnlCNPJSeg: TPanel;
    pnlNumAverbacao: TPanel;
    pnlDadosPedagio: TPanel;
    pnlTopPedagio: TPanel;
    pnlNumComprovanteCmp: TPanel;
    pnlCNPJRespPgto: TPanel;
    pnlValorValePredagio: TPanel;
    pnlCNPJEmpFornecValePedagio: TPanel;
    pnlMsmCNPJFilial: TPanel;
    pnlValorAverb: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerDadosPedagioSeguro;
  end;

implementation

{$R *.dfm}

procedure TfrmDadosPedagioSeguro.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerDadosPedagioSeguro.New(Self);
end;

procedure TfrmDadosPedagioSeguro.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

unit ConhecFrete.Forms.Cte.Simplificado.DadosCte;

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
  ,ConhecFrete.Controller.SimplificadoDadosCte
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmSimplificadoDadosCte = class(TFormDefault)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlTipoServico: TPanel;
    pnlDtEmissao: TPanel;
    pnlFilialTransporte: TPanel;
    pnlEdtCarreg: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerSimplificadoDadosCte;
  end;

implementation

{$R *.dfm}

procedure TfrmSimplificadoDadosCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerSimplificadoDadosCte.New(Self);
end;

procedure TfrmSimplificadoDadosCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

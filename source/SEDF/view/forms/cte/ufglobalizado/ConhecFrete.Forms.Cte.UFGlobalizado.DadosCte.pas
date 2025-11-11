unit ConhecFrete.Forms.Cte.UFGlobalizado.DadosCte;

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
  ,ConhecFrete.Controller.UFGlobalizadoDadosCte
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmUFGlobalizadoDadosCte = class(TFormDefault)
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
    FController :IControllerUFGlobalizadoDadosCte;
  end;

implementation

{$R *.dfm}

procedure TfrmUFGlobalizadoDadosCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerUFGlobalizadoDadosCte.New(Self);
end;

procedure TfrmUFGlobalizadoDadosCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

unit ConhecFrete.Forms.Cte.RegiaoDadosCte;

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
  ,ConhecFrete.Controller.RegiaoDadosCte
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmRegiaoDadosCte = class(TFormDefault)
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
    FController :IControllerRegiaoDadosCte;
  end;

implementation

{$R *.dfm}

procedure TfrmRegiaoDadosCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerRegiaoDadosCte.New(Self);
end;

procedure TfrmRegiaoDadosCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

unit ConhecFrete.Forms.Cte.Tomador;

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
  ,ConhecFrete.Controller.Tomador
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmTomador = class(TFormDefault)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlEditPesq: TPanel;
    pnlEdtCNPJ: TPanel;
    pnlInscEstadual: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerTomador;
  end;

implementation

{$R *.dfm}

procedure TfrmTomador.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerTomador.New(Self);
end;

procedure TfrmTomador.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

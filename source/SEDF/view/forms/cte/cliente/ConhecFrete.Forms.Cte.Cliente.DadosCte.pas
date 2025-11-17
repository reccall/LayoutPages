unit ConhecFrete.Forms.Cte.Cliente.DadosCte;

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
  ,ConhecFrete.Controller.ClienteDadosCte
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmClienteDadosCte = class(TFormDefault)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlEdtCarreg: TPanel;
    pnlTipoServico: TPanel;
    pnlFilialTransporte: TPanel;
    pnlDtEmissao: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerLayoutDadosCte;
  end;

implementation

{$R *.dfm}

procedure TfrmClienteDadosCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerLayoutDadosCte.New(Self);
end;

procedure TfrmClienteDadosCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

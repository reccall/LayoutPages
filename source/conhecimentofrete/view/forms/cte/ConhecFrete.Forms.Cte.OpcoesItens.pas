unit ConhecFrete.Forms.Cte.OpcoesItens;

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
  ,ConhecFrete.Controller.OpcoesItens
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormOpcoesItensCte = class(TFormDefault)
    pnlBackGround: TPanel;
    pnlDadosCteG: TPanel;
    pnlTomadorG: TPanel;
    pnlMotoristaG: TPanel;
    pnlDadosSeg: TPanel;
    Panel13: TPanel;
    pnlDadosCteB: TPanel;
    pnlDadosCte: TPanel;
    pnlTomadorB: TPanel;
    pnlTomador: TPanel;
    pnlMotoristaB: TPanel;
    pnlMotorista: TPanel;
    pnlDadosSeguroCteB: TPanel;
    pnlDadosSeguroCte: TPanel;
    pnlParametrosCteB: TPanel;
    pnlParametrosCte: TPanel;
    pnlMain: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerOpcoesItens;
  end;

implementation

{$R *.dfm}

procedure TFormOpcoesItensCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerOpcoesItens.New(Self);
end;

procedure TFormOpcoesItensCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

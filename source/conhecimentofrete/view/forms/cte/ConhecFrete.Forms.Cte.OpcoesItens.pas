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
  MakeRounded(pnlTomador,10);
  MakeRounded(pnlTomadorB,10);
  MakeRounded(pnlTomadorG,10);
  MakeRounded(pnlDadosCte,10);
  MakeRounded(pnlDadosCteB,10);
  MakeRounded(pnlDadosCteG,10);
  MakeRounded(pnlMotorista,10);
  MakeRounded(pnlMotoristaB,10);
  MakeRounded(pnlMotoristaG,10);
  MakeRounded(pnlParametrosCte,10);
  MakeRounded(pnlParametrosCteB,10);
  MakeRounded(pnlDadosSeg,10);
  MakeRounded(pnlDadosSeguroCte,10);
  MakeRounded(pnlDadosSeguroCteB,10);
  FController.Iniciar;
end;

end.

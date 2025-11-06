unit ConhecFrete.View.Componentes.OpcoesGerarCte;

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
  ,ConhecFrete.Controller.BotoesBarraOpcoes
  ,LayoutPages.View.Componentes.BotoesBarraOpcoes;

type
  TCmpOpcoesGerarCte = class(TCmpBotoesBarra)
    pnlLineBotoes: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerBotoesBarraOpcoes;
  end;

implementation

{$R *.dfm}

procedure TCmpOpcoesGerarCte.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerBotoesBarraOpcoes.New(Self);
end;

procedure TCmpOpcoesGerarCte.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

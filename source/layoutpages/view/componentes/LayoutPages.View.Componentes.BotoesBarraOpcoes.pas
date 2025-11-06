unit LayoutPages.View.Componentes.BotoesBarraOpcoes;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpBotoesBarra = class(TFormDefault)
    pnlBackGround: TPanel;
    pnlInicioB: TPanel;
    pnlInicio: TPanel;
    pnlGerarCteB: TPanel;
    pnlGerarCte: TPanel;
    pnlSimuB: TPanel;
    pnlSimu: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpBotoesBarra.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlInicio,10);
  MakeRounded(pnlInicioB,10);
  MakeRounded(pnlSimu,10);
  MakeRounded(pnlSimuB,10);
  MakeRounded(pnlGerarCte,10);
  MakeRounded(pnlGerarCteB,10);
end;

end.

unit ConhecFrete.Forms.Cte.MenuPrincipal;

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
  ,ConhecFrete.Controller.MenuCte
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormMenuPrincipal = class(TFormDefault)
    pnlBackMenu: TPanel;
    pnlBackCad: TPanel;
    pnlCadastros: TPanel;
    pnlBackEmissor: TPanel;
    pnlEmissor: TPanel;
    pnlBackCertificadoDig: TPanel;
    pnlCertificadoDig: TPanel;
    pnlBackRelatorios: TPanel;
    pnlRelatorios: TPanel;
    pnlBackTutorial: TPanel;
    pnlTutorial: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerMenuCte;
  end;

implementation

{$R *.dfm}

procedure TFormMenuPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerMenuCte.New(Self);
end;

procedure TFormMenuPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlCadastros,10);
  MakeRounded(pnlBackCad,10);
  MakeRounded(pnlEmissor,10);
  MakeRounded(pnlBackEmissor,10);
  MakeRounded(pnlTutorial,10);
  MakeRounded(pnlBackTutorial,10);
  MakeRounded(pnlRelatorios,10);
  MakeRounded(pnlBackRelatorios,10);
  MakeRounded(pnlCertificadoDig,10);
  MakeRounded(pnlBackCertificadoDig,10);

  FController.Iniciar;
end;

end.

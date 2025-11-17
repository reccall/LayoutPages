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
  ,ConhecFrete.Model.Types.Constantes
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
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerMenuCte;
    constructor Create(pArrayForms :array of TForm);
  end;

implementation

{$R *.dfm}

constructor TFormMenuPrincipal.Create(pArrayForms :array of TForm);
begin
  pArrayForms[Ord(tpMenuPrincipal)] := Self;
  Inherited Create(nil);
  FController := TControllerMenuCte.New(pArrayForms);
end;

procedure TFormMenuPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

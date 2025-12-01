unit ConhecFrete.Forms.Cte.MenuItensImagens;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.Variants
  ,System.Classes
  ,System.ImageList
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.Dialogs
  ,Vcl.ExtCtrls
  ,Vcl.ImgList
  ,dxGDIPlusClasses
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.MenuItensImagens
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormMenuItensImagens = class(TFormDefault)
    pnlBackground: TPanel;
    pnlBackRight: TPanel;
    pnlTutorial: TPanel;
    ImgTutorial: TImage;
    pnlEmissaoFiscal: TPanel;
    ImgEmissaoFiscal: TImage;
    pnlCad: TPanel;
    ImgCadastros: TImage;
    pnlRelatorios: TPanel;
    ImgRelatorios: TImage;
    pnlCertDigital: TPanel;
    ImgCertDigital: TImage;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerMenuItensImagens;
    constructor Create(pArrayForms :array of TForm);  reintroduce;
  end;

implementation

{$R *.dfm}

{ TFormMenuItensImagens }

constructor TFormMenuItensImagens.Create(pArrayForms: array of TForm);
begin
  pArrayForms[Ord(tpMenuItensImagens)] := Self;
  Inherited Create(nil);
  FController := TControllerMenuItensImagens.New(aFormsCte);
end;

procedure TFormMenuItensImagens.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

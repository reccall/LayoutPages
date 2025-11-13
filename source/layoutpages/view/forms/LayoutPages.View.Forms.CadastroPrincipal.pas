unit LayoutPages.View.Forms.CadastroPrincipal;

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
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormCadastrosPrincipal = class(TFormDefault)
    pnlCadTop: TPanel;
    pnlMainCadastros: TPanel;
    pnlTopMainCad: TPanel;
    scrlbxMain: TScrollBox;
    pnlCadTopRight: TPanel;
    pnlCadTopRightBtns: TPanel;
    pnlConsulta: TPanel;
    imgLupa: TImage;
    lblConsulta: TLabel;
    pnlIncluirRegistro: TPanel;
    lblInserir: TLabel;
    Image1: TImage;
    lblCodigo: TLabel;
    lblDesc: TLabel;
    lblVl: TLabel;
    lblAtivo: TLabel;
    pnlRegiaoPesq: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

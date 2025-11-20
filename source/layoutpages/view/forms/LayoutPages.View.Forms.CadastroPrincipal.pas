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
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,Vcl.ExtCtrls
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormCadastrosPrincipal = class(TFormDefault)
    pnlBackMain: TPanel;
    pnlCadTop: TPanel;
    pnlMain: TPanel;
    pnlConsulta: TPanel;
    lblConsulta: TLabel;
    pnlRegiaoPesq: TPanel;
    pnlIncluirRegistro: TPanel;
    lblInserir: TLabel;
    Image1: TImage;
    imgLupa: TImage;
    pnlMainBottom: TPanel;
    pnlControlGrid: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
     FPosition :Integer;
  end;

implementation

{$R *.dfm}

end.

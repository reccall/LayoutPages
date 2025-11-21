unit LayoutPages.View.Componentes.CabecalhoCadastroPrincipal;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.StrUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Dialogs
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpCabCadastros = class(TFormDefault)
    pnlCadTop: TPanel;
    pnlConsulta: TPanel;
    lblConsulta: TLabel;
    pnlRegiaoPesq: TPanel;
    imgLupa: TImage;
    pnlIncluirRegistro: TPanel;
    lblInserir: TLabel;
    Image1: TImage;
    pnlControlGrid: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

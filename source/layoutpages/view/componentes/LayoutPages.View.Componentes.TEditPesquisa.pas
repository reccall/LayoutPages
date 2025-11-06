unit LayoutPages.View.Componentes.TEditPesquisa;

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
  ,dxGDIPlusClasses
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpTEditPesquisa = class(TFormDefault)
    pnlEdtDefault: TPanel;
    pnlTopTitulo: TPanel;
    lblTitulo: TLabel;
    pnlEdtBuscaFundo: TPanel;
    pnlBackImg: TPanel;
    pnlImg: TPanel;
    imgLupa: TImage;
    pnlEdtB: TPanel;
    pnlEdt: TPanel;
    edtDefault: TEdit;
    pnlEdtPesqB: TPanel;
    pnlEdtPesq: TPanel;
    edtPesq: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpTEditPesquisa.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlEdt,10);
  MakeRounded(pnlEdtB,10);
  MakeRounded(pnlImg,10);
  MakeRounded(pnlBackImg,10);
  MakeRounded(pnlEdtPesq,10);
  MakeRounded(pnlEdtPesqB,10);
end;

end.

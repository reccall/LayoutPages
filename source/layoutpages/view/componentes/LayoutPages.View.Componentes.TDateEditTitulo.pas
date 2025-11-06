unit LayoutPages.View.Componentes.TDateEditTitulo;

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
  ,Vcl.Mask
  ,RxToolEdit
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpTDateEdiTitulo = class(TFormDefault)
    pnlBackComponente: TPanel;
    pnlEdt: TPanel;
    pnlTopTitulo: TPanel;
    lblTitulo: TLabel;
    pnlEdtB: TPanel;
    pnlEdtBack: TPanel;
    DtEmissao: TDateEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpTDateEdiTitulo.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(DtEmissao,10);
  MakeRounded(pnlEdt,10);
  MakeRounded(pnlEdtB,10);
  MakeRounded(pnlEdtBack,10);
end;

end.

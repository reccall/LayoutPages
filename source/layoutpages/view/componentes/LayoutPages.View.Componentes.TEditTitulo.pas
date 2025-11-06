unit LayoutPages.View.Componentes.TEditTitulo;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpTEditTItulo = class(TFormDefault)
    pnlBackComponente: TPanel;
    pnlEdt: TPanel;
    pnlTopTitulo: TPanel;
    lblTitulo: TLabel;
    pnlEdtB: TPanel;
    pnlEdtBack: TPanel;
    edtDefault: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpTEditTItulo.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(edtDefault,10);
  MakeRounded(pnlEdt,10);
  MakeRounded(pnlEdtB,10);
  MakeRounded(pnlEdtBack,10);
end;

end.

unit LayoutPages.View.Componentes.TComboboxTitulo;

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
  TCmpTComboboxTitulo = class(TFormDefault)
    pnlTopTitulo: TPanel;
    lblTitulo: TLabel;
    pnlEdtB: TPanel;
    pnlEdtBack: TPanel;
    cbbItens: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpTComboboxTitulo.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(cbbItens,10);
  MakeRounded(pnlEdtB,10);
  MakeRounded(pnlEdtBack,10);
end;

end.

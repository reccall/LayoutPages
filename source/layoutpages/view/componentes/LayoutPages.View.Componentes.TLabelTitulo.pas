unit LayoutPages.View.Componentes.TLabelTitulo;

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
  TCmpTLabelTitulo = class(TFormDefault)
    pnlBackground: TPanel;
    pnlLine: TPanel;
    lblTitulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

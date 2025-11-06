unit LayoutPages.View.Componentes.TCheckbox;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpCheckBox = class(TFormDefault)
    pnlBackComponente: TPanel;
    chkDefault: TCheckBox;
    lblCheck: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

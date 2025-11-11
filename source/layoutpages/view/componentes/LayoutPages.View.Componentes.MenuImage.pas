unit LayoutPages.View.Componentes.MenuImage;

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
  TCmpMenuImage = class(TFormDefault)
    Image1: TImage;
    lblMenu: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

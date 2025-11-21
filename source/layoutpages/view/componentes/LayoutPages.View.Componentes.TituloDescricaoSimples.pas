unit LayoutPages.View.Componentes.TituloDescricaoSimples;

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
  TCmpTituloDescSimples = class(TFormDefault)
    lblAtivo: TLabel;
    lblDesc: TLabel;
    lblCodigo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

unit LayoutPages.View.Forms.LoadingCSS;

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
  ,Vcl.OleCtrls
  ,SHDocVw
  ,LayoutPages.View.Forms.FormDefault;

type
  TFormLoadCSS = class(TFormDefault)
    WebBrowser1: TWebBrowser;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  ConhecFrete.Model.Types.Constantes;

{$R *.dfm}

procedure TFormLoadCSS.FormCreate(Sender: TObject);
begin
  inherited;
  WebBrowser1.Navigate('C:\loadingpages\index.html');
end;

end.

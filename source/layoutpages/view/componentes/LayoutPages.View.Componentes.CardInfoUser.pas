unit LayoutPages.View.Componentes.CardInfoUser;

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
  ,LayoutPages.View.Forms.FormDefault
  ,Vcl.StdCtrls
  ,Vcl.ExtCtrls;

type
  TCmpCardInfoUser = class(TFormDefault)
    lblUserName: TLabel;
    pnlUser: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TCmpCardInfoUser.FormShow(Sender: TObject);
begin
  MakeRounded(pnlUser,100);
  inherited;
end;

end.

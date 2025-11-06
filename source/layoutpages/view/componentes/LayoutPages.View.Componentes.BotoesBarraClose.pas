unit LayoutPages.View.Componentes.BotoesBarraClose;

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
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpBotoesBarraClose = class(TFormDefault)
    pnlBackGround: TPanel;
    pnlSairB: TPanel;
    pnlSair: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpBotoesBarraClose.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(pnlSair,10);
  MakeRounded(pnlSairB,10);
end;

end.

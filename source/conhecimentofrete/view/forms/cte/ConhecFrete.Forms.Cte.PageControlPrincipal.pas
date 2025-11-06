unit ConhecFrete.Forms.Cte.PageControlPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  LayoutPages.View.Forms.DefaultPageControlTemplate, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.ComCtrls, LayoutPages.View.Forms.DefaultTemplate;

type
  TFormCtePageControlPrincipal = class(TFormDefaultPageControlTemplate)
    pnlInfoUserB: TPanel;
    pnlInfoUser: TPanel;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalTemplates :TFormDefaultPageControlTemplate;


implementation

{$R *.dfm}

end.

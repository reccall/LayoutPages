unit ConhecFrete.View.Componentes.TopLogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LayoutPages.View.Forms.FormDefault,
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TCmpTopLogo = class(TFormDefault)
    pnlLogo: TPanel;
    Image1: TImage;
    pnlLineOpcoes: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

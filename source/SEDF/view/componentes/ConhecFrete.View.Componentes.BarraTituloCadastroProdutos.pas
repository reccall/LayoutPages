unit ConhecFrete.View.Componentes.BarraTituloCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LayoutPages.View.Forms.FormDefault,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCmpBarraTituloCadastroProdutos = class(TFormDefault)
    lblAtivo: TLabel;
    lblVl: TLabel;
    lblDesc: TLabel;
    lblCodigo: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpBarraTituloCadastroProdutos.FormShow(Sender: TObject);
begin
  inherited;
  MakeRounded(Self,10);
end;

end.

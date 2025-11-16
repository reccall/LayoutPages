unit ConhecFrete.Forms.Cte.CadastroProdutos;

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
 ,Vcl.AppEvnts
 ,dxGDIPlusClasses
 ,ConhecFrete.Model.Types.Constantes
 ,ConhecFrete.Controller.Cadastros.Produtos
 ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosProdutos = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosProdutos;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosProdutos }

constructor TFormCadastrosProdutos.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroProduto)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosProdutos.New(pArrayFormsCte)
end;

procedure TFormCadastrosProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

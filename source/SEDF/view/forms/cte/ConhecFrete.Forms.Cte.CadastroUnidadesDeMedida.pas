unit ConhecFrete.Forms.Cte.CadastroUnidadesDeMedida;

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
  ,Vcl.AppEvnts
  ,Vcl.ExtCtrls
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.Cadastros.UnidadesDeMedida
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosUnidadesDeMedida = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosUnidadesDeMedida;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosUnidadesDeMedida }

constructor TFormCadastrosUnidadesDeMedida.Create(
  pArrayFormsCte: array of TForm);
begin
   pArrayFormsCte[Ord(tpCadastroUnidadesDeMedida)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosUnidadesDeMedida.New(pArrayFormsCte);
end;

procedure TFormCadastrosUnidadesDeMedida.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

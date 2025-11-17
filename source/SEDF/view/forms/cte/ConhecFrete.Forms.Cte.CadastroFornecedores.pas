unit ConhecFrete.Forms.Cte.CadastroFornecedores;

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
  ,ConhecFrete.Controller.Cadastros.Fornecedores
  ,ConhecFrete.Model.Types.Constantes
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosFornecedores = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosFornecedores;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosFornecedores }

constructor TFormCadastrosFornecedores.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroFornecedores)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosFornecedores.New(pArrayFormsCte);
end;

procedure TFormCadastrosFornecedores.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

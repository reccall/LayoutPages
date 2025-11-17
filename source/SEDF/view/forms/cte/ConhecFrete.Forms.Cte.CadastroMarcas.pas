unit ConhecFrete.Forms.Cte.CadastroMarcas;

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
  ,ConhecFrete.Controller.Cadastros.Marcas
  ,ConhecFrete.Model.Types.Constantes
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosMarcas = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosMarcas;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosMarcas }

constructor TFormCadastrosMarcas.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroMarcas)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosMarcas.New(pArrayFormsCte);
end;

procedure TFormCadastrosMarcas.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

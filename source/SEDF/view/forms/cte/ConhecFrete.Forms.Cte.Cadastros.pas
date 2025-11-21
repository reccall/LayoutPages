unit ConhecFrete.Forms.Cte.Cadastros;

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
  ,ConhecFrete.Controller.Cadastros
  ,ConhecFrete.Model.Types.Constantes
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCteCadastros = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastros;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCteCadastros }

constructor TFormCteCadastros.Create(pArrayFormsCte :array of TForm);
begin
  pArrayFormsCte[Ord(tpCteCadastros)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastros.New(pArrayFormsCte);
end;

procedure TFormCteCadastros.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

unit ConhecFrete.Forms.Cte.CadastroServicos;

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
  ,ConhecFrete.Controller.Cadastros.Servicos
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosServicos = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosServicos;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosServicos }

constructor TFormCadastrosServicos.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroServicos)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosServicos.New(pArrayFormsCte);
end;

procedure TFormCadastrosServicos.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar
end;

end.

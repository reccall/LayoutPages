unit ConhecFrete.Forms.Cte.CadastroClientes;

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
  ,ConhecFrete.Controller.Cadastros.Clientes
  ,ConhecFrete.Model.Types.Constantes
  ,LayoutPages.View.Forms.CadastroPrincipal;

type
  TFormCadastrosClientes = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosClientes;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosClientes }

constructor TFormCadastrosClientes.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroClientes)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosClientes.New(pArrayFormsCte);
end;

procedure TFormCadastrosClientes.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

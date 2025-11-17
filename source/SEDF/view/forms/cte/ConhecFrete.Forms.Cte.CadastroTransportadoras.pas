unit ConhecFrete.Forms.Cte.CadastroTransportadoras;

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
  ,LayoutPages.View.Forms.CadastroPrincipal
  ,ConhecFrete.Controller.Cadastros.Transportadoras;

type
  TFormCadastrosTransportadoras = class(TFormCadastrosPrincipal)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerCadastrosTransportadoras;
    constructor Create(pArrayFormsCte :array of TForm); overload;
  end;

implementation

{$R *.dfm}

{ TFormCadastrosTransportadoras }

constructor TFormCadastrosTransportadoras.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCadastroTransportadoras)] := Self;
  Inherited Create(nil);
  FController := TControllerCadastrosTransportadoras.New(pArrayFormsCte);
end;

procedure TFormCadastrosTransportadoras.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

unit LayoutPages.View.Forms.PesquisaNaoEcontrada;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.StrUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Dialogs
  ,Vcl.StdCtrls
  ,LayoutPages.View.Forms.FormDefault
  ,ConhecFrete.Controller.PesquisaNaoEncontrada, dxGDIPlusClasses;

type
  TFormPesquisaNaoEncontrada = class(TFormDefault)
    lblInfo: TLabel;
    lblPesquisa: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerPesquisaNaoEncontrada;
    constructor Create(pArrayFormsCte :array of TForm);

  end;

implementation

uses
   ConhecFrete.Model.Types.Constantes;

{$R *.dfm}

{ TFormPesquisaNaoEncontrada }

constructor TFormPesquisaNaoEncontrada.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpFormPesqNaoEncontrada)] := Self;
  Inherited Create(nil);
  FController := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
end;

procedure TFormPesquisaNaoEncontrada.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

end.

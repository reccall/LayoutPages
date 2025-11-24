unit ConhecFrete.Controller.PesquisaNaoEncontrada;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TEditTitulo
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.TEditPesquisa;

type
  IControllerPesquisaNaoEncontrada = interface
  ['{7E0D0F6C-68D7-41A7-A360-3A08D68BD614}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerPesquisaNaoEncontrada = class(TInterfacedObject, IControllerPesquisaNaoEncontrada)
  private
    FCmpEditTexto :TForm;
    FFormCadastros :TForm;
    FFormNaoEncontrado :TForm;
    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pArrayFormsCte :array of TForm) :IControllerPesquisaNaoEncontrada overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Forms.PesquisaNaoEcontrada;

{ TControllerPesquisaNaoEncontrada }

constructor TControllerPesquisaNaoEncontrada.Create(pArrayFormsCte :array of TForm);
begin
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FFormCadastros := pArrayFormsCte[Ord(tpCteCadastros)];
  FFormNaoEncontrado := pArrayFormsCte[Ord(tpFormPesqNaoEncontrada)];
end;

destructor TControllerPesquisaNaoEncontrada.Destroy;
begin
  with TFormPesquisaNaoEncontrada(FFormNaoEncontrado) do
  begin
    FreeAndNil(FController);
    Close;
  end;
end;

procedure TControllerPesquisaNaoEncontrada.DestroyComponents;
begin

end;

procedure TControllerPesquisaNaoEncontrada.Iniciar;
begin
  with TFormPesquisaNaoEncontrada(FFormNaoEncontrado),
       TCmpEditTexto(FCmpEditTexto),
       TFormCteCadastros(FFormCadastros) do
  begin
    lblPesquisa.Caption := Format('Pesquisando por: %s',[edtPesquisa.Text]);
    FFormNaoEncontrado.Parent := pnlMain;
    FFormNaoEncontrado.Show;
  end;
end;

class function TControllerPesquisaNaoEncontrada.New(pArrayFormsCte :array of TForm): IControllerPesquisaNaoEncontrada;
begin
  Result := Self.Create(pArrayFormsCte);
end;

end.

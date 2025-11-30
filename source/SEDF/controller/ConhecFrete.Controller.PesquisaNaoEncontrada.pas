unit ConhecFrete.Controller.PesquisaNaoEncontrada;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,Vcl.Controls
  ,Vcl.ExtCtrls;

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
    FCmpControlGrid :TForm;
    FFormNaoEncontrado :TForm;
    FFormLoadingCSS :TForm;
    FTimer :TTimer;
    procedure Iniciar;
    procedure LoadFormNaoEncontrado;
    procedure OnTimerLoading(Sender :TObject);
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
  ,LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.ControlGrid
  ,LayoutPages.View.Forms.PesquisaNaoEcontrada;

{ TControllerPesquisaNaoEncontrada }

constructor TControllerPesquisaNaoEncontrada.Create(pArrayFormsCte :array of TForm);
begin
  FCmpEditTexto := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FFormCadastros := pArrayFormsCte[Ord(tpCteCadastros)];
  FCmpControlGrid := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FFormNaoEncontrado := TFormPesquisaNaoEncontrada.Create(pArrayFormsCte);
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimerLoading;
  FTimer.Enabled := False;
  FTimer.Interval := 1000;
end;

destructor TControllerPesquisaNaoEncontrada.Destroy;
begin
  inherited;
  FreeAndNil(FTimer);
  FFormNaoEncontrado.Close;
  FFormNaoEncontrado := nil;
  aFormsCte[Ord(tpFormPesqNaoEncontrada)] := nil;
end;

procedure TControllerPesquisaNaoEncontrada.DestroyComponents;
begin

end;

procedure TControllerPesquisaNaoEncontrada.Iniciar;
begin
  FTimer.Enabled := True;
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FFormCadastros) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

procedure TControllerPesquisaNaoEncontrada.LoadFormNaoEncontrado;
begin
  FTimer.Interval := 500;
  FTimer.Enabled := False;
  TFormLoadCSS(FFormLoadingCSS).Close;
  with TFormPesquisaNaoEncontrada(FFormNaoEncontrado),
         TCmpEditTexto(FCmpEditTexto),
         TFormCteCadastros(FFormCadastros) do
  begin
    FCmpControlGrid.Close;
    lblPesquisa.Caption := Format('Pesquisando por: %s',[edtPesquisa.Text]);

    FFormNaoEncontrado.Parent := pnlMain;
    FFormNaoEncontrado.Show;
  end;
end;

class function TControllerPesquisaNaoEncontrada.New(pArrayFormsCte :array of TForm): IControllerPesquisaNaoEncontrada;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerPesquisaNaoEncontrada.OnTimerLoading(Sender: TObject);
begin
  LoadFormNaoEncontrado;
end;

end.

unit ConhecFrete.Controller.UFGlobalizadoDadosCte;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TEditTitulo
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.TDateEditTitulo
  ,LayoutPages.View.Componentes.TComboboxTitulo;

type
  IControllerUFGlobalizadoDadosCte = interface
  ['{331635AA-55C1-4C07-9AF6-260EC6FA7547}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerUFGlobalizadoDadosCte = class(TInterfacedObject, IControllerUFGlobalizadoDadosCte)
  private
    FFormOwner: TForm;
    FCmpTitulo :TCmpTLabelTitulo;
    FCmpDataEmissao :TCmpTDateEdiTitulo;
    FCmpTipoServico :TCmpTComboboxTitulo;
    FCmpCarregamento :TCmpTEditTitulo;
    FCmpFilialTransp :TCmpTComboboxTitulo;
  public
    procedure Iniciar;
    procedure DestroyComponents;

  class function New(pFormOwner :TForm) :IControllerUFGlobalizadoDadosCte overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.UFGlobalizado.DadosCte;

{ TControllerUFGlobalizadoDadosCte }

constructor TControllerUFGlobalizadoDadosCte.Create(pFormOwner: TForm);
begin
  FFormOwner       := pFormOwner;
  FCmpTitulo       := TCmpTLabelTitulo.Create(nil);
  FCmpDataEmissao  := TCmpTDateEdiTitulo.Create(nil);
  FCmpTipoServico  := TCmpTComboboxTitulo.Create(nil);
  FCmpCarregamento := TCmpTEditTitulo.Create(nil);
  FCmpFilialTransp := TCmpTComboboxTitulo.Create(nil);
end;

destructor TControllerUFGlobalizadoDadosCte.Destroy;
begin
  with TfrmUFGlobalizadoDadosCte(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerUFGlobalizadoDadosCte.DestroyComponents;
begin
  FreeAndNil(FCmpTitulo);
  FreeAndNil(FCmpDataEmissao);
  FreeAndNil(FCmpTipoServico);
  FreeAndNil(FCmpCarregamento);
  FreeAndNil(FCmpFilialTransp);
end;

procedure TControllerUFGlobalizadoDadosCte.Iniciar;
begin
  with TfrmUFGlobalizadoDadosCte(FFormOwner) do
  begin
    FCmpTitulo.lblTitulo.Caption := 'Dados Cte';
    FCmpTitulo.lblTitulo.Font.Style := [fsbold];
    FCmpTitulo.Parent := pnlTop;
    FCmpTitulo.Show;

    FCmpCarregamento.lblTitulo.Caption := 'Carregamento';
    FCmpCarregamento.pnlEdtBack.Width := 110;
    FCmpCarregamento.pnlEdtB.Width := 116;
    FCmpCarregamento.Parent := pnlEdtCarreg;
    FCmpCarregamento.Show;
    FCmpCarregamento.edtDefault.SetFocus;

    FCmpTipoServico.lblTitulo.Caption := 'Tipo de Serviço';
    FCmpTipoServico.pnlEdtBack.Width := 210;
    FCmpTipoServico.pnlEdtB.Width := 215;
    FCmpTipoServico.Parent := pnlTipoServico;
    FCmpTipoServico.Show;

    FCmpFilialTransp.lblTitulo.Caption := 'Filial de Transporte';
    FCmpFilialTransp.pnlEdtBack.Width := 210;
    FCmpFilialTransp.pnlEdtB.Width := 215;
    FCmpFilialTransp.Parent := pnlFilialTransporte;
    FCmpFilialTransp.Show;

    FCmpDataEmissao.lblTitulo.Caption := 'Data de Emissão';
    FCmpDataEmissao.Parent := pnlDtEmissao;
    FCmpDataEmissao.Show;
  end;
end;

class function TControllerUFGlobalizadoDadosCte.New(pFormOwner: TForm): IControllerUFGlobalizadoDadosCte;
begin
  Result := Self.Create(pFormOwner);
end;

end.

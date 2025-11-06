unit ConhecFrete.Controller.RegiaoDadosCte;

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
  IControllerRegiaoDadosCte = interface
  ['{331635AA-55C1-4C07-9AF6-260EC6FA7547}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerRegiaoDadosCte = class(TInterfacedObject, IControllerRegiaoDadosCte)
  private
    FFormOwner: TForm;
    FCmpTitulo :TCmpTLabelTitulo;
    FCmpDataEmissao :TCmpTDateEdiTitulo;
    FCmpTipoServico :TCmpTComboboxTitulo;
    FCmpCarregamento :TCmpTEditTitulo;
    FCmpFilialTransp :TCmpTComboboxTitulo;
    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pFormOwner :TForm) :IControllerRegiaoDadosCte overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.RegiaoDadosCte;

{ TControllerLayoutTomador }

constructor TControllerRegiaoDadosCte.Create(pFormOwner: TForm);
begin
  FFormOwner       := pFormOwner;
  FCmpTitulo       := TCmpTLabelTitulo.Create(nil);
  FCmpDataEmissao  := TCmpTDateEdiTitulo.Create(nil);
  FCmpTipoServico  := TCmpTComboboxTitulo.Create(nil);
  FCmpCarregamento := TCmpTEditTitulo.Create(nil);
  FCmpFilialTransp := TCmpTComboboxTitulo.Create(nil);
end;

destructor TControllerRegiaoDadosCte.Destroy;
begin
  with TfrmRegiaoDadosCte(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerRegiaoDadosCte.DestroyComponents;
begin
  FreeAndNil(FCmpTitulo);
  FreeAndNil(FCmpDataEmissao);
  FreeAndNil(FCmpTipoServico);
  FreeAndNil(FCmpCarregamento);
  FreeAndNil(FCmpFilialTransp);
end;

procedure TControllerRegiaoDadosCte.Iniciar;
begin
  with TfrmRegiaoDadosCte(FFormOwner) do
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

class function TControllerRegiaoDadosCte.New(pFormOwner: TForm): IControllerRegiaoDadosCte;
begin
  Result := Self.Create(pFormOwner);
end;

end.

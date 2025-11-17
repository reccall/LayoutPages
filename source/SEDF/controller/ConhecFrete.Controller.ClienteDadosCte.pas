unit ConhecFrete.Controller.ClienteDadosCte;

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
  IControllerLayoutDadosCte = interface
  ['{331635AA-55C1-4C07-9AF6-260EC6FA7547}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerLayoutDadosCte = class(TInterfacedObject, IControllerLayoutDadosCte)
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
  class function New(pFormOwner :TForm) :IControllerLayoutDadosCte; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.Cliente.DadosCte;

{ TControllerLayoutTomador }

constructor TControllerLayoutDadosCte.Create(pFormOwner: TForm);
begin
  FFormOwner       := pFormOwner;
  FCmpTitulo       := TCmpTLabelTitulo.Create(nil);
  FCmpDataEmissao  := TCmpTDateEdiTitulo.Create(nil);
  FCmpTipoServico  := TCmpTComboboxTitulo.Create(nil);
  FCmpCarregamento := TCmpTEditTitulo.Create(nil);
  FCmpFilialTransp := TCmpTComboboxTitulo.Create(nil);
end;

destructor TControllerLayoutDadosCte.Destroy;
begin
  with TfrmClienteDadosCte(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerLayoutDadosCte.DestroyComponents;
begin
  FreeAndNil(FCmpTitulo);
  FreeAndNil(FCmpDataEmissao);
  FreeAndNil(FCmpTipoServico);
  FreeAndNil(FCmpCarregamento);
  FreeAndNil(FCmpFilialTransp);
end;

procedure TControllerLayoutDadosCte.Iniciar;
begin
  with TfrmClienteDadosCte(FFormOwner) do
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

class function TControllerLayoutDadosCte.New(pFormOwner: TForm): IControllerLayoutDadosCte;
begin
  Result := Self.Create(pFormOwner);
end;

end.

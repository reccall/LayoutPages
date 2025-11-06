unit ConhecFrete.Controller.Tomador;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TEditTitulo
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.TEditPesquisa;

type
  IControllerTomador = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerTomador = class(TInterfacedObject, IControllerTomador)
  private
    FFormOwner: TForm;
    FCmpTitulo :TCmpTLabelTitulo;
    FCmpEditPesquisa :TCmpTEditPesquisa;
    FCmpCNPJ :TCmpTEditTitulo;
    FCmpInscEstadual :TCmpTEditTitulo;
    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pFormOwner :TForm) :IControllerTomador overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.Tomador;

{ TControllerLayoutTomador }

constructor TControllerTomador.Create(pFormOwner: TForm);
begin
  FFormOwner       := pFormOwner;
  FCmpCNPJ         := TCmpTEditTitulo.Create(nil);
  FCmpTitulo       := TCmpTLabelTitulo.Create(nil);
  FCmpInscEstadual := TCmpTEditTitulo.Create(nil);
  FCmpEditPesquisa := TCmpTEditPesquisa.Create(nil);
end;

destructor TControllerTomador.Destroy;
begin
  with TfrmTomador(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
end;

procedure TControllerTomador.DestroyComponents;
begin
  FreeAndNil(FCmpCNPJ);
  FreeAndNil(FCmpTitulo);
  FreeAndNil(FCmpInscEstadual);
  FreeAndNil(FCmpEditPesquisa);
end;

procedure TControllerTomador.Iniciar;
begin
  with TfrmTomador(FFormOwner) do
  begin
    FCmpTitulo.lblTitulo.Caption := 'Tomador';
    FCmpTitulo.lblTitulo.Font.Style := [fsbold];
    FCmpTitulo.Parent := pnlTop;
    FCmpTitulo.Show;

    FCmpEditPesquisa.lblTitulo.Caption := 'Tomador do serviço';
    FCmpEditPesquisa.Parent := pnlEditPesq;
    FCmpEditPesquisa.Show;

    FCmpCNPJ.lblTitulo.Caption := 'CNPJ';
    FCmpCNPJ.pnlEdtBack.Width := 220;
    FCmpCNPJ.pnlEdtB.Width := 225;
    FCmpCNPJ.Parent := pnlEdtCNPJ;
    FCmpCNPJ.Show;

    FCmpInscEstadual.lblTitulo.Caption := 'Inscrição Estadual';
    FCmpInscEstadual.pnlEdtBack.Width := 260;
    FCmpInscEstadual.pnlEdtB.Width := 265;
    FCmpInscEstadual.Parent := pnlInscEstadual;
    FCmpInscEstadual.Show;
  end;
end;

class function TControllerTomador.New(pFormOwner: TForm): IControllerTomador;
begin
  Result := Self.Create(pFormOwner);
end;

end.

unit ConhecFrete.Controller.DadosPedagioSeguro;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TCheckbox
  ,LayoutPages.View.Componentes.TComboboxTitulo
  ,LayoutPages.View.Componentes.TEditTitulo
  ,LayoutPages.View.Componentes.TLabelTitulo;

type
  IControllerDadosPedagioSeguro = interface
  ['{28FF6C6F-E0C3-49B4-87E3-7BF9F91E4EE9}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerDadosPedagioSeguro = class(TInterfacedObject, IControllerDadosPedagioSeguro)
  private
    FFormOwner: TForm;

    FCmpNumComprovante       :TCmpTEditTitulo;
    FCmpMesmoCNPJFilial      :TCmpCheckBox;
    FCmpValorValePedagio     :TCmpTEditTitulo;
    FCmpCNPJRespPgtoPedagio  :TCmpTEditTitulo;
    FCmpCNPJEmpFornecPedagio :TCmpTEditTitulo;

    FCmpRespSeguro       :TCmpTEditTitulo;
    FCmpNumAverbacao     :TCmpTEditTitulo;
    FCmpNomeSeguradora   :TCmpTEditTitulo;
    FCmpCNPJSeguradora   :TCmpTEditTitulo;
    FCmpValorAverbacao   :TCmpTEditTitulo;
    FCmpNumApoliceSeguro :TCmpTEditTitulo;

    FCmpTituloSeguro :TCmpTLabelTitulo;
    FCmpTituloPedagio :TCmpTLabelTitulo;
    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pFormOwner :TForm) :IControllerDadosPedagioSeguro overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.DadosPedagioSeguro;

{ TControllerDadosPedagioSeguro }

constructor TControllerDadosPedagioSeguro.Create(pFormOwner: TForm);
begin
  FFormOwner               := pFormOwner;
  FCmpRespSeguro           := TCmpTEditTitulo.Create(nil);
  FCmpTituloSeguro         := TCmpTLabelTitulo.Create(nil);
  FCmpTituloPedagio        := TCmpTLabelTitulo.Create(nil);
  FCmpNumAverbacao         := TCmpTEditTitulo.Create(nil);
  FCmpNomeSeguradora       := TCmpTEditTitulo.Create(nil);
  FCmpCNPJSeguradora       := TCmpTEditTitulo.Create(nil);
  FCmpValorAverbacao       := TCmpTEditTitulo.Create(nil);
  FCmpNumApoliceSeguro     := TCmpTEditTitulo.Create(nil);
  FCmpNumComprovante       := TCmpTEditTitulo.Create(nil);
  FCmpMesmoCNPJFilial      := TCmpCheckBox.Create(nil);
  FCmpValorValePedagio     := TCmpTEditTitulo.Create(nil);
  FCmpCNPJRespPgtoPedagio  := TCmpTEditTitulo.Create(nil);
  FCmpCNPJEmpFornecPedagio := TCmpTEditTitulo.Create(nil);
end;

destructor TControllerDadosPedagioSeguro.Destroy;
begin
  with TfrmDadosPedagioSeguro(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerDadosPedagioSeguro.DestroyComponents;
begin
  FreeAndNil(FCmpRespSeguro);
  FreeAndNil(FCmpNumAverbacao);
  FreeAndNil(FCmpTituloSeguro);
  FreeAndNil(FCmpTituloPedagio);
  FreeAndNil(FCmpNomeSeguradora);
  FreeAndNil(FCmpCNPJSeguradora);
  FreeAndNil(FCmpValorAverbacao);
  FreeAndNil(FCmpNumComprovante);
  FreeAndNil(FCmpMesmoCNPJFilial);
  FreeAndNil(FCmpNumApoliceSeguro);
  FreeAndNil(FCmpValorValePedagio);
  FreeAndNil(FCmpCNPJRespPgtoPedagio);
  FreeAndNil(FCmpCNPJEmpFornecPedagio);
end;

procedure TControllerDadosPedagioSeguro.Iniciar;
begin
  with TfrmDadosPedagioSeguro(FFormOwner) do
  begin
    FCmpTituloPedagio.lblTitulo.Caption := 'Pedágio';
    FCmpTituloPedagio.lblTitulo.Font.Style := [fsbold];
    FCmpTituloPedagio.Parent := pnlTopPedagio;
    FCmpTituloPedagio.Show;
    FCmpTituloPedagio.SetFocus;

    FCmpTituloSeguro.lblTitulo.Caption := 'Seguro';
    FCmpTituloSeguro.lblTitulo.Font.Style := [fsbold];
    FCmpTituloSeguro.Parent := pnlTopSeguro;
    FCmpTituloSeguro.Show;

    FCmpNumComprovante.lblTitulo.Caption := 'Número do comprovante de compra do vale pedágio';
    FCmpNumComprovante.pnlEdtBack.Width := 220;
    FCmpNumComprovante.pnlEdtB.Width := 225;
    FCmpNumComprovante.Parent := pnlNumComprovanteCmp;
    FCmpNumComprovante.Show;

    FCmpMesmoCNPJFilial.lblCheck.Caption := 'Mesmo CNPJ da Filial';
    FCmpMesmoCNPJFilial.Parent := pnlMsmCNPJFilial;
    FCmpMesmoCNPJFilial.Show;

    FCmpValorValePedagio.lblTitulo.Caption := 'Valor do vale pedágio';
    FCmpValorValePedagio.pnlEdtBack.Width := 220;
    FCmpValorValePedagio.pnlEdtB.Width := 225;
    FCmpValorValePedagio.Parent := pnlValorValePredagio;
    FCmpValorValePedagio.Show;

    FCmpCNPJRespPgtoPedagio.lblTitulo.Caption := 'CNPJ do responsável pelo pagamento vale pedágio';
    FCmpCNPJRespPgtoPedagio.pnlEdtBack.Width := 220;
    FCmpCNPJRespPgtoPedagio.pnlEdtB.Width := 225;
    FCmpCNPJRespPgtoPedagio.Parent := pnlCNPJRespPgto;
    FCmpCNPJRespPgtoPedagio.Show;

    FCmpCNPJEmpFornecPedagio.lblTitulo.Caption := 'CNPJ da empresa fornecedora do vale pedágio';
    FCmpCNPJEmpFornecPedagio.pnlEdtBack.Width := 220;
    FCmpCNPJEmpFornecPedagio.pnlEdtB.Width := 225;
    FCmpCNPJEmpFornecPedagio.Parent := pnlCNPJEmpFornecValePedagio;
    FCmpCNPJEmpFornecPedagio.Show;

    FCmpRespSeguro.lblTitulo.Caption := 'Resposável pelo Seguro';
    FCmpRespSeguro.pnlEdtBack.Width := 220;
    FCmpRespSeguro.pnlEdtB.Width := 225;
    FCmpRespSeguro.Parent := pnlRespSeguro;
    FCmpRespSeguro.Show;

    FCmpNumAverbacao.lblTitulo.Caption := 'Número de Averbação';
    FCmpNumAverbacao.pnlEdtBack.Width := 220;
    FCmpNumAverbacao.pnlEdtB.Width := 225;
    FCmpNumAverbacao.Parent := pnlNumAverbacao;
    FCmpNumAverbacao.Show;

    FCmpNomeSeguradora.lblTitulo.Caption := 'Nome da Seguradora';
    FCmpNomeSeguradora.pnlEdtBack.Width := 220;
    FCmpNomeSeguradora.pnlEdtB.Width := 225;
    FCmpNomeSeguradora.Parent := pnlNomeSeg;
    FCmpNomeSeguradora.Show;

    FCmpCNPJSeguradora.lblTitulo.Caption := 'CNPJ da Seguradora';
    FCmpCNPJSeguradora.pnlEdtBack.Width := 220;
    FCmpCNPJSeguradora.pnlEdtB.Width := 225;
    FCmpCNPJSeguradora.Parent := pnlCNPJSeg;
    FCmpCNPJSeguradora.Show;

    FCmpValorAverbacao.lblTitulo.Caption := 'Valor da Averbação';
    FCmpValorAverbacao.pnlEdtBack.Width := 220;
    FCmpValorAverbacao.pnlEdtB.Width := 225;
    FCmpValorAverbacao.Parent := pnlValorAverb;
    FCmpValorAverbacao.Show;

    FCmpNumApoliceSeguro.lblTitulo.Caption := 'Número da Apólice de Seguro';
    FCmpNumApoliceSeguro.pnlEdtBack.Width := 220;
    FCmpNumApoliceSeguro.pnlEdtB.Width := 225;
    FCmpNumApoliceSeguro.Parent := pnlNumApSeguro;
    FCmpNumApoliceSeguro.Show;
  end;
end;

class function TControllerDadosPedagioSeguro.New(pFormOwner: TForm): IControllerDadosPedagioSeguro;
begin
  Result := Self.Create(pFormOwner);
end;

end.

unit ConhecFrete.Controller.Motorista;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TEditTitulo
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,LayoutPages.View.Componentes.TEditPesquisa;

type
  IControllerMototista = interface
  ['{5E3A1381-9BD9-43B1-94F8-310D003B9D16}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerMototista = class(TInterfacedObject, IControllerMototista)
  private
    FFormOwner: TForm;
    FCmpUFPlaca :TCmpTEditTitulo;
    FCmpTitulo :TCmpTLabelTitulo;
    FCmpPlaca :TCmpTEditTitulo;
    FCmpEditPesquisaMotorista :TCmpTEditPesquisa;
    FCmpEditPesquisaVeiculo :TCmpTEditPesquisa;
    procedure Iniciar;
    procedure DestroyComponents;
  public
  class function New(pFormOwner :TForm) :IControllerMototista overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.Motorista;

{ TControllerMototista }

constructor TControllerMototista.Create(pFormOwner: TForm);
begin
  FFormOwner                := pFormOwner;
  FCmpPlaca                 := TCmpTEditTitulo.Create(nil);
  FCmpTitulo                := TCmpTLabelTitulo.Create(nil);
  FCmpUFPlaca               := TCmpTEditTitulo.Create(nil);
  FCmpEditPesquisaVeiculo   := TCmpTEditPesquisa.Create(nil);
  FCmpEditPesquisaMotorista := TCmpTEditPesquisa.Create(nil);
end;

destructor TControllerMototista.Destroy;
begin
  with TfrmCteMotorista(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
end;

procedure TControllerMototista.DestroyComponents;
begin
  FreeAndNil(FCmpPlaca);
  FreeAndNil(FCmpTitulo);
  FreeAndNil(FCmpUFPlaca);
  FreeAndNil(FCmpEditPesquisaVeiculo);
  FreeAndNil(FCmpEditPesquisaMotorista);
end;

procedure TControllerMototista.Iniciar;
begin
  with TfrmCteMotorista(FFormOwner) do
  begin
    FCmpTitulo.lblTitulo.Caption := 'Motorista';
    FCmpTitulo.lblTitulo.Font.Style := [fsbold];
    FCmpTitulo.Parent := pnlTop;
    FCmpTitulo.Show;

    FCmpEditPesquisaVeiculo.lblTitulo.Caption := 'Veículo';
    FCmpEditPesquisaVeiculo.Parent := pnlEdtPesqVeiculo;
    FCmpEditPesquisaVeiculo.Show;

    FCmpEditPesquisaMotorista.lblTitulo.Caption := 'Motorista';
    FCmpEditPesquisaMotorista.Parent := pnlEdtPesqMotorista;
    FCmpEditPesquisaMotorista.Show;

    FCmpPlaca.lblTitulo.Caption := 'Placa';
    FCmpPlaca.pnlEdtBack.Width := 200;
    FCmpPlaca.pnlEdtB.Width := 205;
    FCmpPlaca.Parent := pnlPlacaVeiculo;
    FCmpPlaca.Show;

    FCmpUFPlaca.lblTitulo.Caption := 'UF Placa';
    FCmpUFPlaca.pnlEdtBack.Width := 110;
    FCmpUFPlaca.pnlEdtB.Width := 115;
    FCmpUFPlaca.Parent := pnlEdtUFPlaca;
    FCmpUFPlaca.Show;
  end;
end;

class function TControllerMototista.New(pFormOwner: TForm): IControllerMototista;
begin
  Result := Self.Create(pFormOwner);
end;

end.

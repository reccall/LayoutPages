unit ConhecFrete.Controller.Parametros;

interface

uses
   Forms
  ,Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TCheckbox
  ,LayoutPages.View.Componentes.TLabelTitulo;

type
  IControllerParametros = interface
  ['{043894E2-5CC9-42E5-96DF-65266AB1F5AF}']
    procedure Iniciar;
    procedure DestroyComponents;
  end;

  TControllerParametros = class(TInterfacedObject, IControllerParametros)
  private
    FFormOwner: TForm;
    FCmpTitulo :TCmpTLabelTitulo;
    FCmpCalcPorKG :TCmpCheckBox;
    FCmpGerarTransf :TCmpCheckBox;
    FCmpTributFilVenda :TCmpCheckBox;
    FCmpPercFreteRegiao :TCmpCheckBox;
    FCmpUtilizarEndEntPed :TCmpCheckBox;
    FCmpTipoFreteDespacho :TCmpCheckBox;
    FCmpInformarDadosPedagio :TCmpCheckBox;
    FCmpGerConhecNFvirtualCliente :TCmpCheckBox;
    FCmpReducaoBaseIcmsPorCliente :TCmpCheckBox;
  public
    procedure Iniciar;
    procedure DestroyComponents;

  class function New(pFormOwner :TForm) :IControllerParametros overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
  ConhecFrete.Forms.Cte.Parametros;

{ TControllerParametros }

constructor TControllerParametros.Create(pFormOwner: TForm);
begin
  FFormOwner                    := pFormOwner;
  FCmpTitulo                    := TCmpTLabelTitulo.Create(nil);
  FCmpCalcPorKG                 := TCmpCheckBox.Create(nil);
  FCmpGerarTransf               := TCmpCheckBox.Create(nil);
  FCmpTributFilVenda            := TCmpCheckBox.Create(nil);
  FCmpPercFreteRegiao           := TCmpCheckBox.Create(nil);
  FCmpUtilizarEndEntPed         := TCmpCheckBox.Create(nil);
  FCmpTipoFreteDespacho         := TCmpCheckBox.Create(nil);
  FCmpInformarDadosPedagio      := TCmpCheckBox.Create(nil);
  FCmpGerConhecNFvirtualCliente := TCmpCheckBox.Create(nil);
  FCmpReducaoBaseIcmsPorCliente := TCmpCheckBox.Create(nil);

  FCmpCalcPorKG.chkDefault.Checked                 := True;
  FCmpPercFreteRegiao.chkDefault.Checked           := True;
  FCmpUtilizarEndEntPed.chkDefault.Checked         := True;
  FCmpTipoFreteDespacho.chkDefault.Checked         := True;
  FCmpInformarDadosPedagio.chkDefault.Checked      := True;
  FCmpReducaoBaseIcmsPorCliente.chkDefault.Checked := True;
end;

destructor TControllerParametros.Destroy;
begin
  with TfrmCteParametros(FFormOwner) do
  begin
    FreeAndNil(FController);
    Close;
  end;
  inherited;
end;

procedure TControllerParametros.DestroyComponents;
begin
  FreeAndNil(FCmpCalcPorKG);
  FreeAndNil(FCmpGerarTransf);
  FreeAndNil(FCmpTributFilVenda);
  FreeAndNil(FCmpPercFreteRegiao);
  FreeAndNil(FCmpUtilizarEndEntPed);
  FreeAndNil(FCmpTipoFreteDespacho);
  FreeAndNil(FCmpInformarDadosPedagio);
  FreeAndNil(FCmpGerConhecNFvirtualCliente);
  FreeAndNil(FCmpReducaoBaseIcmsPorCliente);
  FreeAndNil(FCmpTitulo);
end;

procedure TControllerParametros.Iniciar;
begin
  with TfrmCteParametros(FFormOwner) do
  begin
    FCmpTitulo.lblTitulo.Caption := 'Parâmetros';
    FCmpTitulo.lblTitulo.Font.Style := [fsbold];
    FCmpTitulo.Parent := pnlTop;
    FCmpTitulo.Show;

    FCmpCalcPorKG.lblCheck.Caption := 'Usa Vl.Frete KG da região para calcular o frete';
    FCmpCalcPorKG.Width := pnlparams_chbCalcPorKG.Width;
    FCmpCalcPorKG.Parent := pnlparams_chbCalcPorKG;

    FCmpCalcPorKG.Show;

    FCmpGerarTransf.lblCheck.Caption := 'Gerar conhecimento de frete para transf. virtual/Retira';
    FCmpGerarTransf.Width := pnlparams_chbGerarTransf.Width;
    FCmpGerarTransf.Parent := pnlparams_chbGerarTransf;
    FCmpGerarTransf.Show;

    FCmpTributFilVenda.lblCheck.Caption := 'Gerar conhecimento com os dados da filial Virtual';
    FCmpTributFilVenda.Width := pnlparams_cbTributFilVenda.Width;
    FCmpTributFilVenda.Parent := pnlparams_cbTributFilVenda;
    FCmpTributFilVenda.Show;

    FCmpPercFreteRegiao.lblCheck.Caption := 'Usa percentual de frete da região para calcular o valor do frete';
    FCmpPercFreteRegiao.Width := pnlparams_cb_percfreteregiao.Width;
    FCmpPercFreteRegiao.Parent := pnlparams_cb_percfreteregiao;

    FCmpPercFreteRegiao.Show;

    FCmpUtilizarEndEntPed.lblCheck.Caption := 'Utilizar Endereço de Entrega do Pedido (316/4116)';
    FCmpUtilizarEndEntPed.Width := pnlparams_ckbUtilizarEndEntPed.Width;
    FCmpUtilizarEndEntPed.Parent := pnlparams_ckbUtilizarEndEntPed;

    FCmpUtilizarEndEntPed.Show;

    FCmpTipoFreteDespacho.lblCheck.Caption := 'Gerar conhecimento respeitando o tipo de "Frete despacho" do pedido';
    FCmpTipoFreteDespacho.Width := pnlparams_cb_tipofretedespacho.Width;
    FCmpTipoFreteDespacho.Parent := pnlparams_cb_tipofretedespacho;
    FCmpTipoFreteDespacho.Show;

    FCmpInformarDadosPedagio.lblCheck.Caption := 'Informa dados de pedágio';
    FCmpInformarDadosPedagio.Width := pnlparams_chbInformaDadosPedagio.Width;
    FCmpInformarDadosPedagio.Parent := pnlparams_chbInformaDadosPedagio;

    FCmpInformarDadosPedagio.Show;

    FCmpGerConhecNFvirtualCliente.lblCheck.Caption := 'Gerar conhecimento para nota de filial virtual/retira';
    FCmpGerConhecNFvirtualCliente.Width := pnlparams_chbGerConhecNFvirtualCliente.Width;
    FCmpGerConhecNFvirtualCliente.Parent := pnlparams_chbGerConhecNFvirtualCliente;
    FCmpGerConhecNFvirtualCliente.Show;

    FCmpReducaoBaseIcmsPorCliente.lblCheck.Caption := 'Aplicar redução da Base ICMS (Processo para indústria).****';
    FCmpReducaoBaseIcmsPorCliente.Width := pnlparams_chkReducaoBaseIcmsPorCliente.Width;
    FCmpReducaoBaseIcmsPorCliente.Parent := pnlparams_chkReducaoBaseIcmsPorCliente;
    FCmpReducaoBaseIcmsPorCliente.Show;
  end;
end;

class function TControllerParametros.New(pFormOwner: TForm): IControllerParametros;
begin
  Result := Self.Create(pFormOwner);
end;

end.

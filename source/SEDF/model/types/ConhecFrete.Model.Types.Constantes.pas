unit ConhecFrete.Model.Types.Constantes;


interface

uses
   Winapi.Windows
  ,Forms;

type
  TpRegra    = (tpDefault, tpRemetente, tpDestinatario);
  TpSimular  = (tpSimularCte, tpNovoCte);
  TpMenuImg  = (tpImgCadastro, tpImgEmissorFiscal, tpImgCertDigital, tpImgRelatorios, tpImgTutorial);

  TpOpcaoMenuCad = (tpMenuProdutos, tpMenuServicos, tpMenuMarcas,
                    tpMenuUnidMedida, tpMenuClientes, tpMenuFornec, tpMenuTransp);

  TpOpcaoMenuEmissaoFis = (tpMenuNFe, tpMenuNFCe, tpOpcaoMenuCte, tpMenuNFSe);

  TpMenuCte  = (tpDadosCte, tpTomador, tpMotorista, tpDadosSegPedagio, tpDefinirRegra, tpParamsCte);
  TpOpcaoCte = (tpCteCliente, tpCteRegiao, tpCteSimplificado, tpCteUFGlobalizado, tpSituCarregamento);

  TpForms = (tpOwner, tpMenuPrincipal, tpMenuEmissaoFiscal, tpMenuCadastros, tpCmpTitulo,
             tpCertificadoDig, tpRelatorios, tpTutorial, tpFormCte, tpFormOpcoesItensCte,
             tpBarraBotoes, tpMenuItensImagens, tpCadastros, tpCadastroProdutos, tpCadastroClientes,
             tpCadastroFornecedores, tpCadastroTransportadoras, tpCadastroMarcas,
             tpCadastroServicos, tpCadastroUnidadesDeMedida, tpCmpControlGrid, tpFDefault);

const
  aImageNames :array[0..4] of String = ('ImgCadastros','ImgEmissaoFiscal','ImgCertDigital','ImgRelatorios','ImgTutorial');
var
  aFormsCte :array of TForm;

  implementation

end.

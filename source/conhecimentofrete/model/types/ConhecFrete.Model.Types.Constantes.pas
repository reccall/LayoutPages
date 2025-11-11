unit ConhecFrete.Model.Types.Constantes;


interface

uses
  Forms;

type
  TpRegra    = (tpDefault, tpRemetente, tpDestinatario);
  TpSimular  = (tpSimularCte, tpNovoCte);
  TpMenuImg  = (tpImgCadastro, tpImgEmissorFiscal, tpImgCertDigital, tpImgRelatorios, tpImgTutorial);
  TpMenuCte  = (tpDadosCte, tpTomador, tpMotorista, tpDadosSegPedagio, tpDefinirRegra, tpParamsCte);
  TpOpcaoCte = (tpCteCliente, tpCteRegiao, tpCteSimplificado, tpCteUFGlobalizado, tpSituCarregamento);

  TpForms = (tpOwner, tpMenuPrincipal, tpMenuEmissaoFiscal, tpMenuCadastros, tpCmpTitulo,
             tpCertificadoDig, tpRelatorios, tpTutorial, tpFormCte, tpFormOpcoesItensCte,
             tpBarraBotoes, tpMenuItensImagens, tpFDefault);

const
  aImageNames :array[0..4] of String = ('ImgCadastros','ImgEmissaoFiscal','ImgCertDigital','ImgRelatorios','ImgTutorial');

var
  aFormsCte :array of TForm;

  implementation

end.

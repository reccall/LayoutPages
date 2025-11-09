unit ConhecFrete.Model.Types.Constantes;


interface

uses
  Forms;

type
  TpRegra    = (tpDefault, tpRemetente, tpDestinatario);
  TpSimular  = (tpSimularCte, tpNovoCte);
  TpMenuCte  = (tpDadosCte, tpTomador, tpMotorista, tpDadosSegPedagio, tpDefinirRegra, tpParamsCte);
  TpOpcaoCte = (tpCteCliente, tpCteRegiao, tpCteSimplificado, tpCteUFGlobalizado, tpSituCarregamento);

  TpForms = (tpOwner, tpMenuPrincipal, tpMenuEmissaoFiscal, tpMenuCadastros, tpCmpTitulo,
             tpCertificadoDig, tpRelatorios, tpTutorial, tpFormCte, tpFormOpcoesItensCte,
             tpFDefault);

var
  aFormsCte :array of TForm;

  implementation

end.

unit ConhecFrete.Model.Types.Constantes;


interface

uses
  Forms;

type
  TpRegra    = (tpDefault, tpRemetente, tpDestinatario);
  TpSimular  = (tpSimularCte, tpNovoCte);
  TpMenuCte  = (tpDadosCte, tpTomador, tpMotorista, tpDadosSegPedagio, tpDefinirRegra, tpParamsCte);
  TpOpcaoCte = (tpCteCliente, tpCteRegiao, tpCteSimplificado, tpCteUFGlobalizado, tpSituCarregamento);

const
  IndexOwner = 0;
  IndexMenuPrincipal = 1;
  IndexMenuEmissaoFiscal = 2;
  IndexCmpTituloOpcao = 3;
  IndexSelf  = 4;
var
  aFormsCte :array of TForm;

  implementation

end.

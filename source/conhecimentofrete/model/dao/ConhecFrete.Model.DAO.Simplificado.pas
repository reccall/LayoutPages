{**********************************************}
{                                              }
{                  Winthor                     }
{                                              }
{ Classe destinada a acessar os registros      }
{ que compõe o CTe Simplificado                }
{ Autor: Luiz Fernando Cândido Machado         }
{ Data: 15/10/2025                             }
{**********************************************}

unit ConhecFrete.Model.DAO.Simplificado;

interface

uses
    DB
   ,Ora
   ,Classes
   ,Graphics
   ,SysUtils
   ,StrUtils
   ,DBClient
   ,Dialogs
   ,OraScript
   ,ConhecFrete.Model.DTO.Cte
   ,ConhecFrete.Model.DTO.FiltrosSimulacaoCte;

  type
  IConhecFreteDAOCte = interface
  ['{9FFAAF69-F7B4-44F3-A4CA-879080828588}']
    function GetDsConhecFreteGerado(pNumCar :Double) :TOraQuery;
    function GetDsDtFatCarregmamento(pNumCar :Double) :TOraQuery;
    function BuscarNFePorCarregamentoCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetDadosCteSimlificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetQteUFCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetQteRemCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetQteDestSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetSqlSimularCteSimlificado(pParams :TFiltrosSimulacaoCte) :String;
    function GetCNPJColeta(pParams :TFiltrosSimulacaoCte) :String;

    procedure SetDsNotasEnviadasSEFAZ(pParams :TModelParamsCte; pOraQuery :TOraQuery);
    procedure ValidacoesRegrasSimulacaoCteSimplificado(pOraQuery :TOraQuery);
  end;

  TConhecFreteDAOCte = class(TInterfacedObject, IConhecFreteDAOCte)
  private
    FOraQuery :TOraQuery;
    FOraSession :TOraSession;

    function GetDsOraQuery :TOraQuery;
    function GetDsConhecFreteGerado(pNumCar :Double) :TOraQuery;
    function GetDadosCteSimlificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetSqlSimularCteSimlificado(pParams :TFiltrosSimulacaoCte) :String;
    function GetDsDtFatCarregmamento(pNumCar :Double) :TOraQuery;
    function BuscarNFePorCarregamentoCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetSqlQteUFCliente :String;
    function GetSqlQteClienteDest :String;
    function GetSqlQteUFFilial(pFilialNF :Boolean) :String;
    function GetSqlQteRemFilial(pFilialNF: Boolean) :String;
    function GetSqlTemplateBodyFilial(pFilialNF: Boolean; pFiledDefault :String): String;
    function GetSqlTemplateBodyCliente(pFiledDefault :String): String;

    function GetQteUFCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetQteRemCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetQteDestSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
    function GetCNPJColeta(pParams :TFiltrosSimulacaoCte) :String;

    procedure ValidacoesRegrasSimulacaoCteSimplificado(pOraQuery :TOraQuery);
    procedure SetDsNotasEnviadasSEFAZ(pParamsCte :TModelParamsCte; pOraQuery :TOraQuery);

  public
    class function New(const pSession :TOraSession) :IConhecFreteDAOCte;
    constructor Create(const pSession :TOraSession);
    destructor Destroy; override;
  end;

implementation

{ TConhecFreteDAOCte }

constructor TConhecFreteDAOCte.Create(const pSession :TOraSession);
begin
  FOraSession := pSession;
  FOraQuery := GetDsOraQuery;
end;

destructor TConhecFreteDAOCte.Destroy;
begin
  FreeAndNil(FOraQuery);
  inherited Destroy;
end;

function TConhecFreteDAOCte.GetCNPJColeta(pParams: TFiltrosSimulacaoCte): String;
var
 DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try
    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    DsOraQuery.SQL.Add(' SELECT NVL(PCFILIAL.CGC, PCFORNEC.CGC) AS CGC ');
    DsOraQuery.SQL.Add(' FROM PCFILIAL, PCFORNEC ');
    DsOraQuery.SQL.Add(' WHERE 1 = 1 ');
    DsOraQuery.SQL.Add(' AND PCFILIAL.CODIGO = :CODFILIALCOLETA' );
    DsOraQuery.SQL.Add(' AND PCFILIAL.CODIGO = PCFORNEC.CODFORNEC ');
    DsOraQuery.ParamByName('CODFILIALCOLETA').AsString := pParams.CodFilialDest;
    DsOraQuery.Open;
  finally
    Result :=  DsOraQuery.FieldByName('CGC').AsString;
    FreeAndNil(DsOraQuery);
  end;
end;

function TConhecFreteDAOCte.GetDadosCteSimlificado(pParams: TFiltrosSimulacaoCte): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try
    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    DsOraQuery.SQL.Add(GetSqlSimularCteSimlificado(pParams));
    DsOraQuery.ParamByName('NUMCAR').Value := pParams.NumCar;
    DsOraQuery.ParamByName(':VLSIMBOLICO').Value := pParams.VlFreteSimb;
  finally
    DsOraQuery.Open;
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetQteDestSimplificado(pParams: TFiltrosSimulacaoCte): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try
    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    DsOraQuery.SQL.Add(GetSqlQteClienteDest);
    DsOraQuery.ParamByName('NUMCAR').Value := pParams.NumCar;
  finally
    DsOraQuery.Open;
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetQteRemCteSimplificado(pParams: TFiltrosSimulacaoCte): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try
    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    DsOraQuery.SQL.Add(GetSqlQteRemFilial(pParams.GerarCteDadosFilialVirtual or
                                          pParams.GerarCteDadosTransfVirtualRetira));
    DsOraQuery.ParamByName('NUMCAR').Value := pParams.NumCar;
  finally
    DsOraQuery.Open;
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetQteUFCteSimplificado(pParams: TFiltrosSimulacaoCte): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try

    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    case pParams.GetUfCliente of
      True:  DsOraQuery.SQL.Add(GetSqlQteUFCliente);
      False: DsOraQuery.SQL.Add(GetSqlQteUFFilial((pParams.GerarCteDadosFilialVirtual or
                                                   pParams.GerarCteDadosTransfVirtualRetira)));
    end;
    DsOraQuery.ParamByName('NUMCAR').Value := pParams.NumCar;
  finally
    DsOraQuery.Open;
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetSqlQteClienteDest: String;
var
  stlQuery :TStringList;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('SELECT ');
    stlQuery.Append('    PCCLIENT.CODCLI');
    stlQuery.Append('   ,COUNT(*) AS QT');
    stlQuery.Append(GetSqlTemplateBodyCliente('PCCLIENT.CODCLI'));
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlQteUFCliente: String;
var
  stlQuery :TStringList;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('SELECT ');
    stlQuery.Append('    CIDADE_CLIENTE.UF');
    stlQuery.Append('   ,COUNT(*) AS QT');
    stlQuery.Append(GetSqlTemplateBodyCliente('CIDADE_CLIENTE.UF'));
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlQteRemFilial(pFilialNF: Boolean): String;
var
  stlQuery :TStringList;
  sFilialUF :String;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('SELECT ');
    case pFilialNF of
      True:  sFilialUF := 'PCFILIAL_NF.CODCLI';
      False: sFilialUF := 'PCFILIAL.CODCLI';
    end;
    stlQuery.Append(Format(' %s',[sFilialUF]));
    stlQuery.Append('       ,COUNT(*) AS QT');
    stlQuery.Append(GetSqlTemplateBodyFilial(pFilialNF, sFilialUF));
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlQteUFFilial(pFilialNF :Boolean) :String;
var
  stlQuery :TStringList;
  sFilialUF :String;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('SELECT ');
    case pFilialNF of
      True:  sFilialUF := 'PCCIDADE_FILIAL_NF.UF';
      False: sFilialUF := 'PCCIDADE_FILIAL.UF';
    end;
    stlQuery.Append(Format(' %s',[sFilialUF]));
    stlQuery.Append('       ,COUNT(*) AS QT');
    stlQuery.Append(GetSqlTemplateBodyFilial(pFilialNF, sFilialUF));
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlSimularCteSimlificado(pParams: TFiltrosSimulacaoCte): String;
var
  stlQuery :TStringList;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Add('SELECT');
    stlQuery.Add('    PCNFSAID.NUMCAR,');
    stlQuery.Add('    MIN(PCNFSAID.CODFILIAL) AS CODFILIAL,');
    stlQuery.Add('    MIN(PCNFSAID.CODCLI) AS CODCLI,');
    stlQuery.Add('    MAX(PCNFSAID.CODFILIALNF) AS CODFILIALNF,');
    stlQuery.Add('    MAX(PCNFSAID.CODFISCAL) AS CODFISCAL,');
    stlQuery.Add('    (CASE WHEN (MAX(PCCLIENT.ESTENT) = MAX(PCFILIAL.UF)) THEN ''E'' ELSE ''I'' END) DESTINOVENDA,');
    stlQuery.Add('    DECODE(NVL(MAX(PCNFSAID.CODCLIRECEBEDOR),0), 0, MAX(PCNFSAID.CODCLI), MAX(PCNFSAID.CODCLIRECEBEDOR)) CODCLI,');
    stlQuery.Add('    DECODE(NVL(MAX(PCNFSAID.CODCLIRECEBEDOR),0), 0, MAX(PCCLIENT.CLIENTE),MAX(CLIRECEBEDOR.CLIENTE)) CLIENTE,');
    stlQuery.Add('    DECODE(NVL(MAX(PCNFSAID.CODCLIRECEBEDOR),0), 0, MAX(PCCLIENT.CONSUMIDORFINAL), MAX(CLIRECEBEDOR.CONSUMIDORFINAL)) CONSUMIDORFINAL,');
    stlQuery.Add('    SUM(PCREGIAO.VLFRETEKG) AS VLFRETEKG,');
    stlQuery.Add('    0 AS NUMTRANSVENDA, ');

    case pParams.GerarCteTipoFreteDespacho of
      True:  stlQuery.Add('  CASE WHEN NVL(MAX(PCNFSAID.FRETEDESPACHO),''C'') = ''F'' THEN ''F'' ELSE ''C'' END FRETEDESPACHO, ');
      False: stlQuery.Add('  ''C'' FRETEDESPACHO, ');
    end;

    case pParams.UtilizarEndEntregaPed of
      True:  stlQuery.Add('  NVL(NVL(MAX(PCPEDC.CODENDENTCLI), MAX(PCPEDC.CODENDENT)), 0) CODENDENTCLI, ');
      False: stlQuery.Add('  0 CODENDENTCLI, ');
    end;

    stlQuery.Add('    SUM(DECODE(PCNFSAID.TIPOVENDA,''TR'',PCNFSAID.VLTOTAL,');
    stlQuery.Add('    DECODE(PCNFSAID.CONDVENDA, 4,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    5,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    8,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    11,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    13,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    20,');
    stlQuery.Add('    PCNFSAID.VLTOTAL,');
    stlQuery.Add('    PCNFSAID.VLTOTGER)');
    stlQuery.Add('    )) VLTOTALNOTAS,                                                                                                                                              ');
    stlQuery.Add('       SUM(NVL(PCNFSAID.TOTPESO,0))TOTPESO,                                                                                                                                   ');
    stlQuery.Add('       CASE WHEN                                                                                                                                                              ');
    stlQuery.Add('          SUM(NVL(PCNFSAID.NUMVOLUME,0)) > 0 THEN SUM(NVL(PCNFSAID.NUMVOLUME,0))                                                                                              ');
    stlQuery.Add('       ELSE                                                                                                                                                                   ');
    stlQuery.Add('         MAX((SELECT SUM(NVL(PCMOV.QT,PCMOV.QTCONT)) FROM PCMOV WHERE PCMOV.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA))                                                          ');
    stlQuery.Add('       END TOTALVOLUME,                                                                                                                                                       ');
    stlQuery.Add('DECODE(:VLSIMBOLICO,                                                                                                                                                          ');
    stlQuery.Add('0,                                                                                                                                                                            ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT), PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) = PCFILIAL.UF THEN      ');
    stlQuery.Add('   (DECODE((PCNFSAID.VLTOTAL *                                                                                                                                                ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)                                                         ,                                               ');
    stlQuery.Add('                       0) / 100)                                                                                              ,                                               ');
    stlQuery.Add('                  0                                                                                                           ,                                               ');
    stlQuery.Add('                  PCNFSAID.VLTOTAL                                                                                            ,                                               ');
    stlQuery.Add('                  (PCNFSAID.VLTOTAL *                                                                                                                                         ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)                                                         ,                                               ');
    stlQuery.Add('                       0) / 100)))                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT = PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                 ');
    stlQuery.Add('                                       OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                                ');
    stlQuery.Add('(DECODE((PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100), 0,PCNFSAID.VLTOTAL, (PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100)))                          ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END),                                                                                                                                                                         ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                            ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI) = PCFILIAL.UF THEN                                                                       ');
    stlQuery.Add('      :VLSIMBOLICO                                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT = PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                 ');
    stlQuery.Add('                                      OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                                 ');
    stlQuery.Add(':VLSIMBOLICO                                                                                                                                                                  ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END)) VLTOTAL_EST                                                                 ,                                                                                           ');
    stlQuery.Add('DECODE(:VLSIMBOLICO                                                               ,                                                                                           ');
    stlQuery.Add('0                                                                                 ,                                                                                           ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI ) <> PCFILIAL.UF THEN                           ');
    stlQuery.Add('   (DECODE((PCNFSAID.VLTOTAL *                                                                                                                                                ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)                                   ,                                                                     ');
    stlQuery.Add('                       0) / 100)                                                                        ,                                                                     ');
    stlQuery.Add('                  0                                                                                     ,                                                                     ');
    stlQuery.Add('                  PCNFSAID.VLTOTAL                                                                      ,                                                                     ');
    stlQuery.Add('                  (PCNFSAID.VLTOTAL *                                                                                                                                         ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)                                   ,                                                                     ');
    stlQuery.Add('                       0) / 100)))                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT <> PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                ');
    stlQuery.Add('                                        OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                               ');
    stlQuery.Add('(DECODE((PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100), 0,PCNFSAID.VLTOTAL, (PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100)))                          ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END),                                                                                                                                                                         ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) <> PCFILIAL.UF THEN                            ');
    stlQuery.Add('      :VLSIMBOLICO                                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT <> PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                ');
    stlQuery.Add('                                         OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                              ');
    stlQuery.Add(':VLSIMBOLICO                                                                                                                                                                  ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END)) VLTOTAL_INTEREST,                                                                                                                                                       ');
    stlQuery.Add('DECODE(:VLSIMBOLICO,                                                                                                                                                          ');
    stlQuery.Add('0,                                                                                                                                                                            ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) = PCFILIAL.UF THEN                             ');
    stlQuery.Add('   (DECODE((PCNFSAID.VLTOTAL *                                                                                                                                                ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)           ,                                                                                             ');
    stlQuery.Add('                       0) / 100)                                                ,                                                                                             ');
    stlQuery.Add('                  0                                                             ,                                                                                             ');
    stlQuery.Add('                  PCNFSAID.VLTOTAL                                              ,                                                                                             ');
    stlQuery.Add('                  (PCNFSAID.VLTOTAL *                                                                                                                                         ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)           ,                                                                                             ');
    stlQuery.Add('                       0) / 100)))                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT = PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                 ');
    stlQuery.Add('                                       OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                                ');
    stlQuery.Add('(DECODE((PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100), 0,PCNFSAID.VLTOTAL, (PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100)))                          ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END),                                                                                                                                                                         ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) = PCFILIAL.UF THEN                             ');
    stlQuery.Add('      :VLSIMBOLICO                                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT = PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                 ');
    stlQuery.Add('                                        OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0)  THEN                                                                              ');
    stlQuery.Add(':VLSIMBOLICO                                                                                                                                                                  ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END)) VLTOTGER_EST,                                                                                                                                                           ');
    stlQuery.Add('DECODE(:VLSIMBOLICO,                                                                                                                                                          ');
    stlQuery.Add('0,                                                                                                                                                                            ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) <> PCFILIAL.UF THEN                            ');
    stlQuery.Add('   (DECODE((PCNFSAID.VLTOTAL *                                                                                                                                                ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)           ,                                                                                             ');
    stlQuery.Add('                       0) / 100)                                                ,                                                                                             ');
    stlQuery.Add('                  0                                                             ,                                                                                             ');
    stlQuery.Add('                  PCNFSAID.VLTOTAL                                              ,                                                                                             ');
    stlQuery.Add('                  (PCNFSAID.VLTOTAL *                                                                                                                                         ');
    stlQuery.Add('                  NVL((SELECT PCREGIAO.PERFRETECONHEC                                                                                                                         ');
    stlQuery.Add('                         FROM PCREGIAO, PCPRACA, PCCLIENTENDENT                                                                                                               ');
    stlQuery.Add('                        WHERE NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) =                                                                                                    ');
    stlQuery.Add('                              PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                           ');
    stlQuery.Add('                          AND PCCLIENTENDENT.CODPRACAENT = PCPRACA.CODPRACA                                                                                                   ');
    stlQuery.Add('                          AND PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO)           ,                                                                                             ');
    stlQuery.Add('                       0) / 100)))                                                                                                                                            ');
    stlQuery.Add('    WHEN PCCLIENT.ESTENT <> PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                               ');
    stlQuery.Add('                                         OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                              ');
    stlQuery.Add('(DECODE((PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100), 0,PCNFSAID.VLTOTAL, (PCNFSAID.VLTOTAL * NVL(PCREGIAO.PERFRETECONHEC, 0) / 100)))                          ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END),                                                                                                                                                                         ');
    stlQuery.Add('SUM(CASE                                                                                                                                                                      ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI) <> PCFILIAL.UF THEN                            ');
    stlQuery.Add('      :VLSIMBOLICO                                                                                                                                                            ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT <> PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                ');
    stlQuery.Add('                                        OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN                                                                               ');
    stlQuery.Add(':VLSIMBOLICO                                                                                                                                                                  ');
    stlQuery.Add('ELSE                                                                                                                                                                          ');
    stlQuery.Add('0                                                                                                                                                                             ');
    stlQuery.Add('END)) VLTOTGER_INTEREST,                                                                                                                                                      ');
    stlQuery.Add('       SUM (                                                                                                                                                                  ');
    stlQuery.Add('             (CASE                                                                                                                                                            ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI ) = PCFILIAL.UF THEN 1                          ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT = PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                 ');
    stlQuery.Add('                                      OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0)  THEN 1                                                                              ');
    stlQuery.Add('                       ELSE 0                                                                                                                                                 ');
    stlQuery.Add('                    END) )                                                                                                                                                    ');
    stlQuery.Add('             NUMNOTA_EST,                                                                                                                                                     ');
    stlQuery.Add('       SUM (                                                                                                                                                                  ');
    stlQuery.Add('             (CASE                                                                                                                                                            ');
    stlQuery.Add('   WHEN (SELECT PCCIDADE.UF                                                                                                                                                   ');
    stlQuery.Add('      FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                           ');
    stlQuery.Add('     WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE                                                                                                                      ');
    stlQuery.Add('       AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI ) <> PCFILIAL.UF THEN 1                         ');
    stlQuery.Add('   WHEN PCCLIENT.ESTENT <> PCFILIAL.UF AND (NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) IS NULL                                                                                ');
    stlQuery.Add('                                        OR NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = 0) THEN 1                                                                             ');
    stlQuery.Add('                       ELSE 0                                                                                                                                                 ');
    stlQuery.Add('                    END) )                                                                                                                                                    ');
    stlQuery.Add('             NUMNOTA_INTEREST,                                                                                                                                                ');
    stlQuery.Add('                                                                                                                                                                              ');
    stlQuery.Add('      MAX((SELECT CODPROD                                                                                                                                                     ');
    stlQuery.Add('             FROM PCMOV                                                                                                                                                       ');
    stlQuery.Add('            WHERE PCMOV.NUMCAR = PCNFSAID.NUMCAR AND                                                                                                                          ');
    stlQuery.Add('                  PCMOV.NUMNOTA = PCNFSAID.NUMNOTA AND                                                                                                                        ');
    stlQuery.Add('                 (PCMOV.QT * PCMOV.PUNIT)  = (SELECT MAX(M2.QT * M2.PUNIT)                                                                                                    ');
    stlQuery.Add('                                                FROM PCMOV M2                                                                                                                 ');
    stlQuery.Add('                                               WHERE M2.NUMCAR = PCMOV.NUMCAR                                                                                                 ');
    stlQuery.Add('                                                 AND M2.NUMNOTA = PCMOV.NUMNOTA) AND ROWNUM = 1  ))  AS CODPRODPREDOMINANTE,                                                  ');
    stlQuery.Add(' MAX(PCNFSAID.NUMNOTA) NUMNOTA,                                                                                                                                               ');
    stlQuery.Add(' MAX(PCNFSAID.NUMTRANSVENDA) NUMTRANSVENDAORIG,                                                                                                                               ');
    stlQuery.Add(' DBMS_LOB.SUBSTR(WM_CONCAT(DISTINCT PCNFSAID.NUMTRANSVENDA), 1500) TRANSACOES                                                                                                 ');
    stlQuery.Add('FROM   PCNFSAID, PCCLIENT, PCFILIAL, PCPEDC, PCCLIENT CLIRECEBEDOR, PCCARREG, PCCONSUM, PCPRACA, PCREGIAO                                                                     ');
    stlQuery.Add('WHERE  PCNFSAID.NUMCAR = :NUMCAR                                                                                                                                              ');
    stlQuery.Add('AND    PCCLIENT.CODPRACA = PCPRACA.CODPRACA                                                                                                                                   ');
    stlQuery.Add('AND    PCPRACA.NUMREGIAO = PCREGIAO.NUMREGIAO                                                                                                                                 ');
    stlQuery.Add('AND    NVL(PCNFSAID.NUMTRANSVENDACONHEC, 0) = 0                                                                                                                               ');
    stlQuery.Add('AND    ((NVL(PCNFSAID.TIPOVENDA,''  '') IN (''TR'',''DF'')) OR (PCNFSAID.CODFILIAL <> PCNFSAID.CODFILIALNF))                                                                  ');
    stlQuery.Add('AND    PCNFSAID.CODFILIALNF = PCFILIAL.CODIGO                                                                                                                                 ');
    stlQuery.Add('AND    NVL(PCNFSAID.TIPOVENDA,'''') NOT IN (''SR'')                                                                                                                           ');
    stlQuery.Add('AND    ((NVL(PCNFSAID.TIPOVENDA,''  '') =  (''TR'')) OR (PCPEDC.DTNFTRANSF IS NOT NULL))                                                                                      ');
    stlQuery.Add('AND    NVL(PCNFSAID.ESPECIE,''  '') = ''NF''                                                                                                                                  ');
    stlQuery.Add('AND    PCNFSAID.DTCANCEL IS NULL                                                                                                                                              ');
    stlQuery.Add('AND    PCNFSAID.NUMCAR = PCCARREG.NUMCAR                                                                                                                                      ');
    stlQuery.Add('AND    PCNFSAID.CODCLI = PCCLIENT.CODCLI                                                                                                                                      ');
    stlQuery.Add('AND    PCNFSAID.NUMPED = PCPEDC.NUMPED(+)                                                                                                                                     ');
    stlQuery.Add('AND    DECODE(NVL(PCNFSAID.CODCLIRECEBEDOR,0), 0, PCNFSAID.CODCLI, PCNFSAID.CODCLIRECEBEDOR) = CLIRECEBEDOR.CODCLI                                                            ');
    stlQuery.Add('AND PCFILIAL.CODMUN <>                                                                                                                                                        ');
    stlQuery.Add('    NVL((SELECT PCCIDADE.CODIBGE                                                                                                                                              ');
    stlQuery.Add('         FROM PCCIDADE, PCCLIENTENDENT                                                                                                                                        ');
    stlQuery.Add('         WHERE PCCLIENTENDENT.CODCIDADE = PCCIDADE.CODCIDADE  AND PCPEDC.CODCLI = PCCLIENTENDENT.CODCLI                                                                       ');
    stlQuery.Add('           AND NVL(PCPEDC.CODENDENTCLI, PCPEDC.CODENDENT) = PCCLIENTENDENT.CODENDENTCLI), 0)                                                                                  ');
    stlQuery.Add('GROUP BY');
    stlQuery.Add(' PCNFSAID.NUMCAR');

  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlTemplateBodyCliente(pFiledDefault: String): String;
var
  stlQuery :TStringList;
begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('FROM PCNFSAID');
    stlQuery.Append('INNER JOIN PCCLIENT');
    stlQuery.Append('  ON PCCLIENT.CODCLI = PCNFSAID.CODCLI');
    stlQuery.Append('INNER JOIN PCCIDADE CIDADE_CLIENTE');
    stlQuery.Append('  ON CIDADE_CLIENTE.CODIBGE = PCCLIENT.CODMUNICIPIO');
    stlQuery.Append('LEFT JOIN PCPEDC');
    stlQuery.Append('  ON PCPEDC.NUMPED = PCNFSAID.NUMPED');
    stlQuery.Append('INNER JOIN PCCLIENT CLIRECEBEDOR');
    stlQuery.Append('ON CLIRECEBEDOR.CODCLI = DECODE(NVL(PCNFSAID.CODCLIRECEBEDOR,0), 0, PCNFSAID.CODCLI, PCNFSAID.CODCLIRECEBEDOR)');
    stlQuery.Append('INNER JOIN PCCARREG');
    stlQuery.Append('  ON PCCARREG.NUMCAR = PCNFSAID.NUMCAR');
    stlQuery.Append('INNER JOIN PCPRACA');
    stlQuery.Append('  ON PCCLIENT.CODPRACA = PCPRACA.CODPRACA');
    stlQuery.Append('INNER JOIN PCREGIAO');
    stlQuery.Append('  ON PCREGIAO.NUMREGIAO = PCPRACA.NUMREGIAO');
    stlQuery.Append('WHERE 1=1');
    stlQuery.Append('  AND PCNFSAID.NUMCAR = :NUMCAR');
    stlQuery.Append('  AND NVL(PCNFSAID.NUMTRANSVENDACONHEC, 0) = 0');
    stlQuery.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') IN (''TR'',''DF'')) OR (PCNFSAID.CODFILIAL <> PCNFSAID.CODFILIALNF))');
    stlQuery.Append('  AND NVL(PCNFSAID.TIPOVENDA,'''') NOT IN (''SR'')');
    stlQuery.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') =  (''TR'')) OR (PCPEDC.DTNFTRANSF IS NOT NULL))');
    stlQuery.Append('  AND NVL(PCNFSAID.ESPECIE,''  '') = ''NF''');
    stlQuery.Append('  AND PCNFSAID.DTCANCEL IS NULL');
    stlQuery.Append(Format('GROUP BY %s',[pFiledDefault]));
    stlQuery.Append('ORDER BY QT DESC');
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;
end;

function TConhecFreteDAOCte.GetSqlTemplateBodyFilial(pFilialNF: Boolean; pFiledDefault :String): String;
var
  stlQuery :TStringList;

begin
  stlQuery := TStringList.Create;
  try
    stlQuery.Append('FROM PCNFSAID');
    stlQuery.Append('INNER JOIN PCCLIENT');
    stlQuery.Append('  ON PCCLIENT.CODCLI = PCNFSAID.CODCLI');
    stlQuery.Append('INNER JOIN PCCIDADE CIDADE_CLIENTE');
    stlQuery.Append('  ON CIDADE_CLIENTE.CODIBGE = PCCLIENT.CODMUNICIPIO');
    case pFilialNF of
      True:
      begin
        stlQuery.Append('INNER JOIN PCFILIAL PCFILIAL_NF');
        stlQuery.Append('  ON PCFILIAL_NF.CODIGO = PCNFSAID.CODFILIALNF');
        stlQuery.Append('INNER JOIN PCCLIENT PCCLIENTE_FILIAL_NF');
        stlQuery.Append('  ON PCCLIENTE_FILIAL_NF.CODCLI = PCFILIAL_NF.CODCLI');
        stlQuery.Append('INNER JOIN PCCIDADE PCCIDADE_FILIAL_NF');
        stlQuery.Append('  ON PCCIDADE_FILIAL_NF.CODIBGE = PCCLIENTE_FILIAL_NF.CODMUNICIPIO');
      end;

      False:
      begin
        stlQuery.Append('INNER JOIN PCFILIAL');
        stlQuery.Append('  ON PCFILIAL.CODIGO = PCNFSAID.CODFILIAL');
        stlQuery.Append('INNER JOIN PCCLIENT PCCLIENTE_FILIAL');
        stlQuery.Append('  ON PCCLIENTE_FILIAL.CODCLI = PCFILIAL.CODCLI');
        stlQuery.Append('INNER JOIN PCCIDADE PCCIDADE_FILIAL');
        stlQuery.Append('  ON PCCIDADE_FILIAL.CODIBGE = PCCLIENTE_FILIAL.CODMUNICIPIO');
      end;
    end;
    stlQuery.Append('LEFT JOIN PCPEDC');
    stlQuery.Append('  ON PCPEDC.NUMPED = PCNFSAID.NUMPED');
    stlQuery.Append('INNER JOIN PCCLIENT CLIRECEBEDOR');
    stlQuery.Append('ON CLIRECEBEDOR.CODCLI = DECODE(NVL(PCNFSAID.CODCLIRECEBEDOR,0), 0, PCNFSAID.CODCLI, PCNFSAID.CODCLIRECEBEDOR)');
    stlQuery.Append('INNER JOIN PCCARREG');
    stlQuery.Append('  ON PCCARREG.NUMCAR = PCNFSAID.NUMCAR');
    stlQuery.Append('INNER JOIN PCPRACA');
    stlQuery.Append('  ON PCCLIENT.CODPRACA = PCPRACA.CODPRACA');
    stlQuery.Append('INNER JOIN PCREGIAO');
    stlQuery.Append('  ON PCREGIAO.NUMREGIAO = PCPRACA.NUMREGIAO');
    stlQuery.Append('WHERE 1=1');
    stlQuery.Append('  AND PCNFSAID.NUMCAR = :NUMCAR');
    stlQuery.Append('  AND NVL(PCNFSAID.NUMTRANSVENDACONHEC, 0) = 0');
    stlQuery.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') IN (''TR'',''DF'')) OR (PCNFSAID.CODFILIAL <> PCNFSAID.CODFILIALNF))');
    stlQuery.Append('  AND NVL(PCNFSAID.TIPOVENDA,'''') NOT IN (''SR'')');
    stlQuery.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') =  (''TR'')) OR (PCPEDC.DTNFTRANSF IS NOT NULL))');
    stlQuery.Append('  AND NVL(PCNFSAID.ESPECIE,''  '') = ''NF''');
    stlQuery.Append('  AND PCNFSAID.DTCANCEL IS NULL');
    stlQuery.Append(Format('GROUP BY %s',[pFiledDefault]));
    stlQuery.Append('ORDER BY QT DESC');
  finally
    Result := stlQuery.Text;
    FreeAndNil(stlQuery);
  end;

end;

function TConhecFreteDAOCte.GetDsConhecFreteGerado(pNumCar: Double): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try


    DsOraQuery.Close;
    DsOraQuery.SQL.Clear;
    DsOraQuery.SQL.Add('SELECT COUNT(*) CONTADOR');
    DsOraQuery.SQL.Add('  FROM PCCARREG, PCNFSAID');
    DsOraQuery.SQL.Add(' WHERE PCCARREG.NUMCAR = :NUMCAR');
    DsOraQuery.SQL.Add('   AND PCCARREG.NUMCAR = PCNFSAID.NUMCAR(+) ');
    DsOraQuery.SQL.Add('   AND NVL(PCNFSAID.NUMTRANSVENDACONHEC, 0) = 0 ');
    DsOraQuery.ParamByName('NUMCAR').AsFloat := pNumCar;
    DsOraQuery.Open;

  finally
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetDsDtFatCarregmamento(pNumCar: Double): TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
  try
    DsOraQuery.SQL.Add('SELECT DTFAT');
    DsOraQuery.SQL.Add('  FROM PCCARREG');
    DsOraQuery.SQL.Add(' WHERE NUMCAR = :NUMCAR');
    DsOraQuery.ParamByName('NUMCAR').Value := pNumCar;
    DsOraQuery.Open;
  finally
    Result := DsOraQuery;
  end;
end;

function TConhecFreteDAOCte.GetDsOraQuery: TOraQuery;
begin
  Result := TOraQuery.Create(nil);
  Result.Session := FOraSession;
end;

class function TConhecFreteDAOCte.New(const pSession :TOraSession): IConhecFreteDAOCte;
begin
  Result := Self.Create(pSession);
end;

procedure TConhecFreteDAOCte.SetDsNotasEnviadasSEFAZ(pParamsCte: TModelParamsCte; pOraQuery: TOraQuery);
begin
  pOraQuery.Close;
  try
    pOraQuery.SQL.Clear;
    pOraQuery.SQL.Add('SELECT PCNFSAID.CODFILIAL,  ');
    pOraQuery.SQL.Add('       PCNFSAID.NUMNOTA,   ');
    pOraQuery.SQL.Add('       PCNFSAID.NUMCAR   ');
    pOraQuery.SQL.Add('  FROM PCNFSAID,PCFILIAL    ');
    pOraQuery.SQL.Add(' WHERE PCNFSAID.CODFILIAL = PCFILIAL.CODIGO ');
    pOraQuery.SQL.Add('   AND (PCNFSAID.ESPECIE = ''NE'' ');
    pOraQuery.SQL.Add('   AND NVL(PCNFSAID.ENVIADA,''N'') = ''N'' ');
    pOraQuery.SQL.Add('   AND NVL(PCFILIAL.CONTROLENFEPORSERIE,''N'') = ''S'') ');
    pOraQuery.SQL.Add('   AND PCNFSAID.DTCANCEL IS NULL ');
    if pParamsCte.NumCar > 0 then
    begin
      pOraQuery.SQL.Add('   AND PCNFSAID.NUMCAR = :NUMCAR');
      pOraQuery.ParamByName('NUMCAR').AsFloat := pParamsCte.NumCar;
    end;
    if pParamsCte.NumTransVendaIni <> 0 then
    begin
      pOraQuery.SQL.Add('   AND PCNFSAID.NUMTRANSVENDA >= :NUMTRANSVENDAINI');
      pOraQuery.ParamByName('NUMTRANSVENDAINI').AsFloat := pParamsCte.NumTransVendaIni;
    end;
    if pParamsCte.NumTransVendaFim > 0 then
    begin
      pOraQuery.SQL.Add('   AND PCNFSAID.NUMTRANSVENDA <= :NUMTRANSVENDAFIM');
      pOraQuery.ParamByName('NUMTRANSVENDAFIM').AsFloat := pParamsCte.NumTransVendaFim;
    end;

    if (pParamsCte.CmpCFOP.Text <> EmptyStr) then
      pOraQuery.SQL.Add('   AND NVL(PCNFSAID.CODFISCALNF, 0) NOT IN (' + pParamsCte.CmpCFOP.GetSelecionados(1,',') + ')');

    pOraQuery.SQL.Add('ORDER BY CODFILIAL,NUMNOTA,NUMCAR ');
  finally
    pOraQuery.Open;
  end;
end;

procedure TConhecFreteDAOCte.ValidacoesRegrasSimulacaoCteSimplificado(
  pOraQuery: TOraQuery);
begin

end;

function TConhecFreteDAOCte.BuscarNFePorCarregamentoCteSimplificado(pParams :TFiltrosSimulacaoCte) :TOraQuery;
var
  DsOraQuery :TOraQuery;
begin
  DsOraQuery := GetDsOraQuery;
	try
    DsOraQuery.SQL.Append('SELECT PCNFSAID.DTSAIDA');
    DsOraQuery.SQL.Append('      ,''N'' AS SELECIONADO');
    DsOraQuery.SQL.Append('      ,CASE WHEN (PCCLIENT.ESTENT = PCNFSAID.UF) THEN ''E''');
    DsOraQuery.SQL.Append('            ELSE ''I'' END DESTINOVENDA');
    DsOraQuery.SQL.Append('      ,NVL(PCNFSAID.CODCLIRECEBEDOR, PCNFSAID.CODCLI) AS CODCLIRECEBEDOR');
    DsOraQuery.SQL.Append('      ,DECODE(NVL(PCNFSAID.CODCLIRECEBEDOR,0), 0, PCCLIENT.CLIENTE, CLIRECEBEDOR.CLIENTE) CLIENTE');
    DsOraQuery.SQL.Append('      ,PCCLIENT.CODMUNICIPIO');
    DsOraQuery.SQL.Append('      ,CIDADE_CLIENTE.NOMECIDADE CIDADE_CLIENTE');
    DsOraQuery.SQL.Append('      ,CIDADE_CLIENTE.UF');
    case (pParams.GerarCteDadosFilialVirtual or
          pParams.GerarCteDadosTransfVirtualRetira) of
      True:
      begin
        DsOraQuery.SQL.Append('      ,PCNFSAID.CODFILIALNF');
        DsOraQuery.SQL.Append('      ,PCCLIENTE_FILIAL_NF.CODCLI CODCLIFILIAL');
        DsOraQuery.SQL.Append('      ,PCCLIENTE_FILIAL_NF.CLIENTE RAZAOSOCIAL');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL_NF.CODIBGE');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL_NF.NOMECIDADE CIDADE_FILIAL');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL_NF.UF UF_FILIAL');
      end;

      False:
      begin
        DsOraQuery.SQL.Append('      ,PCNFSAID.CODFILIAL');
        DsOraQuery.SQL.Append('      ,PCCLIENTE_FILIAL.CODCLI CODCLIFILIAL');
        DsOraQuery.SQL.Append('      ,PCCLIENTE_FILIAL.CLIENTE RAZAOSOCIAL');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL.CODIBGE');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL.NOMECIDADE CIDADE_FILIAL');
        DsOraQuery.SQL.Append('      ,PCCIDADE_FILIAL.UF UF_FILIAL');
      end;
    end;

    DsOraQuery.SQL.Append('      ,PCNFSAID.ESPECIE');
    DsOraQuery.SQL.Append('      ,PCNFSAID.CHAVENFE');
    DsOraQuery.SQL.Append('      ,PCNFSAID.NUMNOTA');
    DsOraQuery.SQL.Append('      ,PCNFSAID.CODFISCAL AS CFOP');
    DsOraQuery.SQL.Append('      ,PCNFSAID.NUMTRANSVENDA');
    DsOraQuery.SQL.Append('FROM PCNFSAID');
    DsOraQuery.SQL.Append('INNER JOIN PCCLIENT');
    DsOraQuery.SQL.Append('  ON PCCLIENT.CODCLI = PCNFSAID.CODCLI');
    DsOraQuery.SQL.Append('INNER JOIN PCCIDADE CIDADE_CLIENTE');
    DsOraQuery.SQL.Append('  ON CIDADE_CLIENTE.CODIBGE = PCCLIENT.CODMUNICIPIO');

    case (pParams.GerarCteDadosFilialVirtual or
          pParams.GerarCteDadosTransfVirtualRetira) of
      True:
      begin
        DsOraQuery.SQL.Append('INNER JOIN PCFILIAL PCFILIAL_NF');
        DsOraQuery.SQL.Append('  ON PCFILIAL_NF.CODIGO = PCNFSAID.CODFILIALNF');
        DsOraQuery.SQL.Append('INNER JOIN PCCLIENT PCCLIENTE_FILIAL_NF');
        DsOraQuery.SQL.Append('  ON PCCLIENTE_FILIAL_NF.CODCLI = PCFILIAL_NF.CODCLI');
        DsOraQuery.SQL.Append('INNER JOIN PCCIDADE PCCIDADE_FILIAL_NF');
        DsOraQuery.SQL.Append('  ON PCCIDADE_FILIAL_NF.CODIBGE = PCCLIENTE_FILIAL_NF.CODMUNICIPIO');
      end;

      False:
      begin
        DsOraQuery.SQL.Append('INNER JOIN PCFILIAL');
        DsOraQuery.SQL.Append('  ON PCFILIAL.CODIGO = PCNFSAID.CODFILIAL');
        DsOraQuery.SQL.Append('INNER JOIN PCCLIENT PCCLIENTE_FILIAL');
        DsOraQuery.SQL.Append('  ON PCCLIENTE_FILIAL.CODCLI = PCFILIAL.CODCLI');
        DsOraQuery.SQL.Append('INNER JOIN PCCIDADE PCCIDADE_FILIAL');
        DsOraQuery.SQL.Append('  ON PCCIDADE_FILIAL.CODIBGE = PCCLIENTE_FILIAL.CODMUNICIPIO');
      end;
    end;

    DsOraQuery.SQL.Append('LEFT JOIN PCPEDC');
    DsOraQuery.SQL.Append('  ON PCPEDC.NUMPED = PCNFSAID.NUMPED');
    DsOraQuery.SQL.Append('INNER JOIN PCCLIENT CLIRECEBEDOR');
    DsOraQuery.SQL.Append('ON CLIRECEBEDOR.CODCLI = DECODE(NVL(PCNFSAID.CODCLIRECEBEDOR,0), 0, PCNFSAID.CODCLI, PCNFSAID.CODCLIRECEBEDOR)');
    DsOraQuery.SQL.Append('INNER JOIN PCCARREG');
    DsOraQuery.SQL.Append('  ON PCCARREG.NUMCAR = PCNFSAID.NUMCAR');
    DsOraQuery.SQL.Append('INNER JOIN PCPRACA');
    DsOraQuery.SQL.Append('  ON PCCLIENT.CODPRACA = PCPRACA.CODPRACA');
    DsOraQuery.SQL.Append('INNER JOIN PCREGIAO');
    DsOraQuery.SQL.Append('  ON PCREGIAO.NUMREGIAO = PCPRACA.NUMREGIAO');
    DsOraQuery.SQL.Append('WHERE 1=1');
    DsOraQuery.SQL.Append('  AND PCNFSAID.NUMCAR = :NUMCAR');
    DsOraQuery.SQL.Append('  AND NVL(PCNFSAID.NUMTRANSVENDACONHEC, 0) = 0');
    DsOraQuery.SQL.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') IN (''TR'',''DF'')) OR (PCNFSAID.CODFILIAL <> PCNFSAID.CODFILIALNF))');
    DsOraQuery.SQL.Append('  AND NVL(PCNFSAID.TIPOVENDA,'''') NOT IN (''SR'')');
    DsOraQuery.SQL.Append('  AND ((NVL(PCNFSAID.TIPOVENDA,''  '') =  (''TR'')) OR (PCPEDC.DTNFTRANSF IS NOT NULL))');
    DsOraQuery.SQL.Append('  AND NVL(PCNFSAID.ESPECIE,''  '') = ''NF''');
    DsOraQuery.SQL.Append('  AND PCNFSAID.DTCANCEL IS NULL');

    DsOraQuery.ParamByName('NUMCAR').Value := pParams.NumCar;
  finally
    DsOraQuery.Open;
    Result := DsOraQuery;
  end;
end;


end.


unit ConhecFrete.Model.DTO.DadosColeta;

interface

uses
   SysUtils
   ,Ora;

type
  TDadosColeta = class
  private
    FCnpjColeta,
    Frazaosocialcoleta,
    Flogradourocoleta,
    Fnumerocoleta,
    Fcomplementocoleta,
    Fbairrocoleta : String;
    Fcodcidadecoleta : Double;
    FExisteMaisDeUmaColeta : Boolean;
  public
    function NecessitaDadosColeta(pNumCar, pCodProdPred: Double; pCodFilial: String): Boolean;
    function BuscarDadosEnderecoColeta(pNumCar,
                                       pCodProdPred: Double;
                                       pCodFilial : String = ''): TDadosColeta;

    property CnpjColeta              :String  read FCnpjColeta            write FCnpjColeta;
    property RazaoSocialcoleta       :String  read FRazaoSocialcoleta     write FRazaoSocialcoleta;
    property LogradouroColeta        :String  read FLogradouroColeta      write FLogradouroColeta;
    property NumeroColeta            :String  read FNumeroColeta          write FNumeroColeta;
    property ComplementoColeta       :String  read FComplementoColeta     write FComplementoColeta;
    property BairroColeta            :String  read FBairroColeta          write FBairroColeta;
    property CodCidadeColeta         :Double  read FCodCidadeColeta       write FCodCidadeColeta;
    property ExisteMaisDeUmaColeta   :Boolean read FExisteMaisDeUmaColeta write FExisteMaisDeUmaColeta;
 end;

implementation

{ TDadosColeta }

function TDadosColeta.NecessitaDadosColeta(pNumCar, pCodProdPred: Double;
  pCodFilial: String): Boolean;
var
  DsQuery :TOraQuery;
begin
  DsQuery := TOraQuery.Create(nil);

  DsQuery.Close;
  DsQuery.SQL.Clear;
  DsQuery.SQL.ADD(' SELECT PCPEDI.CODFILIALRETIRA, PCPEDC.CODFILIAL ');
  DsQuery.SQL.ADD(' FROM PCPEDI, PCPEDC ');
  DsQuery.SQL.ADD(' WHERE 1=1 ');
  DsQuery.SQL.ADD(' AND PCPEDC.NUMCAR = PCPEDI.NUMCAR ');
  DsQuery.SQL.ADD(' AND PCPEDC.NUMPED = PCPEDI.NUMPED ');
  DsQuery.SQL.ADD(' AND PCPEDC.NUMCAR = :NUMCAR');
  DsQuery.SQL.ADD(' AND PCPEDI.CODPROD = :CODPROD');
  DsQuery.ParamByName('NUMCAR').AsFloat := pNumCar;
  DsQuery.ParamByName('CODPROD').AsFloat := pCodProdPred;
  DsQuery.Open;

  repeat
    if DsQuery.FieldByName('CODFILIALRETIRA').AsString <> DsQuery.FieldByName('CODFILIAL').AsString then
    begin
      Result := True;
      Break;
    end
    else
      Result := False;
    DsQuery.Next;
  until DsQuery.Eof;
end;

function TDadosColeta.BuscarDadosEnderecoColeta(pNumCar,
                                                pCodProdPred: Double;
                                                pCodFilial : String = ''): TDadosColeta;
var
 sCodfilial : string;
 DsQuery :TOraQuery;
begin
  try
    DsQuery := TOraQuery.Create(nil);
    if pCodFilial = EmptyStr then
    begin
      DsQuery.Close;
      DsQuery.SQL.Clear;
      DsQuery.SQL.ADD(' SELECT COUNT(DISTINCT CODFILIALRETIRA) AS CONTADOR ');
      DsQuery.SQL.ADD(' FROM PCPEDI ');
      DsQuery.SQL.ADD('  WHERE NUMCAR = :NUMCAR' );
      DsQuery.SQL.ADD('  AND CODPROD = :CODPROD' );
      DsQuery.ParamByName('NUMCAR').AsFloat := pNumCar;
      DsQuery.ParamByName('CODPROD').AsFloat := pCodProdPred;
      DsQuery.Open;


      if (DsQuery.FieldByName('CONTADOR').AsFloat > 1) then
      begin
        ExisteMaisDeumaColeta := True;
        Result := Self;
        Exit;
      end
      else
      begin
        ExisteMaisDeumaColeta := False;

        DsQuery.Close;
        DsQuery.SQL.Clear;
        DsQuery.SQL.ADD(' SELECT DISTINCT CODFILIALRETIRA');
        DsQuery.SQL.ADD(' FROM PCPEDI ');
        DsQuery.SQL.ADD('  WHERE NUMCAR = :NUMCAR' );
        DsQuery.SQL.ADD('  AND CODPROD = :CODPROD' );
        DsQuery.ParamByName('NUMCAR').AsFloat := pNumCar;
        DsQuery.ParamByName('CODPROD').AsFloat := pCodProdPred;
        DsQuery.Open;
        sCodfilial := DsQuery.FieldByName('CODFILIALRETIRA').AsString;
      end;

    end
    else
    begin
      DsQuery.Close;
      DsQuery.SQL.Clear;
      DsQuery.SQL.Add(' SELECT NVL(PCFILIAL.CGC, PCFORNEC.CGC) AS CGC, ');
      DsQuery.SQL.Add(' NVL(PCFILIAL.RAZAOSOCIAL, PCFORNEC.FORNECEDOR) AS RAZAOSOCIAL, ');
      DsQuery.SQL.Add(' NVL(PCFILIAL.ENDERECO, PCFORNEC.ENDER) AS ENDERECO, ');
      DsQuery.SQL.Add(' NVL(PCFILIAL.NUMERO, PCFILIAL.NUMERO) AS NUMERO, ');
      DsQuery.SQL.Add(' (SELECT COMPLEMENTOEND ');
      DsQuery.SQL.Add(' FROM PCFORNEC ');
      DsQuery.SQL.Add(' WHERE CODFORNEC = PCFILIAL.CODFORNEC) AS COMPLEMENTO, ');
      DsQuery.SQL.Add(' NVL(PCFILIAL.BAIRRO, PCFORNEC.BAIRRO) AS BAIRRO, ');
      DsQuery.SQL.Add(' (SELECT CODCIDADE FROM PCFORNEC WHERE CODFORNEC = PCFILIAL.CODFORNEC) AS CODCIDADE ');
      DsQuery.SQL.Add(' FROM PCFILIAL, PCFORNEC ');
      DsQuery.SQL.Add(' WHERE 1 = 1 ');
      DsQuery.SQL.Add(' AND PCFILIAL.CODIGO = :CODFILIALCOLETA' );
      DsQuery.SQL.Add(' AND PCFILIAL.CODIGO = PCFORNEC.CODFORNEC ');

      if (pCodFilial = EmptyStr) and (not ExisteMaisDeumaColeta) then
        DsQuery.ParamByName('CODFILIALCOLETA').AsString := sCodfilial
      else
        DsQuery.ParamByName('CODFILIALCOLETA').AsString := pCodfilial;

      DsQuery.Open;

      CnpjColeta        := DsQuery.FieldByName('CGC').AsString;
      RazaoSocialcoleta := DsQuery.FieldByName('RAZAOSOCIAL').AsString;
      LogradouroColeta  := DsQuery.FieldByName('ENDERECO').AsString;
      NumeroColeta      := DsQuery.FieldByName('NUMERO').AsString;
      ComplementoColeta := DsQuery.FieldByName('COMPLEMENTO').AsString;
      BairroColeta      := DsQuery.FieldByName('BAIRRO').AsString;
      CodCidadeColeta   := DsQuery.FieldByName('CODCIDADE').AsFloat;
    end;
  finally
    Result := Self;
  end;
end;

end.

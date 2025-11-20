unit ConhecFrete.Model.DTO.DadosTributacao;

interface

type
  TDadosTributacao = Class
  private
    FCodFiscalTranspForaUF: Integer;
    FSitTributIsentoICMS: String;
    FCodFiscalTranspDentroUF: Integer;
    FAliquotaISS: Double;
    FBaseCalcISS: Double;
    FCodFiscalDevTransf: Integer;
    FSitTribut: String;
    FPerreducBaseICMSFrete: Double;
    FCodFiscalFrete: Integer;
    FSitTributIsentoICMSEnt: String;
    FPercICMFrete: Double;
    FCodFiscalFretePF: Integer;
    FAliquota: Double;
    FPercICMFretePF: Double;
    FBaseCalc: Double;
    FZerarICMSContribuinte: String;
    FSitTributEnt: String;
    FPercServPrest: Double;
    FCalculaISS: Boolean;
    FCodFiscalFreteEnt: Integer;
  public
    property Aliquota                :Double  read FAliquota                   write FAliquota;
    property AliquotaISS             :Double  read FAliquotaISS                write FAliquotaISS;
    property CodFiscalFreteEnt       :Integer read FCodFiscalFreteEnt          write FCodFiscalFreteEnt;
    property CodFiscalFrete          :Integer read FCodFiscalFrete             write FCodFiscalFrete;
    property CodFiscalFretePF        :Integer read FCodFiscalFretePF           write FCodFiscalFretePF;
    property CodFiscalFreteDevTransf :Integer read FCodFiscalDevTransf         write FCodFiscalDevTransf;
    property CodFiscalTranspForaUF   :Integer read FCodFiscalTranspForaUF      write FCodFiscalTranspForaUF;
    property CodFiscalTranspDentroUF :Integer read FCodFiscalTranspDentroUF    write FCodFiscalTranspDentroUF;
    property BaseCalc                :Double  read FBaseCalc                   write FBaseCalc;
    property PercICMFretePF          :Double  read FPercICMFretePF             write FPercICMFretePF;
    property PercICMFrete            :Double  read FPercICMFrete               write FPercICMFrete;
    property BaseCalcISS             :Double  read FBaseCalcISS                write FBaseCalcISS;
    property CalculaISS              :Boolean read FCalculaISS                 write FCalculaISS;
    property SitTribut               :String  read FSitTribut                  write FSitTribut;
    property SitTributEnt            :String  read FSitTributEnt               write FSitTributEnt;
    property ZerarICMSContribuinte   :String  read FZerarICMSContribuinte      write FZerarICMSContribuinte;
    property PercServPrest           :Double  read FPercServPrest              write FPercServPrest;
    property PerreducBaseICMSFrete   :Double  read FPerreducBaseICMSFrete      write FPerreducBaseICMSFrete;
    property SitTributISentoICMS     :String  read FSitTributIsentoICMS        write FSitTributIsentoICMS;
    property SitTributIsentoICMSEnt  :String  read FSitTributIsentoICMSEnt     write FSitTributIsentoICMSEnt;
  end;

implementation

end.

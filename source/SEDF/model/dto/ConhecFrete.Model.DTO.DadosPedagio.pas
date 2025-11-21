unit ConhecFrete.Model.DTO.DadosPedagio;

interface

type
  TDadosPedagio = class
  private
    FCnpjFornecPedagio,
    FCnpjResponsavelPedagio : String;
    FReplicar : Boolean;
    FValorPedagio,
    FNumValePedagio : Double;
  public
    function GravarDadosPedagio(CnpjFornecPedagio,
                               CnpjResponsavelPedagio: String;
                               ValorPedagio,
                               NumValePedagio : Double): TDadosPedagio;

    property CnpjFornecPedagio      :String  read FCnpjFornecPedagio        write FCnpjFornecPedagio;
    property NumValePedagio      		:Double  read FNumValePedagio     		  write FNumValePedagio;
    property CnpjResponsavelPedagio :String  read FCnpjResponsavelPedagio   write FCnpjResponsavelPedagio;
    property Replicar               :Boolean read FReplicar                 write FReplicar;
  	property ValorPedagio	         	:Double  read FValorPedagio       	    write FValorPedagio;
 end;

implementation

{ TDadosPedagio }

function TDadosPedagio.GravarDadosPedagio(CnpjFornecPedagio,
                                          CnpjResponsavelPedagio: String;
                                          ValorPedagio,
                                          NumValePedagio : Double): TDadosPedagio;
begin
  Result := TDadosPedagio.Create;

  Result.ValorPedagio           := ValorPedagio;
  Result.NumValePedagio         := NumValePedagio;
  Result.CnpjFornecPedagio      := CnpjFornecPedagio;
  Result.CnpjResponsavelPedagio := CnpjResponsavelPedagio;
end;


end.

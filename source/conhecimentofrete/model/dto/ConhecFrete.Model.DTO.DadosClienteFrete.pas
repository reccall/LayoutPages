unit ConhecFrete.Model.DTO.DadosClienteFrete;

interface

 type

 TDadosClienteFrete = class
  private
    FUFDest               : String;
    FUFOrig               : String;
    FPessoaFisica         : String;
    FCodFilial            : String;
    FCodFilialNF          : String;
    FCONTRIBUINTE         : String;
    FIEENT                : String;
    FCodCli               : Double;
    FCodCliFilialOrig     : Double;
    FCodCliReceber        : Double;
    FCodPraca             : Integer;
    FCodUsur              : Integer;
    FCodSuperv            : Integer;
    FCodVeiculo           : Integer;
    FCodVeiculo1          : Integer;
    FCodVeiculo2          : Integer;
    FCodContFre           : Integer;
    FNumDiasVencFrete     : Integer;
    FCodFornec            : Integer;
    FNumcar               : Double;
    FCodMunicipio         : Double;
    FCodMunDest           : Double;
    FCodFornecFreteCteRef : Double;
    FTOMACONTRIBUINTE: String;
  public
   property UFDest               	:String  read FUFDest               write FUFDest;
    property UFOrig               :String  read FUFOrig               write FUFOrig;
    property PessoaFisica         :String  read FPessoaFisica         write FPessoaFisica;
    property CodFilial            :String  read FCodFilial            write FCodFilial;
    property CodFilialNF          :String  read FCodFilialNF          write FCodFilialNF;
    property CONTRIBUINTE         :String  read FCONTRIBUINTE         write FCONTRIBUINTE;
    property TOMACONTRIBUINTE     :String  read FTOMACONTRIBUINTE     write FTOMACONTRIBUINTE;
    property IEENT                :String  read FIEENT                write FIEENT;
    property CodCli               :Double  read FCodcli                write FCodcli;
    property CodPraca             :Integer read FCodPraca             write FCodPraca;
    property CodUsur              :Integer read FCodUsur              write FCodUsur;
    property CodSuperv            :Integer read FCodSuperv            write FCodSuperv;
    property CodCliFilialOrig     :Double  read FCodCliFilialOrig     write FCodCliFilialOrig;
    property CodVeiculo           :Integer read FCodVeiculo           write FCodVeiculo;
    property CodVeiculo1          :Integer read FCodVeiculo1          write FCodVeiculo1;
    property CodVeiculo2          :Integer read FCodVeiculo2          write FCodVeiculo2;
    property CodContFre           :Integer read FCodContFre           write FCodContFre;
    property NumDiasVencFrete     :Integer read FNumDiasVencFrete     write FNumDiasVencFrete;
    property CodFornec            :Integer read FCodFornec            write FCodFornec;
    property Numcar               :Double  read FNumCar               write FNumCar;
    property CodMunicipio         :Double  read FCodMunicipio         write FCodMunicipio;
    property CodMunDest           :Double  read FCodMunDest           write FCodMunDest;
    property CodCliReceber        :Double  read FCodCliReceber        write FCodCliReceber;
    property CodFornecFreteCteRef :Double  read FCodFornecFreteCteRef write FCodFornecFreteCteRef;
  end;

implementation

end.

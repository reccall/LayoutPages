unit ConhecFrete.Model.DTO.Cte;

interface

uses
  PesquisarEditButton;

  type
  TpTipoCte = (tpCteCliente, tpCteGlobalizado, tpCteRegiao, tpCteSimplificado);

  TICMS = record
     BAplicaReducaoBaseICMS : Boolean;
  end;

  TModelParamsCte = class
  private
    FNumCar: Double;
    FTipoCte: TpTipoCte;
    FCmpCFOP: TPesquisarEditButton;
    FCodFilial: String;
    FNumTransVendaIni: Double;
    FNumTransVendaFim: Double;
  public
    property NumCar           :Double               read FNumCar           write FNumCar;
    property TipoCte          :TpTipoCte            read FTipoCte          write FTipoCte;
    property CmpCFOP          :TPesquisarEditButton read FCmpCFOP          write FCmpCFOP;
    property CodFilial        :String               read FCodFilial        write FCodFilial;
    property NumTransVendaIni :Double               read FNumTransVendaIni write FNumTransVendaIni;
    property NumTransVendaFim :Double               read FNumTransVendaFim write FNumTransVendaFim;
  end;

implementation

end.

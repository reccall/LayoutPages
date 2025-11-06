{**************************************************}
{                                                  }
{                     Winthor                      }
{                                                  }
{ Classe que compõe o model FiltroSimulacaoCte     }
{ para gerar o CTe Simplificado                    }
{ Autor: Luiz Fernando Cândido Machado             }
{ Data: 15/10/2025                                 }
{**************************************************}
unit ConhecFrete.Model.DTO.FiltrosSimulacaoCte;

interface

uses
  DateUtils;

type
  TFiltrosSimulacaoCte = class
  private
    FCFOP :String;
    FNumCar :Double;
    FFreteVenda :Integer;
    FVlFreteSimb :Double;
    FCodCobranca :String;
    FDtVencFatura :TDateTime;
    FGetUfCliente: Boolean;
    FUsarVlFreteKg :Boolean;
    FUsarPercFrete :Boolean;
    FPercFreteSimb :Double;
    FCodFilialDest :String;
    FNumTransVendaIni :Double;
    FNumTransVendaFim :Double;
    FInformaDadosDePedagio :Boolean;
    FUtilizarEndEntregaPed :Boolean;
    FAplicarReducaoBaseIcms :Boolean;
    FGerarCteTipoFreteDespacho :Boolean;
    FGerarCteDadosVirtualRetira :Boolean;
    FGerarCteDadosFilialVirtual :Boolean;
    FGerarCteDadosTransfVirtualRetira :Boolean;
  public
    property CFOP                             :String    read FCFOP                             write FCFOP;
    property NumCar                           :Double    read FNumCar                           write FNumCar;
    property FreteVenda                       :Integer   read FFreteVenda                       write FFreteVenda;
    property VlFreteSimb                      :Double    read FVlFreteSimb                      write FVlFreteSimb;
    property CodCobranca                      :String    read FCodCobranca                      write FCodCobranca;
    property UsarVlFreteKg                    :Boolean   read FUsarVlFreteKg                    write FUsarVlFreteKg;
    property DtVencFatura                     :TDateTime read FDtVencFatura                     write FDtVencFatura;
    property GetUfCliente                     :Boolean   read FGetUfCliente                     write FGetUfCliente;
    property UsarPercFrete                    :Boolean   read FUsarPercFrete                    write FUsarPercFrete;
    property CodFilialDest                    :String    read FCodFilialDest                    write FCodFilialDest;
    property PercFreteSimb                    :Double    read FPercFreteSimb                    write FPercFreteSimb;
    property NumTransVendaIni                 :Double    read FNumTransVendaIni                 write FNumTransVendaIni;
    property NumTransVendaFim                 :Double    read FNumTransVendaFim                 write FNumTransVendaFim;
    property InformaDadosDePedagio            :Boolean   read FInformaDadosDePedagio            write FInformaDadosDePedagio;
    property UtilizarEndEntregaPed            :Boolean   read FUtilizarEndEntregaPed            write FUtilizarEndEntregaPed;
    property AplicarReducaoBaseIcms           :Boolean   read FAplicarReducaoBaseIcms           write FAplicarReducaoBaseIcms;
    property GerarCteTipoFreteDespacho        :Boolean   read FGerarCteTipoFreteDespacho        write FGerarCteTipoFreteDespacho;
    property GerarCteDadosVirtualRetira       :Boolean   read FGerarCteDadosVirtualRetira       write FGerarCteDadosVirtualRetira;
    property GerarCteDadosFilialVirtual       :Boolean   read FGerarCteDadosFilialVirtual       write FGerarCteDadosFilialVirtual;
    property GerarCteDadosTransfVirtualRetira :Boolean   read FGerarCteDadosTransfVirtualRetira write FGerarCteDadosTransfVirtualRetira;
  end;

implementation

end.

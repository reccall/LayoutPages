unit ConhecFrete.Forms.Cte.GridSimulacao;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.Dialogs
  ,cxGraphics
  ,cxControls
  ,cxLookAndFeels
  ,cxLookAndFeelPainters
  ,cxStyles
  ,cxCustomData
  ,cxFilter
  ,cxData
  ,cxDataStorage
  ,cxEdit
  ,cxNavigator
  ,Data.DB
  ,cxDBData
  ,cxCalc
  ,cxCheckBox
  ,cxButtonEdit
  ,cxImageComboBox
  ,cxCurrencyEdit
  ,cxTextEdit
  ,cxGridLevel
  ,cxGridCustomTableView
  ,cxGridTableView
  ,cxGridBandedTableView
  ,cxGridDBBandedTableView
  ,cxClasses
  ,cxGridCustomView
  ,cxGrid
  ,Vcl.ExtCtrls
  ,Vcl.StdCtrls;

type
  TfrmGridSimulacaoCte = class(TForm)
    cxGridSimulacao: TcxGrid;
    cxGridSimulacaoDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridSimulacaoDBBandedTableView1CODCLI: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CODFILIAL: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CLIENTE: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLTOTAL_EST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMNOTA_EST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLTOTAL_INTEREST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMNOTA_INTEREST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CONSUMIDORFINAL: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1SEQUENCIA: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1TIPO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1totalvolume: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1TOTPESO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMTRANSVENDA: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLTOTGER_EST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLTOTGER_INTEREST: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1TIPOFRETE: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1SELECIONADO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1GERARECEBER: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1GERAPAGAR: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1GERANFENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableCODPRODPREDOMINANTE: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1RESPSEGURO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NOMESEGURADORA: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMEROAPOLICE: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMEROAVERBACAO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLRAVERBACAO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CNPJFORNECPEDAGIO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMVALEPEDAGIO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CPNJRESPONSAVELPEDAGIO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VALORPEDAGIO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLFRETEKG: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1TRANSPAUTONOMO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1GERARCPTRANSPAUT: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CODFORNECTRANSPAUT: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1VLTRANSPAUTONOMO: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1NUMCIOT: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CODMUNINICTE: TcxGridDBBandedColumn;
    cxGridSimulacaoDBBandedTableView1CODMUNFIMCTE: TcxGridDBBandedColumn;
    cxGridSimulacaoLevel1: TcxGridLevel;
    pnlTopGridSim: TPanel;
    lblDadosSimulacao: TLabel;
    pnlLineDados: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

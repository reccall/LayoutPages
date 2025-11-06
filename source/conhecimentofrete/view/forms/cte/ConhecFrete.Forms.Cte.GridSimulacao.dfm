object frmGridSimulacaoCte: TfrmGridSimulacaoCte
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 306
  ClientWidth = 706
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  object cxGridSimulacao: TcxGrid
    Left = 0
    Top = 33
    Width = 706
    Height = 273
    Align = alClient
    TabOrder = 0
    object cxGridSimulacaoDBBandedTableView1: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'totalvolume'
          Column = cxGridSimulacaoDBBandedTableView1totalvolume
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'TOTPESO'
          Column = cxGridSimulacaoDBBandedTableView1TOTPESO
        end
        item
          Format = '0'
          Kind = skSum
          FieldName = 'NUMNOTA_EST'
          Column = cxGridSimulacaoDBBandedTableView1NUMNOTA_EST
        end
        item
          Format = '0'
          Kind = skSum
          FieldName = 'NUMNOTA_INTEREST'
          Column = cxGridSimulacaoDBBandedTableView1NUMNOTA_INTEREST
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'VLTOTAL_EST'
          Column = cxGridSimulacaoDBBandedTableView1VLTOTAL_EST
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'VLTOTAL_INTEREST'
          Column = cxGridSimulacaoDBBandedTableView1VLTOTAL_INTEREST
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.BandsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'Dados Gerenciais'
          FixedKind = fkLeft
          Width = 356
        end
        item
          Caption = 
            '                                                     Dados Adici' +
            'onais'
          HeaderAlignmentHorz = taLeftJustify
        end>
      object cxGridSimulacaoDBBandedTableView1CODCLI: TcxGridDBBandedColumn
        Caption = 'C'#243'd. Cliente'
        DataBinding.FieldName = 'CODCLI'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CODFILIAL: TcxGridDBBandedColumn
        Caption = 'C'#243'd. Filial'
        DataBinding.FieldName = 'CODFILIAL'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CLIENTE: TcxGridDBBandedColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'CLIENTE'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLTOTAL_EST: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VLTOTAL_EST'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.QuickClose = True
        Width = 66
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMNOTA_EST: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NUMNOTA_EST'
        Options.Editing = False
        Width = 81
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLTOTAL_INTEREST: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VLTOTAL_INTEREST'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ImmediatePost = True
        Width = 75
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMNOTA_INTEREST: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NUMNOTA_INTEREST'
        Options.Editing = False
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CONSUMIDORFINAL: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CONSUMIDORFINAL'
        Visible = False
        Width = 79
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1SEQUENCIA: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SEQUENCIA'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1TIPO: TcxGridDBBandedColumn
        DataBinding.FieldName = 'TIPO'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1totalvolume: TcxGridDBBandedColumn
        Caption = 'Volume'
        DataBinding.FieldName = 'totalvolume'
        Width = 40
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1TOTPESO: TcxGridDBBandedColumn
        Caption = 'Peso Total'
        DataBinding.FieldName = 'TOTPESO'
        Width = 56
        Position.BandIndex = 1
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMTRANSVENDA: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NUMTRANSVENDA'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLTOTGER_EST: TcxGridDBBandedColumn
        Caption = 'Vl. Total. Finan. Estadual'
        DataBinding.FieldName = 'VLTOTGER_EST'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 128
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLTOTGER_INTEREST: TcxGridDBBandedColumn
        Caption = 'Vl. Total. Finan. Inter.'
        DataBinding.FieldName = 'VLTOTGER_INTEREST'
        Width = 114
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1TIPOFRETE: TcxGridDBBandedColumn
        Caption = 'Tipo Frete'
        DataBinding.FieldName = 'TIPOFRETE'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1SELECIONADO: TcxGridDBBandedColumn
        Caption = 'Gerar'
        DataBinding.FieldName = 'SELECIONADO'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'False'
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1GERARECEBER: TcxGridDBBandedColumn
        Caption = 'Receber'
        DataBinding.FieldName = 'GERARECEBER'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'False'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1GERAPAGAR: TcxGridDBBandedColumn
        Caption = 'Pagar'
        DataBinding.FieldName = 'GERAPAGAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'False'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1GERANFENT: TcxGridDBBandedColumn
        Caption = 'NF Entrada'
        DataBinding.FieldName = 'GERANFENT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'False'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableCODPRODPREDOMINANTE: TcxGridDBBandedColumn
        Caption = 'Produto Predominante'
        DataBinding.FieldName = 'CODPRODPREDOMINANTE'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1RESPSEGURO: TcxGridDBBandedColumn
        Caption = 'Resp. Pelo Seguro'
        DataBinding.FieldName = 'RESPSEGURO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = '0 - Remetente'
            ImageIndex = 0
            Value = 0.000000000000000000
          end
          item
            Description = '1 - Expedidor'
            Value = '1'
          end
          item
            Description = '2 - Recebedor'
            Value = '2'
          end
          item
            Description = '3 - Destinat'#225'rio'
            Value = '3'
          end
          item
            Description = '4 - Emitente do CT-e'
            Value = '4'
          end
          item
            Description = '5 - Tomador de Servi'#231'o'
            Value = '5'
          end>
        Width = 94
        Position.BandIndex = 1
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NOMESEGURADORA: TcxGridDBBandedColumn
        Caption = 'Nome da Seguradora'
        DataBinding.FieldName = 'NOMESEGURADORA'
        Width = 107
        Position.BandIndex = 1
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMEROAPOLICE: TcxGridDBBandedColumn
        Caption = 'N'#250'm. Ap'#243'lice'
        DataBinding.FieldName = 'NUMEROAPOLICE '
        Width = 68
        Position.BandIndex = 1
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMEROAVERBACAO: TcxGridDBBandedColumn
        Caption = 'Num. Averba'#231#227'o'
        DataBinding.FieldName = 'NUMEROAVERBACAO'
        Width = 86
        Position.BandIndex = 1
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLRAVERBACAO: TcxGridDBBandedColumn
        Caption = 'Valor Averba'#231#227'o'
        DataBinding.FieldName = 'VLRAVERBACAO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.MaxLength = 11
        Width = 85
        Position.BandIndex = 1
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CNPJFORNECPEDAGIO: TcxGridDBBandedColumn
        Caption = 'CNPJ Fornecedor Ped'#225'gio'
        DataBinding.FieldName = 'CNPJFORNECPEDAGIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 130
        Position.BandIndex = 1
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMVALEPEDAGIO: TcxGridDBBandedColumn
        Caption = 'Num. Vale Ped'#225'gio'
        DataBinding.FieldName = 'NUMVALEPEDAGIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 10
        Width = 95
        Position.BandIndex = 1
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CPNJRESPONSAVELPEDAGIO: TcxGridDBBandedColumn
        Caption = 'CNPJ Resp. Ped'#225'gio'
        DataBinding.FieldName = 'CPNJRESPONSAVELPEDAGIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 103
        Position.BandIndex = 1
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VALORPEDAGIO: TcxGridDBBandedColumn
        Caption = 'Valor Ped'#225'gio'
        DataBinding.FieldName = 'VALORPEDAGIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 10
        Width = 71
        Position.BandIndex = 1
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLFRETEKG: TcxGridDBBandedColumn
        Caption = 'Vl. frete KG'
        DataBinding.FieldName = 'VLFRETEKG'
        Options.Editing = False
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1TRANSPAUTONOMO: TcxGridDBBandedColumn
        Caption = 'Transp. Auton'#244'mo?'
        DataBinding.FieldName = 'TRANSPAUTONOMO'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Width = 38
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1GERARCPTRANSPAUT: TcxGridDBBandedColumn
        Caption = 'Gerar CP. Transp. Aut. ?'
        DataBinding.FieldName = 'GERARCPTRANSPAUT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Width = 40
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CODFORNECTRANSPAUT: TcxGridDBBandedColumn
        Caption = 'Fornecedor Transp. Aut'#244'nomo'
        DataBinding.FieldName = 'CODFORNECTRANSPAUT'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Width = 39
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1VLTRANSPAUTONOMO: TcxGridDBBandedColumn
        Caption = 'Vl. Transp. Aut'#244'nomo'
        DataBinding.FieldName = 'VLTRANSPAUTONOMO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 39
        Position.BandIndex = 0
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1NUMCIOT: TcxGridDBBandedColumn
        Caption = 'CIOT'
        DataBinding.FieldName = 'NUMCIOT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 12
        Position.BandIndex = 0
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CODMUNINICTE: TcxGridDBBandedColumn
        Caption = 'Mun. Ini. Serv.'
        DataBinding.FieldName = 'CODMUNINICTE'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Position.BandIndex = 0
        Position.ColIndex = 19
        Position.RowIndex = 0
      end
      object cxGridSimulacaoDBBandedTableView1CODMUNFIMCTE: TcxGridDBBandedColumn
        Caption = 'Mun. Fim Serv.'
        DataBinding.FieldName = 'CODMUNFIMCTE'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Position.BandIndex = 0
        Position.ColIndex = 20
        Position.RowIndex = 0
      end
    end
    object cxGridSimulacaoLevel1: TcxGridLevel
      GridView = cxGridSimulacaoDBBandedTableView1
    end
  end
  object pnlTopGridSim: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblDadosSimulacao: TLabel
      Left = 0
      Top = 11
      Width = 200
      Height = 16
      Caption = 'Dados da Simula'#231#227'o - Cte Simplificado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlLineDados: TPanel
      Left = -86
      Top = 5
      Width = 400
      Height = 1
      BevelOuter = bvNone
      Color = clMenu
      UseDockManager = False
      ParentBackground = False
      TabOrder = 0
    end
  end
end

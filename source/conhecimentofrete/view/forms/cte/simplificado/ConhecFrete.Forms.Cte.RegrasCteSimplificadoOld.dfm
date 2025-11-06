object frmDefinirRegrasCte: TfrmDefinirRegrasCte
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 227
  ClientWidth = 642
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlMainTop: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object lblRem: TLabel
      Left = 14
      Top = 43
      Width = 54
      Height = 16
      Caption = 'Remetente'
    end
    object lblDest: TLabel
      Left = 7
      Top = 65
      Width = 61
      Height = 16
      Caption = 'Destinat'#225'rio'
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 642
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblTitulo: TLabel
        Left = 11
        Top = 1
        Width = 158
        Height = 16
        Caption = 'Definir regras - Cte Simplificado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Nunito Sans Normal'
        Font.Style = []
        ParentFont = False
      end
    end
    object grpPrincipais: TGroupBox
      Left = 77
      Top = 22
      Width = 620
      Height = 70
      Caption = 'Principais   '
      TabOrder = 1
      object lblRemNome: TLabel
        Left = 3
        Top = 19
        Width = 3
        Height = 16
      end
      object lblDestNome: TLabel
        Left = 3
        Top = 43
        Width = 3
        Height = 16
      end
      object pnlLinePrinc: TPanel
        Left = 160
        Top = 37
        Width = 200
        Height = 1
        BevelOuter = bvNone
        Color = clMenu
        UseDockManager = False
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnlBackInfoReg: TPanel
      Left = 678
      Top = 8
      Width = 18
      Height = 18
      Cursor = crHandPoint
      Hint = 'Regras do Cte Simplificado'
      BevelOuter = bvNone
      Color = clMenu
      ParentBackground = False
      TabOrder = 2
      object pnlInfoRegrasCteSimp: TPanel
        Left = 1
        Top = 1
        Width = 16
        Height = 16
        Cursor = crHandPoint
        Hint = 'Regras do Cte Simplificado'
        BevelOuter = bvNone
        Caption = '?'
        Color = clWhite
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object pnlMainBottom: TPanel
    Left = 0
    Top = 97
    Width = 642
    Height = 130
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object cxGridNfe: TcxGrid
      Left = 0
      Top = 24
      Width = 642
      Height = 106
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      object cxGridNfeDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        DataController.DataSource = dsNfeCarragamento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GroupByBox = False
        object cxGridNfeDBTableView1Column6: TcxGridDBColumn
          Caption = 'Cod. Filial'
          DataBinding.FieldName = 'CODFILIAL'
          GroupSummaryAlignment = taCenter
          Width = 75
        end
        object cxGridNfeDBTableView1Column7: TcxGridDBColumn
          Caption = 'Remetente'
          DataBinding.FieldName = 'RAZAOSOCIAL'
          Width = 290
        end
        object cxGridNfeDBTableView1Column8: TcxGridDBColumn
          Caption = 'UF Rem.'
          DataBinding.FieldName = 'UF_FILIAL'
          Width = 50
        end
        object cxGridNfeDBTableView1Column1: TcxGridDBColumn
          Caption = 'Cod. Cliente/Dest.'
          DataBinding.FieldName = 'CODCLIRECEBEDOR'
          Width = 96
        end
        object cxGridNfeDBTableView1Column4: TcxGridDBColumn
          Caption = 'Destinat'#225'rio'
          DataBinding.FieldName = 'CLIENTE'
          Width = 290
        end
        object cxGridNfeDBTableView1Column5: TcxGridDBColumn
          Caption = 'UF Dest.'
          DataBinding.FieldName = 'UF'
          Width = 50
        end
        object cxGridNfeDBTableView1Column2: TcxGridDBColumn
          Caption = 'Num. Nota'
          DataBinding.FieldName = 'NUMNOTA'
          Options.Editing = False
          Width = 66
        end
        object cxGridNfeDBTableView1Column3: TcxGridDBColumn
          Caption = 'ChaveNFe'
          DataBinding.FieldName = 'CHAVENFE'
          Options.Editing = False
          Width = 327
        end
      end
      object cxGridNfeLevel1: TcxGridLevel
        GridView = cxGridNfeDBTableView1
      end
    end
    object pnlTopRight: TPanel
      Left = 0
      Top = 0
      Width = 642
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = 'D'#234' um duplo click no grid para definir o principal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13086616
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
  end
  object dsNfeCarragamento: TDataSource
    Left = 520
    Top = 176
  end
end

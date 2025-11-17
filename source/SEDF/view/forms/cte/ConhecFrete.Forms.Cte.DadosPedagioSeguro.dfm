inherited frmDadosPedagioSeguro: TfrmDadosPedagioSeguro
  ClientHeight = 398
  ClientWidth = 740
  OnCreate = FormCreate
  ExplicitWidth = 740
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 16
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 398
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlDadosSeguro: TPanel
      Left = 1
      Top = 181
      Width = 738
      Height = 216
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnlTopSeguro: TPanel
        Left = 1
        Top = 1
        Width = 736
        Height = 56
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object pnlRespSeguro: TPanel
        Left = 0
        Top = 58
        Width = 196
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object pnlNumApSeguro: TPanel
        Left = 196
        Top = 58
        Width = 202
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
      end
      object pnlNomeSeg: TPanel
        Left = 0
        Top = 129
        Width = 196
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
      end
      object pnlCNPJSeg: TPanel
        Left = 197
        Top = 128
        Width = 201
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
      end
      object pnlNumAverbacao: TPanel
        Left = 398
        Top = 58
        Width = 202
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
      end
      object pnlValorAverb: TPanel
        Left = 398
        Top = 127
        Width = 202
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 6
      end
    end
    object pnlDadosPedagio: TPanel
      Left = 1
      Top = 1
      Width = 738
      Height = 180
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object pnlTopPedagio: TPanel
        Left = 1
        Top = 1
        Width = 736
        Height = 56
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object pnlNumComprovanteCmp: TPanel
        Left = 0
        Top = 60
        Width = 287
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object pnlCNPJRespPgto: TPanel
        Left = 295
        Top = 60
        Width = 412
        Height = 65
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
      end
      object pnlValorValePredagio: TPanel
        Left = 0
        Top = 126
        Width = 287
        Height = 50
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
      end
      object pnlCNPJEmpFornecValePedagio: TPanel
        Left = 295
        Top = 126
        Width = 410
        Height = 50
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
      end
      object pnlMsmCNPJFilial: TPanel
        Left = 478
        Top = 88
        Width = 202
        Height = 33
        Align = alCustom
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
      end
    end
  end
end

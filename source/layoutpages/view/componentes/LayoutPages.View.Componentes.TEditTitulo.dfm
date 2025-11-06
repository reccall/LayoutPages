inherited CmpTEditTItulo: TCmpTEditTItulo
  Align = alClient
  ClientHeight = 54
  ClientWidth = 260
  ExplicitWidth = 260
  ExplicitHeight = 54
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackComponente: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 54
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bai Jamjuree'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object pnlEdt: TPanel
      Left = 0
      Top = -2
      Width = 316
      Height = 54
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnlTopTitulo: TPanel
        Left = 0
        Top = 0
        Width = 316
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object lblTitulo: TLabel
          Left = 0
          Top = 0
          Width = 45
          Height = 19
          Caption = 'lblTitulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -11
          Font.Name = 'Bai Jamjuree'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlEdtB: TPanel
        Left = 0
        Top = 20
        Width = 252
        Height = 32
        BevelOuter = bvNone
        Color = clScrollBar
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bai Jamjuree'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        object pnlEdtBack: TPanel
          Left = 2
          Top = 2
          Width = 248
          Height = 28
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object edtDefault: TEdit
            Left = 0
            Top = 0
            Width = 248
            Height = 28
            Align = alClient
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -16
            Font.Name = 'Bai Jamjuree'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
end

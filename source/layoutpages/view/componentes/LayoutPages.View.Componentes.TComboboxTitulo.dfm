inherited CmpTComboboxTitulo: TCmpTComboboxTitulo
  Align = alClient
  Caption = 'CmpTComboboxTitulo'
  ClientHeight = 55
  ClientWidth = 258
  ExplicitWidth = 258
  ExplicitHeight = 55
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTopTitulo: TPanel
    Left = 0
    Top = 0
    Width = 258
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
    Width = 257
    Height = 32
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = clScrollBar
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Nunito Sans Normal'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object pnlEdtBack: TPanel
      Left = 1
      Top = 1
      Width = 255
      Height = 29
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Color = clWhite
      ParentBiDiMode = False
      ParentBackground = False
      TabOrder = 0
      object cbbItens: TComboBox
        Left = 0
        Top = 0
        Width = 255
        Height = 37
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        BiDiMode = bdLeftToRight
        Font.Charset = ANSI_CHARSET
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

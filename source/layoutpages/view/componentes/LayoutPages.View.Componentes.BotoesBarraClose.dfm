inherited CmpBotoesBarraClose: TCmpBotoesBarraClose
  Align = alRight
  ClientHeight = 41
  ClientWidth = 124
  ExplicitWidth = 124
  ExplicitHeight = 41
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackGround: TPanel
    Left = 11
    Top = 0
    Width = 113
    Height = 41
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlSairB: TPanel
      Left = 0
      Top = 0
      Width = 85
      Height = 40
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Nunito Sans Normal'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object pnlSair: TPanel
        Left = 2
        Top = 1
        Width = 81
        Height = 37
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Sair'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = cl3DDkShadow
        Font.Height = -13
        Font.Name = 'Nunito Sans Normal'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end

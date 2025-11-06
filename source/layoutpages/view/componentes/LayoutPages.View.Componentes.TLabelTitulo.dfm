inherited CmpTLabelTitulo: TCmpTLabelTitulo
  Align = alClient
  Caption = 'CmpTLabelTitulo'
  ClientHeight = 45
  ClientWidth = 621
  ExplicitWidth = 621
  ExplicitHeight = 45
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 45
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 0
      Top = 10
      Width = 71
      Height = 34
      Caption = 'lblTitulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -19
      Font.Name = 'Bai Jamjuree'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object pnlLine: TPanel
      Left = 0
      Top = 40
      Width = 500
      Height = 1
      BevelOuter = bvNone
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Nunito Sans Normal'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
end

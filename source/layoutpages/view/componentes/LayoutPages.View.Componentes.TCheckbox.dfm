inherited CmpCheckBox: TCmpCheckBox
  Align = alClient
  ClientHeight = 24
  ClientWidth = 93
  ExplicitWidth = 93
  ExplicitHeight = 24
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackComponente: TPanel
    Left = 0
    Top = 0
    Width = 93
    Height = 24
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblCheck: TLabel
      Left = 18
      Top = 3
      Width = 46
      Height = 19
      Caption = 'lblCheck'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -11
      Font.Name = 'Bai Jamjuree'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object chkDefault: TCheckBox
      Left = 0
      Top = 0
      Width = 16
      Height = 24
      Align = alLeft
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
  end
end

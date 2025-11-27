inherited FormLoadCSS: TFormLoadCSS
  VertScrollBar.Visible = False
  Align = alClient
  ClientHeight = 220
  ClientWidth = 567
  OnCreate = FormCreate
  ExplicitWidth = 567
  ExplicitHeight = 220
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 166
    Top = 29
    Width = 163
    Height = 48
    Caption = 'Carregando...'
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -27
    Font.Name = 'Bai Jamjuree'
    Font.Style = []
    ParentFont = False
  end
  object WebBrowser1: TWebBrowser
    Left = 184
    Top = 69
    Width = 233
    Height = 143
    Align = alCustom
    TabOrder = 0
    ControlData = {
      4C00000015180000C80E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126209000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end

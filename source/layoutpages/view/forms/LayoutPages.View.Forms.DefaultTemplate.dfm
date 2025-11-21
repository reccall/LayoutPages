inherited FormDefaultTemplate: TFormDefaultTemplate
  ClientHeight = 431
  ClientWidth = 851
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  ExplicitWidth = 851
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBackMenu: TPanel
    Left = 0
    Top = 73
    Width = 209
    Height = 358
    Align = alLeft
    Caption = 'pnlBackMenu'
    TabOrder = 0
  end
  object pnlMain: TPanel
    Left = 209
    Top = 73
    Width = 642
    Height = 358
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    object pnlMainTopB: TPanel
      Left = 1
      Top = 1
      Width = 640
      Height = 88
      Align = alTop
      Caption = 'pnlMainTopB'
      TabOrder = 0
      object pnlMainTopLeft: TPanel
        Left = 1
        Top = 1
        Width = 40
        Height = 86
        Align = alLeft
        Caption = 'pnlMainTopLeft'
        TabOrder = 0
      end
      object pnlMainTop: TPanel
        Left = 41
        Top = 1
        Width = 598
        Height = 86
        Align = alClient
        TabOrder = 1
      end
    end
    object pnlMainLeft: TPanel
      Left = 1
      Top = 89
      Width = 40
      Height = 268
      Align = alLeft
      Caption = 'pnlMainLeft'
      TabOrder = 1
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 73
    Align = alTop
    TabOrder = 2
    object pnlLogo: TPanel
      Left = 1
      Top = 1
      Width = 569
      Height = 71
      Align = alLeft
      Caption = 'pnlLogo'
      TabOrder = 0
      ExplicitTop = -2
    end
  end
end

object FormDefaultBoxTemplate: TFormDefaultBoxTemplate
  Left = 0
  Top = 51
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FormDefaultBoxTemplate'
  ClientHeight = 588
  ClientWidth = 835
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 588
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 835
      Height = 89
      Align = alTop
      TabOrder = 0
      object pnlTopRightBack: TPanel
        Left = 680
        Top = 1
        Width = 154
        Height = 87
        Align = alRight
        TabOrder = 2
      end
      object pnlTopLeftBack: TPanel
        Left = 1
        Top = 1
        Width = 128
        Height = 87
        Align = alLeft
        TabOrder = 0
      end
      object pnlTopCenter: TPanel
        Left = 129
        Top = 1
        Width = 551
        Height = 87
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 192
        ExplicitWidth = 390
      end
    end
    object pnlBotom: TPanel
      Left = 0
      Top = 499
      Width = 835
      Height = 89
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 8
      object pnlBottomRight: TPanel
        Left = 680
        Top = 1
        Width = 154
        Height = 87
        Align = alRight
        TabOrder = 2
        ExplicitLeft = 686
        ExplicitTop = 5
      end
      object pnlBottomLeft: TPanel
        Left = 1
        Top = 1
        Width = 128
        Height = 87
        Align = alLeft
        TabOrder = 0
      end
      object pnlBottomCenter: TPanel
        Left = 129
        Top = 1
        Width = 551
        Height = 87
        Align = alClient
        TabOrder = 1
      end
    end
    object pnlMain: TPanel
      Left = 0
      Top = 89
      Width = 835
      Height = 410
      Align = alClient
      TabOrder = 2
      ExplicitTop = 8
      ExplicitHeight = 89
      object pnlMainRight: TPanel
        Left = 680
        Top = 1
        Width = 154
        Height = 408
        Align = alRight
        TabOrder = 2
        ExplicitHeight = 87
      end
      object pnlMainLeft: TPanel
        Left = 1
        Top = 1
        Width = 128
        Height = 408
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 87
      end
      object pnlMainCenter: TPanel
        Left = 129
        Top = 1
        Width = 551
        Height = 408
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 87
      end
    end
  end
end

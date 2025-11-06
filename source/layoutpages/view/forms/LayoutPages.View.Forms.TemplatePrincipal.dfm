inherited FormTemplatePrincipal: TFormTemplatePrincipal
  Caption = 'FormTemplatePrincipal'
  ClientHeight = 525
  ClientWidth = 991
  ExplicitWidth = 991
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlMenu: TPanel
    Top = 156
    Height = 369
    ExplicitTop = 156
    ExplicitHeight = 369
    object Panel1: TPanel
      Left = 18
      Top = 59
      Width = 185
      Height = 452
      Color = clHighlight
      ParentBackground = False
      TabOrder = 0
    end
  end
  inherited pnlBackMain: TPanel
    Top = 156
    Width = 782
    Height = 369
    ExplicitTop = 156
    ExplicitWidth = 782
    ExplicitHeight = 369
    inherited pnlMainTop: TPanel
      Width = 780
      Height = 58
      Caption = ''
      ExplicitWidth = 780
      ExplicitHeight = 58
    end
  end
  inherited pnlTop: TPanel
    Width = 991
    Height = 156
    ExplicitWidth = 991
    ExplicitHeight = 156
    inherited Image1: TImage
      Left = 27
      Top = -24
      Width = 250
      Height = 200
      ExplicitLeft = 27
      ExplicitTop = -24
      ExplicitWidth = 250
      ExplicitHeight = 200
    end
    inherited pnlLineOpcoes: TPanel
      Left = 48
      Top = 106
      Width = 632
      ExplicitLeft = 48
      ExplicitTop = 106
      ExplicitWidth = 632
    end
    object pnlInfoUserB: TPanel
      Left = 631
      Top = 1
      Width = 359
      Height = 154
      Align = alRight
      TabOrder = 1
      object pnlInfoUser: TPanel
        Left = 32
        Top = 0
        Width = 321
        Height = 70
        TabOrder = 0
      end
    end
  end
end

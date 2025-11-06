inherited frmCtePrincipal: TfrmCtePrincipal
  Caption = 'frmCtePrincipal'
  ClientHeight = 511
  ClientWidth = 908
  ExplicitLeft = -248
  ExplicitWidth = 908
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlMain: TPanel [0]
    Left = 231
    Top = 129
    Width = 677
    Height = 382
    BevelOuter = bvNone
    Caption = ''
    ExplicitLeft = 231
    ExplicitTop = 129
    ExplicitWidth = 677
    ExplicitHeight = 382
    inherited pnlMainTopB: TPanel
      Left = 0
      Top = 0
      Width = 677
      Height = 64
      BevelOuter = bvNone
      Caption = ''
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 677
      ExplicitHeight = 64
      object pnlMainTopRight: TPanel [0]
        Left = 290
        Top = 0
        Width = 387
        Height = 64
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object pnlBotoes: TPanel
          Left = 16
          Top = 6
          Width = 305
          Height = 56
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
        end
      end
      inherited pnlMainTopLeft: TPanel
        Left = 0
        Top = 0
        Width = 40
        Height = 64
        BevelOuter = bvNone
        Caption = ''
        Color = clWhite
        Font.Color = cl3DDkShadow
        Font.Name = 'Bai Jamjuree'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 0
        ExplicitWidth = 40
        ExplicitHeight = 64
      end
      inherited pnlMainTop: TPanel
        Left = 40
        Top = 0
        Width = 250
        Height = 64
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 40
        ExplicitWidth = 250
        ExplicitHeight = 64
      end
    end
    inherited pnlMainLeft: TPanel
      Left = 0
      Top = 64
      Width = 40
      Height = 318
      BevelOuter = bvNone
      Caption = ''
      Color = clWhite
      ParentBiDiMode = False
      ParentBackground = False
      ExplicitLeft = 0
      ExplicitTop = 64
      ExplicitWidth = 40
      ExplicitHeight = 318
    end
  end
  inherited pnlTop: TPanel [1]
    Width = 908
    Height = 129
    BevelOuter = bvNone
    ExplicitWidth = 908
    ExplicitHeight = 129
    inherited Image1: TImage
      Width = 180
      Height = 160
      ExplicitWidth = 180
      ExplicitHeight = 160
    end
    inherited pnlLineOpcoes: TPanel
      Left = 12
      Top = 107
      ExplicitLeft = 12
      ExplicitTop = 107
    end
    object pnlTopLeft: TPanel
      Left = 369
      Top = 0
      Width = 539
      Height = 129
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object pnlUserInfo: TPanel
        Left = 120
        Top = 17
        Width = 338
        Height = 84
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object pnlConfig: TPanel
        Left = 456
        Top = 17
        Width = 78
        Height = 84
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
  inherited pnlBackMenu: TPanel [2]
    Top = 129
    Width = 231
    Height = 382
    BevelOuter = bvNone
    Caption = ''
    ExplicitTop = 129
    ExplicitWidth = 231
    ExplicitHeight = 382
    object pnlMenu: TPanel
      Left = 48
      Top = 72
      Width = 156
      Height = 357
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlLineMenu: TPanel
      Left = 226
      Top = 72
      Width = 1
      Height = 322
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
    end
  end
end

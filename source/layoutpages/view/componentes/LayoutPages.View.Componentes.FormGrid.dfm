inherited CmpFormGrid: TCmpFormGrid
  Align = alClient
  Caption = 'CmpFormGrid'
  ClientHeight = 300
  ClientWidth = 964
  ExplicitWidth = 964
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 16
  object pnlCmpGridMain: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 300
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object scrlbxCmpMain: TScrollBox
      Left = 1
      Top = 41
      Width = 962
      Height = 290
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 37
    end
    object pnlCmpGridTop: TPanel
      Left = 1
      Top = 1
      Width = 962
      Height = 40
      Align = alTop
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
    end
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 577
    Top = 242
  end
end

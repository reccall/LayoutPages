inherited CmpFormGrid: TCmpFormGrid
  Align = alClient
  Caption = 'CmpFormGrid'
  ClientHeight = 331
  ClientWidth = 964
  ExplicitWidth = 964
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 16
  object pnlCmpGridMain: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 331
    Align = alClient
    Caption = 'pnlCmpGridMain'
    TabOrder = 0
    object scrlbxCmpMain: TScrollBox
      Left = 1
      Top = 31
      Width = 962
      Height = 282
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      ParentColor = False
      TabOrder = 0
    end
    object pnlCmpGridTop: TPanel
      Left = 1
      Top = 1
      Width = 962
      Height = 30
      Align = alTop
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 577
    Top = 242
  end
end

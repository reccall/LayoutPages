object frmCteSimplificadoBotoesSimulacao: TfrmCteSimplificadoBotoesSimulacao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 42
  ClientWidth = 689
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBtnLeft: TPanel
    Left = 283
    Top = 0
    Width = 423
    Height = 42
    Align = alCustom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object pnlLineDados: TPanel
      Left = -86
      Top = 3
      Width = 500
      Height = 1
      BevelOuter = bvNone
      Color = clMenu
      UseDockManager = False
      ParentBackground = False
      TabOrder = 0
    end
    object pnlBackSimular: TPanel
      Left = 240
      Top = 8
      Width = 65
      Height = 31
      Cursor = crHandPoint
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object pnlSimular: TPanel
        Left = 2
        Top = 2
        Width = 61
        Height = 27
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Simular'
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnlBackNovo: TPanel
      Left = 320
      Top = 8
      Width = 65
      Height = 31
      Cursor = crHandPoint
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object pnlNovo: TPanel
        Left = 2
        Top = 2
        Width = 61
        Height = 27
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Novo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Nunito Sans Normal'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlBackNfe: TPanel
      Left = 8
      Top = 8
      Width = 92
      Height = 31
      Cursor = crHandPoint
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      object pnlNFe: TPanel
        Left = 0
        Top = 2
        Width = 89
        Height = 27
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Definir regras'
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13882323
        Font.Height = -11
        Font.Name = 'Nunito Sans Normal'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end

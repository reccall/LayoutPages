object frmCteMotorista: TfrmCteMotorista
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 353
  ClientWidth = 581
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 49
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 596
  end
  object pnlMain: TPanel
    Left = 0
    Top = 49
    Width = 581
    Height = 304
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 596
    object pnlEdtPesqMotorista: TPanel
      Left = 0
      Top = 6
      Width = 569
      Height = 59
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlEdtUFPlaca: TPanel
      Left = 0
      Top = 146
      Width = 106
      Height = 65
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnlPlacaVeiculo: TPanel
      Left = 105
      Top = 146
      Width = 182
      Height = 65
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnlEdtPesqVeiculo: TPanel
      Left = 0
      Top = 71
      Width = 569
      Height = 59
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
  end
end

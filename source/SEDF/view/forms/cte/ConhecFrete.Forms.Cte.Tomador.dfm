inherited frmTomador: TfrmTomador
  ClientHeight = 363
  ClientWidth = 575
  OnCreate = FormCreate
  ExplicitWidth = 575
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 49
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object pnlMain: TPanel
    Left = 0
    Top = 49
    Width = 575
    Height = 314
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pnlEditPesq: TPanel
      Left = 0
      Top = 6
      Width = 569
      Height = 59
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlEdtCNPJ: TPanel
      Left = 0
      Top = 95
      Width = 203
      Height = 65
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnlInscEstadual: TPanel
      Left = 203
      Top = 95
      Width = 266
      Height = 65
      Align = alCustom
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
  end
end

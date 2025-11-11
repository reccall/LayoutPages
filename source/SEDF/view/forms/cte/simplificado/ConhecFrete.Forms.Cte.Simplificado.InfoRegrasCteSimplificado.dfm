object frmCteSimplificadoInfoRegras: TfrmCteSimplificadoInfoRegras
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 356
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlMainRegra: TPanel
    Left = 4
    Top = 3
    Width = 613
    Height = 349
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = pnlMainRegraMouseDown
    object lblTituloRegra: TLabel
      Left = 8
      Top = 4
      Width = 317
      Height = 27
      Caption = 'Regras para gerar o Cte-Simplificado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -19
      Font.Name = 'Nunito Sans Normal'
      Font.Style = []
      ParentFont = False
    end
    object lblItem1: TLabel
      Left = 8
      Top = 54
      Width = 552
      Height = 16
      Caption = 
        ' - M'#250'ltiplos remetentes ou destinat'#225'rios: A carga deve conter me' +
        'rcadorias de pelo menos dois remetentes ou'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem1_1: TLabel
      Left = 18
      Top = 69
      Width = 146
      Height = 16
      Caption = 'dois destinat'#225'rios diferentes.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem2: TLabel
      Left = 8
      Top = 106
      Width = 591
      Height = 16
      Caption = 
        ' - Notas fiscais eletr'#244'nicas: Todas as mercadorias transportadas' +
        ' devem ser acobertadas por Notas Fiscais Eletr'#244'nicas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem2_1: TLabel
      Left = 18
      Top = 120
      Width = 95
      Height = 16
      Caption = '(NF-e) modelo 55.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem3: TLabel
      Left = 8
      Top = 157
      Width = 590
      Height = 16
      Caption = 
        ' - Mesma origem e destino: A presta'#231#227'o do servi'#231'o de transporte ' +
        'deve come'#231'ar e terminar no mesmo estado, mesmo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem3_1: TLabel
      Left = 18
      Top = 171
      Width = 420
      Height = 16
      Caption = 
        'que a opera'#231#227'o seja interestadual (ex: coletas no Paran'#225' e entre' +
        'gas em S'#227'o Paulo).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem5: TLabel
      Left = 8
      Top = 209
      Width = 597
      Height = 16
      Caption = 
        ' - Mesmo CFOP: Todas as notas fiscais envolvidas no mesmo CT-e S' +
        'implificado devem ter o mesmo C'#243'digo Fiscal de '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblItem5_1: TLabel
      Left = 18
      Top = 223
      Width = 163
      Height = 16
      Caption = 'Opera'#231#245'es e Presta'#231#245'es (CFOP).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblfonte: TLabel
      Left = 464
      Top = 335
      Width = 141
      Height = 13
      Caption = 'Gerado pelo Google Gemini - 2025'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -9
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object pnlBackOk: TPanel
      Left = 243
      Top = 279
      Width = 99
      Height = 41
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object pnlOK: TPanel
        Left = 2
        Top = 2
        Width = 95
        Height = 37
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Ok'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Nunito Sans Normal'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlLinePrinc: TPanel
      Left = 8
      Top = 37
      Width = 630
      Height = 1
      BevelOuter = bvNone
      Color = clMenu
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
    end
  end
end

object frmCteSimplificadoDadosCte: TfrmCteSimplificadoDadosCte
  Left = 50
  Top = 100
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 206
  ClientWidth = 682
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  object lblFilialTransp: TLabel
    Left = 153
    Top = 29
    Width = 80
    Height = 16
    Caption = 'Filial Transporte'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Nunito Sans Normal'
    Font.Style = []
    ParentFont = False
  end
  object lblDtEmissao: TLabel
    Left = 11
    Top = 29
    Width = 67
    Height = 32
    Caption = 'Data Emiss'#227'o'#13#10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Nunito Sans Normal'
    Font.Style = []
    ParentFont = False
  end
  object lblDados: TLabel
    Left = 11
    Top = 6
    Width = 63
    Height = 18
    Caption = 'Dados Cte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Nunito Sans Normal'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTipoServico: TLabel
    Left = 284
    Top = 29
    Width = 77
    Height = 16
    Caption = 'Tipo de Servi'#231'o'
  end
  object lblVlFreteSimb: TLabel
    Left = 8
    Top = 156
    Width = 86
    Height = 16
    Caption = 'Valor Frete Simb.'
  end
  object lblDadosFinan: TLabel
    Left = 8
    Top = 90
    Width = 107
    Height = 18
    Caption = 'Dados financeiros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Nunito Sans Normal'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDtvencFat: TLabel
    Left = 198
    Top = 159
    Width = 89
    Height = 16
    Caption = 'Data Venc. Fatura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Nunito Sans Normal'
    Font.Style = []
    ParentFont = False
  end
  object lblPercFrete: TLabel
    Left = 104
    Top = 156
    Width = 67
    Height = 16
    Caption = '% Prec. Frete'
  end
  object lblCarregamento: TLabel
    Left = 439
    Top = 27
    Width = 70
    Height = 16
    Caption = 'Carregamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Nunito Sans Normal'
    Font.Style = []
    ParentFont = False
  end
  object cmbFilialTransp: TDBLookupComboBox
    Left = 153
    Top = 46
    Width = 121
    Height = 24
    KeyField = 'CODIGO'
    ListField = 'CODIGO'
    TabOrder = 1
  end
  object pnlLineDados: TPanel
    Left = 11
    Top = 24
    Width = 450
    Height = 1
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 10
  end
  object DtEmissao: TDateEdit
    Left = 8
    Top = 45
    Width = 121
    Height = 24
    NumGlyphs = 2
    TabOrder = 0
  end
  object cmbTipoServ: TComboBox
    Left = 287
    Top = 46
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 2
    Text = '0-Normal'
    Items.Strings = (
      '0-Normal')
  end
  object pesqCobranca: TPesquisarEditButton
    Left = 8
    Top = 129
    Hint = 'Pressione a tecla CTRL + F3 para inicar a pesquisa.'
    ParentShowHint = False
    Properties.ReadOnly = False
    ShowHint = True
    Style.BorderStyle = ebsOffice11
    Style.Color = clWindow
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clWindowText
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    TextHint = 'C'#243'digo'
    Caption = 'Cobran'#231'a'
    PesquisarLabel.Width = 46
    PesquisarLabel.Height = 16
    PesquisarLabel.Caption = 'Cobran'#231'a'
    PesquisarSpeedButton.Left = 68
    PesquisarSpeedButton.Top = 130
    PesquisarSpeedButton.Width = 25
    PesquisarSpeedButton.Height = 21
    PesquisarSpeedButton.Hint = 'Pressione aqui para iniciar a pesquisa'
    PesquisarSpeedButton.Caption = '...'
    PesquisarSpeedButton.LookAndFeel.Kind = lfOffice11
    PesquisarSpeedButton.LookAndFeel.NativeStyle = False
    PesquisarSpeedButton.ParentShowHint = False
    PesquisarSpeedButton.ShowHint = True
    PesquisarSpeedButton.TabOrder = 8
    PesquisarSpeedButton.TabStop = False
    PesquisarSpeedButton.Flat = False
    PesquisarEdit.Left = 93
    PesquisarEdit.Top = 130
    PesquisarEdit.TabStop = False
    PesquisarEdit.ParentFont = False
    PesquisarEdit.Style.BorderStyle = ebsOffice11
    PesquisarEdit.Style.Color = clInactiveCaption
    PesquisarEdit.Style.Font.Charset = DEFAULT_CHARSET
    PesquisarEdit.Style.Font.Color = clInactiveCaptionText
    PesquisarEdit.Style.Font.Height = -11
    PesquisarEdit.Style.Font.Name = 'Tahoma'
    PesquisarEdit.Style.Font.Style = []
    PesquisarEdit.Style.LookAndFeel.Kind = lfOffice11
    PesquisarEdit.Style.LookAndFeel.NativeStyle = False
    PesquisarEdit.Style.IsFontAssigned = True
    PesquisarEdit.StyleDisabled.LookAndFeel.Kind = lfOffice11
    PesquisarEdit.StyleDisabled.LookAndFeel.NativeStyle = False
    PesquisarEdit.StyleFocused.LookAndFeel.Kind = lfOffice11
    PesquisarEdit.StyleFocused.LookAndFeel.NativeStyle = False
    PesquisarEdit.StyleHot.LookAndFeel.Kind = lfOffice11
    PesquisarEdit.StyleHot.LookAndFeel.NativeStyle = False
    PesquisarEdit.TabOrder = 9
    PesquisarEdit.ReadOnly = False
    PesquisarEdit.Color = clInactiveCaption
    PesquisarEdit.Width = 320
    PositionLabel = lpAbove
    SpacingLabel = 3
    PositionSpeedButton = lpRight
    SpacingSpeedButton = 2
    PositionEdit = lpRight
    SpacingEdit = 27
    PropPesquisar.ColunaPsq1 = 'CODCOB'
    PropPesquisar.ColunaPsq2 = 'COBRANCA'
    PropPesquisar.IndiceEdit = 0
    PropPesquisar.IndiceBotao = 1
    PropPesquisar.TipoEntrada = tpString
    PropPesquisar.RotinaCadastro = 0
    MultiSelecao = False
    CorCodigo = clWindow
    CorDescricao = clInactiveCaption
    Habilitado = True
    ExibirMsgNaoEncontrado = False
    Width = 58
  end
  object edtVlFreteSimb: TCurrencyEdit
    Left = 8
    Top = 175
    Width = 86
    Height = 24
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = ',0.00;-,0.00'
    TabOrder = 5
  end
  object pnlLineFinan: TPanel
    Left = 11
    Top = 110
    Width = 450
    Height = 1
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 11
  end
  object DtVencFat: TDateEdit
    Left = 196
    Top = 175
    Width = 121
    Height = 24
    NumGlyphs = 2
    TabOrder = 7
  end
  object edtPercFrete: TCurrencyEdit
    Left = 104
    Top = 175
    Width = 86
    Height = 24
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = ',0.00;-,0.00'
    TabOrder = 6
  end
  object pnlMultiplos: TPanel
    Left = 515
    Top = 27
    Width = 158
    Height = 58
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 12
    object lblMult: TLabel
      Left = 0
      Top = 0
      Width = 45
      Height = 16
      Caption = 'M'#250'ltiplos'
    end
    object lblUF: TLabel
      Left = 359
      Top = 6
      Width = 14
      Height = 16
      Caption = 'UF'
      Visible = False
    end
    object pnlBackDest: TPanel
      Left = 80
      Top = 25
      Width = 77
      Height = 31
      Cursor = crHandPoint
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object pnlDest: TPanel
        Left = 1
        Top = 2
        Width = 74
        Height = 27
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Destinat'#225'rios'
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnlBackRemet: TPanel
      Left = 0
      Top = 25
      Width = 75
      Height = 31
      Cursor = crHandPoint
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object pnlReme: TPanel
        Left = 1
        Top = 2
        Width = 72
        Height = 27
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Remetentes'
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnlLineMulti: TPanel
      Left = 0
      Top = 18
      Width = 150
      Height = 1
      BevelOuter = bvNone
      Color = clMenu
      UseDockManager = False
      ParentBackground = False
      TabOrder = 2
    end
    object cbbUF: TComboBox
      Left = 359
      Top = 27
      Width = 53
      Height = 24
      TabOrder = 3
      Visible = False
      Items.Strings = (
        'SP'
        'MG'
        'RJ'
        'RS'
        'SC'
        'PR'
        'ES'
        'DF'
        'MT'
        'MS'
        'GO'
        'TO'
        'BA'
        'SE'
        'AL'
        'PB'
        'PE'
        'MA'
        'RN'
        'CE'
        'PI'
        'PA'
        'AM'
        'AP'
        'AC'
        'RR'
        'RO')
    end
  end
  object edtNumCar: TCurrencyEdit
    Left = 439
    Top = 46
    Width = 70
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end

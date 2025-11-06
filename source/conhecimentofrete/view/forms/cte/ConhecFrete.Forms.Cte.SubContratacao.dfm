object frmCteSimplificadoSubContratacao: TfrmCteSimplificadoSubContratacao
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 190
  ClientWidth = 712
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Nunito Sans Normal'
  Font.Style = []
  OldCreateOrder = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  object scrlbxBackground: TScrollBox
    Left = 0
    Top = 0
    Width = 712
    Height = 177
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object lbl11: TLabel
      Left = 11
      Top = 45
      Width = 119
      Height = 16
      Caption = 'Chave CTE referenciado'
    end
    object lbl12: TLabel
      Left = 347
      Top = 45
      Width = 139
      Height = 16
      Caption = 'S'#233'rie Doc. CTE referenciado'
    end
    object lbl14: TLabel
      Left = 12
      Top = 86
      Width = 151
      Height = 16
      Caption = 'Raz'#227'o Social CTE referenciado'
    end
    object lbl13: TLabel
      Left = 347
      Top = 86
      Width = 163
      Height = 16
      Caption = 'Sub-S'#233'rie Doc. CTE referenciado'
    end
    object lbl15: TLabel
      Left = 12
      Top = 131
      Width = 113
      Height = 16
      Caption = 'CNPJ CTE referenciado'
    end
    object lbl17: TLabel
      Left = 347
      Top = 130
      Width = 123
      Height = 16
      Caption = 'N'#186' doc. CTE referenciado'
    end
    object lbl16: TLabel
      Left = 11
      Top = 178
      Width = 97
      Height = 16
      Caption = 'IE CTE referenciado'
    end
    object lbl9: TLabel
      Left = 347
      Top = 178
      Width = 104
      Height = 16
      Caption = 'UF Doc Referenciado'
    end
    object lblDados: TLabel
      Left = 12
      Top = 6
      Width = 187
      Height = 18
      Caption = 'Info. Documento Referenciado '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Nunito Sans Normal'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object psqExpedidor: TPesquisarEditButton
      Left = 11
      Top = 261
      Hint = 'Pressione a tecla CTRL + F3 para inicar a pesquisa.'
      ParentShowHint = False
      Properties.ReadOnly = False
      ShowHint = True
      Style.BorderStyle = ebsOffice11
      Style.Color = clWindow
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmInterfaces.edtStyleNativeWindows
      Style.TextColor = clWindowText
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      TextHint = 'C'#243'digo'
      Caption = 'Expedidor'
      PesquisarLabel.Width = 49
      PesquisarLabel.Height = 16
      PesquisarLabel.Caption = 'Expedidor'
      PesquisarSpeedButton.Left = 73
      PesquisarSpeedButton.Top = 262
      PesquisarSpeedButton.Width = 25
      PesquisarSpeedButton.Height = 21
      PesquisarSpeedButton.Hint = 'Pressione aqui para iniciar a pesquisa'
      PesquisarSpeedButton.Caption = '...'
      PesquisarSpeedButton.LookAndFeel.Kind = lfOffice11
      PesquisarSpeedButton.LookAndFeel.NativeStyle = False
      PesquisarSpeedButton.ParentShowHint = False
      PesquisarSpeedButton.ShowHint = True
      PesquisarSpeedButton.TabOrder = 1
      PesquisarSpeedButton.TabStop = False
      PesquisarSpeedButton.Flat = False
      PesquisarEdit.Left = 98
      PesquisarEdit.Top = 262
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
      PesquisarEdit.TabOrder = 2
      PesquisarEdit.ReadOnly = False
      PesquisarEdit.Color = clInactiveCaption
      PesquisarEdit.Width = 527
      PositionLabel = lpAbove
      SpacingLabel = 1
      PositionSpeedButton = lpRight
      SpacingSpeedButton = 2
      PositionEdit = lpRight
      SpacingEdit = 27
      PropPesquisar.ColunaPsq1 = 'CODFORNEC'
      PropPesquisar.ColunaPsq2 = 'FORNECEDOR'
      PropPesquisar.IndiceEdit = 0
      PropPesquisar.IndiceBotao = 1
      PropPesquisar.TipoEntrada = tpString
      PropPesquisar.RotinaCadastro = 0
      Pesquisar = dmInterfaces.psqFornecedor
      MultiSelecao = False
      CorCodigo = clWindow
      CorDescricao = clInactiveCaption
      Habilitado = True
      ExibirMsgNaoEncontrado = False
      Width = 60
    end
    object psqRecebedor: TPesquisarEditButton
      Left = 12
      Top = 301
      Hint = 'Pressione a tecla CTRL + F3 para inicar a pesquisa.'
      ParentShowHint = False
      Properties.ReadOnly = False
      ShowHint = True
      Style.BorderStyle = ebsOffice11
      Style.Color = clWindow
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmInterfaces.edtStyleNativeWindows
      Style.TextColor = clWindowText
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      TextHint = 'C'#243'digo'
      Caption = 'Recebedor'
      PesquisarLabel.Width = 52
      PesquisarLabel.Height = 16
      PesquisarLabel.Caption = 'Recebedor'
      PesquisarSpeedButton.Left = 74
      PesquisarSpeedButton.Top = 302
      PesquisarSpeedButton.Width = 25
      PesquisarSpeedButton.Height = 21
      PesquisarSpeedButton.Hint = 'Pressione aqui para iniciar a pesquisa'
      PesquisarSpeedButton.Caption = '...'
      PesquisarSpeedButton.LookAndFeel.Kind = lfOffice11
      PesquisarSpeedButton.LookAndFeel.NativeStyle = False
      PesquisarSpeedButton.ParentShowHint = False
      PesquisarSpeedButton.ShowHint = True
      PesquisarSpeedButton.TabOrder = 4
      PesquisarSpeedButton.TabStop = False
      PesquisarSpeedButton.Flat = False
      PesquisarEdit.Left = 99
      PesquisarEdit.Top = 302
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
      PesquisarEdit.TabOrder = 5
      PesquisarEdit.ReadOnly = False
      PesquisarEdit.Color = clInactiveCaption
      PesquisarEdit.Width = 527
      PositionLabel = lpAbove
      SpacingLabel = 1
      PositionSpeedButton = lpRight
      SpacingSpeedButton = 2
      PositionEdit = lpRight
      SpacingEdit = 27
      PropPesquisar.ColunaPsq1 = 'CODCLI'
      PropPesquisar.ColunaPsq2 = 'CLIENTE'
      PropPesquisar.IndiceEdit = 0
      PropPesquisar.IndiceBotao = 1
      PropPesquisar.TipoEntrada = tpString
      PropPesquisar.RotinaCadastro = 0
      Pesquisar = dmInterfaces.psqCliente
      MultiSelecao = False
      CorCodigo = clWindow
      CorDescricao = clInactiveCaption
      Habilitado = True
      ExibirMsgNaoEncontrado = False
      Width = 60
    end
    object rgTipoPrestacao: TRadioGroup
      Left = 12
      Top = 334
      Width = 185
      Height = 49
      BiDiMode = bdLeftToRight
      Caption = 'Tipo de Presta'#231#227'o'
      Columns = 2
      Items.Strings = (
        'Total'
        'Parcial')
      ParentBiDiMode = False
      TabOrder = 6
    end
    object edtChaveCteRef: TEdit
      Left = 8
      Top = 61
      Width = 278
      Height = 24
      TabOrder = 7
    end
    object edtRazaoSocialCteRef: TEdit
      Left = 8
      Top = 101
      Width = 281
      Height = 24
      TabOrder = 8
    end
    object edtCNPJCteRef: TEdit
      Left = 8
      Top = 148
      Width = 281
      Height = 24
      TabOrder = 9
    end
    object edtIECteRef: TEdit
      Left = 8
      Top = 200
      Width = 278
      Height = 24
      TabOrder = 10
    end
    object edtSerieDocCteRef: TEdit
      Left = 347
      Top = 61
      Width = 278
      Height = 24
      TabOrder = 11
    end
    object edtSubSerieDocCteRef: TEdit
      Left = 347
      Top = 101
      Width = 278
      Height = 24
      TabOrder = 12
    end
    object edtNumDocCteRef: TEdit
      Left = 347
      Top = 148
      Width = 278
      Height = 24
      TabOrder = 13
    end
    object edtUFDocCteRef: TEdit
      Left = 347
      Top = 200
      Width = 278
      Height = 24
      TabOrder = 14
    end
    object pnlLineDados: TPanel
      Left = 11
      Top = 24
      Width = 618
      Height = 1
      BevelOuter = bvNone
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 15
    end
  end
end

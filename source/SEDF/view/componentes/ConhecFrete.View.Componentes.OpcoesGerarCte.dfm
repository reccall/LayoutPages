inherited CmpOpcoesGerarCte: TCmpOpcoesGerarCte
  ClientHeight = 50
  ClientWidth = 328
  OnCreate = FormCreate
  ExplicitWidth = 328
  ExplicitHeight = 50
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBackGround: TPanel
    Width = 328
    Height = 50
    Align = alClient
    ExplicitLeft = -1
    ExplicitWidth = 321
    ExplicitHeight = 50
    inherited pnlInicioB: TPanel
      Left = 28
      ExplicitLeft = 28
    end
    inherited pnlGerarCteB: TPanel
      Left = 236
      ExplicitLeft = 236
    end
    inherited pnlSimuB: TPanel
      Left = 147
      ExplicitLeft = 147
    end
    object pnlLineBotoes: TPanel
      Left = 28
      Top = 46
      Width = 293
      Height = 1
      BevelOuter = bvNone
      Color = clMenu
      ParentBackground = False
      TabOrder = 3
    end
  end
end

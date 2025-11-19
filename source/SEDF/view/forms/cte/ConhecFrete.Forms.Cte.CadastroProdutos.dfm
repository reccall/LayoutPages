inherited FormCadastrosProdutos: TFormCadastrosProdutos
  Caption = 'FormCadastrosProdutos'
  ClientHeight = 453
  ClientWidth = 1500
  ExplicitWidth = 1500
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBackMain: TPanel
    Width = 1500
    Height = 324
    ExplicitWidth = 1500
    ExplicitHeight = 332
  end
  inherited pnlCadTop: TPanel
    Width = 1500
    ExplicitWidth = 1500
    inherited pnlConsulta: TPanel
      inherited lblConsulta: TLabel
        Left = 389
        ExplicitLeft = 389
      end
      inherited pnlRegiaoPesq: TPanel
        Top = 10
        Height = 33
        ExplicitTop = 10
        ExplicitHeight = 33
        inherited imgLupa: TImage
          Left = 330
          ExplicitLeft = 330
        end
      end
    end
    inherited pnlIncluirRegistro: TPanel
      Top = -3
      ExplicitTop = -3
    end
    inherited pnlTopMainCad: TPanel
      Top = 81
      Width = 1498
      Height = 39
      ExplicitTop = 81
      ExplicitWidth = 1498
      ExplicitHeight = 39
    end
  end
  inherited pnlMain: TPanel
    Width = 1500
    Height = 324
    Color = clWhite
    ParentBackground = False
    ExplicitLeft = 1
    ExplicitTop = 126
    ExplicitWidth = 1500
    ExplicitHeight = 332
    inherited scrlbxMain: TScrollBox
      Width = 1500
      Height = 300
      ExplicitWidth = 1500
      ExplicitHeight = 300
    end
  end
end

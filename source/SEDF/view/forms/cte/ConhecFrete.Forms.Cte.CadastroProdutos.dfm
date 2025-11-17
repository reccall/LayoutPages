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
    Height = 332
    ExplicitWidth = 1500
    ExplicitHeight = 332
  end
  inherited pnlCadTop: TPanel
    Width = 1500
    ExplicitWidth = 1500
    inherited pnlConsulta: TPanel
      Top = 7
      ExplicitTop = 7
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
          Top = 2
          Width = 30
          Height = 30
          Stretch = True
          ExplicitLeft = 330
          ExplicitTop = 2
          ExplicitWidth = 30
          ExplicitHeight = 30
        end
      end
    end
    inherited pnlTopMainCad: TPanel
      Top = 94
      Width = 1498
      Height = 26
      ExplicitTop = 94
      ExplicitWidth = 1498
      ExplicitHeight = 26
    end
  end
  inherited pnlMain: TPanel
    Width = 1500
    Height = 332
    Color = clWhite
    ParentBackground = False
    ExplicitWidth = 1500
    ExplicitHeight = 332
    inherited scrlbxMain: TScrollBox
      Width = 1500
      ExplicitWidth = 1500
    end
  end
end

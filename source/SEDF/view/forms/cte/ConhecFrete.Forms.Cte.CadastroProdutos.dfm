inherited FormCadastrosProdutos: TFormCadastrosProdutos
  Align = alClient
  Caption = 'FormCadastrosProdutos'
  ClientHeight = 453
  ClientWidth = 898
  ExplicitWidth = 898
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBackground: TPanel
    Width = 898
    Height = 453
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 669
    ExplicitHeight = 424
    inherited pnlBackMain: TPanel
      Width = 890
      Height = 451
      Caption = ''
      ExplicitWidth = 661
      inherited pnlCadTop: TPanel
        Width = 888
        Height = 104
        ExplicitTop = 1
        ExplicitWidth = 888
        ExplicitHeight = 104
        inherited pnlCadTopRight: TPanel
          Left = 888
          Width = 0
          Height = 104
          Caption = ''
          ExplicitLeft = 653
          ExplicitWidth = 0
        end
        inherited pnlCadTopRightBtns: TPanel
          Left = 0
          Width = 999
          Height = 104
          Align = alLeft
          Caption = ''
          ExplicitLeft = 0
          ExplicitWidth = 999
          ExplicitHeight = 97
          inherited pnlConsulta: TPanel
            Left = 144
            Top = -2
            Width = 377
            Height = 52
            ExplicitLeft = 144
            ExplicitTop = -2
            ExplicitWidth = 377
            ExplicitHeight = 52
            inherited imgLupa: TImage
              Left = 325
              Top = 1
              Width = 40
              Height = 40
              Align = alCustom
              ExplicitLeft = 325
              ExplicitTop = 1
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited lblConsulta: TLabel
              Left = 238
              Top = 4
              Width = 79
              Height = 34
              Font.Height = -19
              ExplicitLeft = 238
              ExplicitTop = 4
              ExplicitWidth = 79
              ExplicitHeight = 34
            end
            inherited pnlRegiaoPesq: TPanel
              Top = 8
              Caption = ''
              ExplicitTop = 8
            end
          end
          inherited pnlIncluirRegistro: TPanel
            Left = 382
            Top = 51
            Width = 139
            Height = 45
            ExplicitLeft = 382
            ExplicitTop = 51
            ExplicitWidth = 139
            ExplicitHeight = 45
            inherited lblInserir: TLabel
              Left = 24
              Top = 3
              Width = 55
              Height = 34
              Font.Height = -19
              ExplicitLeft = 24
              ExplicitTop = 3
              ExplicitWidth = 55
              ExplicitHeight = 34
            end
            inherited Image1: TImage
              Left = 85
              Top = 0
              Width = 40
              Height = 40
              ExplicitLeft = 85
              ExplicitTop = 0
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
          end
        end
      end
      inherited pnlMainCadastros: TPanel
        Top = 105
        Width = 888
        Height = 345
        Caption = ''
        ExplicitTop = 202
        ExplicitWidth = 659
        ExplicitHeight = 219
        inherited pnlTopMainCad: TPanel
          Width = 888
          ExplicitLeft = -5
          ExplicitTop = 6
          ExplicitWidth = 745
          inherited lblVl: TLabel
            Left = 594
            ExplicitLeft = 594
          end
          inherited lblAtivo: TLabel
            Left = 778
            Align = alCustom
            ExplicitLeft = 778
          end
        end
        inherited scrlbxMain: TScrollBox
          Width = 888
          ExplicitWidth = 659
        end
      end
    end
    inherited pnlRightMain: TPanel
      Left = 891
      Height = 451
      ExplicitLeft = 662
    end
  end
end

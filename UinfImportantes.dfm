object frmInfImportantes: TfrmInfImportantes
  Left = 0
  Top = 0
  ClientHeight = 596
  ClientWidth = 320
  Caption = 'Informa'#231#245'es importantes'
  BorderIcons = []
  AutoHeight = False
  FullScreen = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object pnlPrincipal: TUnimPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 596
    Hint = ''
    Align = alClient
    BorderStyle = ubsNone
    object ctnRodapé: TUnimContainerPanel
      Left = 0
      Top = 548
      Width = 320
      Height = 48
      Hint = ''
      Align = alBottom
      object btnConfirmar: TUnimButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 314
        Height = 42
        Hint = ''
        Align = alClient
        Caption = 'Confirmo'
        Font.Color = 7092497
        OnClick = btnConfirmarClick
      end
    end
    object scrlPrincipal: TUnimScrollBox
      Left = 0
      Top = 0
      Width = 320
      Height = 548
      Hint = ''
      Align = alClient
      ExplicitHeight = 596
      DesignSize = (
        301
        546)
      ScrollHeight = 830
      ScrollWidth = 0
      object ctnItens: TUnimContainerPanel
        Left = 4
        Top = 12
        Width = 294
        Height = 818
        Hint = ''
        Anchors = [akTop]
        object ctnTitulo: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 288
          Height = 65
          Hint = ''
          Align = alTop
          object UnimLabel1: TUnimLabel
            Left = 0
            Top = 0
            Width = 288
            Height = 55
            Hint = ''
            AutoSize = False
            Caption = 
              'Estou ciente de que s'#243' h'#225' possibilidade de libera'#231#227'o de cr'#233'dito ' +
              'se:'
            Align = alTop
            ParentFont = False
            Font.Color = 7092497
            Font.Height = -16
            Font.Style = [fsBold]
          end
        end
        object UnimContainerPanel1: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 367
          Width = 288
          Height = 74
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel2: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 74
            Hint = ''
            Align = alClient
            object lblFichaAvalista: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 68
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                '<b>Para a situa'#231#227'o de atividade formal(CNPJ), </b> a Pessoa Jur'#237 +
                'dica deve ter mais de 180 dias de exist'#234'ncia'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel3: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 74
            Hint = ''
            Align = alLeft
            object chk3: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 30
              Width = 19
              Height = 14
              Hint = ''
              Margins.Top = 30
              Margins.Bottom = 30
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimContainerPanel4: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 74
          Width = 288
          Height = 175
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel5: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 175
            Hint = ''
            Align = alClient
            object UnimLabel3: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 71
              Width = 257
              Height = 101
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                '*O grupo de aval '#233' a uni'#227'o volunt'#225'ria de 2 a 3 empreendedores qu' +
                'e queiram solicitar o cr'#233'dito, sendo um avalista dos outros. Os ' +
                'financiamentos s'#227'o individuais, mas, os integrantes atuam como a' +
                'valistas dentro do pr'#243'prio grupo.'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
            object UnimLabel4: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 62
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                'Todos os campos solicitados por esta Plataforma estiverem preenc' +
                'hidos, inclusive a apresenta'#231#227'o e p'#233'-cadastro de avalista ou gru' +
                'po de aval*'
              Align = alTop
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel6: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 175
            Hint = ''
            Align = alLeft
            object chk1: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 30
              Width = 19
              Height = 115
              Hint = ''
              Margins.Top = 30
              Margins.Bottom = 30
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimContainerPanel7: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 255
          Width = 288
          Height = 106
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel8: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 106
            Hint = ''
            Align = alClient
            object UnimLabel2: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 100
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                '<b>N'#195'O</b> h'#225' restri'#231#227'o de cr'#233'dito, ou seja, n'#227'o h'#225' registro neg' +
                'ativo junto '#224' SERASA e BANCO CENTRAL vinculado ao solicitante do' +
                ' cr'#233'dito e aos avalistas/componentes do grupo de Aval. Dessa for' +
                'ma, n'#227'o devo registrar o pr'#233'-cadastro nesta plataforma (RN MAIS ' +
                'CR'#201'DITO)'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel9: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 106
            Hint = ''
            Align = alLeft
            object chk2: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 30
              Width = 19
              Height = 46
              Hint = ''
              Margins.Top = 30
              Margins.Bottom = 30
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimLabel5: TUnimLabel
          Left = 0
          Top = 444
          Width = 294
          Height = 45
          Hint = ''
          AutoSize = False
          Caption = 'ATEN'#199#195'O: Tamb'#233'm estou ciente que:'
          Align = alTop
          ParentFont = False
          Font.Color = 7092497
          Font.Height = -16
          Font.Style = [fsBold]
        end
        object UnimContainerPanel10: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 719
          Width = 288
          Height = 58
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel11: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 58
            Hint = ''
            Align = alClient
            object UnimLabel6: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 52
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                'Toda documenta'#231#227'o deve ser anexada at'#233' 10 dias ap'#243's a data de so' +
                'licita'#231#227'o.'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel12: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 58
            Hint = ''
            Align = alLeft
            object chk6: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 19
              Height = 38
              Hint = ''
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimContainerPanel13: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 492
          Width = 288
          Height = 93
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel14: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 93
            Hint = ''
            Align = alClient
            object UnimLabel7: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 87
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                'O acompanhamento '#233' de minha responsabilidade o qual se dar'#225'  pel' +
                'o acesso a esta plataforma, clicando no bot'#227'o ACOMPANHAR SOLICIT' +
                'A'#199#195'O, digitando o meu CPF e a senha que foi cadastrada no pr'#233'-ca' +
                'dastro'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel15: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 93
            Hint = ''
            Align = alLeft
            object chk4: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 30
              Width = 19
              Height = 33
              Hint = ''
              Margins.Top = 30
              Margins.Bottom = 30
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimContainerPanel16: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 591
          Width = 288
          Height = 58
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel17: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 58
            Hint = ''
            Align = alClient
            object UnimLabel8: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 52
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 
                'Que esta plataforma n'#227'o deve ser utilizada, caso j'#225' esteja com a' +
                'lgum processo de solicita'#231#227'o em andamento junto '#224' AGN'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel18: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 58
            Hint = ''
            Align = alLeft
            object chk5: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 19
              Height = 38
              Hint = ''
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Caption = ''
            end
          end
        end
        object UnimLabel9: TUnimLabel
          AlignWithMargins = True
          Left = 3
          Top = 800
          Width = 288
          Height = 15
          Cursor = crHandPoint
          Hint = ''
          AutoSize = False
          Caption = 'Mais informa'#231#245'es acesse: <b>agn.rn.gov.br</b>'
          Align = alBottom
          ParentFont = False
          Font.Color = 6043655
          Font.Height = -12
          OnClick = UnimLabel9Click
        end
        object UnimContainerPanel19: TUnimContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 655
          Width = 288
          Height = 58
          Hint = ''
          Align = alTop
          Color = 16704730
          object UnimContainerPanel20: TUnimContainerPanel
            Left = 25
            Top = 0
            Width = 263
            Height = 58
            Hint = ''
            Align = alClient
            object UnimLabel10: TUnimLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 257
              Height = 52
              Cursor = crHandPoint
              Hint = ''
              AutoSize = False
              Caption = 'Todas as solicita'#231#245'es s'#227'o sujeitas a an'#225'lise de cr'#233'dito'
              Align = alClient
              ParentFont = False
              Font.Color = 6043655
              Font.Height = -12
            end
          end
          object UnimContainerPanel21: TUnimContainerPanel
            Left = 0
            Top = 0
            Width = 25
            Height = 58
            Hint = ''
            Align = alLeft
            object UnimCheckBox1: TUnimCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 19
              Height = 38
              Hint = ''
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Caption = ''
            end
          end
        end
      end
    end
  end
end

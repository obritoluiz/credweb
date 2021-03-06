object frmPedirDocs: TfrmPedirDocs
  Left = 0
  Top = 0
  ClientHeight = 629
  ClientWidth = 653
  Caption = 'frmPedirDocs'
  OnShow = UnimFormShow
  AutoHeight = False
  ShowTitle = False
  FullScreen = False
  TitleButtons = <>
  ShowAnimation = 'fade'
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object pgPrincipal: TUnimTabPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 647
    Height = 570
    Hint = ''
    ActivePage = pgDocumentos
    Align = alClient
    object pgDocumentos: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 639
      Height = 515
      Hint = ''
      Caption = 'Documentos'
      object pnlDocumentos: TUnimPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 515
        Hint = ''
        Align = alClient
        object grdDocs1: TUnimDBListGrid
          AlignWithMargins = True
          Left = 4
          Top = 69
          Width = 631
          Height = 442
          Hint = ''
          Align = alClient
          DataSource = UniMainModule.dsDocumentos
          OnDblClick = grdDocs1DblClick
          Columns = <
            item
              Title.Caption = 'DESCRICAO'
              FieldName = 'DESCRICAO'
              Width = 334
            end
            item
              Title.Caption = 'SITUA'#199#195'O'
              FieldName = 'SITUACAO'
              Width = 160
            end
            item
              Title.Caption = 'DATA'
              FieldName = 'DATACADASTRO'
              Width = 161
            end>
        end
        object UnimLabel1: TUnimLabel
          AlignWithMargins = True
          Left = 21
          Top = 21
          Width = 597
          Height = 25
          Hint = ''
          Margins.Left = 20
          Margins.Top = 20
          Margins.Right = 20
          Margins.Bottom = 20
          Alignment = taCenter
          AutoSize = False
          Caption = 'Lista de documentos solicitados'
          Align = alTop
          ParentFont = False
          Font.Color = 7092497
          Font.Style = [fsBold]
        end
      end
    end
    object pgIndeferir: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 639
      Height = 515
      Hint = ''
      Caption = 'Indeferir'
      object UnimPanel3: TUnimPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 515
        Hint = ''
        Align = alClient
        DesignSize = (
          639
          515)
        object grdDocs3: TUnimDBListGrid
          AlignWithMargins = True
          Left = 4
          Top = 69
          Width = 631
          Height = 442
          Hint = ''
          Align = alClient
          DataSource = dsIndeferirDocs
          OnDblClick = grdDocs3DblClick
          Columns = <
            item
              Title.Caption = 'DESCRICAO'
              FieldName = 'DESCRICAO'
              Width = 245
            end
            item
              Title.Caption = 'SITUA'#199#195'O'
              FieldName = 'SITUACAO'
              Width = 110
            end
            item
              Title.Caption = 'OBSERVA'#199#195'O'
              FieldName = 'OBS'
              Width = 320
            end>
        end
        object pnlMotivo: TUnimPanel
          Left = 86
          Top = 192
          Width = 449
          Height = 273
          Hint = ''
          Visible = False
          Anchors = [akTop]
          object UnimLabel3: TUnimLabel
            AlignWithMargins = True
            Left = 4
            Top = 11
            Width = 441
            Height = 37
            Hint = ''
            Margins.Top = 10
            Alignment = taCenter
            AutoSize = False
            Caption = 'Motivo do indeferimento'
            Align = alTop
            ParentFont = False
            Font.Height = -27
            Font.Style = [fsBold]
          end
          object edtMotivo: TUnimMemo
            AlignWithMargins = True
            Left = 31
            Top = 54
            Width = 387
            Height = 139
            Hint = ''
            Margins.Left = 30
            Margins.Right = 30
            Align = alTop
            TabOrder = 2
          end
          object UnimContainerPanel1: TUnimContainerPanel
            AlignWithMargins = True
            Left = 31
            Top = 199
            Width = 387
            Height = 49
            Hint = ''
            Margins.Left = 30
            Margins.Right = 30
            Align = alTop
            object btnVoltar: TUnimButton
              AlignWithMargins = True
              Left = 280
              Top = 3
              Width = 107
              Height = 43
              Hint = 'Fechar sem salvar'
              Margins.Right = 0
              ShowHint = True
              ParentShowHint = False
              Align = alRight
              Caption = 'VOLTAR'
              OnClick = btnVoltarClick
            end
            object btnIndApr: TUnimButton
              AlignWithMargins = True
              Left = 0
              Top = 3
              Width = 170
              Height = 43
              Hint = 'Alterar status'
              Margins.Left = 0
              ShowHint = True
              ParentShowHint = False
              Align = alClient
              Caption = 'INDEFERIR'
              OnClick = btnIndAprClick
            end
            object btnSalvar: TUnimButton
              AlignWithMargins = True
              Left = 176
              Top = 3
              Width = 101
              Height = 43
              Hint = 'Salvar altera'#231#245'es'
              Margins.Right = 0
              ShowHint = True
              ParentShowHint = False
              Align = alRight
              Caption = 'SALVAR'
              OnClick = btnSalvarClick
            end
          end
        end
        object UnimLabel2: TUnimLabel
          AlignWithMargins = True
          Left = 21
          Top = 21
          Width = 597
          Height = 25
          Hint = ''
          Margins.Left = 20
          Margins.Top = 20
          Margins.Right = 20
          Margins.Bottom = 20
          Alignment = taCenter
          AutoSize = False
          Caption = 'Indeferir documentos'
          Align = alTop
          ParentFont = False
          Font.Color = 7092497
          Font.Style = [fsBold]
        end
      end
    end
    object pgSolicitar: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 639
      Height = 515
      Hint = ''
      Caption = 'Solicitar'
      object scrlBody: TUnimScrollBox
        Left = 0
        Top = 0
        Width = 639
        Height = 515
        Hint = ''
        Align = alClient
        ScrollHeight = 647
        ScrollWidth = 636
        object umpDocumentos: TUnimPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 633
          Height = 644
          Hint = ''
          object umlDocumentos: TUnimLabel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 621
            Height = 25
            Hint = ''
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Alignment = taCenter
            AutoSize = False
            Caption = 'Solicitar documentos'
            Align = alTop
            ParentFont = False
            Font.Color = 7092497
            Font.Style = [fsBold]
          end
          object grdDocs2: TUnimDBListGrid
            AlignWithMargins = True
            Left = 4
            Top = 39
            Width = 625
            Height = 601
            Hint = ''
            Align = alClient
            DataSource = dsSolicitarDocs
            WebOptions.Paged = False
            WebOptions.PageSize = 200
            OnDblClick = grdDocs2DblClick
            Columns = <
              item
                Title.Caption = 'DESCRICAO'
                FieldName = 'DESCRICAO'
                Width = 480
              end
              item
                Title.Caption = 'SOLICITAR'
                FieldName = 'SOLICITAR'
                Width = 110
              end>
          end
        end
      end
    end
  end
  object btnFechar: TUnimButton
    AlignWithMargins = True
    Left = 3
    Top = 579
    Width = 647
    Height = 47
    Hint = ''
    Align = alBottom
    Caption = 'Fechar'
    Font.Color = 7092497
    OnClick = btnFecharClick
  end
  object qrySilicitarDocs: TFDQuery
    Connection = UniMainModule.FDConnection
    SQL.Strings = (
      'select '
      '  * '
      'from tb_documentos')
    Left = 522
    Top = 73
  end
  object dsSolicitarDocs: TDataSource
    DataSet = qrySilicitarDocs
    Left = 522
    Top = 25
  end
  object qryIndeferirDocs: TFDQuery
    Connection = UniMainModule.FDConnection
    SQL.Strings = (
      'select '
      '  * '
      'from tb_documentos'
      'where solicitar = '#39'SIM'#39'  and '
      'situacao <> '#39'PENDENTE'#39)
    Left = 434
    Top = 73
  end
  object dsIndeferirDocs: TDataSource
    DataSet = qryIndeferirDocs
    Left = 434
    Top = 25
  end
end

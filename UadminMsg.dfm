object frmAdminMsg: TfrmAdminMsg
  Left = 0
  Top = 0
  ClientHeight = 607
  ClientWidth = 688
  Caption = 'frmAdminMsg'
  OnShow = UnimFormShow
  AutoHeight = False
  ShowTitle = False
  FullScreen = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 25
    Hint = ''
    Align = alTop
    object lblClose: TUnimLabel
      AlignWithMargins = True
      Left = 628
      Top = 3
      Width = 57
      Height = 19
      Cursor = crHandPoint
      Hint = 'Fechar'
      ShowHint = True
      ParentShowHint = False
      Alignment = taRightJustify
      AutoSize = False
      Caption = '<i class="far fa-times-circle"></i>'
      Align = alRight
      ParentFont = False
      Font.Color = 8933122
      Font.Height = -20
      Font.Style = [fsBold]
      OnClick = lblCloseClick
    end
  end
  object pgPrincipal: TUnimTabPanel
    AlignWithMargins = True
    Left = 3
    Top = 28
    Width = 682
    Height = 576
    Hint = ''
    ActivePage = pgMensagens
    Align = alClient
    object pgMensagens: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 674
      Height = 521
      Hint = ''
      Caption = 'Mensagens n'#227'o lidas'
      object pnlGrd: TUnimPanel
        Left = 0
        Top = 0
        Width = 674
        Height = 521
        Hint = ''
        Align = alClient
        object grdDocs1: TUnimDBListGrid
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 666
          Height = 513
          Hint = ''
          Align = alClient
          DataSource = dsMsg
          OnDblClick = grdDocs1DblClick
          Columns = <
            item
              Title.Caption = 'CPF'
              FieldName = 'CPF'
              Width = 130
            end
            item
              Title.Caption = 'NOME'
              FieldName = 'NOME'
              Width = 400
            end
            item
              Title.Caption = 'MENSAGENS'
              FieldName = 'QTDE'
              Width = 125
            end>
        end
      end
    end
  end
  object dsMsg: TDataSource
    DataSet = qryMsg
    Left = 554
    Top = 25
  end
  object qryMsg: TFDQuery
    Connection = UniMainModule.FDConnection
    SQL.Strings = (
      'select'
      '    cli.nome,'
      '    cli.cpf, '
      '    count(c.mensagem) as qtde,'
      '    cli.id'
      ''
      'from tb_chat c'
      'inner join tb_cliente cli on cli.id = c.cliente'
      'where c.visto = '#39'N'#195'O'#39' and c.remetente = '#39'CLIENTE'#39
      'group by cli.nome, cli.cpf, cli.id')
    Left = 554
    Top = 73
  end
end

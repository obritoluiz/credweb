object frmDocsReprovados: TfrmDocsReprovados
  Left = 0
  Top = 0
  ClientHeight = 533
  ClientWidth = 692
  Caption = 'frmDocsReprovados'
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
  object UnimPanel3: TUnimPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 472
    Hint = ''
    Align = alClient
    DesignSize = (
      692
      472)
    object UnimLabel15: TUnimLabel
      AlignWithMargins = True
      Left = 4
      Top = 65
      Width = 684
      Height = 34
      Hint = ''
      Margins.Top = 0
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'D'#234' um clique duplo nos documentos que deseja marcar como reprova' +
        'dos.'
      Align = alTop
      ParentFont = False
      Font.Height = -12
    end
    object grdDocs: TUnimDBListGrid
      AlignWithMargins = True
      Left = 4
      Top = 105
      Width = 684
      Height = 363
      Hint = ''
      Align = alClient
      DataSource = UniMainModule.dsDocumentos
      OnDblClick = grdDocsDblClick
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
    object UnimLabel1: TUnimLabel
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 684
      Height = 44
      Hint = ''
      Margins.Top = 20
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      Caption = 'Documentos indeferidos'
      Align = alTop
      ParentFont = False
      Font.Height = -33
      ExplicitLeft = 5
      ExplicitTop = 20
    end
    object pnlMotivo: TUnimPanel
      Left = 117
      Top = 200
      Width = 449
      Height = 177
      Hint = ''
      Visible = False
      Anchors = [akTop]
      object UnimLabel2: TUnimLabel
        AlignWithMargins = True
        Left = 4
        Top = 11
        Width = 441
        Height = 37
        Hint = ''
        Margins.Top = 10
        Alignment = taCenter
        AutoSize = False
        Caption = 'Informe o motivo'
        Align = alTop
        ParentFont = False
        Font.Height = -27
        Font.Style = [fsBold]
      end
      object edtMotivo: TUnimEdit
        AlignWithMargins = True
        Left = 31
        Top = 54
        Width = 387
        Height = 47
        Hint = ''
        Margins.Left = 30
        Margins.Right = 30
        Align = alTop
        Text = ''
        CharCase = ecUpperCase
        ParentFont = False
        TabOrder = 2
      end
      object btnOK: TUnimButton
        AlignWithMargins = True
        Left = 31
        Top = 107
        Width = 387
        Height = 47
        Hint = ''
        Margins.Left = 30
        Margins.Right = 30
        Align = alTop
        Caption = 'OK'
        OnClick = btnOKClick
      end
    end
  end
  object UnimPanel1: TUnimPanel
    Left = 0
    Top = 472
    Width = 692
    Height = 61
    Hint = ''
    Align = alBottom
    object btnFinalizar: TUnimButton
      AlignWithMargins = True
      Left = 463
      Top = 4
      Width = 225
      Height = 53
      Hint = ''
      Align = alRight
      Caption = 'Finalizar'
      OnClick = btnFinalizarClick
    end
  end
end

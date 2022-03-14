object frmChat: TfrmChat
  Left = 0
  Top = 0
  ClientHeight = 607
  ClientWidth = 320
  Caption = 'frmChat'
  OnShow = UnimFormShow
  AutoHeight = False
  ShowTitle = False
  FullScreen = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 88
  PlatformData = {}
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 33
    Hint = ''
    Align = alTop
    Color = 9252103
    object lblSair: TUnimLabel
      AlignWithMargins = True
      Left = 272
      Top = 3
      Width = 45
      Height = 27
      Cursor = crHandPoint
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = '<i class="fas fa-times-circle"></i>'
      Align = alRight
      ParentFont = False
      Font.Color = clWhite
      OnClick = lblSairClick
    end
    object lblCabecalho: TUnimLabel
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 225
      Height = 27
      Hint = ''
      Margins.Left = 20
      AutoSize = False
      Caption = 'Chat com o cliente'
      Align = alLeft
      ParentFont = False
      Font.Color = 14803425
      Font.Style = [fsBold]
    end
  end
  object scrMensagens: TUnimScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 314
    Height = 513
    Hint = ''
    Align = alClient
    ScrollHeight = 23
    ScrollWidth = 0
    object UnimLabel1: TUnimLabel
      Left = 0
      Top = 0
      Width = 312
      Height = 23
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Role a p'#225'gina pra baixo para ver as mensagens <i class="fas fa-a' +
        'rrow-down"></i>'
      Align = alTop
      ParentFont = False
      Font.Height = -11
    end
  end
  object pnlRodape: TUnimPanel
    Left = 0
    Top = 552
    Width = 320
    Height = 55
    Hint = ''
    Align = alBottom
    BorderStyle = ubsNone
    object UnimContainerPanel2: TUnimContainerPanel
      AlignWithMargins = True
      Left = 274
      Top = 3
      Width = 43
      Height = 49
      Hint = ''
      Align = alClient
      object btnEnviar: TUnimButton
        Left = 0
        Top = 0
        Width = 43
        Height = 33
        Hint = ''
        Align = alTop
        Caption = '<i class="fas fa-paper-plane"></i>'
        Font.Color = 657930
        OnClick = btnEnviarClick
      end
    end
    object lblMsg: TUnimEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 265
      Height = 49
      Hint = ''
      Align = alLeft
      Text = ''
      EmptyText = 'Sua mensagem'
      ParentFont = False
      TabOrder = 2
      MaxLength = 80
    end
  end
  object UniTimer: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimerTimer
    Left = 251
    Top = 78
  end
  object qryMsg: TFDQuery
    Connection = UniMainModule.FDConnection
    Left = 155
    Top = 83
  end
  object dsMsg: TDataSource
    DataSet = qryMsg
    Left = 155
    Top = 139
  end
end

object frmPesqPendencia: TfrmPesqPendencia
  Left = 0
  Top = 0
  ClientHeight = 607
  ClientWidth = 320
  Caption = 'frmPesqPendencia'
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
    Width = 320
    Height = 129
    Hint = ''
    Align = alTop
    object UnimLabel1: TUnimLabel
      AlignWithMargins = True
      Left = 10
      Top = 30
      Width = 300
      Height = 96
      Hint = ''
      Margins.Left = 10
      Margins.Top = 30
      Margins.Right = 10
      Alignment = taCenter
      AutoSize = False
      Caption = 'Pesquisa inicial com pend'#234'ncias'
      Align = alClient
      ParentFont = False
      Font.Color = 7092497
      Font.Height = -33
      Font.Style = [fsBold]
    end
  end
  object UnimContainerPanel3: TUnimContainerPanel
    Left = 0
    Top = 129
    Width = 320
    Height = 440
    Hint = ''
    Align = alClient
    object lblCaracRest: TUnimLabel
      AlignWithMargins = True
      Left = 3
      Top = 417
      Width = 314
      Height = 20
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Car'#225'cteres restantes: 2000'
      Align = alBottom
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
    end
    object mmMsg: TUnimMemo
      Left = 0
      Top = 0
      Width = 320
      Height = 414
      Hint = ''
      Align = alClient
      TabOrder = 2
      OnChange = mmMsgChange
      ExplicitLeft = 168
      ExplicitTop = 176
      ExplicitWidth = 225
      ExplicitHeight = 235
    end
  end
  object UnimContainerPanel2: TUnimContainerPanel
    Left = 0
    Top = 569
    Width = 320
    Height = 38
    Hint = ''
    Align = alBottom
    object UnimButton1: TUnimButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 314
      Height = 32
      Hint = ''
      Align = alClient
      Caption = 'Confirmar'
      OnClick = UnimButton1Click
    end
  end
end

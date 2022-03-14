object frmConexao: TfrmConexao
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 320
  Caption = 'Conex'#227'o '
  TitleButtons = <>
  DesignSize = (
    320
    480)
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object umeServidor: TUnimEdit
    Left = 8
    Top = 101
    Width = 304
    Height = 47
    Hint = ''
    Anchors = [akTop]
    Text = ''
    EmptyText = 'Servidor'
    ParentFont = False
    TabOrder = 0
  end
  object umeUsusario: TUnimEdit
    Left = 8
    Top = 181
    Width = 304
    Height = 47
    Hint = ''
    Anchors = [akTop]
    Text = ''
    EmptyText = 'Usu'#225'rio'
    ParentFont = False
    TabOrder = 1
  end
  object umeSenha: TUnimEdit
    Left = 8
    Top = 261
    Width = 304
    Height = 47
    Hint = ''
    Anchors = [akTop]
    Text = ''
    PasswordChar = '*'
    EmptyText = 'Senha'
    ParentFont = False
    TabOrder = 2
  end
  object umbConectar: TUnimButton
    Left = 8
    Top = 330
    Width = 304
    Height = 47
    Hint = ''
    Anchors = [akTop]
    Caption = 'Conectar'
    OnClick = umbConectarClick
  end
end

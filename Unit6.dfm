object MapForm: TMapForm
  Left = 410
  Top = 279
  Width = 479
  Height = 376
  Caption = #1050#1072#1088#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 463
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 73
      Height = 17
      Caption = #1042#1089#1077' '#1079#1074#1091#1082#1080
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = #1043#1083#1072#1089'. / '#1089#1086#1075#1083'.'
      TabOrder = 1
      OnClick = RadioButton2Click
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 463
    Height = 272
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 65
      Height = 57
    end
  end
end

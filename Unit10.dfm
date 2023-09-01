object FntBgForm: TFntBgForm
  Left = 560
  Top = 398
  BorderStyle = bsDialog
  Caption = #1064#1088#1080#1092#1090' '#1080' '#1092#1086#1085
  ClientHeight = 171
  ClientWidth = 344
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = #1043#1072#1088#1085#1080#1090#1091#1088#1072':'
  end
  object Label2: TLabel
    Left = 200
    Top = 8
    Width = 33
    Height = 13
    Caption = #1050#1077#1075#1083#1100':'
  end
  object Label3: TLabel
    Left = 272
    Top = 8
    Width = 62
    Height = 13
    Caption = #1051#1077#1074#1086#1077' '#1087#1086#1083#1077':'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object SpinEdit1: TSpinEdit
    Left = 200
    Top = 24
    Width = 65
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object ColorGrid1: TColorGrid
    Left = 8
    Top = 48
    Width = 328
    Height = 80
    GridOrdering = go8x2
    ForegroundIndex = 1
    TabOrder = 2
  end
  object Button1: TButton
    Left = 180
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 260
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object SpinEdit2: TSpinEdit
    Left = 272
    Top = 24
    Width = 65
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
end

object FrequencyForm: TFrequencyForm
  Left = 854
  Top = 342
  Width = 299
  Height = 435
  Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1072#1085#1072#1083#1080#1079' '#1089#1083#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 283
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103':'
    end
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 283
    Height = 368
    Align = alClient
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 16
    Top = 152
    Width = 257
    Height = 121
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
end

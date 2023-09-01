object ReNameDlg: TReNameDlg
  Left = 324
  Top = 378
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
  ClientHeight = 93
  ClientWidth = 233
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 62
    Height = 13
    Caption = #1048#1084#1103' '#1087#1091#1085#1082#1090#1072':'
  end
  object ReNameEdit: TEdit
    Left = 8
    Top = 27
    Width = 217
    Height = 21
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 70
    Top = 59
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 150
    Top = 59
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBtnClick
  end
end

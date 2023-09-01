object AddItemDlg: TAddItemDlg
  Left = 555
  Top = 335
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 93
  ClientWidth = 233
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 128
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1091#1085#1082#1090#1072':'
  end
  object AddItem: TEdit
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

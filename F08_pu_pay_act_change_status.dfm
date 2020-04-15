object F_pu_pay_act_change_status: TF_pu_pay_act_change_status
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
  ClientHeight = 113
  ClientWidth = 181
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 128
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089' '#1072#1090#1072' '#1085#1072' '#1086#1087#1083#1072#1090#1091' '#1055#1059
  end
  object B_OK: TBitBtn
    Left = 138
    Top = 72
    Width = 25
    Height = 25
    Caption = 'B_OK'
    TabOrder = 0
    OnClick = B_OKClick
  end
  object cb_pu_pay_act_status: TComboBox
    Left = 18
    Top = 32
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
end

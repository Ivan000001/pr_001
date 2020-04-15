object F_ks_rec: TF_ks_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1057': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 194
  ClientWidth = 408
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
    Left = 16
    Top = 8
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 16
    Top = 108
    Width = 40
    Height = 13
    Caption = #1053#1044#1057', %'
  end
  object Label3: TLabel
    Left = 16
    Top = 62
    Width = 43
    Height = 13
    Caption = #1044#1086#1075#1086#1074#1086#1088
  end
  object Label6: TLabel
    Left = 96
    Top = 8
    Width = 54
    Height = 13
    Caption = #1057#1086#1089#1090#1072#1074#1083#1077#1085
  end
  object Label7: TLabel
    Left = 206
    Top = 8
    Width = 5
    Height = 13
    Caption = #1089
  end
  object Label8: TLabel
    Left = 304
    Top = 8
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object e_number: TEdit
    Left = 24
    Top = 27
    Width = 49
    Height = 21
    TabOrder = 0
    OnKeyPress = e_numberKeyPress
  end
  object e_nds: TEdit
    Left = 24
    Top = 127
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = e_ndsKeyPress
  end
  object cb_contract: TComboBox
    Left = 24
    Top = 81
    Width = 292
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object dt_create: TDateTimePicker
    Left = 96
    Top = 27
    Width = 97
    Height = 21
    Date = 43838.416666666660000000
    Time = 43838.416666666660000000
    TabOrder = 3
  end
  object dt_from: TDateTimePicker
    Left = 217
    Top = 27
    Width = 81
    Height = 21
    Date = 43838.000000000000000000
    Time = 43838.000000000000000000
    TabOrder = 4
  end
  object dt_to: TDateTimePicker
    Left = 312
    Top = 27
    Width = 81
    Height = 21
    Date = 43838.999988425920000000
    Time = 43838.999988425920000000
    TabOrder = 5
  end
  object B_OK: TBitBtn
    Left = 360
    Top = 142
    Width = 33
    Height = 33
    Caption = 'B_OK'
    TabOrder = 6
    OnClick = B_OKClick
  end
  object rec_rb1: TRadioButton
    Left = 176
    Top = 127
    Width = 81
    Height = 17
    Caption = #1055#1088#1080#1093#1086#1076
    Checked = True
    TabOrder = 7
    TabStop = True
  end
  object rec_rb2: TRadioButton
    Left = 176
    Top = 150
    Width = 81
    Height = 17
    Caption = #1056#1072#1089#1093#1086#1076
    TabOrder = 8
  end
end

object F_contracts_rec: TF_contracts_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1082#1090#1099': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 165
  ClientWidth = 502
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
    Width = 71
    Height = 13
    Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 47
    Height = 13
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
  end
  object Label3: TLabel
    Left = 209
    Top = 54
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object Label4: TLabel
    Left = 271
    Top = 8
    Width = 43
    Height = 13
    Caption = #1040#1082#1090#1080#1074#1077#1085
  end
  object Label5: TLabel
    Left = 151
    Top = 8
    Width = 89
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
  end
  object e_contract: TEdit
    Left = 16
    Top = 27
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 0
  end
  object cb_one: TComboBox
    Left = 16
    Top = 73
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object cb_two: TComboBox
    Left = 216
    Top = 73
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object B_reload: TBitBtn
    Left = 447
    Top = 69
    Width = 34
    Height = 29
    Caption = 'B_reload'
    TabOrder = 3
    OnClick = B_reloadClick
  end
  object B_counteragents: TBitBtn
    Left = 408
    Top = 69
    Width = 33
    Height = 29
    Caption = 'B_counteragents'
    TabOrder = 4
    OnClick = B_counteragentsClick
  end
  object cb_status: TComboBox
    Left = 280
    Top = 27
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 5
    Text = #1076#1072
    Items.Strings = (
      #1085#1077#1090
      #1076#1072)
  end
  object DT_sign: TDateTimePicker
    Left = 157
    Top = 27
    Width = 108
    Height = 21
    Date = 43834.000000000000000000
    Time = 43834.000000000000000000
    TabOrder = 6
  end
  object B_OK: TBitBtn
    Left = 360
    Top = 120
    Width = 33
    Height = 33
    Caption = 'B_OK'
    TabOrder = 7
    OnClick = B_OKClick
  end
end

object F_tp_point: TF_tp_point
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1086#1095#1082#1072
  ClientHeight = 432
  ClientWidth = 241
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
    Left = 17
    Top = 64
    Width = 20
    Height = 13
    Caption = #1044#1086#1084
  end
  object Label2: TLabel
    Left = 93
    Top = 64
    Width = 49
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  object Label3: TLabel
    Left = 93
    Top = 110
    Width = 70
    Height = 13
    Caption = #1047#1072#1084#1077#1085#1072' '#1074#1074#1086#1076#1072
  end
  object Label4: TLabel
    Left = 17
    Top = 160
    Width = 52
    Height = 13
    Caption = #1058#1080#1087' '#1074#1074#1086#1076#1072
  end
  object Label5: TLabel
    Left = 17
    Top = 203
    Width = 14
    Height = 13
    Caption = #1055#1059
  end
  object Label6: TLabel
    Left = 17
    Top = 249
    Width = 69
    Height = 13
    Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
  end
  object Label7: TLabel
    Left = 17
    Top = 110
    Width = 48
    Height = 13
    Caption = #1060#1072#1079#1085#1086#1089#1090#1100
  end
  object Label8: TLabel
    Left = 17
    Top = 18
    Width = 31
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object Label9: TLabel
    Left = 16
    Top = 312
    Width = 60
    Height = 13
    Caption = 'id '#1089#1091#1097#1085#1086#1089#1090#1080
  end
  object E_house: TEdit
    Left = 27
    Top = 83
    Width = 60
    Height = 21
    TabOrder = 0
  end
  object E_room: TEdit
    Left = 103
    Top = 83
    Width = 60
    Height = 21
    TabOrder = 1
  end
  object cb_vvod: TComboBox
    Left = 103
    Top = 133
    Width = 86
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object cb_type_outline: TComboBox
    Left = 27
    Top = 179
    Width = 166
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object E_pu: TEdit
    Left = 28
    Top = 222
    Width = 158
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object B_list_pu: TBitBtn
    Left = 192
    Top = 220
    Width = 25
    Height = 25
    Caption = '*'
    TabOrder = 6
    OnClick = B_list_puClick
  end
  object B_OK: TBitBtn
    Left = 198
    Top = 384
    Width = 35
    Height = 25
    Caption = '->'
    TabOrder = 8
    OnClick = B_OKClick
  end
  object E_act: TEdit
    Left = 27
    Top = 268
    Width = 159
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object E_faze: TEdit
    Left = 27
    Top = 133
    Width = 60
    Height = 21
    MaxLength = 1
    TabOrder = 2
    OnKeyPress = E_fazeKeyPress
  end
  object cb_street: TComboBox
    Left = 28
    Top = 37
    Width = 158
    Height = 21
    ItemHeight = 13
    TabOrder = 9
  end
  object e_y_id: TEdit
    Left = 27
    Top = 336
    Width = 200
    Height = 21
    MaxLength = 36
    TabOrder = 10
  end
end

object F_act_rec: TF_act_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090
  ClientHeight = 678
  ClientWidth = 1244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 480
    Width = 55
    Height = 13
    Caption = #1055#1086#1076#1087#1080#1089#1072#1085#1090
  end
  object Label2: TLabel
    Left = 154
    Top = 480
    Width = 89
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
  end
  object Label3: TLabel
    Left = 8
    Top = 334
    Width = 83
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100' '#1089#1091#1097'. '#1055#1059
  end
  object Label4: TLabel
    Left = 8
    Top = 380
    Width = 75
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1091#1097'. '#1055#1059
  end
  object L_old_sum: TLabel
    Left = 73
    Top = 445
    Width = 5
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object L_new_sum: TLabel
    Left = 73
    Top = 303
    Width = 5
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 8
    Top = 147
    Width = 23
    Height = 13
    Caption = #1060#1048#1054
  end
  object Label6: TLabel
    Left = 8
    Top = 235
    Width = 14
    Height = 13
    Caption = #1055#1059
  end
  object Label7: TLabel
    Left = 163
    Top = 235
    Width = 37
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072
  end
  object Label8: TLabel
    Left = 8
    Top = 189
    Width = 39
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100
  end
  object Label9: TLabel
    Left = 84
    Top = 282
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'1'
  end
  object Label10: TLabel
    Left = 149
    Top = 282
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'2'
  end
  object Label11: TLabel
    Left = 214
    Top = 282
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'3'
  end
  object Label12: TLabel
    Left = 84
    Top = 423
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'1'
  end
  object Label13: TLabel
    Left = 149
    Top = 423
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'2'
  end
  object Label14: TLabel
    Left = 214
    Top = 423
    Width = 12
    Height = 13
    Alignment = taCenter
    Caption = #1058'3'
  end
  object Label15: TLabel
    Left = 8
    Top = 54
    Width = 18
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label18: TLabel
    Left = 8
    Top = 526
    Width = 63
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
  end
  object Label19: TLabel
    Left = 8
    Top = 103
    Width = 69
    Height = 13
    Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
  end
  object Label16: TLabel
    Left = 8
    Top = 576
    Width = 43
    Height = 13
    Caption = #1050#1072#1076#1072#1089#1090#1088
  end
  object cb_sign_master: TComboBox
    Left = 22
    Top = 499
    Width = 126
    Height = 21
    ItemHeight = 13
    TabOrder = 13
  end
  object B_OK: TBitBtn
    Left = 241
    Top = 626
    Width = 25
    Height = 25
    Caption = 'B_OK'
    TabOrder = 16
    OnClick = B_OKClick
  end
  object DT_sign: TDateTimePicker
    Left = 169
    Top = 499
    Width = 97
    Height = 21
    Date = 43780.634121203700000000
    Time = 43780.634121203700000000
    TabOrder = 14
  end
  object E_old_T1: TEdit
    Left = 84
    Top = 442
    Width = 65
    Height = 21
    TabOrder = 10
    OnExit = E_old_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_old_T2: TEdit
    Left = 149
    Top = 442
    Width = 65
    Height = 21
    TabOrder = 11
    OnExit = E_old_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_old_T3: TEdit
    Left = 214
    Top = 442
    Width = 65
    Height = 21
    TabOrder = 12
    OnExit = E_old_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_new_T1: TEdit
    Left = 84
    Top = 301
    Width = 65
    Height = 21
    TabOrder = 5
    OnExit = E_new_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_new_T2: TEdit
    Left = 149
    Top = 301
    Width = 65
    Height = 21
    TabOrder = 6
    OnExit = E_new_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_new_T3: TEdit
    Left = 214
    Top = 301
    Width = 65
    Height = 21
    TabOrder = 7
    OnExit = E_new_T1Exit
    OnKeyPress = E_old_T1KeyPress
  end
  object E_old_pu: TEdit
    Left = 22
    Top = 399
    Width = 155
    Height = 21
    TabOrder = 9
  end
  object E_old_pu_model: TEdit
    Left = 22
    Top = 353
    Width = 155
    Height = 21
    TabOrder = 8
  end
  object E_FIO: TEdit
    Left = 22
    Top = 166
    Width = 193
    Height = 21
    TabOrder = 4
  end
  object E_pu: TEdit
    Left = 22
    Top = 254
    Width = 135
    Height = 21
    Enabled = False
    TabOrder = 17
  end
  object E_plomb: TEdit
    Left = 176
    Top = 254
    Width = 103
    Height = 21
    Enabled = False
    TabOrder = 18
  end
  object E_model: TEdit
    Left = 22
    Top = 208
    Width = 149
    Height = 21
    Enabled = False
    TabOrder = 19
  end
  object E_tp: TEdit
    Left = 8
    Top = 8
    Width = 98
    Height = 21
    Enabled = False
    TabOrder = 20
  end
  object E_np: TEdit
    Left = 112
    Top = 8
    Width = 167
    Height = 21
    Enabled = False
    TabOrder = 21
  end
  object E_street: TEdit
    Left = 8
    Top = 32
    Width = 149
    Height = 21
    Enabled = False
    TabOrder = 22
  end
  object E_house: TEdit
    Left = 163
    Top = 32
    Width = 55
    Height = 21
    Enabled = False
    TabOrder = 23
  end
  object E_room: TEdit
    Left = 224
    Top = 32
    Width = 55
    Height = 21
    Enabled = False
    TabOrder = 24
  end
  object cb_abonent_status: TComboBox
    Left = 22
    Top = 73
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object cb_act_status: TComboBox
    Left = 22
    Top = 545
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 15
    OnSelect = cb_act_statusSelect
  end
  object SC2: TScrollBox
    Left = 795
    Top = 5
    Width = 441
    Height = 332
    TabOrder = 1
    object Image2: TImage
      Left = 0
      Top = 0
      Width = 153
      Height = 105
      OnProgress = Image2Progress
    end
    object B_load_2: TBitBtn
      Left = 5
      Top = 5
      Width = 28
      Height = 25
      Caption = 'B_load_2'
      TabOrder = 0
      OnClick = B_load_2Click
    end
    object B_clear_2: TBitBtn
      Left = 5
      Top = 36
      Width = 28
      Height = 25
      Caption = 'B_clear_2'
      TabOrder = 1
      OnClick = B_clear_2Click
    end
  end
  object SC3: TScrollBox
    Left = 795
    Top = 343
    Width = 440
    Height = 327
    TabOrder = 2
    object Image3: TImage
      Left = 0
      Top = 0
      Width = 177
      Height = 105
      OnProgress = Image3Progress
    end
    object B_load_3: TBitBtn
      Left = 9
      Top = 24
      Width = 32
      Height = 34
      Caption = 'B_load_3'
      TabOrder = 0
      OnClick = B_load_3Click
    end
    object B_clear_3: TBitBtn
      Left = 16
      Top = 64
      Width = 25
      Height = 25
      Caption = 'B_clear_3'
      TabOrder = 1
      OnClick = B_clear_3Click
    end
  end
  object SC1: TScrollBox
    Left = 304
    Top = 5
    Width = 485
    Height = 665
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 257
      Height = 224
      OnProgress = Image1Progress
    end
    object B_load_1: TBitBtn
      Left = 5
      Top = 5
      Width = 25
      Height = 26
      Caption = 'B_load_1'
      TabOrder = 0
      OnClick = B_load_1Click
    end
    object B_clear_1: TBitBtn
      Left = 5
      Top = 37
      Width = 25
      Height = 21
      Caption = 'B_clear_1'
      TabOrder = 1
      OnClick = B_clear_1Click
    end
  end
  object E_kadastr: TEdit
    Left = 22
    Top = 595
    Width = 191
    Height = 21
    TabOrder = 25
  end
  object E_p_number: TEdit
    Left = 22
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 26
  end
  object B_fiz18: TBitBtn
    Left = 256
    Top = 120
    Width = 23
    Height = 25
    Caption = 'B_fiz18'
    TabOrder = 27
    OnClick = B_fiz18Click
  end
  object OPD1: TOpenPictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 256
    Top = 72
  end
end

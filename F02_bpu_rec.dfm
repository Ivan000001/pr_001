object F_bpu_rec: TF_bpu_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1041#1055#1059' - '#1076#1072#1085#1085#1099#1077
  ClientHeight = 671
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 13
    Width = 13
    Height = 13
    Caption = #1058#1055
  end
  object Label2: TLabel
    Left = 15
    Top = 64
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
  end
  object Label3: TLabel
    Left = 161
    Top = 64
    Width = 37
    Height = 13
    Caption = #1052#1072#1089#1090#1077#1088
  end
  object Label4: TLabel
    Left = 15
    Top = 150
    Width = 84
    Height = 13
    Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label5: TLabel
    Left = 161
    Top = 150
    Width = 22
    Height = 13
    Caption = 'MAC'
  end
  object Label6: TLabel
    Left = 15
    Top = 196
    Width = 46
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072' 1'
  end
  object Label7: TLabel
    Left = 161
    Top = 196
    Width = 46
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072' 2'
  end
  object Label8: TLabel
    Left = 15
    Top = 320
    Width = 63
    Height = 13
    Caption = #1058#1058' - '#1053#1072#1080#1084#1077#1085'.'
  end
  object Label9: TLabel
    Left = 104
    Top = 320
    Width = 52
    Height = 13
    Caption = #1050#1086#1092'. '#1040'/5'#1040
  end
  object Label10: TLabel
    Left = 176
    Top = 320
    Width = 53
    Height = 13
    Caption = #1057#1077#1088'.'#1085#1086#1084#1077#1088
  end
  object Label11: TLabel
    Left = 260
    Top = 320
    Width = 37
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072
  end
  object Label12: TLabel
    Left = 15
    Top = 488
    Width = 60
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
  end
  object L_last_sn: TLabel
    Left = 176
    Top = 32
    Width = 3
    Height = 13
    Visible = False
  end
  object Label13: TLabel
    Left = 15
    Top = 110
    Width = 153
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100' ('#1079#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1088#1091#1082#1072#1084#1080')'
  end
  object SB: TScrollBox
    Left = 318
    Top = 0
    Width = 476
    Height = 671
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 319
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image2: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image3: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image4: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image5: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image6: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image7: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image8: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
    object Image9: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Stretch = True
      Visible = False
      ExplicitWidth = 105
      ExplicitHeight = 65
    end
  end
  object B_OK: TBitBtn
    Left = 268
    Top = 630
    Width = 29
    Height = 25
    Caption = 'B_OK'
    TabOrder = 1
    OnClick = B_OKClick
  end
  object B_Load: TBitBtn
    Left = 286
    Top = 520
    Width = 26
    Height = 25
    Caption = 'B_Load'
    TabOrder = 2
    OnClick = B_LoadClick
  end
  object B_clear: TBitBtn
    Left = 284
    Top = 551
    Width = 26
    Height = 25
    Caption = 'B_clear'
    TabOrder = 3
    OnClick = B_clearClick
  end
  object e_tp: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object e_sn: TEdit
    Left = 24
    Top = 169
    Width = 121
    Height = 21
    MaxLength = 13
    TabOrder = 5
    OnKeyPress = e_snKeyPress
  end
  object cb_status: TComboBox
    Left = 21
    Top = 507
    Width = 78
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      #1076#1072)
  end
  object DT_install: TDateTimePicker
    Left = 24
    Top = 83
    Width = 121
    Height = 21
    Date = 43820.715119629630000000
    Time = 43820.715119629630000000
    TabOrder = 7
  end
  object cb_brig: TComboBox
    Left = 176
    Top = 83
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 8
  end
  object e_mac: TEdit
    Left = 176
    Top = 169
    Width = 137
    Height = 21
    MaxLength = 16
    TabOrder = 9
    OnKeyPress = e_macKeyPress
  end
  object e_plomb1: TEdit
    Left = 24
    Top = 215
    Width = 70
    Height = 21
    MaxLength = 7
    TabOrder = 10
    OnKeyPress = e_snKeyPress
  end
  object e_plomb2: TEdit
    Left = 176
    Top = 215
    Width = 70
    Height = 21
    MaxLength = 7
    TabOrder = 11
    OnKeyPress = e_snKeyPress
  end
  object e_tt1_name: TEdit
    Left = 21
    Top = 339
    Width = 73
    Height = 21
    TabOrder = 12
  end
  object e_tt1_sn: TEdit
    Left = 164
    Top = 339
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 13
    OnKeyPress = e_tt1_snKeyPress
  end
  object e_tt1_plomb: TEdit
    Left = 243
    Top = 339
    Width = 67
    Height = 21
    MaxLength = 7
    TabOrder = 14
    OnKeyPress = e_snKeyPress
  end
  object e_tt2_name: TEdit
    Left = 21
    Top = 366
    Width = 73
    Height = 21
    TabOrder = 15
  end
  object e_tt2_sn: TEdit
    Left = 164
    Top = 366
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 16
    OnKeyPress = e_tt1_snKeyPress
  end
  object e_tt2_plomb: TEdit
    Left = 243
    Top = 366
    Width = 67
    Height = 21
    MaxLength = 7
    TabOrder = 17
    OnKeyPress = e_snKeyPress
  end
  object e_tt3_name: TEdit
    Left = 21
    Top = 393
    Width = 73
    Height = 21
    TabOrder = 18
  end
  object e_tt3_sn: TEdit
    Left = 164
    Top = 393
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 19
    OnKeyPress = e_tt1_snKeyPress
  end
  object e_tt3_plomb: TEdit
    Left = 243
    Top = 393
    Width = 67
    Height = 21
    MaxLength = 7
    TabOrder = 20
    OnKeyPress = e_snKeyPress
  end
  object e_tt1_k: TEdit
    Left = 100
    Top = 339
    Width = 58
    Height = 21
    MaxLength = 4
    TabOrder = 21
    OnKeyPress = e_snKeyPress
  end
  object e_tt2_k: TEdit
    Left = 100
    Top = 366
    Width = 58
    Height = 21
    MaxLength = 4
    TabOrder = 22
    OnKeyPress = e_snKeyPress
  end
  object e_tt3_k: TEdit
    Left = 100
    Top = 393
    Width = 58
    Height = 21
    MaxLength = 4
    TabOrder = 23
    OnKeyPress = e_snKeyPress
  end
  object B_bpu_img1: TBitBtn
    Left = 96
    Top = 259
    Width = 49
    Height = 41
    Caption = #1041#1055#1059' '#1089#1077#1088#1080#1081#1085#1080#1082
    TabOrder = 24
    WordWrap = True
    OnClick = B_bpu_img1Click
  end
  object B_bpu_mac: TBitBtn
    Left = 152
    Top = 259
    Width = 49
    Height = 41
    Caption = #1041#1055#1059' MAC'
    TabOrder = 25
    WordWrap = True
    OnClick = B_bpu_macClick
  end
  object B_bpu_img2: TBitBtn
    Left = 207
    Top = 259
    Width = 50
    Height = 41
    Caption = #1055#1083#1086#1084#1073#1072
    TabOrder = 26
    WordWrap = True
    OnClick = B_bpu_img2Click
  end
  object B_bpu_img3: TBitBtn
    Left = 264
    Top = 259
    Width = 49
    Height = 41
    Caption = #1055#1083#1086#1084#1073#1072
    TabOrder = 27
    WordWrap = True
    OnClick = B_bpu_img3Click
  end
  object B_tt_all: TBitBtn
    Left = 97
    Top = 424
    Width = 49
    Height = 41
    Caption = #1054#1073#1097#1080#1081' '#1074#1080#1076
    TabOrder = 28
    WordWrap = True
    OnClick = B_tt_allClick
  end
  object B_tt1: TBitBtn
    Left = 152
    Top = 424
    Width = 49
    Height = 41
    Caption = #1058#1058' 1'
    TabOrder = 29
    WordWrap = True
    OnClick = B_tt1Click
  end
  object B_tt2: TBitBtn
    Left = 207
    Top = 424
    Width = 50
    Height = 41
    Caption = #1058#1058' 2'
    TabOrder = 30
    WordWrap = True
    OnClick = B_tt2Click
  end
  object B_tt3: TBitBtn
    Left = 263
    Top = 424
    Width = 50
    Height = 41
    Caption = #1058#1058' 3'
    TabOrder = 31
    WordWrap = True
    OnClick = B_tt3Click
  end
  object B_bpu_all: TBitBtn
    Left = 40
    Top = 259
    Width = 50
    Height = 41
    BiDiMode = bdLeftToRight
    Caption = #1054#1073#1097#1080#1081' '#1074#1080#1076
    ParentBiDiMode = False
    TabOrder = 32
    WordWrap = True
    OnClick = B_bpu_allClick
  end
  object B_save: TBitBtn
    Left = 284
    Top = 582
    Width = 26
    Height = 25
    Caption = 'B_save'
    TabOrder = 33
  end
  object e_model_name: TEdit
    Left = 24
    Top = 128
    Width = 289
    Height = 21
    TabOrder = 34
  end
  object OPD1: TOpenPictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 224
    Top = 528
  end
  object SPD1: TSavePictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 224
    Top = 560
  end
end

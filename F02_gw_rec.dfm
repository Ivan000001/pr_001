object F_gw_rec: TF_gw_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1064#1083#1102#1079' - '#1076#1072#1085#1099#1077
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
    Left = 8
    Top = 8
    Width = 13
    Height = 13
    Caption = #1058#1055
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
  end
  object Label3: TLabel
    Left = 154
    Top = 59
    Width = 37
    Height = 13
    Caption = #1052#1072#1089#1090#1077#1088
  end
  object Label4: TLabel
    Left = 8
    Top = 113
    Width = 22
    Height = 13
    Caption = 'IMEI'
  end
  object Label5: TLabel
    Left = 154
    Top = 113
    Width = 22
    Height = 13
    Caption = 'MAC'
  end
  object Label6: TLabel
    Left = 8
    Top = 159
    Width = 37
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072
  end
  object L_last_sn: TLabel
    Left = 169
    Top = 27
    Width = 3
    Height = 13
    Visible = False
  end
  object Label12: TLabel
    Left = 8
    Top = 464
    Width = 60
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
  end
  object Label7: TLabel
    Left = 8
    Top = 205
    Width = 33
    Height = 13
    Caption = #1060#1080#1076#1077#1088
  end
  object Label8: TLabel
    Left = 154
    Top = 205
    Width = 32
    Height = 13
    Caption = #1054#1087#1086#1088#1072
  end
  object SB: TScrollBox
    Left = 318
    Top = 0
    Width = 476
    Height = 671
    Align = alRight
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Visible = False
      ExplicitLeft = 32
      ExplicitTop = 32
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object Image2: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Visible = False
      ExplicitLeft = 64
      ExplicitTop = 144
      ExplicitWidth = 81
      ExplicitHeight = 65
    end
    object Image3: TImage
      Left = 0
      Top = 0
      Width = 472
      Height = 667
      Align = alClient
      Proportional = True
      Visible = False
      ExplicitLeft = 96
      ExplicitTop = 248
      ExplicitWidth = 73
      ExplicitHeight = 73
    end
  end
  object e_tp: TEdit
    Left = 17
    Top = 27
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object e_imei: TEdit
    Left = 17
    Top = 132
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 2
    OnKeyPress = e_imeiKeyPress
  end
  object DT_install: TDateTimePicker
    Left = 17
    Top = 78
    Width = 121
    Height = 21
    Date = 43820.715119629630000000
    Time = 43820.715119629630000000
    TabOrder = 3
  end
  object cb_brig: TComboBox
    Left = 169
    Top = 78
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object e_mac: TEdit
    Left = 169
    Top = 132
    Width = 137
    Height = 21
    MaxLength = 16
    TabOrder = 5
    OnKeyPress = e_macKeyPress
  end
  object e_plomb: TEdit
    Left = 17
    Top = 178
    Width = 70
    Height = 21
    MaxLength = 7
    TabOrder = 6
    OnKeyPress = e_imeiKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 592
    Width = 33
    Height = 33
    Caption = 'BitBtn1'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object B_Load: TBitBtn
    Left = 279
    Top = 352
    Width = 26
    Height = 25
    Caption = 'B_Load'
    TabOrder = 8
    OnClick = B_LoadClick
  end
  object B_clear: TBitBtn
    Left = 279
    Top = 383
    Width = 26
    Height = 25
    Caption = 'B_clear'
    TabOrder = 9
    OnClick = B_clearClick
  end
  object cb_status: TComboBox
    Left = 17
    Top = 483
    Width = 78
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      #1076#1072)
  end
  object B_save: TBitBtn
    Left = 279
    Top = 414
    Width = 26
    Height = 25
    Caption = 'B_save'
    TabOrder = 11
  end
  object B_img1: TBitBtn
    Left = 139
    Top = 280
    Width = 52
    Height = 49
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1074#1080#1076
    TabOrder = 12
    OnClick = B_img1Click
  end
  object B_img2: TBitBtn
    Left = 197
    Top = 280
    Width = 51
    Height = 49
    Caption = #1055#1083#1086#1084#1073#1072
    TabOrder = 13
    OnClick = B_img2Click
  end
  object B_img3: TBitBtn
    Left = 254
    Top = 280
    Width = 51
    Height = 49
    Caption = #1054#1087#1086#1088#1072
    TabOrder = 14
    OnClick = B_img3Click
  end
  object e_fider: TEdit
    Left = 17
    Top = 224
    Width = 70
    Height = 21
    TabOrder = 15
    OnKeyPress = e_imeiKeyPress
  end
  object e_opore: TEdit
    Left = 169
    Top = 224
    Width = 74
    Height = 21
    TabOrder = 16
    OnKeyPress = e_oporeKeyPress
  end
  object OPD1: TOpenPictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 219
    Top = 360
  end
  object SPD1: TSavePictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 219
    Top = 392
  end
end

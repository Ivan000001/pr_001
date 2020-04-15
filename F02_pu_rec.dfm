object F_pu_rec: TF_pu_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1055#1059
  ClientHeight = 671
  ClientWidth = 889
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
    Top = 8
    Width = 13
    Height = 13
    Caption = #1058#1055
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 33
    Height = 13
    Caption = #1060#1080#1076#1077#1088
  end
  object Label3: TLabel
    Left = 71
    Top = 56
    Width = 32
    Height = 13
    Caption = #1054#1087#1086#1088#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 39
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100
  end
  object Label5: TLabel
    Left = 8
    Top = 171
    Width = 48
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1055#1059
  end
  object Label6: TLabel
    Left = 140
    Top = 171
    Width = 37
    Height = 13
    Caption = #1055#1083#1086#1084#1073#1072
  end
  object Label7: TLabel
    Left = 8
    Top = 224
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
  end
  object Label8: TLabel
    Left = 140
    Top = 224
    Width = 37
    Height = 13
    Caption = #1052#1072#1089#1090#1077#1088
  end
  object Label9: TLabel
    Left = 8
    Top = 278
    Width = 19
    Height = 13
    Caption = #1040#1082#1090
  end
  object Label10: TLabel
    Left = 8
    Top = 342
    Width = 26
    Height = 13
    Caption = #1060#1086#1090#1086
  end
  object Label11: TLabel
    Left = 8
    Top = 398
    Width = 38
    Height = 13
    Caption = #1054#1087#1083#1072#1090#1072
  end
  object L_tp_point: TLabel
    Left = 181
    Top = 72
    Width = 3
    Height = 13
  end
  object cb_tp: TComboBox
    Left = 16
    Top = 27
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object E_fider: TEdit
    Left = 15
    Top = 75
    Width = 57
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object E_opore: TEdit
    Left = 78
    Top = 75
    Width = 58
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object B_Opore_list: TBitBtn
    Left = 142
    Top = 73
    Width = 25
    Height = 25
    Caption = 'B_Opore_list'
    TabOrder = 8
    OnClick = B_Opore_listClick
  end
  object cb_model: TComboBox
    Left = 16
    Top = 131
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 9
  end
  object DT_install: TDateTimePicker
    Left = 16
    Top = 243
    Width = 89
    Height = 21
    Date = 43773.558821226850000000
    Time = 43773.558821226850000000
    TabOrder = 3
  end
  object cb_brig: TComboBox
    Left = 144
    Top = 243
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object E_act: TEdit
    Left = 16
    Top = 297
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object cb_photo_status: TComboBox
    Left = 16
    Top = 361
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 11
  end
  object cb_pay_status: TComboBox
    Left = 16
    Top = 417
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 12
  end
  object B_OK: TBitBtn
    Left = 192
    Top = 600
    Width = 41
    Height = 25
    Caption = 'B_OK'
    TabOrder = 5
    OnClick = B_OKClick
  end
  object Panel1: TPanel
    Left = 312
    Top = 0
    Width = 577
    Height = 671
    Align = alRight
    BorderStyle = bsSingle
    TabOrder = 15
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 571
      Height = 665
      Align = alClient
      Proportional = True
      Stretch = True
      ExplicitLeft = 104
      ExplicitTop = 64
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object B_Clear_image: TBitBtn
    Left = 282
    Top = 39
    Width = 25
    Height = 25
    Caption = 'B_Clear_image'
    TabOrder = 14
    OnClick = B_Clear_imageClick
  end
  object B_Load_image: TBitBtn
    Left = 281
    Top = 8
    Width = 25
    Height = 25
    Caption = 'B_Load_image'
    TabOrder = 13
    OnClick = B_Load_imageClick
  end
  object E_pu_sn: TEdit
    Left = 16
    Top = 190
    Width = 122
    Height = 21
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = E_pu_snKeyPress
  end
  object E_plomb: TEdit
    Left = 144
    Top = 190
    Width = 89
    Height = 21
    MaxLength = 7
    TabOrder = 1
    OnKeyPress = E_plombKeyPress
  end
  object OPD1: TOpenPictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 240
    Top = 8
  end
  object ActionList1: TActionList
    Left = 8
    Top = 592
    object Action1: TAction
      Caption = 'Action1'
    end
  end
end

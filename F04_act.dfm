object F_act: TF_act
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1082#1090#1099
  ClientHeight = 543
  ClientWidth = 1244
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
  object cb_tp: TComboBox
    Left = 24
    Top = 8
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object DB_act: TDBGrid
    Left = 8
    Top = 35
    Width = 1201
    Height = 439
    DataSource = DM1.DS_act
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_sign'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_address'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'street_name'
        Title.Alignment = taCenter
        Title.Caption = #1059#1083#1080#1094#1072
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'house'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1084
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'room'
        Title.Alignment = taCenter
        Title.Caption = #1050#1074'.'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_abonent_status'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'p_number'
        Title.Alignment = taCenter
        Title.Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054
        Width = 168
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sign_master'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1076#1087#1080#1089#1072#1085#1090
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_act_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_act_pay_status'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072' '#1072#1082#1090#1072
        Width = 86
        Visible = True
      end>
  end
  object B_Apply_filter: TBitBtn
    Left = 1199
    Top = 8
    Width = 27
    Height = 25
    Caption = 'B_Apply_filter'
    TabOrder = 2
    OnClick = B_Apply_filterClick
  end
  object B_Edit: TBitBtn
    Left = 1215
    Top = 51
    Width = 26
    Height = 25
    Caption = 'B_Edit'
    TabOrder = 3
    OnClick = B_EditClick
  end
  object SB1: TStatusBar
    Left = 0
    Top = 524
    Width = 1244
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object cb_act_status: TComboBox
    Left = 1008
    Top = 8
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object cb_act_pay_status: TComboBox
    Left = 1104
    Top = 8
    Width = 89
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 1244
    Height = 44
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 7
    object DBText1: TDBText
      Left = 24
      Top = 16
      Width = 25
      Height = 17
      Alignment = taCenter
      DataField = 'fider_a'
      DataSource = DM1.DS_act
    end
    object DBText2: TDBText
      Left = 48
      Top = 16
      Width = 33
      Height = 17
      Alignment = taCenter
      DataField = 'opore_a'
      DataSource = DM1.DS_act
    end
    object DBText3: TDBText
      Left = 96
      Top = 16
      Width = 65
      Height = 17
      DataField = 'pu_model_name'
      DataSource = DM1.DS_act
    end
    object DBText4: TDBText
      Left = 184
      Top = 16
      Width = 65
      Height = 17
      Alignment = taCenter
      DataField = 'pu_plomb'
      DataSource = DM1.DS_act
    end
    object DBText5: TDBText
      Left = 272
      Top = 16
      Width = 65
      Height = 17
      DataField = 'install_master'
      DataSource = DM1.DS_act
    end
    object DBText6: TDBText
      Left = 368
      Top = 16
      Width = 65
      Height = 17
      DataField = 'date_install'
      DataSource = DM1.DS_act
    end
    object DBText7: TDBText
      Left = 456
      Top = 16
      Width = 113
      Height = 17
      DataField = 'sn_old_pu'
      DataSource = DM1.DS_act
    end
    object DBText8: TDBText
      Left = 576
      Top = 16
      Width = 161
      Height = 17
      DataField = 'kadastr'
      DataSource = DM1.DS_act
    end
  end
  object E_pu: TEdit
    Left = 808
    Top = 8
    Width = 97
    Height = 21
    TabOrder = 8
  end
  object E_p_number: TEdit
    Left = 544
    Top = 8
    Width = 97
    Height = 21
    TabOrder = 9
  end
  object E_FIO: TEdit
    Left = 640
    Top = 8
    Width = 169
    Height = 21
    TabOrder = 10
  end
  object E_house: TEdit
    Left = 408
    Top = 8
    Width = 41
    Height = 21
    TabOrder = 11
  end
  object B_Clear: TBitBtn
    Left = 1215
    Top = 82
    Width = 21
    Height = 25
    Caption = 'B_Clear'
    TabOrder = 12
    OnClick = B_ClearClick
  end
  object cb_sign_brig: TComboBox
    Left = 904
    Top = 8
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 13
  end
  object DT_from: TDateTimePicker
    Left = 103
    Top = 8
    Width = 105
    Height = 21
    Date = 43849.673366377310000000
    Time = 43849.673366377310000000
    TabOrder = 14
  end
  object DT_to: TDateTimePicker
    Left = 208
    Top = 8
    Width = 105
    Height = 21
    Date = 43849.673450370370000000
    Time = 43849.673450370370000000
    TabOrder = 15
  end
end

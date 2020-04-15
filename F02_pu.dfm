object F_pu: TF_pu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1059
  ClientHeight = 522
  ClientWidth = 934
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 51
    Width = 889
    Height = 409
    DataSource = DM1.DS_pu
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fider_a'
        Title.Alignment = taCenter
        Title.Caption = #1060#1080#1076#1077#1088
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'opore_a'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1086#1088#1072
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_model_name'
        Title.Alignment = taCenter
        Title.Caption = #1052#1086#1076#1077#1083#1100
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088' '#1055#1059
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_plomb'
        Title.Alignment = taCenter
        Title.Caption = #1055#1083#1086#1084#1073#1072
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_install'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name_master'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1089#1090#1077#1088
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_act_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_photo_status'
        Title.Alignment = taCenter
        Title.Caption = #1060#1086#1090#1086
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_pu_pay_status'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 65
        Visible = True
      end>
  end
  object DT_to: TDateTimePicker
    Left = 425
    Top = 24
    Width = 89
    Height = 21
    Date = 43773.999988425920000000
    Time = 43773.999988425920000000
    TabOrder = 1
  end
  object B_Apply_filter: TBitBtn
    Left = 872
    Top = 20
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 2
    OnClick = B_Apply_filterClick
  end
  object cb_pu_model: TComboBox
    Left = 176
    Top = 24
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object cb_brig: TComboBox
    Left = 520
    Top = 24
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object cb_photo_status: TComboBox
    Left = 739
    Top = 24
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object cb_pu_pay_status: TComboBox
    Left = 802
    Top = 24
    Width = 64
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object E_fider: TEdit
    Left = 95
    Top = 24
    Width = 34
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object E_opore: TEdit
    Left = 135
    Top = 24
    Width = 42
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object E_pu_sn: TEdit
    Left = 271
    Top = 24
    Width = 98
    Height = 21
    TabOrder = 9
  end
  object E_plomb: TEdit
    Left = 361
    Top = 24
    Width = 64
    Height = 21
    TabOrder = 10
  end
  object E_act: TEdit
    Left = 632
    Top = 24
    Width = 101
    Height = 21
    TabOrder = 11
  end
  object cb_tp: TComboBox
    Left = 16
    Top = 24
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 12
  end
  object DT_from: TDateTimePicker
    Left = 424
    Top = 0
    Width = 90
    Height = 21
    Date = 43773.000011574080000000
    Time = 43773.000011574080000000
    TabOrder = 13
  end
  object SB1: TStatusBar
    Left = 0
    Top = 503
    Width = 934
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object B_Add_pu: TBitBtn
    Left = 903
    Top = 51
    Width = 25
    Height = 25
    Caption = 'B_Add_pu'
    TabOrder = 15
    OnClick = B_Add_puClick
  end
  object B_Del_pu: TBitBtn
    Left = 903
    Top = 82
    Width = 23
    Height = 25
    Caption = 'B_Del_pu'
    TabOrder = 16
    OnClick = B_Del_puClick
  end
  object B_Edit_pu: TBitBtn
    Left = 903
    Top = 113
    Width = 25
    Height = 25
    Caption = 'B_Edit_pu'
    TabOrder = 17
    OnClick = B_Edit_puClick
  end
end

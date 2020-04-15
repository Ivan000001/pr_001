object F_exp_act_reestr: TF_exp_act_reestr
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1088#1077#1077#1089#1090#1088#1072' '#1072#1082#1090#1086#1074
  ClientHeight = 404
  ClientWidth = 783
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
  object B_exp: TBitBtn
    Left = 743
    Top = 104
    Width = 25
    Height = 25
    Caption = 'B_exp'
    TabOrder = 0
    OnClick = B_expClick
  end
  object B_apply: TBitBtn
    Left = 743
    Top = 56
    Width = 25
    Height = 25
    Caption = 'B_apply'
    TabOrder = 1
    OnClick = B_applyClick
  end
  object SB1: TStatusBar
    Left = 0
    Top = 385
    Width = 783
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object cb_tp: TComboBox
    Left = 24
    Top = 56
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object DT_from: TDateTimePicker
    Left = 103
    Top = 35
    Width = 89
    Height = 21
    Date = 43787.000000000000000000
    Time = 43787.000000000000000000
    TabOrder = 4
  end
  object DT_to: TDateTimePicker
    Left = 103
    Top = 56
    Width = 89
    Height = 21
    Date = 43787.999988425920000000
    Time = 43787.999988425920000000
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 83
    Width = 729
    Height = 296
    DataSource = DM_exp1.DS_act_reestr_list
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
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
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_create'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1072#1082#1090#1086#1074
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'type_reestr'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'path_ext'
        Title.Alignment = taCenter
        Title.Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080
        Width = 486
        Visible = True
      end>
  end
  object E_path: TEdit
    Left = 24
    Top = 8
    Width = 473
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object B_dir: TBitBtn
    Left = 503
    Top = 8
    Width = 25
    Height = 25
    Caption = 'B_dir'
    TabOrder = 8
    OnClick = B_dirClick
  end
end

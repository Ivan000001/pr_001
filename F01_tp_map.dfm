object F_tp_map: TF_tp_map
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1055' '#1080' '#1082#1072#1088#1090#1072' '#1086#1087#1086#1088
  ClientHeight = 478
  ClientWidth = 803
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
  object cb_tp: TComboBox
    Left = 27
    Top = 8
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object B_Apply_filter01: TBitBtn
    Left = 178
    Top = 8
    Width = 23
    Height = 20
    Caption = '>'
    TabOrder = 1
    OnClick = B_Apply_filter01Click
  end
  object B_list_tp: TBitBtn
    Left = 207
    Top = 8
    Width = 23
    Height = 20
    Caption = '*'
    TabOrder = 2
    OnClick = B_list_tpClick
  end
  object DG_tp_list: TDBGrid
    Left = 8
    Top = 34
    Width = 465
    Height = 272
    DataSource = DM1.DS_tp_map
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
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
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fider'
        Title.Alignment = taCenter
        Title.Caption = #1060#1080#1076#1077#1088
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'opore'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1086#1088#1072
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_opore_state'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1089#1090'.'#1086#1087#1086#1088#1099
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_type_inline'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1074#1093'.'#1084#1072#1075#1080#1089#1090#1088#1072#1083#1080
        Visible = True
      end>
  end
  object DG_tp_point: TDBGrid
    Left = 8
    Top = 312
    Width = 745
    Height = 154
    DataSource = DM1.DS_tp_point
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'street_name'
        Title.Alignment = taCenter
        Title.Caption = #1059#1083#1080#1094#1072
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'house'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1084
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'room'
        Title.Alignment = taCenter
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_vvod'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1084#1077#1085#1072' '#1074#1074#1086#1076#1072
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_type_outline'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1074#1074#1086#1076#1072
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn_a'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_act_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
        Width = 106
        Visible = True
      end>
  end
  object B_Add_opore: TBitBtn
    Left = 486
    Top = 34
    Width = 27
    Height = 25
    Caption = 'B_Add_opore'
    TabOrder = 5
    OnClick = B_Add_oporeClick
  end
  object B_Del_opore: TBitBtn
    Left = 487
    Top = 96
    Width = 27
    Height = 25
    Caption = 'B_Del_opore'
    TabOrder = 6
    OnClick = B_Del_oporeClick
  end
  object B_Edit_opore: TBitBtn
    Left = 487
    Top = 65
    Width = 27
    Height = 25
    Caption = 'B_Edit_opore'
    TabOrder = 7
    OnClick = B_Edit_oporeClick
  end
  object B_Add_point: TBitBtn
    Left = 759
    Top = 312
    Width = 26
    Height = 25
    Caption = 'B_Add_point'
    TabOrder = 8
    OnClick = B_Add_pointClick
  end
  object B_Del_point: TBitBtn
    Left = 759
    Top = 374
    Width = 26
    Height = 25
    Caption = 'B_Del_point'
    TabOrder = 9
    OnClick = B_Del_pointClick
  end
  object B_Edit_point: TBitBtn
    Left = 759
    Top = 343
    Width = 26
    Height = 25
    Caption = 'B_Edit_point'
    TabOrder = 10
    OnClick = B_Edit_pointClick
  end
  object B_tp_imp: TBitBtn
    Left = 487
    Top = 168
    Width = 25
    Height = 25
    Caption = 'B_tp_imp'
    TabOrder = 11
  end
end

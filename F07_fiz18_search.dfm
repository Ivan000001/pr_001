object F_fiz18_search: TF_fiz18_search
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1060#1048#1047'-18'
  ClientHeight = 343
  ClientWidth = 1126
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
    Left = 6
    Top = 40
    Width = 1115
    Height = 297
    DataSource = DM1.DS_fiz18_search
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'p_number'
        Title.Alignment = taCenter
        Title.Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054
        Width = 223
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stat_abon'
        Title.Alignment = taCenter
        Title.Caption = #1057
        Width = 17
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stat_shetc'
        Title.Alignment = taCenter
        Title.Caption = #1052
        Width = 18
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sn_old_pu'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1057#1091#1097'.'#1055#1059
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'poselenie'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'street'
        Title.Alignment = taCenter
        Title.Caption = #1059#1083#1080#1094#1072
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'house'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1084
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'room'
        Title.Alignment = taCenter
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_number'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055' '#1085#1086#1084#1077#1088
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kadastr'
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1076#1072#1089#1090#1088#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
        Width = 148
        Visible = True
      end>
  end
  object E_p_number: TEdit
    Left = 16
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object E_FIO: TEdit
    Left = 112
    Top = 16
    Width = 217
    Height = 21
    TabOrder = 2
  end
  object E_sn_old_pu: TEdit
    Left = 368
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 3
  end
  object B_Apply_filter: TBitBtn
    Left = 488
    Top = 14
    Width = 25
    Height = 25
    Caption = 'B_Apply_filter'
    TabOrder = 4
    OnClick = B_Apply_filterClick
  end
end

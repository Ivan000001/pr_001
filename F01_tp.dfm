object F_tp: TF_tp
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1055
  ClientHeight = 536
  ClientWidth = 978
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
  object DBGrid1: TDBGrid
    Left = 22
    Top = 8
    Width = 691
    Height = 481
    DataSource = DM1.DS_tp
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_address'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'strukture'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name_PO'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1055#1054
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name_RES'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1056#1069#1057
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name_PS'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1055#1057
        Width = 148
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 495
    Width = 280
    Height = 25
    DataSource = DM1.DS_tp
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 757
    Top = 8
    Width = 200
    Height = 120
    DataSource = DM1.DS_street
    TabOrder = 2
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
        Width = 156
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 757
    Top = 134
    Width = 200
    Height = 25
    DataSource = DM1.DS_street
    TabOrder = 3
  end
end

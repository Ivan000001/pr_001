object F_pu_pay_act: TF_pu_pay_act
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088' '#1055#1059' - '#1079#1072#1082#1088#1099#1090#1080#1077
  ClientHeight = 440
  ClientWidth = 682
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
  object B_Apply: TBitBtn
    Left = 230
    Top = 8
    Width = 26
    Height = 25
    Caption = 'B_Apply'
    TabOrder = 0
    OnClick = B_ApplyClick
  end
  object DT_from: TDateTimePicker
    Left = 16
    Top = 8
    Width = 105
    Height = 21
    Date = 43810.355472523150000000
    Time = 43810.355472523150000000
    TabOrder = 1
  end
  object DT_to: TDateTimePicker
    Left = 119
    Top = 8
    Width = 105
    Height = 21
    Date = 43810.355523275470000000
    Time = 43810.355523275470000000
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 305
    Height = 386
    DataSource = DM1.DS_pu_pay_act
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
        FieldName = 'date_create'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'doc_name'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_pu_pay_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 82
        Visible = True
      end>
  end
  object B_new: TBitBtn
    Left = 327
    Top = 39
    Width = 25
    Height = 25
    Caption = 'B_new'
    TabOrder = 4
    OnClick = B_newClick
  end
  object B_del: TBitBtn
    Left = 326
    Top = 72
    Width = 26
    Height = 25
    Caption = 'B_del'
    TabOrder = 5
  end
  object B_change_status: TBitBtn
    Left = 326
    Top = 191
    Width = 26
    Height = 25
    Caption = 'B_change_status'
    TabOrder = 6
    OnClick = B_change_statusClick
  end
  object DBGrid2: TDBGrid
    Left = 367
    Top = 39
    Width = 298
    Height = 386
    DataSource = DM1.DS_pu_pay_act_detail
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
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
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SUM1'
        Title.Alignment = taCenter
        Title.Caption = '1'#1092
        Width = 60
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SUM3'
        Title.Alignment = taCenter
        Title.Caption = '3'#1092
        Width = 60
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ALL_SUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1042#1089#1077#1075#1086
        Width = 70
        Visible = True
      end>
  end
  object B_edit: TBitBtn
    Left = 327
    Top = 103
    Width = 26
    Height = 25
    Caption = 'B_edit'
    TabOrder = 8
    OnClick = B_editClick
  end
end

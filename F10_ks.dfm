object F_ks: TF_ks
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1057' '#1087#1088#1080#1093#1086#1076
  ClientHeight = 588
  ClientWidth = 826
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
    Top = 32
    Width = 769
    Height = 273
    DataSource = DM1.DS_ks
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
        FieldName = 'number_doc'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_create'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1089#1090#1072#1074#1083#1077#1085
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_from'
        Title.Alignment = taCenter
        Title.Caption = #1089
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_to'
        Title.Alignment = taCenter
        Title.Caption = #1087#1086
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_status'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'contract_name'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'contract_status'
        Title.Alignment = taCenter
        Title.Caption = #1089#1090#1072#1090#1091#1089' '#1076#1086#1075
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_name1'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_name2'
        Title.Alignment = taCenter
        Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Title.Alignment = taCenter
        Title.Caption = #1053#1044#1057',%'
        Width = 65
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 311
    Width = 641
    Height = 186
    DataSource = DM1.DS_ks_detail
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
        FieldName = 'code_action'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr_action'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'scale_action'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'count_'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072', '#1088#1091#1073
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sum_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073
        Width = 90
        Visible = True
      end>
  end
  object B_add: TBitBtn
    Left = 783
    Top = 32
    Width = 26
    Height = 25
    Caption = 'B_add'
    TabOrder = 2
    OnClick = B_addClick
  end
  object B_edit: TBitBtn
    Left = 783
    Top = 63
    Width = 25
    Height = 25
    Caption = 'B_edit'
    TabOrder = 3
    OnClick = B_editClick
  end
  object B_del: TBitBtn
    Left = 783
    Top = 94
    Width = 25
    Height = 25
    Caption = 'B_del'
    TabOrder = 4
  end
  object B_c_edit: TBitBtn
    Left = 663
    Top = 343
    Width = 24
    Height = 25
    Caption = 'B_c_edit'
    TabOrder = 5
    OnClick = B_c_editClick
  end
  object B_c_add: TBitBtn
    Left = 663
    Top = 312
    Width = 24
    Height = 25
    Caption = 'B_c_add'
    TabOrder = 6
    OnClick = B_c_addClick
  end
  object B_c_del: TBitBtn
    Left = 663
    Top = 374
    Width = 24
    Height = 25
    Caption = 'B_c_del'
    TabOrder = 7
    OnClick = B_c_delClick
  end
  object B_exp: TBitBtn
    Left = 783
    Top = 157
    Width = 26
    Height = 25
    Caption = 'B_exp'
    TabOrder = 8
  end
  object B_show: TBitBtn
    Left = 663
    Top = 415
    Width = 25
    Height = 25
    Caption = 'B_show'
    TabOrder = 9
    OnClick = B_showClick
  end
  object rb0: TRadioButton
    Left = 24
    Top = 8
    Width = 57
    Height = 17
    Caption = #1042#1089#1077
    Checked = True
    TabOrder = 10
    TabStop = True
    OnClick = rb0Click
  end
  object rb1: TRadioButton
    Left = 79
    Top = 8
    Width = 74
    Height = 17
    Caption = #1055#1088#1080#1093#1086#1076
    TabOrder = 11
    OnClick = rb1Click
  end
  object rb2: TRadioButton
    Left = 144
    Top = 8
    Width = 73
    Height = 17
    Caption = #1056#1072#1089#1093#1086#1076
    TabOrder = 12
    OnClick = rb2Click
  end
  object b_change: TBitBtn
    Left = 783
    Top = 216
    Width = 26
    Height = 25
    Caption = 'b_change'
    TabOrder = 13
  end
end

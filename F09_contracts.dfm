object F_contracts: TF_contracts
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 561
  ClientWidth = 821
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
    Top = 8
    Width = 752
    Height = 273
    DataSource = DM1.DS_contracts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'contract_name'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_sign'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contract_add'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1087
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_add_sign'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_one'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_two'
        Title.Alignment = taCenter
        Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_status'
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1090#1080#1074#1085#1099#1081
        Width = 80
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 287
    Width = 489
    Height = 257
    DataSource = DM1.DS_contract_price
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
        FieldName = 'price'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072', '#1088#1091#1073
        Width = 90
        Visible = True
      end>
  end
  object B_counteragents: TBitBtn
    Left = 766
    Top = 240
    Width = 34
    Height = 33
    Caption = 'B_counteragents'
    TabOrder = 2
    OnClick = B_counteragentsClick
  end
  object B_c_add: TBitBtn
    Left = 766
    Top = 8
    Width = 34
    Height = 34
    Caption = 'B_c_add'
    TabOrder = 3
    OnClick = B_c_addClick
  end
  object B_c_edit: TBitBtn
    Left = 766
    Top = 48
    Width = 33
    Height = 34
    Caption = 'B_c_edit'
    TabOrder = 4
    OnClick = B_c_editClick
  end
  object B_c_del: TBitBtn
    Left = 766
    Top = 88
    Width = 33
    Height = 34
    Caption = 'B_c_del'
    TabOrder = 5
    OnClick = B_c_delClick
  end
  object B_add: TBitBtn
    Left = 511
    Top = 287
    Width = 33
    Height = 34
    Caption = 'B_add'
    TabOrder = 6
    OnClick = B_addClick
  end
  object B_edit: TBitBtn
    Left = 511
    Top = 327
    Width = 33
    Height = 34
    Caption = 'B_edit'
    TabOrder = 7
    OnClick = B_editClick
  end
  object B_del: TBitBtn
    Left = 511
    Top = 367
    Width = 33
    Height = 34
    Caption = 'B_del'
    TabOrder = 8
    OnClick = B_delClick
  end
  object B_actions: TBitBtn
    Left = 511
    Top = 439
    Width = 33
    Height = 34
    Caption = 'B_actions'
    TabOrder = 9
    OnClick = B_actionsClick
  end
  object B_a_add: TBitBtn
    Left = 766
    Top = 144
    Width = 34
    Height = 33
    Caption = 'B_a_add'
    TabOrder = 10
    OnClick = B_a_addClick
  end
  object B_a_edit: TBitBtn
    Left = 766
    Top = 183
    Width = 33
    Height = 34
    Caption = 'B_a_edit'
    TabOrder = 11
    OnClick = B_a_editClick
  end
end

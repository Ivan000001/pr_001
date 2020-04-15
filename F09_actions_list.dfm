object F_actions_list: TF_actions_list
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090
  ClientHeight = 467
  ClientWidth = 550
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
  object B_add: TBitBtn
    Left = 485
    Top = 8
    Width = 34
    Height = 33
    Caption = 'B_add'
    TabOrder = 0
    OnClick = B_addClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 465
    Height = 441
    DataSource = DM1.DS_actions_list
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_status'
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1090#1080#1074#1085#1072
        Width = 60
        Visible = True
      end>
  end
  object B_edit: TBitBtn
    Left = 486
    Top = 48
    Width = 33
    Height = 33
    Caption = 'B_edit'
    TabOrder = 2
    OnClick = B_editClick
  end
  object B_del: TBitBtn
    Left = 486
    Top = 88
    Width = 33
    Height = 33
    Caption = 'B_del'
    TabOrder = 3
    OnClick = B_delClick
  end
end

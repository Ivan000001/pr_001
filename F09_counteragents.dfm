object F_counteragents: TF_counteragents
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
  ClientHeight = 413
  ClientWidth = 524
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
  object DBText1: TDBText
    Left = 8
    Top = 288
    Width = 465
    Height = 17
    DataField = 'name'
    DataSource = DM1.DS_counteragents
  end
  object DBText2: TDBText
    Left = 8
    Top = 312
    Width = 465
    Height = 33
    DataField = 'address'
    DataSource = DM1.DS_counteragents
    WordWrap = True
  end
  object DBText3: TDBText
    Left = 48
    Top = 351
    Width = 169
    Height = 17
    DataField = 'OKPO'
    DataSource = DM1.DS_counteragents
  end
  object DBText4: TDBText
    Left = 8
    Top = 374
    Width = 465
    Height = 17
    DataField = 'jobs_post'
    DataSource = DM1.DS_counteragents
  end
  object Label1: TLabel
    Left = 8
    Top = 352
    Width = 34
    Height = 13
    Caption = #1054#1050#1055#1054':'
  end
  object B_add: TBitBtn
    Left = 479
    Top = 8
    Width = 33
    Height = 33
    Caption = 'B_add'
    TabOrder = 0
    OnClick = B_addClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 465
    Height = 265
    DataSource = DM1.DS_counteragents
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'short_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054
        Width = 155
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_status'
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1090#1080#1074#1085#1099#1081
        Width = 115
        Visible = True
      end>
  end
  object B_edit: TBitBtn
    Left = 479
    Top = 47
    Width = 33
    Height = 34
    Caption = 'B_edit'
    TabOrder = 2
    OnClick = B_editClick
  end
  object B_del: TBitBtn
    Left = 479
    Top = 87
    Width = 33
    Height = 34
    Caption = 'B_del'
    TabOrder = 3
    OnClick = B_delClick
  end
end

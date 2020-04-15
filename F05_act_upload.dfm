object F_act_upload: TF_act_upload
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1089#1082#1072#1085' '#1072#1082#1090#1086#1074
  ClientHeight = 498
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 8
    Top = 408
    Width = 409
    Height = 17
    DataField = 'ext_path1'
    DataSource = DM1.DS_act_upload
  end
  object DBText2: TDBText
    Left = 8
    Top = 431
    Width = 413
    Height = 17
    DataField = 'ext_path2'
    DataSource = DM1.DS_act_upload
  end
  object DBText3: TDBText
    Left = 8
    Top = 454
    Width = 413
    Height = 17
    DataField = 'ext_path3'
    DataSource = DM1.DS_act_upload
  end
  object B_apply: TBitBtn
    Left = 375
    Top = 57
    Width = 25
    Height = 25
    Caption = 'B_apply'
    TabOrder = 0
    OnClick = B_applyClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 378
    Height = 305
    DataSource = DM1.DS_act_upload
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
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_sign'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 160
        Visible = True
      end>
  end
  object cb_tp: TComboBox
    Left = 24
    Top = 61
    Width = 83
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object DT_from: TDateTimePicker
    Left = 106
    Top = 34
    Width = 104
    Height = 21
    Date = 43786.882205810190000000
    Time = 43786.882205810190000000
    TabOrder = 3
  end
  object DT_to: TDateTimePicker
    Left = 106
    Top = 61
    Width = 104
    Height = 21
    Date = 43786.882241145830000000
    Time = 43786.882241145830000000
    TabOrder = 4
  end
  object E_path: TEdit
    Left = 24
    Top = 7
    Width = 345
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object B_dir: TBitBtn
    Left = 375
    Top = 8
    Width = 19
    Height = 25
    Caption = 'B_dir'
    TabOrder = 6
    OnClick = B_dirClick
  end
  object B_upload: TBitBtn
    Left = 392
    Top = 104
    Width = 25
    Height = 25
    Caption = 'B_upload'
    TabOrder = 7
    OnClick = B_uploadClick
  end
  object SB1: TStatusBar
    Left = 0
    Top = 479
    Width = 429
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object E_pu: TEdit
    Left = 208
    Top = 61
    Width = 161
    Height = 21
    TabOrder = 9
  end
end

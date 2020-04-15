object F_pu_upload: TF_pu_upload
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1081
  ClientHeight = 563
  ClientWidth = 648
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
  object cb_tp: TComboBox
    Left = 24
    Top = 12
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 591
    Height = 497
    DataSource = DM1.DS_pu_upload
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
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ext_path'
        Title.Alignment = taCenter
        Title.Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080
        Width = 367
        Visible = True
      end>
  end
  object E_path: TEdit
    Left = 208
    Top = 12
    Width = 360
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object B_Apply: TBitBtn
    Left = 605
    Top = 8
    Width = 25
    Height = 25
    Caption = 'B_Apply'
    TabOrder = 3
    OnClick = B_ApplyClick
  end
  object B_upload: TBitBtn
    Left = 605
    Top = 55
    Width = 25
    Height = 25
    Caption = 'B_upload'
    TabOrder = 4
    OnClick = B_uploadClick
  end
  object SB1: TStatusBar
    Left = 0
    Top = 544
    Width = 648
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object E_pu_sn: TEdit
    Left = 104
    Top = 12
    Width = 105
    Height = 21
    TabOrder = 6
  end
  object B_dir: TBitBtn
    Left = 573
    Top = 12
    Width = 26
    Height = 21
    Caption = 'B_dir'
    TabOrder = 7
    OnClick = B_dirClick
  end
end

object F_exp_montage: TF_exp_montage
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1084#1086#1085#1090#1072#1078#1085#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
  ClientHeight = 618
  ClientWidth = 691
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
  object B_exp_montage1: TBitBtn
    Left = 621
    Top = 25
    Width = 25
    Height = 25
    Caption = 'B_exp_montage1'
    TabOrder = 0
    OnClick = B_exp_montage1Click
  end
  object cb_tp: TComboBox
    Left = 24
    Top = 27
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object e_path: TEdit
    Left = 208
    Top = 27
    Width = 376
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object B_dir_montage: TBitBtn
    Left = 590
    Top = 25
    Width = 25
    Height = 25
    Caption = 'B_dir_montage'
    TabOrder = 3
    OnClick = B_dir_montageClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 95
    Width = 669
    Height = 497
    DataSource = DM1.DS_pu_upload
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
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
        Width = 75
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
        Width = 449
        Visible = True
      end>
  end
  object e_path_upload: TEdit
    Left = 208
    Top = 68
    Width = 368
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object B_Apply: TBitBtn
    Left = 621
    Top = 66
    Width = 25
    Height = 25
    Caption = 'B_Apply'
    TabOrder = 6
    OnClick = B_ApplyClick
  end
  object B_upload: TBitBtn
    Left = 652
    Top = 66
    Width = 25
    Height = 25
    Caption = 'B_upload'
    TabOrder = 7
    OnClick = B_uploadClick
  end
  object E_pu_sn: TEdit
    Left = 96
    Top = 68
    Width = 114
    Height = 21
    TabOrder = 8
  end
  object B_dir_upload: TBitBtn
    Left = 589
    Top = 68
    Width = 26
    Height = 21
    Caption = 'B_dir'
    TabOrder = 9
    OnClick = B_dir_uploadClick
  end
  object B_exp_montage2: TBitBtn
    Left = 654
    Top = 25
    Width = 29
    Height = 25
    Caption = 'B_exp_montage2'
    TabOrder = 10
    OnClick = B_exp_montage2Click
  end
  object sb: TStatusBar
    Left = 0
    Top = 599
    Width = 691
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end

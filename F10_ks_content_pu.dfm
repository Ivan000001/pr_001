object f_ks_content_pu: Tf_ks_content_pu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1072#1082#1088#1099#1090#1080#1077': '#1055#1059
  ClientHeight = 683
  ClientWidth = 944
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
    Left = 24
    Top = 8
    Width = 20
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 160
    Top = 8
    Width = 114
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
  end
  object Label3: TLabel
    Left = 384
    Top = 8
    Width = 38
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084'.'
  end
  object Label4: TLabel
    Left = 456
    Top = 8
    Width = 35
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086
  end
  object e_code: TEdit
    Left = 8
    Top = 27
    Width = 49
    Height = 21
    Enabled = False
    MaxLength = 3
    TabOrder = 0
  end
  object e_job: TEdit
    Left = 58
    Top = 27
    Width = 311
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object e_count: TEdit
    Left = 440
    Top = 27
    Width = 82
    Height = 21
    BiDiMode = bdLeftToRight
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 2
  end
  object e_scale: TEdit
    Left = 368
    Top = 27
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object SB: TStatusBar
    Left = 0
    Top = 664
    Width = 944
    Height = 19
    Panels = <
      item
        Width = 380
      end
      item
        Width = 50
      end
      item
        Width = 200
      end>
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 441
    Height = 594
    DataSource = DM1.DS_ks_content_pu
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
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
        FieldName = 'pu_sn_a'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088' '#1055#1059
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'model_faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name_master'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1089#1090#1077#1088
        Width = 132
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 495
    Top = 64
    Width = 443
    Height = 594
    DataSource = DM1.DS_ks_content_pu_not
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 6
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
        Title.Caption = #1053#1086#1084#1077#1088' '#1055#1059
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'model_faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name_master'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1089#1090#1077#1088
        Width = 132
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 455
    Top = 88
    Width = 34
    Height = 33
    Caption = '<-'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 455
    Top = 143
    Width = 34
    Height = 33
    Caption = '->'
    TabOrder = 8
  end
  object BitBtn3: TBitBtn
    Left = 456
    Top = 271
    Width = 33
    Height = 33
    Caption = 'BitBtn3'
    TabOrder = 9
  end
  object BitBtn4: TBitBtn
    Left = 455
    Top = 448
    Width = 34
    Height = 33
    Caption = 'BitBtn4'
    TabOrder = 10
  end
  object BitBtn5: TBitBtn
    Left = 456
    Top = 517
    Width = 33
    Height = 25
    Caption = 'BitBtn5'
    TabOrder = 11
  end
  object RG: TRadioGroup
    Left = 631
    Top = 10
    Width = 226
    Height = 38
    Columns = 3
    Ctl3D = True
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077
      '1'#1092
      '3'#1092)
    ParentCtl3D = False
    TabOrder = 12
    OnClick = RGClick
  end
end

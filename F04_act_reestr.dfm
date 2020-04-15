object F_act_reestr: TF_act_reestr
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1072#1082#1090#1086#1074
  ClientHeight = 544
  ClientWidth = 641
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
    Left = 21
    Top = 41
    Width = 76
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 68
    Width = 409
    Height = 445
    DataSource = DM1.DS_act_reestr
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
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_create'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'type_reestr'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_act_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1086#1074
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_photo_status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1082#1072#1085
        Width = 60
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 480
    Top = 68
    Width = 153
    Height = 451
    DataSource = DM1.DS_act_reestr_detail
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn_a'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 115
        Visible = True
      end>
  end
  object B_Gen: TBitBtn
    Left = 423
    Top = 68
    Width = 25
    Height = 25
    Caption = 'B_Gen'
    TabOrder = 3
    OnClick = B_GenClick
  end
  object B_Del: TBitBtn
    Left = 423
    Top = 99
    Width = 25
    Height = 25
    Caption = 'B_Del'
    TabOrder = 4
    OnClick = B_DelClick
  end
  object B_Change_status: TBitBtn
    Left = 423
    Top = 155
    Width = 25
    Height = 25
    Caption = 'B_Change_status'
    TabOrder = 5
    OnClick = B_Change_statusClick
  end
  object SB1: TStatusBar
    Left = 0
    Top = 525
    Width = 641
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitWidth = 583
  end
  object B_Apply_filter: TBitBtn
    Left = 328
    Top = 37
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 7
    OnClick = B_Apply_filterClick
  end
  object DT_to: TDateTimePicker
    Left = 88
    Top = 41
    Width = 105
    Height = 21
    Date = 43779.622188807870000000
    Time = 43779.622188807870000000
    TabOrder = 8
  end
  object DT_from: TDateTimePicker
    Left = 88
    Top = 14
    Width = 105
    Height = 21
    Date = 43779.628258182870000000
    Time = 43779.628258182870000000
    TabOrder = 9
  end
  object B_load: TBitBtn
    Left = 424
    Top = 224
    Width = 24
    Height = 25
    Caption = 'B_load'
    TabOrder = 10
    OnClick = B_loadClick
  end
  object B_mass_upload: TBitBtn
    Left = 424
    Top = 264
    Width = 24
    Height = 25
    Caption = 'B_mass_upload'
    TabOrder = 11
    OnClick = B_mass_uploadClick
  end
end

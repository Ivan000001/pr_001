object F_tp_plan: TF_tp_plan
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1058#1055
  ClientHeight = 509
  ClientWidth = 776
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
    Width = 489
    Height = 441
    DataSource = DM1.DS_tp_plan
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
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_address'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plan_1f'
        Title.Alignment = taCenter
        Title.Caption = '1'#1092
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plan_3f'
        Title.Alignment = taCenter
        Title.Caption = '3'#1092
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plan_all_pu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1042#1089#1077#1075#1086' '#1055#1059
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bpu_c'
        Title.Alignment = taCenter
        Title.Caption = #1041#1055#1059
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gw_c'
        Title.Alignment = taCenter
        Title.Caption = #1064#1083#1102#1079
        Width = 50
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 503
    Top = 134
    Width = 225
    Height = 120
    DataSource = DM1.DS_tp_plan_gw
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
        FieldName = 'gw_imei'
        Title.Alignment = taCenter
        Title.Caption = 'IMEI'
        Width = 125
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
        Width = 65
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 503
    Top = 8
    Width = 225
    Height = 120
    DataSource = DM1.DS_tp_plan_bpu
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
        FieldName = 'bpu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1041#1055#1059' '#1089'.'#1085#1086#1084#1077#1088
        Width = 125
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
        Width = 65
        Visible = True
      end>
  end
  object B_add_bpu: TBitBtn
    Left = 734
    Top = 8
    Width = 27
    Height = 25
    Caption = 'B_add_bpu'
    TabOrder = 3
    OnClick = B_add_bpuClick
  end
  object B_del_bpu: TBitBtn
    Left = 734
    Top = 39
    Width = 27
    Height = 25
    Caption = 'B_del_bpu'
    TabOrder = 4
    OnClick = B_del_bpuClick
  end
  object B_add_gw: TBitBtn
    Left = 734
    Top = 136
    Width = 27
    Height = 25
    Caption = 'B_add_gw'
    TabOrder = 5
    OnClick = B_add_gwClick
  end
  object B_del_gw: TBitBtn
    Left = 734
    Top = 167
    Width = 27
    Height = 25
    Caption = 'B_del_gw'
    TabOrder = 6
    OnClick = B_del_gwClick
  end
end

object F_gw: TF_gw
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1064#1083#1102#1079
  ClientHeight = 516
  ClientWidth = 663
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
    Width = 609
    Height = 459
    DataSource = DM1.DS_gw
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
        Width = 70
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
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'date_install'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name_master'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1089#1090#1077#1088
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gw_imei'
        Title.Alignment = taCenter
        Title.Caption = 'IMEI'
        Width = 134
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_pu_pay_status'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descr_pu_pay_metz_status'
        Title.Alignment = taCenter
        Title.Caption = #1052#1069#1058#1047
        Width = 50
        Visible = True
      end>
  end
  object rb_all: TRadioButton
    Left = 16
    Top = 8
    Width = 58
    Height = 17
    Caption = #1042#1089#1077
    TabOrder = 1
    OnClick = rb_allClick
  end
  object rb_1: TRadioButton
    Left = 80
    Top = 8
    Width = 121
    Height = 17
    Caption = #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077
    TabOrder = 2
    OnClick = rb_1Click
  end
  object rb_2: TRadioButton
    Left = 207
    Top = 9
    Width = 106
    Height = 17
    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = rb_2Click
  end
  object b_clear: TBitBtn
    Left = 623
    Top = 32
    Width = 25
    Height = 25
    Caption = 'b_clear'
    TabOrder = 4
    OnClick = b_clearClick
  end
  object B_edit: TBitBtn
    Left = 623
    Top = 64
    Width = 25
    Height = 25
    Caption = 'B_edit'
    TabOrder = 5
    OnClick = B_editClick
  end
end

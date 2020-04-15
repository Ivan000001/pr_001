object F_pu_tp_point2: TF_pu_tp_point2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050' '#1090#1086#1095#1082#1077
  ClientHeight = 401
  ClientWidth = 279
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
    Top = 16
    Width = 13
    Height = 13
    Caption = #1058#1055
  end
  object cb_tp: TComboBox
    Left = 43
    Top = 16
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 43
    Width = 265
    Height = 302
    DataSource = DM1.DS_pu_tp_point_TP
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
        FieldName = 'fider_a'
        Title.Alignment = taCenter
        Title.Caption = #1060#1080#1076#1077#1088
        Width = 38
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'opore_a'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1086#1088#1072
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'h_r'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1084' - '#1082#1074'.'
        Width = 92
        Visible = True
      end>
  end
  object B_Clear: TBitBtn
    Left = 208
    Top = 360
    Width = 25
    Height = 25
    Caption = 'B_Clear'
    TabOrder = 2
    OnClick = B_ClearClick
  end
  object B_OK: TBitBtn
    Left = 239
    Top = 360
    Width = 25
    Height = 25
    Caption = 'B_OK'
    TabOrder = 3
    OnClick = B_OKClick
  end
end

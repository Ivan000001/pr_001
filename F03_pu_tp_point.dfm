object F_pu_tp_point: TF_pu_tp_point
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1055#1059' '#1082' '#1086#1087#1086#1088#1072#1084
  ClientHeight = 430
  ClientWidth = 185
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
    Left = 8
    Top = 6
    Width = 169
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 0
  end
  object DBG_pu: TDBGrid
    Left = 8
    Top = 56
    Width = 169
    Height = 321
    DataSource = DM1.DS_pu_tp_point_SN
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBG_puDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 135
        Visible = True
      end>
  end
  object B_OK: TBitBtn
    Left = 151
    Top = 391
    Width = 26
    Height = 25
    Caption = 'B_OK'
    TabOrder = 2
    OnClick = B_OKClick
  end
  object B_Clear: TBitBtn
    Left = 118
    Top = 391
    Width = 27
    Height = 25
    Caption = 'B_Clear'
    TabOrder = 3
    OnClick = B_ClearClick
  end
  object rb0: TRadioButton
    Left = 8
    Top = 33
    Width = 53
    Height = 17
    Caption = #1042#1089#1077
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = rb0Click
  end
  object rb1: TRadioButton
    Left = 67
    Top = 33
    Width = 50
    Height = 17
    Caption = '1'#1092
    TabOrder = 5
    OnClick = rb1Click
  end
  object rb3: TRadioButton
    Left = 123
    Top = 33
    Width = 41
    Height = 17
    Caption = '3'#1092
    TabOrder = 6
    OnClick = rb3Click
  end
end

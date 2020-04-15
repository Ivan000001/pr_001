object F_act_reestr_gen: TF_act_reestr_gen
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1043#1077#1085'. '#1088#1077#1077#1089#1090#1088
  ClientHeight = 197
  ClientWidth = 133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 77
    Height = 13
    Caption = #1047#1072' '#1082#1072#1082#1086#1077' '#1095#1080#1089#1083#1086
  end
  object Label3: TLabel
    Left = 8
    Top = 100
    Width = 62
    Height = 13
    Caption = #1058#1080#1087' '#1088#1077#1077#1089#1090#1088#1072
  end
  object cb_tp: TComboBox
    Left = 16
    Top = 27
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object DT_gen: TDateTimePicker
    Left = 16
    Top = 73
    Width = 105
    Height = 21
    Date = 43786.388989745370000000
    Time = 43786.388989745370000000
    TabOrder = 1
  end
  object B_OK: TBitBtn
    Left = 98
    Top = 156
    Width = 27
    Height = 25
    Caption = 'B_OK'
    TabOrder = 2
    OnClick = B_OKClick
  end
  object cb_type_reestr: TComboBox
    Left = 16
    Top = 119
    Width = 85
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = 'A'
    Items.Strings = (
      'A'
      'B')
  end
end

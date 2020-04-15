object F_actions_list_rec: TF_actions_list_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 104
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    Left = 463
    Top = 8
    Width = 43
    Height = 13
    Caption = #1040#1082#1090#1080#1074#1085#1072
  end
  object B_OK: TBitBtn
    Left = 494
    Top = 54
    Width = 35
    Height = 33
    Caption = 'B_OK'
    TabOrder = 0
    OnClick = B_OKClick
  end
  object e_code: TEdit
    Left = 8
    Top = 27
    Width = 49
    Height = 21
    MaxLength = 3
    TabOrder = 1
    OnKeyPress = e_codeKeyPress
  end
  object e_job: TEdit
    Left = 58
    Top = 27
    Width = 311
    Height = 21
    TabOrder = 2
  end
  object cb_scale: TComboBox
    Left = 368
    Top = 27
    Width = 78
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = #1096#1090'.'
    Items.Strings = (
      #1096#1090'.'
      #1091#1089#1083#1091#1075#1072'.'
      #1082#1086#1084#1087#1083#1077#1082#1089
      #1082#1074'.'#1084'.'
      #1082#1091#1073'.'#1084'.'
      #1091#1087#1072#1082#1086#1074#1082#1072
      #1082#1086#1084#1087#1083#1077#1082#1090
      #1091#1089#1083'.'#1077#1076'.')
  end
  object cb_status: TComboBox
    Left = 447
    Top = 27
    Width = 82
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 4
    Text = #1076#1072
    Items.Strings = (
      #1085#1077#1090
      #1076#1072)
  end
end

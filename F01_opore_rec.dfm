object F_opore_rec: TF_opore_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1086#1087#1086#1088#1099
  ClientHeight = 306
  ClientWidth = 187
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
    Left = 17
    Top = 8
    Width = 13
    Height = 13
    Caption = #1058#1055
  end
  object Label2: TLabel
    Left = 17
    Top = 153
    Width = 63
    Height = 13
    Caption = #1057#1086#1089#1090'. '#1086#1087#1086#1088#1099
    WordWrap = True
  end
  object Label3: TLabel
    Left = 17
    Top = 203
    Width = 98
    Height = 13
    Caption = #1058#1080#1087' '#1074#1093'. '#1084#1072#1075#1080#1089#1090#1088#1072#1083#1080
    WordWrap = True
  end
  object Label4: TLabel
    Left = 17
    Top = 102
    Width = 32
    Height = 13
    Caption = #1054#1087#1086#1088#1072
  end
  object Label5: TLabel
    Left = 17
    Top = 54
    Width = 33
    Height = 13
    Caption = #1060#1080#1076#1077#1088
  end
  object cb_tp: TComboBox
    Left = 27
    Top = 27
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object cb_opore_state: TComboBox
    Left = 27
    Top = 176
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object cb_type_inline: TComboBox
    Left = 27
    Top = 224
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object E_opore: TEdit
    Left = 27
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = E_oporeKeyPress
  end
  object E_fider: TEdit
    Left = 27
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = E_fiderKeyPress
  end
  object B_OK: TBitBtn
    Left = 132
    Top = 265
    Width = 40
    Height = 25
    Caption = '->'
    TabOrder = 5
    OnClick = B_OKClick
  end
end

object f_counteragents_rec: Tf_counteragents_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 397
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 124
    Height = 13
    Caption = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 208
    Top = 5
    Width = 112
    Height = 13
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 50
    Height = 13
    Caption = #1070#1088'.'#1072#1076#1088#1077#1089
  end
  object Label4: TLabel
    Left = 8
    Top = 93
    Width = 30
    Height = 13
    Caption = #1054#1050#1055#1054
  end
  object Label5: TLabel
    Left = 208
    Top = 93
    Width = 88
    Height = 13
    Caption = #1040#1082#1090#1080#1074#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
  end
  object Label6: TLabel
    Left = 8
    Top = 139
    Width = 70
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
  end
  object Label7: TLabel
    Left = 207
    Top = 139
    Width = 57
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object e_short: TEdit
    Left = 16
    Top = 24
    Width = 185
    Height = 21
    MaxLength = 20
    TabOrder = 0
  end
  object e_name: TEdit
    Left = 216
    Top = 24
    Width = 404
    Height = 21
    MaxLength = 150
    TabOrder = 1
  end
  object e_address: TEdit
    Left = 16
    Top = 70
    Width = 820
    Height = 21
    MaxLength = 250
    TabOrder = 2
  end
  object B_OK: TBitBtn
    Left = 806
    Top = 340
    Width = 33
    Height = 33
    Caption = 'B_OK'
    TabOrder = 3
    OnClick = B_OKClick
  end
  object e_OKPO: TEdit
    Left = 16
    Top = 112
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 4
    OnKeyPress = e_OKPOKeyPress
  end
  object cb_status: TComboBox
    Left = 216
    Top = 112
    Width = 89
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      #1076#1072)
  end
  object e_fio: TEdit
    Left = 16
    Top = 158
    Width = 177
    Height = 21
    TabOrder = 6
  end
  object e_jobs_post: TEdit
    Left = 216
    Top = 158
    Width = 404
    Height = 21
    TabOrder = 7
  end
end

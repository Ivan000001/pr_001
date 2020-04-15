object F_ks_content_rec: TF_ks_content_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1057' '#1088#1072#1073#1086#1090#1099': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 104
  ClientWidth = 726
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
  object Label5: TLabel
    Left = 528
    Top = 8
    Width = 55
    Height = 13
    Caption = #1062#1077#1085#1072', '#1088#1091#1073'.'
  end
  object Label6: TLabel
    Left = 609
    Top = 8
    Width = 60
    Height = 13
    Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
  end
  object l_id_action: TLabel
    Left = 144
    Top = 72
    Width = 3
    Height = 13
    Visible = False
  end
  object B_OK: TBitBtn
    Left = 650
    Top = 67
    Width = 33
    Height = 25
    Caption = 'B_OK'
    TabOrder = 2
    OnClick = B_OKClick
  end
  object B_show: TBitBtn
    Left = 689
    Top = 25
    Width = 25
    Height = 25
    Caption = 'B_show'
    TabOrder = 1
    OnClick = B_showClick
  end
  object e_code: TEdit
    Left = 8
    Top = 27
    Width = 49
    Height = 21
    Enabled = False
    MaxLength = 3
    TabOrder = 3
  end
  object e_job: TEdit
    Left = 58
    Top = 27
    Width = 311
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object e_count: TEdit
    Left = 440
    Top = 27
    Width = 82
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 5
    OnExit = e_countExit
    OnKeyPress = e_countKeyPress
  end
  object e_price: TEdit
    Left = 520
    Top = 27
    Width = 83
    Height = 21
    BiDiMode = bdRightToLeft
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 0
  end
  object e_sum_price: TEdit
    Left = 600
    Top = 27
    Width = 83
    Height = 21
    BiDiMode = bdRightToLeft
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 6
  end
  object e_scale: TEdit
    Left = 368
    Top = 27
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 7
  end
end

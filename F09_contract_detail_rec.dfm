object F_contract_detail_rec: TF_contract_detail_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090': '#1044#1072#1085#1085#1099#1077
  ClientHeight = 118
  ClientWidth = 597
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
    Left = 468
    Top = 8
    Width = 55
    Height = 13
    Caption = #1062#1077#1085#1072', '#1088#1091#1073'.'
  end
  object Label2: TLabel
    Left = 24
    Top = 8
    Width = 20
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label3: TLabel
    Left = 160
    Top = 8
    Width = 114
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
  end
  object Label4: TLabel
    Left = 392
    Top = 8
    Width = 38
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084'.'
  end
  object l_select_id: TLabel
    Left = 120
    Top = 72
    Width = 3
    Height = 13
    Visible = False
  end
  object e_price: TEdit
    Left = 447
    Top = 27
    Width = 98
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = e_priceKeyPress
  end
  object B_OK: TBitBtn
    Left = 506
    Top = 72
    Width = 32
    Height = 30
    Caption = 'B_OK'
    TabOrder = 1
    OnClick = B_OKClick
  end
  object B_show: TBitBtn
    Left = 551
    Top = 24
    Width = 26
    Height = 28
    Caption = 'B_show'
    TabOrder = 2
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
  object e_scale: TEdit
    Left = 368
    Top = 27
    Width = 78
    Height = 21
    Enabled = False
    TabOrder = 5
  end
end

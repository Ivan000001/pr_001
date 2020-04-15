object F_exp_not_sign: TF_exp_not_sign
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1073#1077#1079' '#1072#1082#1090#1086#1074
  ClientHeight = 153
  ClientWidth = 389
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
  object cb_tp: TComboBox
    Left = 24
    Top = 27
    Width = 110
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object E_path: TEdit
    Left = 24
    Top = 67
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object b_dir: TBitBtn
    Left = 335
    Top = 65
    Width = 26
    Height = 25
    Caption = 'b_dir'
    TabOrder = 2
    OnClick = b_dirClick
  end
  object B_OK: TBitBtn
    Left = 335
    Top = 107
    Width = 25
    Height = 25
    Caption = 'B_OK'
    TabOrder = 3
    OnClick = B_OKClick
  end
end

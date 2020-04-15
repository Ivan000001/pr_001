object F_act_reestr_img: TF_act_reestr_img
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1082#1072#1085' '#1088#1077#1077#1089#1090#1088#1072
  ClientHeight = 621
  ClientWidth = 843
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
  object SB: TScrollBox
    Left = 0
    Top = 41
    Width = 843
    Height = 513
    Align = alTop
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 839
      Height = 509
      Align = alClient
      Proportional = True
      ExplicitLeft = 88
      ExplicitTop = 32
      ExplicitWidth = 81
      ExplicitHeight = 73
    end
  end
  object B_load: TBitBtn
    Left = 392
    Top = 574
    Width = 25
    Height = 25
    Caption = 'B_load'
    TabOrder = 1
    OnClick = B_loadClick
  end
  object B_clear: TBitBtn
    Left = 423
    Top = 574
    Width = 25
    Height = 25
    Caption = 'B_clear'
    TabOrder = 2
    OnClick = B_clearClick
  end
  object B_save: TBitBtn
    Left = 454
    Top = 574
    Width = 25
    Height = 25
    Caption = 'B_save'
    TabOrder = 3
  end
  object B_OK: TBitBtn
    Left = 784
    Top = 580
    Width = 33
    Height = 33
    Caption = 'B_OK'
    TabOrder = 4
    OnClick = B_OKClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 41
    Align = alTop
    TabOrder = 5
    ExplicitLeft = 240
    ExplicitTop = 8
    ExplicitWidth = 185
    object DBText1: TDBText
      Left = 16
      Top = 14
      Width = 65
      Height = 17
      DataField = 'tp_name'
      DataSource = DM1.DS_act_reestr
    end
    object DBText2: TDBText
      Left = 104
      Top = 14
      Width = 81
      Height = 17
      DataField = 'date_create'
      DataSource = DM1.DS_act_reestr
    end
    object DBText3: TDBText
      Left = 217
      Top = 14
      Width = 65
      Height = 17
      DataField = 'type_reestr'
      DataSource = DM1.DS_act_reestr
    end
    object DBText4: TDBText
      Left = 304
      Top = 14
      Width = 65
      Height = 17
      DataField = 'descr_act_status'
      DataSource = DM1.DS_act_reestr
    end
  end
  object OPD1: TOpenPictureDialog
    Filter = 'All pictures|*.jpg;*.jpeg;*.bmp;*.png;'
    Left = 584
    Top = 568
  end
end

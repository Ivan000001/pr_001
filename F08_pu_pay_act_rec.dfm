object F_pu_pay_act_rec: TF_pu_pay_act_rec
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1072#1082#1090#1072' '#1085#1072' '#1086#1087#1083#1072#1090#1091' '#1055#1059
  ClientHeight = 504
  ClientWidth = 651
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
  object E_doc: TEdit
    Left = 24
    Top = 18
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 446
    Width = 25
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DT_create: TDateTimePicker
    Left = 168
    Top = 18
    Width = 121
    Height = 21
    Date = 43810.462602662040000000
    Time = 43810.462602662040000000
    TabOrder = 2
  end
  object B_apply: TBitBtn
    Left = 584
    Top = 24
    Width = 25
    Height = 25
    Caption = 'B_apply'
    TabOrder = 3
    OnClick = B_applyClick
  end
  object DBG2: TDBGrid
    Left = 352
    Top = 55
    Width = 281
    Height = 379
    DataSource = DM1.DS_pu_pay_not_list
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'model_faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 113
        Visible = True
      end>
  end
  object DBG1: TDBGrid
    Left = 24
    Top = 55
    Width = 273
    Height = 378
    DataSource = DM1.DS_pu_pay_RAM
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tp_name'
        Title.Alignment = taCenter
        Title.Caption = #1058#1055
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faze'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1079#1085#1086#1089#1090#1100
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pu_sn'
        Title.Alignment = taCenter
        Title.Caption = #1055#1059
        Width = 97
        Visible = True
      end>
  end
  object B_left: TBitBtn
    Left = 312
    Top = 96
    Width = 25
    Height = 25
    Caption = 'B_left'
    TabOrder = 6
    OnClick = B_leftClick
  end
  object B_Del: TBitBtn
    Left = 312
    Top = 152
    Width = 25
    Height = 25
    Caption = 'B_Del'
    TabOrder = 7
    OnClick = B_DelClick
  end
  object r0: TRadioButton
    Left = 352
    Top = 32
    Width = 65
    Height = 17
    Caption = #1042#1089#1077
    Checked = True
    TabOrder = 8
    TabStop = True
    OnClick = r0Click
  end
  object r1: TRadioButton
    Left = 423
    Top = 32
    Width = 58
    Height = 17
    Caption = '1 '#1092
    TabOrder = 9
    OnClick = r1Click
  end
  object r3: TRadioButton
    Left = 495
    Top = 32
    Width = 50
    Height = 17
    Caption = '3 '#1092
    TabOrder = 10
    OnClick = r3Click
  end
  object SB1: TStatusBar
    Left = 0
    Top = 485
    Width = 651
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
end

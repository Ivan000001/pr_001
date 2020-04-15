object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 491
  ClientWidth = 859
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
    Left = 8
    Top = 19
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object B_Apply_filter01: TBitBtn
    Left = 231
    Top = 14
    Width = 33
    Height = 25
    Caption = '>'
    TabOrder = 1
  end
  object B_New_tp: TBitBtn
    Left = 263
    Top = 14
    Width = 33
    Height = 25
    Caption = '*'
    TabOrder = 2
  end
  object DB_tp_list: TDBGrid
    Left = 8
    Top = 56
    Width = 545
    Height = 393
    DataSource = DM1.DS_tp_list
    TabOrder = 3
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
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'opore'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fider'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr_opore_state'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr_type_inline'
        Visible = True
      end>
  end
  object DB_tp_point: TDBGrid
    Left = 648
    Top = 56
    Width = 203
    Height = 153
    DataSource = DM1.DS_tp_point
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end

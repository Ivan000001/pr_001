unit F01_tp_point;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_tp_point = class(TForm)
    Label1: TLabel;
    E_house: TEdit;
    Label2: TLabel;
    E_room: TEdit;
    Label3: TLabel;
    cb_vvod: TComboBox;
    Label4: TLabel;
    cb_type_outline: TComboBox;
    E_pu: TEdit;
    Label5: TLabel;
    B_list_pu: TBitBtn;
    B_OK: TBitBtn;
    Label6: TLabel;
    E_act: TEdit;
    Label7: TLabel;
    E_faze: TEdit;
    cb_street: TComboBox;
    Label8: TLabel;
    e_y_id: TEdit;
    Label9: TLabel;
    procedure E_fazeKeyPress(Sender: TObject; var Key: Char);
    procedure B_list_puClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_tp_point: TF_tp_point;

implementation
uses DM, F03_pu_tp_point;

{$R *.dfm}

function get_null_int(in_:string):string;
begin
//пустые убрать пробелы если етсь - можно рекурсией
  if in_='' then result:='null' else result:=in_;
end;

//ненужна чтоли?
function get_null_str(in_:string):string;
begin
//нужна проверка на последний пробулы в конце - можно рекурсией
  if in_='' then result:='null' else result:=in_;
end;

procedure TF_tp_point.B_list_puClick(Sender: TObject);
begin
  e_pu.Text:=f_pu_tp_point.get_sn_show_pu_tp_point(dm1.ZQ_tp_map.FieldByName('id_tp_a').AsInteger,e_pu.Text,e_faze.text);
end;

procedure TF_tp_point.B_OKClick(Sender: TObject);
begin
//проверки
    if e_faze.Text<>'' then
      begin
        if f_tp_point.Tag=0 then
          begin
      //new
            dm1.ZQ_tp_map_TMP.SQL.Text:='insert into tp_map_point (id_tp_a,fider_a,opore_a,faze,house,room,id_vvod_a,id_type_outline_a,' +
                                  'pu_sn_a,id_street_a,y_id_tp_point) values ('+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+','+dm1.ZQ_tp_map.FieldByName('fider').AsString+
                                  ',"'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'",'+e_faze.Text+',"'+e_house.Text+'",'+get_null_int(e_room.Text)+','+
                                  inttostr(integer(cb_vvod.Items.Objects[cb_vvod.ItemIndex]))+','+inttostr(integer(cb_type_outline.Items.Objects[cb_type_outline.ItemIndex]))+',"'+
                                  e_pu.Text+'",'+inttostr(integer(cb_street.Items.Objects[cb_street.ItemIndex]))+',"'+e_y_id.Text+'");';
            dm1.ZQ_tp_map_TMP.ExecSQL();
            if e_pu.Text<>'' then
              begin
                dm1.ZQ_tp_map_TMP.SQL.Text:='update pu set id_tp_point_a=LAST_INSERT_ID() where pu.pu_sn="'+e_pu.Text+'";';
                dm1.ZQ_tp_map_TMP.ExecSQL();
              end;
          end
        else
          begin
      //edit
            dm1.ZQ_tp_map_TMP.SQL.Text:='update tp_map_point set house="'+e_house.Text+'",room='+get_null_int(e_room.Text)+', id_vvod_a='+
              inttostr(integer(cb_vvod.Items.Objects[cb_vvod.ItemIndex]))+',faze='+e_faze.Text+', id_type_outline_a='+inttostr(integer(cb_type_outline.Items.Objects[cb_type_outline.ItemIndex]))+
              ', pu_sn_a="'+e_pu.Text+'",id_street_a='+inttostr(integer(cb_street.Items.Objects[cb_street.ItemIndex]))+',y_id_tp_point="'+e_y_id.Text+'" where id_tp_point='+dm1.ZQ_tp_point.FieldByName('id_tp_point').AsString+';';
            dm1.ZQ_tp_map_TMP.ExecSQL();
            dm1.ZQ_tp_map_TMP.SQL.Text:='update pu set id_tp_point_a=null where pu.pu_sn="'+dm1.ZQ_tp_point.FieldByName('pu_sn_a').AsString+'";';
            dm1.ZQ_tp_map_TMP.ExecSQL();
            if e_pu.Text<>'' then
              begin
                dm1.ZQ_tp_map_TMP.SQL.Text:='update pu set id_tp_point_a='+dm1.ZQ_tp_point.FieldByName('id_tp_point').AsString+' where pu.pu_sn="'+e_pu.Text+'";';
                dm1.ZQ_tp_map_TMP.ExecSQL();
              end
          end;
        dm1.ZQ_tp_map_TMP.Close();
        dm1.ZQ_tp_map_TMP.SQL.Clear();
        dm1.ZQ_tp_point.Refresh();
        Close();
      end
    else
      showmessage('ПУСТО');
end;

procedure TF_tp_point.E_fazeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'1','3' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

end.

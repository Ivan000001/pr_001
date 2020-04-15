unit F01_opore_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_opore_rec = class(TForm)
    Label1: TLabel;
    cb_tp: TComboBox;
    cb_opore_state: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cb_type_inline: TComboBox;
    Label4: TLabel;
    E_opore: TEdit;
    Label5: TLabel;
    E_fider: TEdit;
    B_OK: TBitBtn;
    procedure E_fiderKeyPress(Sender: TObject; var Key: Char);
    procedure E_oporeKeyPress(Sender: TObject; var Key: Char);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_opore_rec: TF_opore_rec;

implementation
uses DM;
{$R *.dfm}

procedure TF_opore_rec.B_OKClick(Sender: TObject);
var re:integer;
begin
  if (e_fider.Text<>'') and (e_opore.Text<>'') then
    begin
      //проверка на дубляж опоры на фидере
      dm1.ZQ_tp_map_TMP.SQL.Clear();
      dm1.ZQ_tp_map_TMP.SQL.Text:='select id_tp_a,fider,opore from tp_map where id_tp_a='+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+
        ' and fider='+e_fider.Text+' and opore="'+e_opore.Text+'";';
      dm1.ZQ_tp_map_TMP.Open();

      if dm1.ZQ_tp_map_TMP.RecordCount=0 then
        begin
          dm1.ZQ_tp_map_TMP.SQL.Clear();
          if f_opore_rec.Tag=0 then
            begin
              dm1.ZQ_tp_map_TMP.SQL.Text:='insert into tp_map (id_tp_a,fider,opore,id_opore_state_a,id_type_inline_a) values ('+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+','+
                e_fider.text+',"'+e_opore.text+'",'+inttostr(integer(cb_opore_state.Items.Objects[cb_opore_state.ItemIndex]))+','+
                inttostr(integer(cb_type_inline.Items.Objects[cb_type_inline.ItemIndex]))+'); ';
              dm1.ZQ_tp_map_TMP.ExecSQL();
            end
          else
            begin
        //проверка на совпадение записей по трем условия не должно
        //либо на базу возложить
          //detail
              dm1.ZQ_tp_map_TMP.SQL.Text:='update tp_map_point set id_tp_a='+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+','+
                'opore_a="'+e_opore.Text+'", fider_a='+e_fider.Text+' '+
                ' where id_tp_a='+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+' and opore_a="'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'" and fider_a='+
                dm1.ZQ_tp_map.FieldByName('fider').AsString+';';
              dm1.ZQ_tp_map_TMP.ExecSQL();
          //master
              re:=dm1.ZQ_tp_map.RecNo;
              dm1.ZQ_tp_map_TMP.SQL.Text:='update tp_map set id_tp_a='+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+','+
                'opore="'+e_opore.Text+'", fider='+e_fider.Text+', id_opore_state_a='+inttostr(integer(cb_opore_state.Items.Objects[cb_opore_state.ItemIndex]))+
                ',id_type_inline_a='+inttostr(integer(cb_type_inline.Items.Objects[cb_type_inline.ItemIndex]))+' '+
                ' where id_tp_a='+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+' and opore="'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'" and fider='+
                dm1.ZQ_tp_map.FieldByName('fider').AsString+';';
              dm1.ZQ_tp_map_TMP.ExecSQL();
              dm1.ZQ_tp_map.RecNo:=re;
            end;
          dm1.ZQ_tp_map_TMP.Close();
          dm1.ZQ_tp_map.Refresh();
        end
      else
        showmessage('НИХЕРА! Такая опора уже есть!');
    end
  else
    showmessage('ПУСТО');
  close;
end;

procedure TF_opore_rec.E_fiderKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_opore_rec.E_oporeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9','.' :  ; // цифры и <Back Space>
    ',' : Key:='.'
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

end.

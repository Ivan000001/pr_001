unit F01_tp_map;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_tp_map = class(TForm)
    cb_tp: TComboBox;
    Label1: TLabel;
    B_Apply_filter01: TBitBtn;
    B_list_tp: TBitBtn;
    DG_tp_list: TDBGrid;
    DG_tp_point: TDBGrid;
    B_Add_opore: TBitBtn;
    B_Del_opore: TBitBtn;
    B_Edit_opore: TBitBtn;
    B_Add_point: TBitBtn;
    B_Del_point: TBitBtn;
    B_Edit_point: TBitBtn;
    B_tp_imp: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Del_pointClick(Sender: TObject);
    procedure B_Edit_pointClick(Sender: TObject);
    procedure B_Add_pointClick(Sender: TObject);
    procedure B_Del_oporeClick(Sender: TObject);
    procedure B_Edit_oporeClick(Sender: TObject);
    procedure B_Add_oporeClick(Sender: TObject);
    procedure B_list_tpClick(Sender: TObject);
    procedure B_Apply_filter01Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_tp_map: TF_tp_map;

implementation
uses DM, lib_cb, F01_tp, F01_opore_rec, F01_tp_point;
{$R *.dfm}


procedure pre_show_opore_rec;
begin
  get_list_cb_tp(f_opore_rec.cb_tp);
  get_list_cb_opore_state(f_opore_rec.cb_opore_state);
  get_list_cb_type_inline(f_opore_rec.cb_type_inline);
end;

procedure pre_show_point_rec;
begin
  get_list_cb_street(f_tp_point.cb_street,dm1.ZQ_tp_map.FindField('id_tp_a').AsInteger);
  get_list_cb_type_outline(f_tp_point.cb_type_outline);
  get_list_cb_list_vvod(f_tp_point.cb_vvod);
end;

procedure TF_tp_map.B_Apply_filter01Click(Sender: TObject);
begin
  dm1.ZQ_tp_map.Close();
  dm1.ZQ_tp_map.ParamByName('p_tp').AsInteger:=integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_tp_map.Open();
end;

procedure TF_tp_map.B_Add_oporeClick(Sender: TObject);
begin
  f_opore_rec.Tag:=0;
  pre_show_opore_rec();
  f_opore_rec.cb_tp.ItemIndex:=cb_tp.ItemIndex;
  f_opore_rec.E_fider.Text:='';
  f_opore_rec.E_opore.Text:='';
  f_opore_rec.showmodal();
end;

procedure TF_tp_map.B_Edit_oporeClick(Sender: TObject);
begin
  if dm1.ZQ_tp_map.RecordCount>0 then
    begin
      f_opore_rec.Tag:=1;
      pre_show_opore_rec();
      f_opore_rec.cb_tp.ItemIndex:= f_opore_rec.cb_tp.Items.IndexOfObject(tobject(dm1.ZQ_tp_map.FieldByName('id_tp_a').AsInteger));
      f_opore_rec.E_fider.Text:=dm1.ZQ_tp_map.FieldByName('fider').AsString;
      f_opore_rec.e_opore.Text:=dm1.ZQ_tp_map.FieldByName('opore').AsString;
      f_opore_rec.cb_opore_state.ItemIndex:= f_opore_rec.cb_opore_state.Items.IndexOfObject(tobject(dm1.ZQ_tp_map.FieldByName('id_opore_state_a').AsInteger));
      f_opore_rec.cb_type_inline.ItemIndex:= f_opore_rec.cb_type_inline.Items.IndexOfObject(tobject(dm1.ZQ_tp_map.FieldByName('id_type_inline_a').AsInteger));
      f_opore_rec.ShowModal();
    end;
end;

procedure TF_tp_map.B_Del_oporeClick(Sender: TObject);
//var re:integer;
begin
  if dm1.ZQ_tp_map.RecordCount>0 then
    begin
//      re:=dm1.ZQ_tp_map.RecNo;
  //удаление detail

      dm1.ZQ_tp_map_TMP.SQL.Text:='update pu left join tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_point_a set id_tp_point_a=null '+
        ' where tp_map_point.id_tp_a='+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+' and tp_map_point.opore_a="'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'" and tp_map_point.fider_a='+
        dm1.ZQ_tp_map.FieldByName('fider').AsString+';';
      dm1.ZQ_tp_map_TMP.ExecSQL();
      dm1.ZQ_tp_map_TMP.SQL.Text:='delete from tp_map_point '+
        ' where id_tp_a='+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+' and opore_a="'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'" and fider_a='+
        dm1.ZQ_tp_map.FieldByName('fider').AsString+';';
      dm1.ZQ_tp_map_TMP.ExecSQL();
      dm1.ZQ_tp_map_TMP.SQL.Text:='delete from tp_map '+
        ' where id_tp_a='+dm1.ZQ_tp_map.FieldByName('id_tp_a').AsString+' and opore="'+dm1.ZQ_tp_map.FieldByName('opore').AsString+'" and fider='+
        dm1.ZQ_tp_map.FieldByName('fider').AsString+';';
      dm1.ZQ_tp_map_TMP.ExecSQL();
      dm1.ZQ_tp_map.Refresh();
//cursor не критично
//  if re-1=0 then dm1.ZQ_tp_map.First() else
//  dm1.ZQ_tp_map_TMP.RecNo:=re-1;
    end;
end;

procedure TF_tp_map.B_Del_pointClick(Sender: TObject);
begin
  if dm1.ZQ_tp_point.RecordCount>0 then
    begin
      dm1.ZQ_tp_map_TMP.SQL.Text:='update pu set id_tp_point_a=null '+
        ' where id_tp_point_a='+dm1.ZQ_tp_point.FindField('id_tp_point').AsString+';';
      dm1.ZQ_tp_map_TMP.ExecSQL();
      dm1.ZQ_tp_map_TMP.SQL.Text:='delete from tp_map_point '+
        ' where id_tp_point='+dm1.ZQ_tp_point.FindField('id_tp_point').AsString+';';
      dm1.ZQ_tp_map_TMP.ExecSQL();
      dm1.ZQ_tp_point.Refresh();
    end;
end;

procedure TF_tp_map.B_Add_pointClick(Sender: TObject);
begin
  if dm1.ZQ_tp_map.RecordCount>0 then
    begin
      f_tp_point.Tag:=0;
      pre_show_point_rec();
      f_tp_point.E_house.Text:='';
      f_tp_point.E_room.Text:='';
      f_tp_point.E_faze.Text:='';
      f_tp_point.E_pu.Text:='';
      f_tp_point.E_act.Text:='';
      f_tp_point.e_y_id.Text:='';
      f_tp_point.showmodal();
    end;
end;

procedure TF_tp_map.B_Edit_pointClick(Sender: TObject);
begin
  if dm1.ZQ_tp_point.RecordCount>0 then
    begin
      f_tp_point.Tag:=1;
      pre_show_point_rec();
      f_tp_point.cb_street.ItemIndex:=f_tp_point.cb_street.Items.IndexOfObject(tobject(dm1.ZQ_tp_point.FieldByName('id_street_a').AsInteger));
      f_tp_point.E_house.Text:=dm1.ZQ_tp_point.FieldByName('house').AsString;
      f_tp_point.E_room.Text:=dm1.ZQ_tp_point.FieldByName('room').AsString;
      f_tp_point.E_faze.Text:=dm1.ZQ_tp_point.FieldByName('faze').AsString;
      f_tp_point.cb_vvod.ItemIndex:= f_tp_point.cb_vvod.Items.IndexOfObject(tobject(dm1.ZQ_tp_point.FieldByName('id_vvod_a').AsInteger));
      f_tp_point.cb_type_outline.ItemIndex:= f_tp_point.cb_type_outline.Items.IndexOfObject(tobject(dm1.ZQ_tp_point.FieldByName('id_type_outline_a').AsInteger));
      f_tp_point.E_pu.Text:=dm1.ZQ_tp_point.FieldByName('pu_sn_a').AsString;
      f_tp_point.E_act.Text:=dm1.ZQ_tp_point.FieldByName('descr_act_status').AsString;
      f_tp_point.e_y_id.Text:=dm1.ZQ_tp_point.FieldByName('y_id_tp_point').AsString;
      f_tp_point.ShowModal();
    end;
end;

procedure TF_tp_map.B_list_tpClick(Sender: TObject);
begin
  dm1.ZT_tp.Active:=true;
  dm1.ZT_street.Active:=true;
  F_tp.showmodal();
end;

procedure TF_tp_map.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_tp_map.Close();
  dm1.ZQ_tp_point.Close();
end;

procedure TF_tp_map.FormShow(Sender: TObject);
begin
  get_list_cb_tp(cb_tp);
end;

end.

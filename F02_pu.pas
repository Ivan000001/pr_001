unit F02_pu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DBCtrls,jpeg;

type
  TF_pu = class(TForm)
    DBGrid1: TDBGrid;
    DT_to: TDateTimePicker;
    B_Apply_filter: TBitBtn;
    cb_pu_model: TComboBox;
    cb_brig: TComboBox;
    cb_photo_status: TComboBox;
    cb_pu_pay_status: TComboBox;
    E_fider: TEdit;
    E_opore: TEdit;
    E_pu_sn: TEdit;
    E_plomb: TEdit;
    E_act: TEdit;
    cb_tp: TComboBox;
    DT_from: TDateTimePicker;
    SB1: TStatusBar;
    B_Add_pu: TBitBtn;
    B_Del_pu: TBitBtn;
    B_Edit_pu: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Del_puClick(Sender: TObject);
    procedure B_Edit_puClick(Sender: TObject);
    procedure B_Add_puClick(Sender: TObject);
    procedure B_Apply_filterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure reload_cb_all;
    procedure clear_edit_all;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu: TF_pu;

implementation
uses DM, lib_cb, F02_pu_rec;

{$R *.dfm}

procedure pre_show_pu_rec;
begin
  get_list_cb_tp(f_pu_rec.cb_tp);
  get_list_cb_model_all(f_pu_rec.cb_model);
  get_list_cb_brig_all(f_pu_rec.cb_brig);
  get_list_cb_pu_photo_status(f_pu_rec.cb_photo_status);
  get_list_cb_pu_pay_status(f_pu_rec.cb_pay_status);
end;

procedure TF_pu.B_Add_puClick(Sender: TObject);
begin
//if dm1. then

  f_pu_rec.Tag:=0;
  pre_show_pu_rec();
  f_pu_rec.E_fider.Text:='';
  f_pu_rec.E_opore.Text:='';
  f_pu_rec.l_tp_point.caption:='';
  f_pu_rec.E_pu_sn.Text:='';
  f_pu_rec.E_pu_sn.Enabled:=true;
  f_pu_rec.E_plomb.Text:='';
  f_pu_rec.DT_install.Date:=DT_to.Date;
  f_pu_rec.E_act.Text:='';
  f_pu_rec.cb_tp.ItemIndex:=f_pu_rec.cb_tp.Items.IndexOfObject(tobject(Integer(cb_tp.Items.Objects[cb_tp.ItemIndex])));
  f_pu_rec.cb_model.ItemIndex:=cb_pu_model.ItemIndex;
  f_pu_rec.cb_brig.ItemIndex:=cb_brig.ItemIndex;
  f_pu_rec.Image1.Picture.Graphic:=nil;
  f_pu_rec.showmodal();
 // B_Apply_filter.Click();
end;

procedure TF_pu.B_Apply_filterClick(Sender: TObject);
begin
  dm1.ZQ_pu.Close();
  dm1.ZQ_pu.ParamByName('p_sn').AsString:='%%'+e_pu_sn.Text+'%%';
  dm1.ZQ_pu.ParamByName('p_id_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
 // dm1.ZQ_pu.ParamByName('p_fider').AsString:='%%'+e_fider.Text+'%%';
 // dm1.ZQ_pu.ParamByName('p_opore').AsString:='%%'+e_opore.Text+'%%';
  dm1.ZQ_pu.ParamByName('p_id_model').AsInteger:=Integer(cb_pu_model.Items.Objects[cb_pu_model.ItemIndex]);
  dm1.ZQ_pu.ParamByName('p_plomb').AsString:='%%'+E_plomb.Text+'%%';
  dm1.ZQ_pu.ParamByName('p_id_brig').AsInteger:=Integer(cb_brig.Items.Objects[cb_brig.ItemIndex]);
  dm1.ZQ_pu.ParamByName('p_datefrom').AsDate:=DT_from.Date;
  dm1.ZQ_pu.ParamByName('p_dateto').AsDate:=DT_to.Date;
  dm1.ZQ_pu.ParamByName('p_status_photo').AsInteger:=Integer(cb_photo_status.Items.Objects[cb_photo_status.ItemIndex]);
//  dm1.ZQ_pu.ParamByName('p_act_status').AsInteger:=Integer(cb_act.Items.Objects[cb_act.ItemIndex]);
  dm1.ZQ_pu.ParamByName('p_pay_status').AsInteger:=Integer(cb_pu_pay_status.Items.Objects[cb_pu_pay_status.ItemIndex]);
  dm1.ZQ_pu.open();
  sb1.Panels[0].Text:=inttostr(dm1.ZQ_pu.RecordCount)+' зап.';

end;

procedure TF_pu.B_Del_puClick(Sender: TObject);
begin
  //удаление нет реализации
  //удалить из оплаты пу
  //удалить из оплаты атов
  //удалить из реестра актов
  //удалить из точки тп
end;

procedure TF_pu.B_Edit_puClick(Sender: TObject);
var jpg:TJPEGImage;
begin
  if dm1.ZQ_pu.RecordCount>0 then
    begin
      f_pu_rec.Tag:=1;
      pre_show_pu_rec();
      f_pu_rec.cb_tp.ItemIndex:=f_pu_rec.CB_tp.Items.IndexOfObject(tobject(dm1.ZQ_pu.FieldByName('id_tp_a').AsInteger));
      f_pu_rec.E_fider.Text:=dm1.ZQ_pu.FieldByName('fider_a').AsString;
      f_pu_rec.E_opore.Text:=dm1.ZQ_pu.FieldByName('opore_a').AsString;
      f_pu_rec.l_tp_point.caption:=dm1.ZQ_pu.FieldByName('id_tp_point_a').AsString;
      f_pu_rec.cb_model.ItemIndex:=f_pu_rec.cb_model.Items.IndexOfObject(tobject(dm1.ZQ_pu.FieldByName('id_pu_model_a').AsInteger));
      f_pu_rec.E_pu_sn.Text:=dm1.ZQ_pu.FieldByName('pu_sn').AsString;
      f_pu_rec.E_pu_sn.Enabled:=false;
      f_pu_rec.E_plomb.Text:=dm1.ZQ_pu.FieldByName('pu_plomb').AsString;
      f_pu_rec.DT_install.Date:=dm1.ZQ_pu.FieldByName('date_install').AsDateTime;
      f_pu_rec.cb_brig.ItemIndex:=f_pu_rec.cb_brig.Items.IndexOfObject(tobject(dm1.ZQ_pu.FieldByName('id_brig_a').AsInteger));
      f_pu_rec.E_act.Text:=dm1.ZQ_pu.FieldByName('descr_act_status').AsString;
      f_pu_rec.cb_photo_status.ItemIndex:=f_pu_rec.cb_photo_status.Items.IndexOfObject(tobject(dm1.ZQ_pu.FieldByName('id_photo_status_a').AsInteger));
      f_pu_rec.cb_pay_status.ItemIndex:=f_pu_rec.cb_pay_status.Items.IndexOfObject(tobject(dm1.ZQ_pu.FieldByName('id_pu_pay_status_a').AsInteger));

      f_pu_rec.l_tp_point.Caption:=dm1.ZQ_pu.FieldByName('id_tp_point_a').AsString;

      dm1.ZQ_pu_TMP.SQL.Text:='select pu_image from pu_photo where pu_sn_a="'+dm1.ZQ_pu.FieldByName('pu_sn').AsString+'";';
      dm1.ZQ_pu_TMP.Open();
        if not(dm1.ZQ_pu_TMP.FieldByName('pu_image').IsNull) then
          try
            F_pu_rec.image1.Picture.Assign(dm1.ZQ_pu_TMP.FieldByName('pu_image'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_pu_TMP.FieldByName('pu_image'));
              f_pu_rec.image1.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else
          f_pu_rec.image1.Picture:=nil;
      dm1.ZQ_pu_TMP.Close();
      dm1.ZQ_pu_TMP.SQL.Clear();
      f_pu_rec.ShowModal();
//      B_Apply_filter.Click();
    end;
end;

procedure TF_pu.clear_edit_all;
begin
  e_fider.Clear();
  e_opore.Clear();
  e_pu_sn.Clear();
  e_plomb.Clear();
  dt_from.Date:=date()-14;
  dt_to.Date:=date();
  e_act.Clear();

end;

procedure TF_pu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu.Close();
end;

procedure TF_pu.FormShow(Sender: TObject);
begin
  clear_edit_all();
  reload_cb_all();
//  B_Apply_filter.Click();
end;

procedure TF_pu.reload_cb_all;
begin
  get_list_cb_tp_all(cb_tp);
  get_list_cb_model_all(cb_pu_model);
  get_list_cb_brig_all(cb_brig);
  get_list_cb_pu_photo_status_all(cb_photo_status);
  get_list_cb_pu_pay_status_all(cb_pu_pay_status);
end;

end.

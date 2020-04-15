unit F04_act;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls, Mask, DBCtrls,jpeg;

type
  TF_act = class(TForm)
    cb_tp: TComboBox;
    DB_act: TDBGrid;
    B_Apply_filter: TBitBtn;
    B_Edit: TBitBtn;
    SB1: TStatusBar;
    cb_act_status: TComboBox;
    cb_act_pay_status: TComboBox;
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    E_pu: TEdit;
    E_p_number: TEdit;
    E_FIO: TEdit;
    E_house: TEdit;
    B_Clear: TBitBtn;
    cb_sign_brig: TComboBox;
    DBText7: TDBText;
    DBText8: TDBText;
    DT_from: TDateTimePicker;
    DT_to: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ClearClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_Apply_filterClick(Sender: TObject);
    procedure clear_edit_all();
    procedure reload_cb_all();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act: TF_act;

implementation
uses DM, lib_cb, F04_act_rec;
{$R *.dfm}

procedure TF_act.B_Apply_filterClick(Sender: TObject);
begin
  dm1.ZQ_act.Close();
  dm1.ZQ_act.ParamByName('p_tp').AsInteger:=integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_act.ParamByName('p_house').AsString:='%%'+e_house.Text+'%%';
  dm1.ZQ_act.ParamByName('p_number').AsString:='%%'+e_p_number.Text+'%%';
  dm1.ZQ_act.ParamByName('p_FIO').AsString:='%%'+e_FIO.Text+'%%';
  dm1.ZQ_act.ParamByName('p_pu').AsString:='%%'+e_pu.Text+'%%';
  dm1.ZQ_act.ParamByName('p_act_status').AsInteger:=integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex]);
  dm1.ZQ_act.ParamByName('p_act_pay_status').AsInteger:=integer(cb_act_pay_status.Items.Objects[cb_act_pay_status.ItemIndex]);
  dm1.ZQ_act.ParamByName('p_sign_brig').AsInteger:=integer(cb_sign_brig.Items.Objects[cb_sign_brig.ItemIndex]);
  dm1.ZQ_act.Open();
  sb1.Panels[0].Text:=inttostr(dm1.ZQ_act.RecordCount);
end;

procedure TF_act.B_ClearClick(Sender: TObject);
begin
  if dm1.ZQ_act.RecordCount>0 then
    begin
    //делаем проверку на реестр по статусу акта правила удаления

      //reestr удаляем pu
      //оплата актов удаляем
      //удаляем фото актов
      dm1.ZQ_act_TMP.SQL.Text:='delete from act_photo where pu_sn_a=:p_sn;';
      dm1.ZQ_act_TMP.ParamByName('p_sn').AsString:=dm1.ZQ_act.FieldByName('pu_sn').AsString;
      dm1.ZQ_act_TMP.ExecSQL();
      dm1.ZQ_act_TMP.SQL.Text:='update pu set id_act_status_a=1, id_act_pay_status_a=1, id_abonent_status_a=1,'+
        'p_number=null,FIO=null,sn_old_pu=null,old_pu_model=null, old_pu_t1=0,old_pu_t2=0, old_pu_t3=0, new_pu_t1=0,new_pu_t2=0,new_pu_t3=0,'+
        ' date_sign=null, id_brig_sign_a=null where pu_sn="'+dm1.ZQ_act.FieldByName('pu_sn').AsString+'";';
      dm1.ZQ_act_TMP.ExecSQL();
      dm1.ZQ_act_TMP.SQL.Clear();
      b_apply_filter.Click();
    end;
end;

procedure TF_act.B_EditClick(Sender: TObject);
var jpg:TJPEGImage;
begin
  if dm1.ZQ_act.RecordCount>0 then
    begin
      if (dm1.ZQ_act.FieldByName('id_act_status_a').AsInteger=3) or (dm1.ZQ_act.FieldByName('id_act_status_a').AsInteger=5) then
        f_act_rec.B_OK.Enabled:=false
      else
        f_act_rec.B_OK.Enabled:=true;

      get_list_cb_abonent_status(f_act_rec.cb_abonent_status);
      get_list_cb_act_status(f_act_rec.cb_act_status);
      get_list_cb_brig_null(f_act_rec.cb_sign_master);

      f_act_rec.E_tp.Text:=dm1.ZQ_act.FieldByName('tp_name').AsString;
      f_act_rec.E_np.Text:=dm1.ZQ_act.FieldByName('tp_address').AsString;
      f_act_rec.E_street.Text:=dm1.ZQ_act.FieldByName('street_name').AsString;
      f_act_rec.E_house.Text:=dm1.ZQ_act.FieldByName('house').AsString;
      f_act_rec.E_room.Text:=dm1.ZQ_act.FieldByName('room').AsString;
      f_act_rec.cb_abonent_status.ItemIndex:=f_act_rec.cb_abonent_status.Items.IndexOfObject(tobject(dm1.ZQ_act.FieldByName('id_abonent_status_a').AsInteger));
      f_act_rec.E_p_number.Text:=dm1.ZQ_act.FieldByName('p_number').AsString;
      f_act_rec.E_FIO.Text:=dm1.ZQ_act.FieldByName('FIO').AsString;
      f_act_rec.E_model.Text:=dm1.ZQ_act.FieldByName('pu_model_name').AsString;
      f_act_rec.E_pu.Text:=dm1.ZQ_act.FieldByName('pu_sn').AsString;
      f_act_rec.E_plomb.Text:=dm1.ZQ_act.FieldByName('pu_plomb').AsString;
      f_act_rec.L_new_sum.Caption:='';
      f_act_rec.E_new_T1.Text:=dm1.ZQ_act.FieldByName('new_pu_t1').AsString;
      f_act_rec.E_new_T2.Text:=dm1.ZQ_act.FieldByName('new_pu_t2').AsString;
      f_act_rec.E_new_T3.Text:=dm1.ZQ_act.FieldByName('new_pu_t3').AsString;
      f_act_rec.L_old_sum.Caption:='';
      f_act_rec.E_old_pu.Text:=dm1.ZQ_act.FieldByName('sn_old_pu').AsString;
      f_act_rec.E_old_pu_model.Text:=dm1.ZQ_act.FieldByName('old_pu_model').AsString;

      f_act_rec.E_old_T1.Text:=dm1.ZQ_act.FieldByName('old_pu_t1').AsString;
      f_act_rec.E_old_T2.Text:=dm1.ZQ_act.FieldByName('old_pu_t2').AsString;
      f_act_rec.E_old_T3.Text:=dm1.ZQ_act.FieldByName('old_pu_t3').AsString;

      f_act_rec.E_kadastr.Text:=dm1.ZQ_act.FieldByName('kadastr').AsString;

      if (dm1.ZQ_act.FieldByName('sign_master').AsString<>'') then
        f_act_rec.cb_sign_master.ItemIndex:=f_act_rec.cb_sign_master.Items.IndexOfObject(tobject(dm1.ZQ_act.FieldByName('id_brig_sign_a').AsInteger));
      if not(dm1.ZQ_act.FieldByName('date_sign').IsNull) then
        f_act_rec.DT_sign.Date:=dm1.ZQ_act.FieldByName('date_sign').AsDateTime
      else
        f_act_rec.DT_sign.Date:=now();
      f_act_rec.cb_act_status.ItemIndex:=f_act_rec.cb_act_status.Items.IndexOfObject(tobject(dm1.ZQ_act.FieldByName('id_act_status_a').AsInteger));

  //фото
      dm1.ZQ_act_TMP.SQL.Text:='select act_img1,act_img2,act_img3 from act_photo where pu_sn_a="'+dm1.ZQ_act.FieldByName('pu_sn').AsString+'";';
      dm1.ZQ_act_TMP.Open();
      if not(dm1.ZQ_act_TMP.FieldByName('act_img1').IsNull) then
        begin
          try
            F_act_rec.image1.Picture.Assign(dm1.ZQ_act_TMP.FieldByName('act_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_act_TMP.FieldByName('act_img1'));
              f_act_rec.image1.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end;
          f_act_rec.cb_act_status.Enabled:=true;
        end
      else
        begin
          f_act_rec.image1.Picture:=nil;
          f_act_rec.Image1.Picture.Graphic:=nil;
          f_act_rec.Image1.Picture.Bitmap:=nil;
          f_act_rec.cb_act_status.Enabled:=false;
        end;

        
      if not(dm1.ZQ_act_TMP.FieldByName('act_img2').IsNull) then
        try
          F_act_rec.image2.Picture.Assign(dm1.ZQ_act_TMP.FieldByName('act_img2'));
        except
          jpg:=TJPEGImage.Create;
          try
            jpg.Assign(dm1.ZQ_act_TMP.FieldByName('act_img2'));
            f_act_rec.image2.Picture.Assign(jpg);
          finally
            jpg.Free;
          end;
        end
      else
        begin
          f_act_rec.image2.Picture:=nil;
          f_act_rec.Image2.Picture.Graphic:=nil;
          f_act_rec.Image2.Picture.Bitmap:=nil;
        end;


      if not(dm1.ZQ_act_TMP.FieldByName('act_img3').IsNull) then
        try
          F_act_rec.image3.Picture.Assign(dm1.ZQ_act_TMP.FieldByName('act_img3'));
        except
          jpg:=TJPEGImage.Create;
          try
            jpg.Assign(dm1.ZQ_act_TMP.FieldByName('act_img3'));
            f_act_rec.image3.Picture.Assign(jpg);
          finally
            jpg.Free;
          end;
        end
      else
        begin
          f_act_rec.image3.Picture:=nil;
          f_act_rec.Image3.Picture.Graphic:=nil;
          f_act_rec.Image3.Picture.Bitmap:=nil;
        end;

//
      dm1.ZQ_act_TMP.Close();
      dm1.ZQ_act_TMP.SQL.Clear();
      f_act_rec.showmodal();
      b_apply_filter.Click();
    end;
end;

procedure TF_act.clear_edit_all;
begin
  E_house.Clear();
  e_p_number.Clear();
  e_FIO.Clear();
  e_pu.Clear();
end;

procedure TF_act.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_act.Close();
end;

procedure TF_act.FormShow(Sender: TObject);
begin
  clear_edit_all();
  reload_cb_all();
//  B_Apply_filter.Click();
end;

procedure TF_act.reload_cb_all;
begin
  get_list_cb_tp_all(cb_tp);
//  cb_tp.itemindex:=cb_tp.Items.IndexOfObject(tobject(10));
  get_list_cb_act_status_all(cb_act_status);
  get_list_cb_act_pay_status_all(cb_act_pay_status);
  get_list_cb_brig_all(cb_sign_brig);
  dt_from.Date:=date()-14;
  dt_to.Date:=now();

end;

end.

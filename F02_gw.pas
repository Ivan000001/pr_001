unit F02_gw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids,jpeg;

type
  TF_gw = class(TForm)
    DBGrid1: TDBGrid;
    rb_all: TRadioButton;
    rb_1: TRadioButton;
    rb_2: TRadioButton;
    b_clear: TBitBtn;
    B_edit: TBitBtn;
    procedure b_clearClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rb_allClick(Sender: TObject);
    procedure rb_1Click(Sender: TObject);
    procedure rb_2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_gw: TF_gw;

implementation
uses DM, F02_gw_rec,lib_cb;
{$R *.dfm}

procedure TF_gw.b_clearClick(Sender: TObject);
begin
  showmessage('DEMO');
end;

procedure TF_gw.B_editClick(Sender: TObject);
var jpg:TJPEGImage;
begin
  if dm1.zq_gw.RecordCount>0 then
    begin
      dm1.zq_gw_TMP.SQL.Text:='select  tp.tp_name,  gateway.*,  gateway_photo.* from gateway LEFT JOIN tp ON tp.id_tp=gateway.id_tp_a LEFT JOIN gateway_photo ON gateway_photo.gw_imei_a=gateway.gw_imei WHERE gateway.gw_imei=:p_sn limit 1';
      dm1.zq_gw_TMP.ParamByName('p_sn').AsString:=dm1.ZQ_gw.FieldByName('gw_imei').AsString;
      dm1.zq_gw_TMP.open();
      dm1.zq_gw_TMP.First();
      f_gw_rec.e_tp.Text:=dm1.ZQ_gw_TMP.FieldByName('tp_name').AsString;
      if (dm1.ZQ_gw_TMP.FieldByName('date_install').IsNull) then f_gw_rec.DT_install.Date:=date()
        else f_gw_rec.DT_install.Date:=dm1.ZQ_gw_TMP.FieldByName('date_install').AsDateTime;
      get_list_cb_brig_null(f_gw_rec.cb_brig);
      if not(dm1.ZQ_gw_TMP.FieldByName('id_brig_a').IsNull) then
        f_gw_rec.cb_brig.ItemIndex:=f_gw_rec.cb_brig.Items.IndexOfObject(tobject(dm1.ZQ_gw_TMP.FieldByName('id_brig_a').AsInteger));
      f_gw_rec.e_imei.Text:=dm1.ZQ_gw_TMP.FieldByName('gw_imei').AsString;
      f_gw_rec.l_last_sn.caption:=f_gw_rec.e_imei.Text;
      f_gw_rec.e_mac.Text:=dm1.ZQ_gw_TMP.FieldByName('gw_mac').AsString;
      f_gw_rec.e_plomb.Text:=dm1.ZQ_gw_TMP.FieldByName('gw_plomb').AsString;
      f_gw_rec.e_fider.Text:=dm1.ZQ_gw_TMP.FieldByName('fider').AsString;
      f_gw_rec.e_opore.Text:=dm1.ZQ_gw_TMP.FieldByName('opore').AsString;
      f_gw_rec.cb_status.ItemIndex:=dm1.ZQ_gw_TMP.FieldByName('gw_status').AsInteger-1;

      if not(dm1.ZQ_gw_TMP.FieldByName('gw_img1').IsNull) then
          try
            F_gw_rec.image1.Picture.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img1'));
              f_gw_rec.image1.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_gw_rec.image1.Picture:=nil;

      if not(dm1.ZQ_gw_TMP.FieldByName('gw_img2').IsNull) then
          try
            F_gw_rec.image2.Picture.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img2'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img2'));
              f_gw_rec.image2.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_gw_rec.image2.Picture:=nil;

      if not(dm1.ZQ_gw_TMP.FieldByName('gw_img3').IsNull) then
          try
            F_gw_rec.image3.Picture.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img3'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_gw_TMP.FieldByName('gw_img3'));
              f_gw_rec.image3.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_gw_rec.image3.Picture:=nil;
      dm1.zq_gw_TMP.Close();
      dm1.zq_gw_TMP.SQL.Clear();
      f_gw_rec.showmodal();
    end;
end;

procedure TF_gw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.zq_gw.Close();
end;

procedure TF_gw.FormShow(Sender: TObject);
begin
  rb_2.Checked:=true;
  dm1.ZQ_gw.Close();
  dm1.ZQ_gw.ParamByName('p_status').AsInteger:=2;
  dm1.ZQ_gw.Open();
end;

procedure TF_gw.rb_1Click(Sender: TObject);
begin
  dm1.ZQ_gw.Close();
  dm1.ZQ_gw.ParamByName('p_status').AsInteger:=1;
  dm1.ZQ_gw.Open();
end;

procedure TF_gw.rb_2Click(Sender: TObject);
begin
  dm1.ZQ_gw.Close();
  dm1.ZQ_gw.ParamByName('p_status').AsInteger:=2;
  dm1.ZQ_gw.Open();
end;

procedure TF_gw.rb_allClick(Sender: TObject);
begin
  dm1.ZQ_gw.Close();
  dm1.ZQ_gw.ParamByName('p_status').AsInteger:=0;
  dm1.ZQ_gw.Open();
end;

end.

unit F02_bpu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,jpeg;

type
  TF_bpu = class(TForm)
    DBGrid1: TDBGrid;
    rb_all: TRadioButton;
    rb_1: TRadioButton;
    rb_2: TRadioButton;
    b_clear: TBitBtn;
    B_edit: TBitBtn;
    SB1: TStatusBar;
    procedure b_clearClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure rb_2Click(Sender: TObject);
    procedure rb_1Click(Sender: TObject);
    procedure rb_allClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_bpu: TF_bpu;

implementation
uses dm, F02_bpu_rec,lib_cb;
{$R *.dfm}

procedure TF_bpu.b_clearClick(Sender: TObject);
begin
  showmessage('DEMO');
end;

procedure TF_bpu.B_editClick(Sender: TObject);
var jpg:TJPEGImage;
begin
  if dm1.ZQ_bpu.RecordCount>0 then
    begin
      dm1.zq_bpu_TMP.SQL.Text:='select  tp.tp_name,  bpu.*,  bpu_photo.* from bpu LEFT JOIN tp ON tp.id_tp=bpu.id_tp_a LEFT JOIN bpu_photo ON bpu_photo.bpu_sn_a=bpu.bpu_sn WHERE bpu.bpu_sn=:p_sn limit 1';
      dm1.zq_bpu_TMP.ParamByName('p_sn').AsString:=dm1.ZQ_bpu.FieldByName('bpu_sn').AsString;
      dm1.zq_bpu_TMP.open();
      dm1.zq_bpu_TMP.First();
      f_bpu_rec.e_tp.Text:=dm1.ZQ_bpu_TMP.FieldByName('tp_name').AsString;
      if (dm1.ZQ_bpu_TMP.FieldByName('date_install').IsNull) then f_bpu_rec.DT_install.Date:=date()
        else f_bpu_rec.DT_install.Date:=dm1.ZQ_bpu_TMP.FieldByName('date_install').AsDateTime;
      get_list_cb_brig_null(f_bpu_rec.cb_brig);
      if not(dm1.ZQ_bpu_TMP.FieldByName('id_brig_a').IsNull) then
        f_bpu_rec.cb_brig.ItemIndex:=f_bpu_rec.cb_brig.Items.IndexOfObject(tobject(dm1.ZQ_bpu_TMP.FieldByName('id_brig_a').AsInteger));
      f_bpu_rec.e_sn.Text:=dm1.ZQ_bpu_TMP.FieldByName('bpu_sn').AsString;
      f_bpu_rec.l_last_sn.caption:=f_bpu_rec.e_sn.Text;
      f_bpu_rec.e_model_name.Text:=dm1.zq_bpu_TMP.FieldByName('bpu_model_name').AsString;
      f_bpu_rec.e_mac.Text:=dm1.ZQ_bpu_TMP.FieldByName('bpu_mac').AsString;
      f_bpu_rec.e_plomb1.Text:=dm1.ZQ_bpu_TMP.FieldByName('bpu_plomb1').AsString;
      f_bpu_rec.e_plomb2.Text:=dm1.ZQ_bpu_TMP.FieldByName('bpu_plomb2').AsString;
      f_bpu_rec.e_plomb2.Text:=dm1.ZQ_bpu_TMP.FieldByName('bpu_plomb2').AsString;
      f_bpu_rec.e_tt1_name.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt1_name').AsString;
      f_bpu_rec.e_tt1_k.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt1_k').AsString;
      f_bpu_rec.e_tt1_sn.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt1_sn').AsString;
      f_bpu_rec.e_tt1_plomb.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt1_plomb').AsString;
      f_bpu_rec.e_tt2_name.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt2_name').AsString;
      f_bpu_rec.e_tt2_k.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt2_k').AsString;
      f_bpu_rec.e_tt2_sn.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt2_sn').AsString;
      f_bpu_rec.e_tt2_plomb.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt2_plomb').AsString;
      f_bpu_rec.e_tt3_name.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt3_name').AsString;
      f_bpu_rec.e_tt3_k.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt3_k').AsString;
      f_bpu_rec.e_tt3_sn.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt3_sn').AsString;
      f_bpu_rec.e_tt3_plomb.Text:=dm1.ZQ_bpu_TMP.FieldByName('tt3_plomb').AsString;
      f_bpu_rec.cb_status.ItemIndex:=dm1.ZQ_bpu_TMP.FieldByName('bpu_status').AsInteger-1;

      if not(dm1.ZQ_bpu_TMP.FieldByName('bpu_all_img').IsNull) then
          try
            F_bpu_rec.image1.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_all_img'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_all_img'));
              f_bpu_rec.image1.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image1.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('bpu_img1').IsNull) then
          try
            F_bpu_rec.image2.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img1'));
              f_bpu_rec.image2.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image2.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('bpu_mac_img').IsNull) then
          try
            F_bpu_rec.image3.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_mac_img'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_mac_img'));
              f_bpu_rec.image3.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image3.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('bpu_img2').IsNull) then
          try
            F_bpu_rec.image4.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img2'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img2'));
              f_bpu_rec.image4.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image4.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('bpu_img3').IsNull) then
          try
            F_bpu_rec.image5.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img3'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('bpu_img3'));
              f_bpu_rec.image5.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image5.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('tt_all_img').IsNull) then
          try
            F_bpu_rec.image6.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt_all_img'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt_all_img'));
              f_bpu_rec.image6.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image6.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('tt1_img1').IsNull) then
          try
            F_bpu_rec.image7.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt1_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt1_img1'));
              f_bpu_rec.image7.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image7.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('tt2_img1').IsNull) then
          try
            F_bpu_rec.image8.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt2_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt2_img1'));
              f_bpu_rec.image8.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image8.Picture:=nil;

      if not(dm1.ZQ_bpu_TMP.FieldByName('tt3_img1').IsNull) then
          try
            F_bpu_rec.image9.Picture.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt3_img1'));
          except
            jpg:=TJPEGImage.Create;
            try
              jpg.Assign(dm1.ZQ_bpu_TMP.FieldByName('tt3_img1'));
              f_bpu_rec.image9.Picture.Assign(jpg);
            finally
              jpg.Free;
            end;
          end
        else f_bpu_rec.image9.Picture:=nil;

      dm1.zq_bpu_TMP.Close();
      dm1.zq_bpu_TMP.SQL.Clear();
      f_bpu_rec.showmodal();
    end;
end;

procedure TF_bpu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_bpu.Close();
end;

procedure TF_bpu.FormShow(Sender: TObject);
begin
  rb_2.Checked:=true;
  dm1.ZQ_bpu.Close();
  dm1.ZQ_bpu.ParamByName('p_status').AsInteger:=2;
  dm1.ZQ_bpu.Open();
end;

procedure TF_bpu.rb_1Click(Sender: TObject);
begin
  dm1.ZQ_bpu.Close();
  dm1.ZQ_bpu.ParamByName('p_status').AsInteger:=1;
  dm1.ZQ_bpu.Open();
end;

procedure TF_bpu.rb_2Click(Sender: TObject);
begin
  dm1.ZQ_bpu.Close();
  dm1.ZQ_bpu.ParamByName('p_status').AsInteger:=2;
  dm1.ZQ_bpu.Open();
end;

procedure TF_bpu.rb_allClick(Sender: TObject);
begin
  dm1.ZQ_bpu.Close();
  dm1.ZQ_bpu.ParamByName('p_status').AsInteger:=0;
  dm1.ZQ_bpu.Open();
end;

end.

unit F02_bpu_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs,jpeg;

type
  TF_bpu_rec = class(TForm)
    SB: TScrollBox;
    Image1: TImage;
    B_OK: TBitBtn;
    B_Load: TBitBtn;
    B_clear: TBitBtn;
    e_tp: TEdit;
    e_sn: TEdit;
    cb_status: TComboBox;
    DT_install: TDateTimePicker;
    cb_brig: TComboBox;
    e_mac: TEdit;
    e_plomb1: TEdit;
    e_plomb2: TEdit;
    e_tt1_name: TEdit;
    e_tt1_sn: TEdit;
    e_tt1_plomb: TEdit;
    e_tt2_name: TEdit;
    e_tt2_sn: TEdit;
    e_tt2_plomb: TEdit;
    e_tt3_name: TEdit;
    e_tt3_sn: TEdit;
    e_tt3_plomb: TEdit;
    e_tt1_k: TEdit;
    e_tt2_k: TEdit;
    e_tt3_k: TEdit;
    B_bpu_img1: TBitBtn;
    B_bpu_mac: TBitBtn;
    B_bpu_img2: TBitBtn;
    B_bpu_img3: TBitBtn;
    B_tt_all: TBitBtn;
    B_tt1: TBitBtn;
    B_tt2: TBitBtn;
    B_tt3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    B_bpu_all: TBitBtn;
    OPD1: TOpenPictureDialog;
    L_last_sn: TLabel;
    B_save: TBitBtn;
    SPD1: TSavePictureDialog;
    e_model_name: TEdit;
    Label13: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_clearClick(Sender: TObject);
    procedure B_LoadClick(Sender: TObject);
    procedure B_tt3Click(Sender: TObject);
    procedure B_tt2Click(Sender: TObject);
    procedure B_tt1Click(Sender: TObject);
    procedure B_tt_allClick(Sender: TObject);
    procedure B_bpu_img3Click(Sender: TObject);
    procedure B_bpu_img2Click(Sender: TObject);
    procedure B_bpu_macClick(Sender: TObject);
    procedure B_bpu_img1Click(Sender: TObject);
    procedure B_bpu_allClick(Sender: TObject);
    procedure e_tt1_snKeyPress(Sender: TObject; var Key: Char);
    procedure e_macKeyPress(Sender: TObject; var Key: Char);
    procedure e_snKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_bpu_rec: TF_bpu_rec;

implementation

uses DM;

{$R *.dfm}

procedure select_img(i_:integer);
begin
  if (i_=1) and (F_bpu_rec.b_bpu_all.tag=0) then F_bpu_rec.b_bpu_all.tag:=1 else F_bpu_rec.b_bpu_all.TAg:=0;
  if (i_=2) and (F_bpu_rec.b_bpu_img1.tag=0) then F_bpu_rec.b_bpu_img1.tag:=1 else F_bpu_rec.b_bpu_img1.TAg:=0;
  if (i_=3) and (F_bpu_rec.b_bpu_mac.tag=0) then F_bpu_rec.b_bpu_mac.tag:=1 else F_bpu_rec.b_bpu_mac.TAg:=0;
  if (i_=4) and (F_bpu_rec.b_bpu_img2.tag=0) then F_bpu_rec.b_bpu_img2.tag:=1 else F_bpu_rec.b_bpu_img2.TAg:=0;
  if (i_=5) and (F_bpu_rec.b_bpu_img3.tag=0) then F_bpu_rec.b_bpu_img3.tag:=1 else F_bpu_rec.b_bpu_img3.TAg:=0;
  if (i_=6) and (F_bpu_rec.b_tt_all.tag=0) then F_bpu_rec.b_tt_all.tag:=1 else F_bpu_rec.b_tt_all.TAg:=0;
  if (i_=7) and (F_bpu_rec.b_tt1.tag=0) then F_bpu_rec.b_tt1.tag:=1 else F_bpu_rec.b_tt1.TAg:=0;
  if (i_=8) and (F_bpu_rec.b_tt2.tag=0) then F_bpu_rec.b_tt2.tag:=1 else F_bpu_rec.b_tt2.TAg:=0;
  if (i_=9) and (F_bpu_rec.b_tt3.tag=0) then F_bpu_rec.b_tt3.tag:=1 else F_bpu_rec.b_tt3.TAg:=0;

  if f_bpu_rec.b_bpu_all.Tag=1 then
    begin
      F_bpu_rec.Image1.Visible:=true;
      f_bpu_rec.B_bpu_all.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image1.Visible:=false;
      f_bpu_rec.B_bpu_all.Enabled:=true;
    end;
  if f_bpu_rec.b_bpu_img1.Tag=1 then
    begin
      F_bpu_rec.Image2.Visible:=true;
      f_bpu_rec.B_bpu_img1.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image2.Visible:=false;
      f_bpu_rec.B_bpu_img1.Enabled:=true;
    end;
  if f_bpu_rec.b_bpu_mac.Tag=1 then
    begin
      F_bpu_rec.Image3.Visible:=true;
      f_bpu_rec.B_bpu_mac.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image3.Visible:=false;
      f_bpu_rec.B_bpu_mac.Enabled:=true;
    end;
  if f_bpu_rec.b_bpu_img2.Tag=1 then
    begin
      F_bpu_rec.Image4.Visible:=true;
      f_bpu_rec.B_bpu_img2.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image4.Visible:=false;
      f_bpu_rec.B_bpu_img2.Enabled:=true;
    end;
  if f_bpu_rec.b_bpu_img3.Tag=1 then
    begin
      F_bpu_rec.Image5.Visible:=true;
      f_bpu_rec.B_bpu_img3.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image5.Visible:=false;
      f_bpu_rec.B_bpu_img3.Enabled:=true;
    end;
  if f_bpu_rec.b_tt_all.Tag=1 then
    begin
      F_bpu_rec.Image6.Visible:=true;
      f_bpu_rec.B_tt_all.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image6.Visible:=false;
      f_bpu_rec.B_tt_all.Enabled:=true;
    end;
  if f_bpu_rec.b_tt1.Tag=1 then
    begin
      F_bpu_rec.Image7.Visible:=true;
      f_bpu_rec.B_tt1.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image7.Visible:=false;
      f_bpu_rec.B_tt1.Enabled:=true;
    end;
  if f_bpu_rec.b_tt2.Tag=1 then
    begin
      F_bpu_rec.Image8.Visible:=true;
      f_bpu_rec.B_tt2.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image8.Visible:=false;
      f_bpu_rec.B_tt2.Enabled:=true;
    end;
  if f_bpu_rec.b_tt3.Tag=1 then
    begin
      F_bpu_rec.Image9.Visible:=true;
      f_bpu_rec.B_tt3.Enabled:=false;
    end
      else
    begin
      F_bpu_rec.Image9.Visible:=false;
      f_bpu_rec.B_tt3.Enabled:=true;
    end;
end;

procedure TF_bpu_rec.B_bpu_allClick(Sender: TObject);
begin
  select_img(1);
end;

procedure TF_bpu_rec.B_bpu_img1Click(Sender: TObject);
begin
  select_img(2);
end;

procedure TF_bpu_rec.B_bpu_img2Click(Sender: TObject);
begin
  select_img(4);
end;

procedure TF_bpu_rec.B_bpu_img3Click(Sender: TObject);
begin
  select_img(5);
end;

procedure TF_bpu_rec.B_bpu_macClick(Sender: TObject);
begin
  select_img(3);
end;

procedure TF_bpu_rec.B_clearClick(Sender: TObject);
begin
      if b_bpu_all.Tag=1 then
        begin
          image1.Picture:=nil;
          image1.Picture.Graphic:=nil;
          image1.Picture.Bitmap:=nil;
        end;
      if b_bpu_img1.Tag=1 then
        begin
          image2.Picture:=nil;
          image2.Picture.Graphic:=nil;
          image2.Picture.Bitmap:=nil;
        end;
      if b_bpu_mac.Tag=1 then
        begin
          image3.Picture:=nil;
          image3.Picture.Graphic:=nil;
          image3.Picture.Bitmap:=nil;
        end;
      if b_bpu_img2.Tag=1 then
        begin
          image4.Picture:=nil;
          image4.Picture.Graphic:=nil;
          image4.Picture.Bitmap:=nil;
        end;
      if b_bpu_img3.Tag=1 then
        begin
          image5.Picture:=nil;
          image5.Picture.Graphic:=nil;
          image5.Picture.Bitmap:=nil;
        end;
      if b_tt_all.Tag=1 then
        begin
          image6.Picture:=nil;
          image6.Picture.Graphic:=nil;
          image6.Picture.Bitmap:=nil;
        end;
      if b_tt1.Tag=1 then
        begin
          image7.Picture:=nil;
          image7.Picture.Graphic:=nil;
          image7.Picture.Bitmap:=nil;
        end;
      if b_tt2.Tag=1 then
        begin
          image8.Picture:=nil;
          image8.Picture.Graphic:=nil;
          image8.Picture.Bitmap:=nil;
        end;
      if b_tt3.Tag=1 then
        begin
          image9.Picture:=nil;
          image9.Picture.Graphic:=nil;
          image9.Picture.Bitmap:=nil;
        end;
end;

procedure TF_bpu_rec.B_LoadClick(Sender: TObject);
begin
  if opd1.Execute then
    begin
      if b_bpu_all.Tag=1 then
        begin
          image1.Picture:=nil;
          image1.Picture.Graphic:=nil;
          image1.Picture.Bitmap:=nil;
          image1.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_bpu_img1.Tag=1 then
        begin
          image2.Picture:=nil;
          image2.Picture.Graphic:=nil;
          image2.Picture.Bitmap:=nil;
          image2.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_bpu_mac.Tag=1 then
        begin
          image3.Picture:=nil;
          image3.Picture.Graphic:=nil;
          image3.Picture.Bitmap:=nil;
          image3.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_bpu_img2.Tag=1 then
        begin
          image4.Picture:=nil;
          image4.Picture.Graphic:=nil;
          image4.Picture.Bitmap:=nil;
          image4.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_bpu_img3.Tag=1 then
        begin
          image5.Picture:=nil;
          image5.Picture.Graphic:=nil;
          image5.Picture.Bitmap:=nil;
          image5.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_tt_all.Tag=1 then
        begin
          image6.Picture:=nil;
          image6.Picture.Graphic:=nil;
          image6.Picture.Bitmap:=nil;
          image6.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_tt1.Tag=1 then
        begin
          image7.Picture:=nil;
          image7.Picture.Graphic:=nil;
          image7.Picture.Bitmap:=nil;
          image7.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_tt2.Tag=1 then
        begin
          image8.Picture:=nil;
          image8.Picture.Graphic:=nil;
          image8.Picture.Bitmap:=nil;
          image8.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_tt3.Tag=1 then
        begin
          image9.Picture:=nil;
          image9.Picture.Graphic:=nil;
          image9.Picture.Bitmap:=nil;
          image9.Picture.LoadFromFile(opd1.FileName);
        end;

    end;

end;

procedure TF_bpu_rec.B_OKClick(Sender: TObject);
var
  Ss  : TStringStream;
  St : string;
  jpg: TJpegImage;
function get_v(s_:string):string;
begin
  if s_='' then result:='null' else result:='"'+s_+'"';
end;
function get_v2(i_:integer):string;
begin
  if i_=0 then result:='null' else result:=inttostr(i_);
end;
begin
  dm1.zq_bpu_TMP.SQL.Text:='delete from bpu_photo where bpu_sn_a="'+dm1.ZQ_bpu.FieldByName('bpu_sn').AsString+'";';
  dm1.zq_bpu_TMP.ExecSQL();
  dm1.zq_bpu_TMP.SQL.Text:='update bpu set bpu_status='+inttostr(cb_status.ItemIndex+1)+', date_install="'+formatdatetime('yyyy-mm-dd',DT_install.Date)+'", id_brig_a='+get_v2(integer(cb_brig.Items.Objects[cb_brig.ItemIndex]))+
    ',bpu_sn="'+e_sn.Text+'",bpu_model_name='+get_v(e_model_name.Text)+',bpu_mac='+get_v(e_mac.Text)+',bpu_plomb1='+get_v(e_plomb1.Text)+',bpu_plomb2='+get_v(e_plomb2.Text)+
    ', tt1_name='+get_v(e_tt1_name.Text)+',tt1_k='+get_v(e_tt1_k.Text)+',tt1_sn='+get_v(e_tt1_sn.Text)+',tt1_plomb='+get_v(e_tt1_plomb.Text)+
    ', tt2_name='+get_v(e_tt2_name.Text)+',tt2_k='+get_v(e_tt2_k.Text)+',tt2_sn='+get_v(e_tt2_sn.Text)+',tt2_plomb='+get_v(e_tt2_plomb.Text)+
    ', tt3_name='+get_v(e_tt3_name.Text)+',tt3_k='+get_v(e_tt3_k.Text)+',tt3_sn='+get_v(e_tt3_sn.Text)+',tt3_plomb='+get_v(e_tt3_plomb.Text)+
    ' where bpu_sn="'+dm1.ZQ_bpu.FieldByName('bpu_sn').AsString+'";';
  dm1.zq_bpu_TMP.ExecSQL();
  //фото в базу - не засирая память делаем руками по много раз
  dm1.ZQ_bpu_TMP.SQL.Text:='insert into bpu_photo(bpu_sn_a,bpu_img1,bpu_mac_img,bpu_img2,bpu_img3,bpu_all_img,tt_all_img,tt1_img1,tt2_img1,tt3_img1) value '+
     '("'+e_sn.Text+'",:p_img1,:p_mac,:p_img2,:p_img3,:p_all_img,:p_tt_all_img,:p_tt1_img,:p_tt2_img,:p_tt3_img);';
  if not(Image1.Picture.Graphic=nil)   then
    begin
      Ss := TStringStream.Create(st);
      if Image1.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image1.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image1.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_all_img').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_all_img').AsBlob:='';

  if not(image2.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image2.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image2.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image2.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_img1').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_img1').AsBlob:='';

  if not(image3.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image3.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image3.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image3.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_mac').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_mac').AsBlob:='';

  if not(image4.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image4.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image4.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image4.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_img2').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_img2').AsBlob:='';

  if not(image5.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image5.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image5.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image5.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_img3').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_img3').AsBlob:='';

  if not(image6.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image6.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image6.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image6.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_tt_all_img').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_tt_all_img').AsBlob:='';

  if not(image7.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image7.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image7.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image7.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_tt1_img').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_tt1_img').AsBlob:='';

  if not(image8.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image8.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image8.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image8.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_tt2_img').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_tt2_img').AsBlob:='';

  if not(image9.Picture.Graphic=nil) then
    begin
      Ss := TStringStream.Create(st);
      if Image9.Picture.Graphic is TJpegImage then
        begin
          jpg := TJpegImage.Create();
          jpg.Assign(image9.picture.graphic);
          jpg.CompressionQuality := 100;  //100% кажись как оригинал - не ужимать
          jpg.SaveToStream(Ss);
          jpg.Free();
        end
      else
        Image9.Picture.Bitmap.SaveToStream(Ss);
      dm1.ZQ_bpu_TMP.ParamByName('p_tt3_img').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_bpu_TMP.ParamByName('p_tt3_img').AsBlob:='';
  dm1.zq_bpu_TMP.ExecSQL();
  dm1.zq_bpu_TMP.SQL.Clear();
  close();
end;

procedure TF_bpu_rec.B_tt1Click(Sender: TObject);
begin
  select_img(7);
end;

procedure TF_bpu_rec.B_tt2Click(Sender: TObject);
begin
  select_img(8);
end;

procedure TF_bpu_rec.B_tt3Click(Sender: TObject);
begin
  select_img(9);
end;

procedure TF_bpu_rec.B_tt_allClick(Sender: TObject);
begin
  select_img(6);
end;

procedure TF_bpu_rec.e_macKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9','A'..'F' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_bpu_rec.e_snKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_bpu_rec.e_tt1_snKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9','_' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_bpu_rec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  image1.Picture:=nil;
  image2.Picture:=nil;
  image3.Picture:=nil;
  image4.Picture:=nil;
  image5.Picture:=nil;
  image6.Picture:=nil;
  image7.Picture:=nil;
  image8.Picture:=nil;
  image9.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image2.Picture.Graphic:=nil;
  image3.Picture.Graphic:=nil;
  image4.Picture.Graphic:=nil;
  image5.Picture.Graphic:=nil;
  image6.Picture.Graphic:=nil;
  image7.Picture.Graphic:=nil;
  image8.Picture.Graphic:=nil;
  image9.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
  image2.Picture.Bitmap:=nil;
  image3.Picture.Bitmap:=nil;
  image4.Picture.Bitmap:=nil;
  image5.Picture.Bitmap:=nil;
  image6.Picture.Bitmap:=nil;
  image7.Picture.Bitmap:=nil;
  image8.Picture.Bitmap:=nil;
  image9.Picture.Bitmap:=nil;
end;

procedure TF_bpu_rec.FormShow(Sender: TObject);
begin
  select_img(1);
end;

end.

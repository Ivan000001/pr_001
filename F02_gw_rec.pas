unit F02_gw_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ExtDlgs, StdCtrls, Buttons, ComCtrls,jpeg;

type
  TF_gw_rec = class(TForm)
    SB: TScrollBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    L_last_sn: TLabel;
    e_tp: TEdit;
    e_imei: TEdit;
    DT_install: TDateTimePicker;
    cb_brig: TComboBox;
    e_mac: TEdit;
    e_plomb: TEdit;
    BitBtn1: TBitBtn;
    Label12: TLabel;
    B_Load: TBitBtn;
    B_clear: TBitBtn;
    cb_status: TComboBox;
    B_save: TBitBtn;
    OPD1: TOpenPictureDialog;
    SPD1: TSavePictureDialog;
    B_img1: TBitBtn;
    B_img2: TBitBtn;
    B_img3: TBitBtn;
    e_fider: TEdit;
    e_opore: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure B_clearClick(Sender: TObject);
    procedure B_LoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_img3Click(Sender: TObject);
    procedure B_img2Click(Sender: TObject);
    procedure B_img1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure e_oporeKeyPress(Sender: TObject; var Key: Char);
    procedure e_macKeyPress(Sender: TObject; var Key: Char);
    procedure e_imeiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_gw_rec: TF_gw_rec;

implementation

uses DM;

{$R *.dfm}

procedure select_img(i_:integer);
begin
  if (i_=1) and (F_gw_rec.B_img1.tag=0) then F_gw_rec.b_img1.tag:=1 else F_gw_rec.b_img1.TAg:=0;
  if (i_=2) and (F_gw_rec.B_img2.tag=0) then F_gw_rec.b_img2.tag:=1 else F_gw_rec.b_img2.TAg:=0;
  if (i_=3) and (F_gw_rec.B_img3.tag=0) then F_gw_rec.b_img3.tag:=1 else F_gw_rec.b_img3.TAg:=0;

  if f_gw_rec.B_img1.Tag=1 then
    begin
      F_gw_rec.Image1.Visible:=true;
      f_gw_rec.B_img1.Enabled:=false;
    end
      else
    begin
      F_gw_rec.Image1.Visible:=false;
      f_gw_rec.B_img1.Enabled:=true;
    end;
    if f_gw_rec.B_img2.Tag=1 then
    begin
      F_gw_rec.Image2.Visible:=true;
      f_gw_rec.B_img2.Enabled:=false;
    end
      else
    begin
      F_gw_rec.Image2.Visible:=false;
      f_gw_rec.B_img2.Enabled:=true;
    end;
  if f_gw_rec.B_img3.Tag=1 then
    begin
      F_gw_rec.Image3.Visible:=true;
      f_gw_rec.B_img3.Enabled:=false;
    end
      else
    begin
      F_gw_rec.Image3.Visible:=false;
      f_gw_rec.B_img3.Enabled:=true;
    end;

end;

procedure TF_gw_rec.BitBtn1Click(Sender: TObject);
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
  dm1.zq_gw_TMP.SQL.Text:='delete from gateway_photo where gw_imei_a="'+dm1.ZQ_gw.FieldByName('gw_imei').AsString+'";';
  dm1.zq_gw_TMP.ExecSQL();
  dm1.zq_gw_TMP.SQL.Text:='update gateway set gw_status='+inttostr(cb_status.ItemIndex+1)+', date_install="'+formatdatetime('yyyy-mm-dd',DT_install.Date)+'", id_brig_a='+get_v2(integer(cb_brig.Items.Objects[cb_brig.ItemIndex]))+
    ',gw_imei="'+e_imei.Text+'",gw_mac='+get_v(e_mac.Text)+',gw_plomb='+get_v(e_plomb.Text)+', fider='+get_v(e_fider.Text)+',opore='+get_v(e_opore.Text)+
    ' where gw_imei="'+dm1.ZQ_gw.FieldByName('gw_imei').AsString+'";';
  dm1.zq_gw_TMP.ExecSQL();
  //фото в базу - не засирая память делаем руками по много раз
  dm1.ZQ_gw_TMP.SQL.Text:='insert into gateway_photo(gw_imei_a,gw_img1,gw_img2,gw_img3) value '+
     '("'+e_imei.Text+'",:p_img1,:p_img2,:p_img3);';
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
      dm1.ZQ_gw_TMP.ParamByName('p_img1').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_gw_TMP.ParamByName('p_img1').AsBlob:='';
  if not(Image2.Picture.Graphic=nil)   then
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
      dm1.ZQ_gw_TMP.ParamByName('p_img2').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_gw_TMP.ParamByName('p_img2').AsBlob:='';
  if not(Image3.Picture.Graphic=nil)   then
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
      dm1.ZQ_gw_TMP.ParamByName('p_img3').AsBlob := Ss.DataString;
      Ss.Free();
    end
  else dm1.ZQ_gw_TMP.ParamByName('p_img3').AsBlob:='';
  dm1.zq_gw_TMP.ExecSQL();
  dm1.zq_gw_TMP.SQL.Clear();
  close();

end;

procedure TF_gw_rec.B_clearClick(Sender: TObject);
begin
  if b_img1.Tag=1 then
    begin
      image1.Picture:=nil;
      image1.Picture.Graphic:=nil;
      image1.Picture.Bitmap:=nil;
    end;
  if b_img2.Tag=1 then
    begin
      image2.Picture:=nil;
      image2.Picture.Graphic:=nil;
      image2.Picture.Bitmap:=nil;
    end;
  if b_img3.Tag=1 then
    begin
      image3.Picture:=nil;
      image3.Picture.Graphic:=nil;
      image3.Picture.Bitmap:=nil;
    end;
end;

procedure TF_gw_rec.B_img1Click(Sender: TObject);
begin
  select_img(1);
end;

procedure TF_gw_rec.B_img2Click(Sender: TObject);
begin
  select_img(2);
end;

procedure TF_gw_rec.B_img3Click(Sender: TObject);
begin
  select_img(3);
end;

procedure TF_gw_rec.B_LoadClick(Sender: TObject);
begin
  if opd1.Execute then
    begin
      if b_img1.Tag=1 then
        begin
          image1.Picture:=nil;
          image1.Picture.Graphic:=nil;
          image1.Picture.Bitmap:=nil;
          image1.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_img2.Tag=1 then
        begin
          image2.Picture:=nil;
          image2.Picture.Graphic:=nil;
          image2.Picture.Bitmap:=nil;
          image2.Picture.LoadFromFile(opd1.FileName);
        end;
      if b_img3.Tag=1 then
        begin
          image3.Picture:=nil;
          image3.Picture.Graphic:=nil;
          image3.Picture.Bitmap:=nil;
          image3.Picture.LoadFromFile(opd1.FileName);
        end;
    end;
end;

procedure TF_gw_rec.e_imeiKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_gw_rec.e_macKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9','A'..'F' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_gw_rec.e_oporeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9','.' :  ; // цифры и <Back Space>
    ',' : Key:='.'
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_gw_rec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  image1.Picture:=nil;
  image2.Picture:=nil;
  image3.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image2.Picture.Graphic:=nil;
  image3.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
  image2.Picture.Bitmap:=nil;
  image3.Picture.Bitmap:=nil;
end;

procedure TF_gw_rec.FormShow(Sender: TObject);
begin
  select_img(1);
end;

end.

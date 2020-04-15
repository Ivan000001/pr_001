unit F04_act_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, ExtDlgs,jpeg, Mask;

type
  TF_act_rec = class(TForm)
    cb_sign_master: TComboBox;
    B_OK: TBitBtn;
    Label1: TLabel;
    DT_sign: TDateTimePicker;
    Label2: TLabel;
    E_old_T1: TEdit;
    E_old_T2: TEdit;
    E_old_T3: TEdit;
    E_new_T1: TEdit;
    E_new_T2: TEdit;
    E_new_T3: TEdit;
    E_old_pu: TEdit;
    E_old_pu_model: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    L_old_sum: TLabel;
    L_new_sum: TLabel;
    E_FIO: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    E_pu: TEdit;
    E_plomb: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    E_model: TEdit;
    E_tp: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    E_np: TEdit;
    E_street: TEdit;
    E_house: TEdit;
    E_room: TEdit;
    cb_abonent_status: TComboBox;
    Label15: TLabel;
    Label18: TLabel;
    cb_act_status: TComboBox;
    Label19: TLabel;
    OPD1: TOpenPictureDialog;
    SC2: TScrollBox;
    Image2: TImage;
    B_load_2: TBitBtn;
    B_clear_2: TBitBtn;
    SC3: TScrollBox;
    Image3: TImage;
    B_load_3: TBitBtn;
    B_clear_3: TBitBtn;
    SC1: TScrollBox;
    Image1: TImage;
    B_load_1: TBitBtn;
    B_clear_1: TBitBtn;
    E_kadastr: TEdit;
    Label16: TLabel;
    E_p_number: TEdit;
    B_fiz18: TBitBtn;
    procedure B_fiz18Click(Sender: TObject);
    procedure cb_act_statusSelect(Sender: TObject);
    procedure Image3Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
    procedure Image2Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
    procedure Image1Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_clear_3Click(Sender: TObject);
    procedure B_load_3Click(Sender: TObject);
    procedure B_clear_2Click(Sender: TObject);
    procedure B_load_2Click(Sender: TObject);
    procedure B_clear_1Click(Sender: TObject);
    procedure B_load_1Click(Sender: TObject);
    procedure E_old_T1KeyPress(Sender: TObject; var Key: Char);
    procedure E_new_T1Exit(Sender: TObject);
    procedure E_old_T1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_rec: TF_act_rec;

implementation

uses DM, F07_fiz18_search;
{$R *.dfm}

function replace_str(source_:string;w_in,w_out:char):string;
var i:integer;
begin
  for I := 1 to length(source_) do
    if source_[i]=w_in then source_[i]:=w_out;
  result:=source_;
end;


procedure TF_act_rec.B_clear_1Click(Sender: TObject);
begin
  image1.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
  cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(1));
  cb_act_status.Enabled:=false;
end;

procedure TF_act_rec.B_clear_2Click(Sender: TObject);
begin
  image2.Picture:=nil;
  image2.Picture.Graphic:=nil;
  image2.Picture.Bitmap:=nil;
  cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(1));
end;

procedure TF_act_rec.B_clear_3Click(Sender: TObject);
begin
  image3.Picture:=nil;
  image3.Picture.Graphic:=nil;
  image3.Picture.Bitmap:=nil;
  cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(1));
end;

procedure TF_act_rec.B_fiz18Click(Sender: TObject);
begin

  f_fiz18_search.e_p_number.Text:=e_p_number.Text;
  f_fiz18_search.E_FIO.Text:='';
  f_fiz18_search.E_sn_old_pu.Text:='';
  f_fiz18_search.showmodal();
end;

procedure TF_act_rec.B_load_1Click(Sender: TObject);
begin
  if opd1.Execute then
    begin
      image1.Picture:=nil;
      image1.Picture.Graphic:=nil;
      image1.Picture.Bitmap:=nil;
      image1.Picture.LoadFromFile(opd1.FileName);
    //подправить если изменится параметр в базе - это для автомата
      if integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex])=1 then
        cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(2));
      cb_act_status.Enabled:=true;
    end;
end;

procedure TF_act_rec.B_load_2Click(Sender: TObject);

begin
  if opd1.Execute then
    begin
      image2.Picture:=nil;
      image2.Picture.Graphic:=nil;
      image2.Picture.Bitmap:=nil;
      image2.Picture.LoadFromFile(opd1.FileName);
    //подправить если изменится параметр в базе - это для автомата
      if integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex])=1 then
        cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(2));
    end;
end;

procedure TF_act_rec.B_load_3Click(Sender: TObject);
begin
  if opd1.Execute then
    begin
      image3.Picture:=nil;
      image3.Picture.Graphic:=nil;
      image3.Picture.Bitmap:=nil;
      image3.Picture.LoadFromFile(opd1.FileName);
    //подправить если изменится параметр в базе - это для автомата
      if integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex])=1 then
        cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(2));
    end;
end;

procedure TF_act_rec.B_OKClick(Sender: TObject);
var
  Ss  : TStringStream;
  St : string;
  jpg: TJpegImage;
begin

  if e_p_number.Text<>'' then
    begin
      //удаляем фото актов
      dm1.ZQ_act_TMP.SQL.Text:='delete from act_photo where pu_sn_a=:p_sn;';
      dm1.ZQ_act_TMP.ParamByName('p_sn').AsString:=dm1.ZQ_act.FieldByName('pu_sn').AsString;
      dm1.ZQ_act_TMP.ExecSQL();
//цункции работаю.т сылками поэтому чтобы не засирать память прийдется делать без неё
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
          dm1.ZQ_act_TMP.SQL.Text:='insert into act_photo value (:p_sn,:p_act_img1,:p_act_img2,:p_act_img3);';
          dm1.ZQ_act_TMP.ParamByName('p_sn').AsString:=dm1.ZQ_act.FieldByName('pu_sn').AsString;
          dm1.ZQ_act_TMP.ParamByName('p_act_img1').AsBlob := Ss.DataString;
          Ss.Free();
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
              dm1.ZQ_act_TMP.ParamByName('p_act_img2').AsBlob := Ss.DataString;
              Ss.Free();
            end
          else dm1.ZQ_act_TMP.ParamByName('p_act_img2').AsBlob:=null;
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
              dm1.ZQ_act_TMP.ParamByName('p_act_img3').AsBlob := Ss.DataString;
              Ss.Free();
            end
          else dm1.ZQ_act_TMP.ParamByName('p_act_img3').AsBlob :=null;
          dm1.ZQ_act_TMP.ExecSQL();
        end;
      dm1.ZQ_act_TMP.SQL.Clear();

//начало запроса
dm1.ZQ_act_TMP.SQL.Text:='update pu set id_abonent_status_a='+inttostr(integer(cb_abonent_status.Items.Objects[cb_abonent_status.ItemIndex]))+', p_number="'+
  e_p_number.Text+'", FIO="'+e_FIO.Text+'",kadastr="'+e_kadastr.Text+'"';
  if e_new_t1.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',new_pu_t1='+replace_str(e_new_t1.Text,',','.'));
  if e_new_t2.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',new_pu_t2='+replace_str(e_new_t2.Text,',','.'));
  if e_new_t3.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',new_pu_t3='+replace_str(e_new_t3.Text,',','.'));
dm1.ZQ_act_TMP.SQL.Add(', old_pu_model="'+e_old_pu_model.Text+'",sn_old_pu="'+e_old_pu.Text+'"');
  if e_old_t1.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',old_pu_t1='+replace_str(e_old_t1.Text,',','.'));
  if e_old_t2.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',old_pu_t2='+replace_str(e_old_t2.Text,',','.'));
  if e_old_t3.Text<>'' then dm1.ZQ_act_TMP.SQL.Add(',old_pu_t3='+replace_str(e_old_t3.Text,',','.'));
  if integer(cb_sign_master.Items.Objects[cb_sign_master.ItemIndex])<>0 then
     dm1.ZQ_act_TMP.SQL.Add(',id_act_status_a='+inttostr(integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex]))+', id_brig_sign_a='+inttostr(integer(cb_sign_master.Items.Objects[cb_sign_master.ItemIndex]))+
          ',date_sign="'+formatdatetime('yyyy-mm-dd',DT_sign.Date)+'"')
  else
     dm1.ZQ_act_TMP.SQL.Add(',id_act_status_a=1,id_brig_sign_a=null, date_sign=null');
  dm1.ZQ_act_TMP.SQL.Add('where pu_sn="'+dm1.ZQ_act.FieldByName('pu_sn').AsString+'";');
//конец запроса
      dm1.ZQ_act_TMP.ExecSQL();
      dm1.ZQ_act_TMP.SQL.Clear();
      close();
    end
  else
    showmessage('ПУСТО');
end;

procedure TF_act_rec.cb_act_statusSelect(Sender: TObject);
begin
  if (integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex]) in [3,5]) then
    cb_act_status.ItemIndex:=cb_act_status.Items.IndexOfObject(tobject(1));
end;

procedure TF_act_rec.E_new_T1Exit(Sender: TObject);
var i1,i2,i3:real;
begin
  //обработать точку на запятую
  if e_new_T1.Text='' then i1:=0 else i1:=strtofloat(e_new_T1.Text);
  if e_new_T2.Text='' then i2:=0 else i2:=strtofloat(e_new_T2.Text);
  if e_new_T3.Text='' then i3:=0 else i3:=strtofloat(e_new_T3.Text);
  i1:=i1+i2+i3;
  l_new_sum.Caption:=floattostr(round(i1*100)/100);
end;

procedure TF_act_rec.E_old_T1Exit(Sender: TObject);
var i1,i2,i3:real;
begin
  if e_old_T1.Text='' then i1:=0 else i1:=strtofloat(e_old_T1.Text);
  if e_old_T2.Text='' then i2:=0 else i2:=strtofloat(e_old_T2.Text);
  if e_old_T3.Text='' then i3:=0 else i3:=strtofloat(e_old_T3.Text);
  i1:=i1+i2+i3;
  l_old_sum.Caption:=floattostr(round(i1*100)/100);
end;

procedure TF_act_rec.E_old_T1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    '.',',': // разделитель целой и дробной частей числа
        begin
          if Pos(DecimalSeparator,(Sender as TEdit).Text) <> 0
          then Key := Chr(0) // запрет ввода второго разделителя
          else Key := DecimalSeparator; // установим родной для ОС разделитель
        end
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;


procedure TF_act_rec.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TF_act_rec.Image1Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if Stage=psEnding then
    begin
      image1.Width:=sc1.Width-21;
      image1.Height:=trunc(image1.Picture.Height/(image1.Picture.Width/image1.Width));
      image1.Stretch:=true;
    end;
end;

procedure TF_act_rec.Image2Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if Stage=psEnding then
    begin
      image2.Width:=sc2.Width-21;
      image2.Height:=trunc(image2.Picture.Height/(image2.Picture.Width/image2.Width));
      image2.Stretch:=true;
    end;
end;

procedure TF_act_rec.Image3Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if Stage=psEnding then
    begin
      image3.Width:=sc3.Width-21;
      image3.Height:=trunc(image3.Picture.Height/(image3.Picture.Width/image3.Width));
      image3.Stretch:=true;
    end;
end;

end.

unit F02_pu_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, ExtDlgs,jpeg, ActnList;

type
  TF_pu_rec = class(TForm)
    Label1: TLabel;
    cb_tp: TComboBox;
    Label2: TLabel;
    E_fider: TEdit;
    Label3: TLabel;
    E_opore: TEdit;
    B_Opore_list: TBitBtn;
    Label4: TLabel;
    cb_model: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DT_install: TDateTimePicker;
    Label8: TLabel;
    cb_brig: TComboBox;
    Label9: TLabel;
    E_act: TEdit;
    cb_photo_status: TComboBox;
    cb_pay_status: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    B_Load_image: TBitBtn;
    B_Clear_image: TBitBtn;
    B_OK: TBitBtn;
    Panel1: TPanel;
    OPD1: TOpenPictureDialog;
    Image1: TImage;
    L_tp_point: TLabel;
    E_pu_sn: TEdit;
    E_plomb: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure E_plombKeyPress(Sender: TObject; var Key: Char);
    procedure E_pu_snKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Opore_listClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_Clear_imageClick(Sender: TObject);
    procedure B_Load_imageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_rec: TF_pu_rec;

implementation
uses DM, F03_pu_tp_point2, F02_pu;
{$R *.dfm}

function get_null_int(in_:string):string;
begin
//пустые убрать пробелы если етсь - можно рекурсией
  if in_='' then result:='null' else result:=in_;
end;

procedure TF_pu_rec.B_Clear_imageClick(Sender: TObject);
begin
  image1.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
  cb_photo_status.ItemIndex:=cb_photo_status.Items.IndexOfObject(tobject(1));
end;

procedure TF_pu_rec.B_Load_imageClick(Sender: TObject);
begin
  if opd1.Execute then
    begin
      image1.Picture:=nil;
      image1.Picture.Graphic:=nil;
      image1.Picture.Bitmap:=nil;
      image1.Picture.LoadFromFile(opd1.FileName);
    //подправить если изменится параметр в базе - это для автомата
      cb_photo_status.ItemIndex:=cb_photo_status.Items.IndexOfObject(tobject(2));
    end;
end;

function check_sn(sn_:string):boolean;
begin
  result:=true;
  if length(sn_)<>13 then
    begin
      showmessage('Длина серийного номера не соответсвует!');
      result:=false;
    end;
end;

function check_plomb(pl_:string):boolean;
begin
  result:=true;
  if not((length(pl_)=7) or (pl_='')) then
    begin
      showmessage('Длина номера пломбы не соответсвует');
      result:=false;
    end;
end;


procedure TF_pu_rec.B_OKClick(Sender: TObject);
var
  Ss  : TStringStream;
  St : string;
  jpg: TJpegImage;
begin
  if (f_pu_rec.Tag=0) and (not(check_sn(E_pu_sn.Text))) then exit;
  if (not(check_plomb(e_plomb.Text))) then exit;


  if (E_pu_sn.Text<>'') and (((f_pu_rec.Tag=0) and (dm1.check_sn_pu(e_pu_sn.Text)) and (dm1.check_plomb(e_plomb.Text))) or (f_pu_rec.Tag=1))
  then
    begin
    //работа с фото - удаляем старое загоняем новое если оно есть
      dm1.ZQ_pu_TMP.SQL.Text:='delete from pu_photo where pu_sn_a=:p_sn ;';
      dm1.ZQ_pu_TMP.ParamByName('p_sn').AsString:=E_pu_sn.Text;
      dm1.ZQ_pu_TMP.ExecSQL();

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
          dm1.ZQ_pu_TMP.SQL.Text:='insert into pu_photo value (:p_sn,:p_blob_img);';
          dm1.ZQ_pu_TMP.ParamByName('p_sn').AsString:=E_pu_sn.Text;
          dm1.ZQ_pu_TMP.ParamByName('p_blob_img').AsBlob := Ss.DataString;
          Ss.Free();
          dm1.ZQ_pu_TMP.ExecSQL();
        end;
      dm1.ZQ_pu_TMP.SQL.Clear();
      //новая запись или редактим
      if f_pu_rec.Tag=0 then
        begin
          //add
          dm1.ZQ_pu_TMP.SQL.Text:='insert into pu (pu_sn,id_tp_a,id_pu_model_a,pu_plomb,id_brig_a,date_install,id_photo_status_a, id_tp_point_a) '+
             'value ("'+e_pu_sn.Text+'",'+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+','+inttostr(integer(cb_model.Items.Objects[cb_model.ItemIndex]))+
             ',"'+e_plomb.Text+'",'+inttostr(integer(cb_brig.Items.Objects[cb_brig.ItemIndex]))+',"'+formatdatetime('yyyy-mm-dd',DT_install.Date)+'",'+
              inttostr(integer(cb_photo_status.Items.Objects[cb_photo_status.ItemIndex]))+','+get_null_int(l_tp_point.Caption)+');';
          dm1.ZQ_pu_TMP.ExecSQL();
          if l_tp_point.Caption<>'' then
            begin
              dm1.ZQ_pu_TMP.SQL.Text:='update tp_map_point set pu_sn_a="'+e_pu_sn.Text+'" where id_tp_point='+get_null_int(l_tp_point.Caption)+';';
              dm1.ZQ_pu_TMP.ExecSQL();
            end;
{*          dm1.ZQ_pu_TMP.SQL.Text:='SELECT pu_sn_a,sn_old_pu_tmp,FIO_tmp,p_number_tmp FROM tp_map_point WHERE pu_sn_a="'+e_pu_sn.Text+'";';
          dm1.ZQ_pu_TMP.Open();
          if dm1.ZQ_pu_TMP.RecordCount>0 then
            begin

            end;
*}            
        end
      else
        begin
          //edit
          dm1.ZQ_pu_TMP.SQL.Text:='update pu set id_tp_a='+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+',id_pu_model_a='+inttostr(integer(cb_model.Items.Objects[cb_model.ItemIndex]))+
            ',pu_plomb="'+e_plomb.Text+'",id_brig_a='+inttostr(integer(cb_brig.Items.Objects[cb_brig.ItemIndex]))+',date_install="'+formatdatetime('yyyy-mm-dd',DT_install.Date)+'",id_photo_status_a='+
            inttostr(integer(cb_photo_status.Items.Objects[cb_photo_status.ItemIndex]))+',id_tp_point_a='+get_null_int(l_tp_point.Caption)+
            ' where pu_sn="'+e_pu_sn.Text+'";';
          dm1.ZQ_pu_TMP.ExecSQL();
          dm1.ZQ_pu_TMP.SQL.Text:='update tp_map_point set pu_sn_a=null where id_tp_point='+get_null_int(dm1.ZQ_pu.FieldByName('id_tp_point_a').AsString)+';';
          dm1.ZQ_pu_TMP.ExecSQL();
          if l_tp_point.Caption<>'' then
            begin
//            dm1.zq_pu_TMP.SQL.Text:='update pu set id_tp_point_a=null where'+
              dm1.ZQ_pu_TMP.SQL.Text:='update tp_map_point set pu_sn_a="'+e_pu_sn.Text+'" where id_tp_point='+get_null_int(l_tp_point.Caption)+';';
              dm1.ZQ_pu_TMP.ExecSQL();
            end;
        end;
      dm1.ZQ_pu_TMP.SQL.Clear();
      f_pu.cb_tp.ItemIndex:=f_pu.cb_tp.Items.IndexOfObject(tobject(integer(cb_tp.Items.Objects[cb_tp.ItemIndex])));
      f_pu.B_Apply_filter.click();
      close();
    end
  else
    begin
      if e_pu_sn.Text='' then showmessage('ПУСТО!')
    end;
    
end;

function get_empty_str_for_point(st_:string):integer;
begin
  if st_='' then result:=0 else result:=strtoint(st_);
end;

function get_str_empty_for_point(in_:integer):string;
begin
  if in_=0 then result:='' else result:=inttostr(in_);
end;

procedure TF_pu_rec.B_Opore_listClick(Sender: TObject);
var s1,s2:string;
begin
  f_pu_rec.L_tp_point.Caption:=get_str_empty_for_point(f_pu_tp_point2.get_tp_point_show_opore(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]),
    get_empty_str_for_point(f_pu_rec.L_tp_point.Caption),s1,s2));
  e_fider.Text:=s1;
  e_opore.Text:=s2  
end;

procedure TF_pu_rec.E_plombKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_pu_rec.E_pu_snKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_pu_rec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  image1.Picture:=nil;
  image1.Picture.Graphic:=nil;
end;

end.

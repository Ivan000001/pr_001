unit F04_act_reestr_img;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,jpeg, ExtDlgs, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TF_act_reestr_img = class(TForm)
    SB: TScrollBox;
    Image1: TImage;
    B_load: TBitBtn;
    B_clear: TBitBtn;
    B_save: TBitBtn;
    B_OK: TBitBtn;
    OPD1: TOpenPictureDialog;
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_clearClick(Sender: TObject);
    procedure B_loadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_reestr_img: TF_act_reestr_img;

implementation
uses dm;
{$R *.dfm}

procedure TF_act_reestr_img.B_clearClick(Sender: TObject);
begin
  image1.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
end;

procedure TF_act_reestr_img.B_loadClick(Sender: TObject);
begin
  if opd1.Execute then
    begin
      image1.Picture:=nil;
      image1.Picture.Graphic:=nil;
      image1.Picture.Bitmap:=nil;
      image1.Picture.LoadFromFile(opd1.FileName);
    end;
end;

procedure TF_act_reestr_img.B_OKClick(Sender: TObject);
var
  Ss  : TStringStream;
  St : string;
  jpg: TJpegImage;
begin
  dm1.ZQ_act_reestr_TMP.SQL.Text:='delete from act_reestr_photo where id_act_reestr_a='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
  dm1.ZQ_act_reestr_TMP.ExecSQL();
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
      dm1.ZQ_act_reestr_TMP.SQL.Text:='insert into act_reestr_photo value (:p_act_reestr,:p_img);';
      dm1.ZQ_act_reestr_TMP.ParamByName('p_act_reestr').AsString:=dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
      dm1.ZQ_act_reestr_TMP.ParamByName('p_img').AsBlob := Ss.DataString;
      Ss.Free();
      dm1.ZQ_act_reestr_TMP.ExecSQL();
      dm1.ZQ_act_reestr_TMP.SQL.Text:='update act_reestr set id_photo_status_a=2 where id_act_reestr='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
      dm1.ZQ_act_reestr_TMP.ExecSQL();
    end
  else
    begin
      dm1.ZQ_act_reestr_TMP.SQL.Text:='update act_reestr set id_photo_status_a=1 where id_act_reestr='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
      dm1.ZQ_act_reestr_TMP.ExecSQL();
    end;
  dm1.ZQ_act_reestr_TMP.SQL.Clear();
  dm1.ZQ_act_reestr.Refresh();
  close;  
end;

procedure TF_act_reestr_img.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  image1.Picture:=nil;
  image1.Picture.Graphic:=nil;
  image1.Picture.Bitmap:=nil;
end;

end.

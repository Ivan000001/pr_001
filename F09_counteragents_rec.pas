unit F09_counteragents_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tf_counteragents_rec = class(TForm)
    Label1: TLabel;
    e_short: TEdit;
    Label2: TLabel;
    e_name: TEdit;
    Label3: TLabel;
    e_address: TEdit;
    B_OK: TBitBtn;
    Label4: TLabel;
    e_OKPO: TEdit;
    Label5: TLabel;
    cb_status: TComboBox;
    e_fio: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    e_jobs_post: TEdit;
    procedure e_OKPOKeyPress(Sender: TObject; var Key: Char);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_counteragents_rec: Tf_counteragents_rec;

implementation
uses dm;
{$R *.dfm}
function get_v(st_:string):string;
begin
  if st_<>'' then result:='"'+st_+'"' else result:='null';
end;

procedure Tf_counteragents_rec.B_OKClick(Sender: TObject);
begin
  if e_short.Text<>'' then
    begin
      if f_counteragents_rec.Tag=0 then
        begin
          dm1.zq_counteragents_TMP.SQL.Text:='insert into counteragents (name,short_name,OKPO,address,status,FIO,jobs_post) values ('+
            get_v(e_name.Text)+','+get_v(e_short.Text)+','+get_v(e_OKPO.Text)+','+get_v(e_address.Text)+','+inttostr(cb_status.ItemIndex+1)+
            ','+get_v(e_FIO.Text)+','+get_v(e_jobs_post.Text)+');';
          dm1.zq_counteragents_TMP.ExecSQL();
          dm1.zq_counteragents.Refresh();
          dm1.zq_counteragents_TMP.SQL.Clear();
          f_counteragents_rec.Close();
        end;
      if f_counteragents_rec.Tag=1 then
        begin
          dm1.zq_counteragents_TMP.SQL.Text:='update counteragents set name='+get_v(e_name.Text)+',short_name='+get_v(e_short.Text)+
            ',OKPO='+get_v(e_OKPO.Text)+',address='+get_v(e_address.Text)+',status='+inttostr(cb_status.ItemIndex+1)+
            ',FIO='+get_v(e_FIO.Text)+',jobs_post='+get_v(e_jobs_post.Text)+
            ' where id_counteragent='+dm1.zq_counteragents.FieldByName('id_counteragent').AsString+';';
          dm1.zq_counteragents_TMP.ExecSQL();
          dm1.zq_counteragents.Refresh();
          dm1.zq_counteragents_TMP.SQL.Clear();
          f_counteragents_rec.Close();
        end; 
    end
  else
    showmessage('ПУСТО');
end;

procedure Tf_counteragents_rec.e_OKPOKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure Tf_counteragents_rec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  e_short.Text:='';
  e_name.Text:='';
  e_address.Text:='';
  e_OKPO.Text:='';
  e_FIO.Text:='';
  e_jobs_post.Text:='';
  cb_status.ItemIndex:=0;
end;

end.

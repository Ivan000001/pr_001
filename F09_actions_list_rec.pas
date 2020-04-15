unit F09_actions_list_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_actions_list_rec = class(TForm)
    B_OK: TBitBtn;
    Label1: TLabel;
    e_code: TEdit;
    Label2: TLabel;
    e_job: TEdit;
    Label3: TLabel;
    cb_scale: TComboBox;
    Label4: TLabel;
    cb_status: TComboBox;
    procedure B_OKClick(Sender: TObject);
    procedure e_codeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_actions_list_rec: TF_actions_list_rec;

implementation
uses dm;
{$R *.dfm}

function get_v(st_:string):string;
begin
  if st_<>'' then result:='"'+st_+'"' else result:='null';
end;

procedure TF_actions_list_rec.B_OKClick(Sender: TObject);
begin
  if e_job.Text<>'' then
    begin
      if f_actions_list_rec.Tag=0 then
        begin
          dm1.zq_actions_list_TMP.SQL.Text:='insert into list_actions (code_action,descr_action,scale_action,status) values ('+
            get_v(e_code.Text)+','+get_v(e_job.Text)+','+get_v(cb_scale.Text)+','+inttostr(cb_status.ItemIndex+1)+');';
          dm1.zq_actions_list_TMP.ExecSQL();
          dm1.zq_actions_list.Refresh();
          dm1.zq_actions_list_TMP.SQL.Clear();
          f_actions_list_rec.Close();
        end;
      if f_actions_list_rec.Tag=1 then
        begin
          dm1.zq_actions_list_TMP.SQL.Text:='update list_actions set code_action='+get_v(e_code.Text)+',descr_action='+get_v(e_job.Text)+
            ',scale_action='+get_v(cb_scale.Text)+',status='+inttostr(cb_status.ItemIndex+1)+
            ' where id_action='+dm1.zq_actions_list.FieldByName('id_action').AsString+';';
          dm1.zq_actions_list_TMP.ExecSQL();
          dm1.zq_actions_list.Refresh();
          dm1.zq_actions_list_TMP.SQL.Clear();
          f_actions_list_rec.Close();
        end;
    end
  else
    showmessage('ПУСТО');
end;

procedure TF_actions_list_rec.e_codeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

end.

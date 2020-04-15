unit F04_act_reestr_gen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TF_act_reestr_gen = class(TForm)
    cb_tp: TComboBox;
    DT_gen: TDateTimePicker;
    B_OK: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cb_type_reestr: TComboBox;
    procedure B_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_reestr_gen: TF_act_reestr_gen;

implementation
uses dm,lib_cb;
{$R *.dfm}

procedure TF_act_reestr_gen.B_OKClick(Sender: TObject);
var str:Tstringlist;
i:integer;
begin
  dm1.ZQ_act_reestr_TMP.SQL.Text:='select pu_sn from pu where id_tp_a='+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+
    ' and date_sign="'+formatdatetime('yyyy-mm-dd',DT_gen.Date)+'" and id_abonent_status_a=1 and ';
    if cb_type_reestr.Text='B' then dm1.ZQ_act_reestr_TMP.SQL.Add('id_act_status_a=4 ')
      else dm1.ZQ_act_reestr_TMP.SQL.Add('id_act_status_a=2 and  not pu_sn in (SELECT pu_sn_a AS pu_sn FROM act_reestr_detail);');
  dm1.ZQ_act_reestr_TMP.Open();
  if dm1.ZQ_act_reestr_TMP.RecordCount>0 then
    begin
      str:=tstringlist.Create();
      dm1.ZQ_act_reestr_TMP.First();
      while not(dm1.ZQ_act_reestr_TMP.Eof) do
        begin
          str.Add(dm1.ZQ_act_reestr_TMP.FieldByName('pu_sn').AsString);
          dm1.ZQ_act_reestr_TMP.Next();
        end;
      dm1.ZQ_act_reestr_TMP.Close();
      dm1.ZQ_act_reestr_TMP.SQL.Text:='insert into act_reestr (id_tp_a,date_create,id_act_status_a,type_reestr) '+
        'value ('+inttostr(integer(cb_tp.Items.Objects[cb_tp.ItemIndex]))+',"'+formatdatetime('yyyy-mm-dd',DT_gen.Date)+'",';
        if cb_type_reestr.Text='B' then dm1.ZQ_act_reestr_TMP.SQL.Add('4,"B");')
          else dm1.ZQ_act_reestr_TMP.SQL.Add('2,"A");');
      dm1.ZQ_act_reestr_TMP.ExecSQL();
      dm1.ZQ_act_reestr_TMP.SQL.Text:='insert into act_reestr_detail value ';
      for i := 0 to str.Count - 1 do
        begin
          dm1.ZQ_act_reestr_TMP.SQL.Add('(last_insert_id(),"'+str[i]+'")');
          if i<str.Count-1 then dm1.ZQ_act_reestr_TMP.SQL.Add(',');
        end;
      dm1.ZQ_act_reestr_TMP.ExecSQL();
      dm1.ZQ_act_reestr.Refresh();
    end
  else
    showmessage('Нечего добавлять');
  dm1.ZQ_act_reestr_TMP.Close();  
  dm1.ZQ_act_reestr_TMP.SQL.Clear();
  close();
end;

procedure TF_act_reestr_gen.FormShow(Sender: TObject);
begin
  get_list_cb_tp(cb_tp);
//  cb_tp.itemindex:=cb_tp.Items.IndexOfObject(tobject(10));
  dt_gen.Date:=now();
end;

end.

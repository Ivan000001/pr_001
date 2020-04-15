unit F09_contracts_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TF_contracts_rec = class(TForm)
    Label1: TLabel;
    e_contract: TEdit;
    cb_one: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cb_two: TComboBox;
    B_reload: TBitBtn;
    B_counteragents: TBitBtn;
    cb_status: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    DT_sign: TDateTimePicker;
    B_OK: TBitBtn;
    procedure B_OKClick(Sender: TObject);
    procedure B_reloadClick(Sender: TObject);
    procedure B_counteragentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_contracts_rec: TF_contracts_rec;

implementation

uses dm,F09_counteragents,lib_cb;

{$R *.dfm}

procedure TF_contracts_rec.B_counteragentsClick(Sender: TObject);
begin
  f_counteragents.show();
end;

function get_v(st_:string):string;
begin
  if st_<>'' then result:='"'+st_+'"' else result:='null';
end;

procedure TF_contracts_rec.B_OKClick(Sender: TObject);
begin
  if e_contract.Text<>'' then
    begin
      if f_contracts_rec.Tag=0 then
        begin
          if (cb_one.Text<>'') and (cb_two.Text<>'') then
            begin
              dm1.zq_contracts_TMP.SQL.Text:='insert into contracts (contract_name,date_sign,id_counteragent_one_a,id_counteragent_two_a,contract_status) values ('+
                get_v(e_contract.Text)+','+get_v(formatdatetime('yyyy-mm-dd',DT_sign.Date))+','+
                inttostr(integer(cb_one.Items.Objects[cb_one.ItemIndex]))+','+inttostr(integer(cb_two.Items.Objects[cb_two.ItemIndex]))+','+inttostr(cb_status.ItemIndex+1)+');';
              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts.Refresh();
              dm1.zq_contracts_TMP.SQL.Clear();
              f_contracts_rec.Close();
            end
          else showmessage('поля заказчик и исполнитель не должны быть пустые!')
        end;
      if f_contracts_rec.Tag=1 then
        begin
          if (cb_one.Text<>'') and (cb_two.Text<>'') then
            begin
              dm1.zq_contracts_TMP.SQL.Text:='update contracts set contract_name='+get_v(e_contract.Text)+',date_sign='+get_v(formatdatetime('yyyy-mm-dd',DT_sign.Date))+
                ',id_counteragent_one_a='+inttostr(integer(cb_one.Items.Objects[cb_one.ItemIndex]))+',id_counteragent_two_a='+inttostr(integer(cb_two.Items.Objects[cb_two.ItemIndex]))+',contract_status='+inttostr(cb_status.ItemIndex+1)+
                ' where id_contract='+dm1.zq_contracts.FieldByName('id_contract').AsString+';';
              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts.Refresh();
              dm1.zq_contracts_TMP.SQL.Clear();
              f_contracts_rec.Close();
            end
          else showmessage('поля заказчик и исполнитель не должны быть пустые!')
        end;
    end
  else
    showmessage('ПУСТО');
end;

procedure TF_contracts_rec.B_reloadClick(Sender: TObject);
begin
  if F_contracts_rec.Tag=0 then
    begin
      get_list_cb_countragents(cb_one,2);
      cb_one.Text:='';
      get_list_cb_countragents(cb_two,2);
      cb_two.Text:='';
    end;
  if F_contracts_rec.Tag=1 then
    begin
      get_list_cb_countragents(cb_one,0);
      cb_one.Text:='';
      get_list_cb_countragents(cb_two,0);
      cb_two.Text:='';
    end;
end;

end.

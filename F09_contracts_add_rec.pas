unit F09_contracts_add_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TF_contracts_add_rec = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    e_contract: TEdit;
    cb_one: TComboBox;
    cb_two: TComboBox;
    cb_status: TComboBox;
    DT_sign: TDateTimePicker;
    Label6: TLabel;
    e_contract_add: TEdit;
    Label7: TLabel;
    DT_add_sign: TDateTimePicker;
    B_OK: TBitBtn;
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_contracts_add_rec: TF_contracts_add_rec;

implementation
uses dm;
{$R *.dfm}

function get_v(st_:string):string;
begin
  if st_<>'' then result:='"'+st_+'"' else result:='null';
end;

procedure TF_contracts_add_rec.B_OKClick(Sender: TObject);
begin
  if e_contract_add.Text<>'' then
    begin
      if f_contracts_add_rec.Tag=0 then
        begin
          if (cb_one.Text<>'') and (cb_two.Text<>'') then
            begin
              dm1.zq_contracts_TMP.SQL.Text:='update contracts set contract_status=1 where contract_name='+get_v(e_contract.Text)+';';
              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts_TMP.SQL.Text:='insert into contracts (contract_name,date_sign,contract_add,date_add_sign,id_counteragent_one_a,id_counteragent_two_a,contract_status) values ('+
                get_v(e_contract.Text)+','+get_v(formatdatetime('yyyy-mm-dd',DT_sign.Date))+','+
                get_v(e_contract_add.Text)+','+get_v(formatdatetime('yyyy-mm-dd',DT_add_sign.Date))+','+
                inttostr(integer(cb_one.Items.Objects[cb_one.ItemIndex]))+','+inttostr(integer(cb_two.Items.Objects[cb_two.ItemIndex]))+', 2);';
              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts.Refresh();
              dm1.zq_contracts_TMP.SQL.Clear();
              f_contracts_add_rec.Close();
            end
          else showmessage('поля заказчик и исполнитель не должны быть пустые!')
        end;
      if f_contracts_add_rec.Tag=1 then
        begin
          if (cb_one.Text<>'') and (cb_two.Text<>'') then
            begin
//              dm1.zq_contracts_TMP.SQL.Text:='update contracts set contract_status=1 where contract_name='+get_v(e_contract.Text)+';';
//              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts_TMP.SQL.Text:='update contracts set contract_add='+get_v(e_contract_add.Text)+',date_add_sign='+get_v(formatdatetime('yyyy-mm-dd',DT_add_sign.Date))+
                ' where id_contract='+dm1.zq_contracts.FieldByName('id_contract').AsString+';';
              dm1.zq_contracts_TMP.ExecSQL();
              dm1.zq_contracts.Refresh();
              dm1.zq_contracts_TMP.SQL.Clear();
              f_contracts_add_rec.Close();
            end
          else showmessage('поля заказчик и исполнитель не должны быть пустые!')
        end;
    end
  else
    showmessage('ПУСТО');
end;

end.



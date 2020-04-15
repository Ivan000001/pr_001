unit F08_pu_pay_act_change_status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_pu_pay_act_change_status = class(TForm)
    B_OK: TBitBtn;
    cb_pu_pay_act_status: TComboBox;
    Label1: TLabel;
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_pay_act_change_status: TF_pu_pay_act_change_status;

implementation
uses dm;
{$R *.dfm}

procedure TF_pu_pay_act_change_status.B_OKClick(Sender: TObject);
begin
  dm1.ZQ_pu_pay_TMP.SQL.Text:='update pu set id_pu_pay_status_a='+inttostr(integer(cb_pu_pay_act_status.Items.Objects[cb_pu_pay_act_status.ItemIndex]))+' where pu_sn in (select pu_sn_a from pu_pay_doc_detail where id_pu_pay_doc_a='+dm1.ZQ_pu_pay_act.FieldByName('id_pu_pay_doc').AsString+');';
  dm1.ZQ_pu_pay_TMP.ExecSQL();
  dm1.ZQ_pu_pay_TMP.SQL.Text:='update pu_pay_doc set id_pu_pay_status_a='+inttostr(integer(cb_pu_pay_act_status.Items.Objects[cb_pu_pay_act_status.ItemIndex]))+' where id_pu_pay_doc='+dm1.ZQ_pu_pay_act.FieldByName('id_pu_pay_doc').AsString;
  dm1.ZQ_pu_pay_TMP.ExecSQL();
  dm1.ZQ_pu_pay_TMP.SQL.Clear();
  close();
end;

end.

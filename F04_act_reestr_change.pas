unit F04_act_reestr_change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_act_reestr_change = class(TForm)
    cb_act_status: TComboBox;
    B_OK: TBitBtn;
    Label1: TLabel;
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_reestr_change: TF_act_reestr_change;

implementation
uses dm,lib_cb;
{$R *.dfm}

procedure TF_act_reestr_change.B_OKClick(Sender: TObject);
begin
  dm1.ZQ_act_reestr_TMP.SQL.Text:='UPDATE pu SET id_act_status_a='+inttostr(integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex]));
  dm1.ZQ_act_reestr_TMP.SQL.Add(' WHERE pu_sn IN (SELECT pu_sn_a FROM act_reestr_detail WHERE id_act_reestr_a='+ dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString+');');
  dm1.ZQ_act_reestr_TMP.ExecSQL();
  dm1.ZQ_act_reestr_TMP.SQL.Text:='update act_reestr set id_act_status_a='+inttostr(integer(cb_act_status.Items.Objects[cb_act_status.ItemIndex]))+
    ' where id_act_reestr='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString+';';
  dm1.ZQ_act_reestr_TMP.ExecSQL();
  dm1.ZQ_act_reestr.Refresh();
  dm1.ZQ_act_reestr_TMP.SQL.Clear();
  close();
end;

end.

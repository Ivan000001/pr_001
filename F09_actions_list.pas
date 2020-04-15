unit F09_actions_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_actions_list = class(TForm)
    B_add: TBitBtn;
    DBGrid1: TDBGrid;
    B_edit: TBitBtn;
    B_del: TBitBtn;
    procedure B_delClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure B_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_actions_list: TF_actions_list;

implementation
uses dm, F09_actions_list_rec, F09_contract_detail_rec;
{$R *.dfm}

procedure TF_actions_list.B_addClick(Sender: TObject);
begin
  with F_actions_list_rec do
    begin
      e_code.Text:='';
      e_job.Text:='';
      cb_scale.ItemIndex:=0;
      cb_status.ItemIndex:=1;
      Tag:=0;
      showmodal();
    end;
end;

procedure TF_actions_list.B_delClick(Sender: TObject);
begin
  if dm1.zq_actions_list.RecordCount>0 then
    begin
      dm1.zq_actions_list_TMP.SQL.Text:='delete from list_actions where id_action='+dm1.zq_actions_list.FieldByName('id_action').AsString+';';
      dm1.zq_actions_list_TMP.ExecSQL();
      dm1.zq_actions_list.Refresh();
    end;
end;

procedure TF_actions_list.B_editClick(Sender: TObject);
begin
  if dm1.zq_actions_list.RecordCount>0 then
    begin
      with F_actions_list_rec do
        begin
          e_code.Text:=dm1.zq_actions_list.FieldByName('code_action').AsString;
          e_job.Text:=dm1.zq_actions_list.FieldByName('descr_action').AsString;
          cb_scale.Text:=dm1.zq_actions_list.FieldByName('scale_action').AsString;
          cb_status.ItemIndex:=dm1.zq_actions_list.FieldByName('status').AsInteger-1;
          Tag:=1;
          showmodal();
        end;
    end;
end;

procedure TF_actions_list.DBGrid1DblClick(Sender: TObject);
begin
  if f_actions_list.Tag=3 then
    begin
      f_contract_detail_rec.e_code.Text:=dm1.zq_actions_list.FieldByName('code_action').AsString;
      f_contract_detail_rec.e_job.Text:=dm1.zq_actions_list.FieldByName('descr_action').AsString;
      f_contract_detail_rec.e_scale.Text:=dm1.zq_actions_list.FieldByName('scale_action').AsString;
      f_contract_detail_rec.l_select_id.Caption:=dm1.zq_actions_list.FieldByName('id_action').AsString;
      f_contract_detail_rec.e_price.SetFocus();
      close();
    end;
end;

procedure TF_actions_list.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_actions_list.Tag:=0;
  dm1.zq_actions_list.Close();
end;

procedure TF_actions_list.FormShow(Sender: TObject);
begin
  dm1.zq_actions_list.Close();
  dm1.zq_actions_list.Open();
end;

end.

unit F09_contracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_contracts = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    B_counteragents: TBitBtn;
    B_c_add: TBitBtn;
    B_c_edit: TBitBtn;
    B_c_del: TBitBtn;
    B_add: TBitBtn;
    B_edit: TBitBtn;
    B_del: TBitBtn;
    B_actions: TBitBtn;
    B_a_add: TBitBtn;
    B_a_edit: TBitBtn;
    procedure B_delClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure B_addClick(Sender: TObject);
    procedure B_actionsClick(Sender: TObject);
    procedure B_a_editClick(Sender: TObject);
    procedure B_a_addClick(Sender: TObject);
    procedure B_c_delClick(Sender: TObject);
    procedure B_c_editClick(Sender: TObject);
    procedure B_c_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure B_counteragentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_contracts: TF_contracts;

implementation

uses dm,F09_counteragents, F09_contracts_rec,lib_cb, F09_contracts_add_rec,
  F09_actions_list, F09_contract_detail_rec;

{$R *.dfm}

procedure TF_contracts.B_actionsClick(Sender: TObject);
begin
  f_actions_list.tag:=0;
  dm1.zq_actions_list.ParamByName('p_contract').AsInteger:=0;
  f_actions_list.show();
end;

procedure TF_contracts.B_addClick(Sender: TObject);
begin
  if dm1.zq_contracts.RecordCount>0 then
    begin
      with f_contract_detail_rec do
        begin
          B_show.Enabled:=true;
          l_select_id.Caption:='';
          e_code.text:='';
          e_job.text:='';
          e_scale.Text:='';
          e_price.text:='';
          Tag:=0;
          showmodal();
        end;
    end;
end;

procedure TF_contracts.B_a_addClick(Sender: TObject);
begin
  if dm1.zq_contracts.RecordCount>0 then
    begin
      with f_contracts_add_rec do
        begin
          e_contract.Text:=dm1.zq_contracts.FieldByName('contract_name').AsString;
          dt_sign.Date:=dm1.zq_contracts.FieldByName('date_sign').AsDateTime;
          cb_status.ItemIndex:=dm1.zq_contracts.FieldByName('contract_status').AsInteger-1;
          get_list_cb_countragents(cb_one,0);
          cb_one.ItemIndex:=cb_one.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_one_a').AsInteger));
          get_list_cb_countragents(cb_two,0);
          cb_two.ItemIndex:=cb_two.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_two_a').AsInteger));
          e_contract_add.text:='';
          dt_add_sign.date:=now();
          Tag:=0;
          showmodal();
        end;
    end;
end;

procedure TF_contracts.B_a_editClick(Sender: TObject);
begin
  if (dm1.zq_contracts.RecordCount>0) and (not(dm1.zq_contracts.FieldByName('contract_add').IsNull)) then
    begin
      with f_contracts_add_rec do
        begin
          e_contract.Text:=dm1.zq_contracts.FieldByName('contract_name').AsString;
          dt_sign.Date:=dm1.zq_contracts.FieldByName('date_sign').AsDateTime;
          cb_status.ItemIndex:=dm1.zq_contracts.FieldByName('contract_status').AsInteger-1;
          get_list_cb_countragents(cb_one,0);
          cb_one.ItemIndex:=cb_one.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_one_a').AsInteger));
          get_list_cb_countragents(cb_two,0);
          cb_two.ItemIndex:=cb_two.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_two_a').AsInteger));
          e_contract_add.text:=dm1.zq_contracts.FieldByName('contract_add').AsString;
          dt_add_sign.date:=dm1.zq_contracts.FieldByName('date_add_sign').AsDateTime;;
          Tag:=1;
          showmodal();
        end;
    end;
end;

procedure TF_contracts.B_counteragentsClick(Sender: TObject);
begin
  f_counteragents.show();
end;

procedure TF_contracts.B_c_addClick(Sender: TObject);
begin
  with f_contracts_rec do
    begin
      e_contract.Text:='';
      dt_sign.Date:=now();
      cb_status.ItemIndex:=1;
      get_list_cb_countragents(cb_one,2);
      cb_one.Text:='';
      get_list_cb_countragents(cb_two,2);
      cb_two.Text:='';
      Tag:=0;
      showmodal();
    end;
end;

procedure TF_contracts.B_c_delClick(Sender: TObject);
begin
//нужно учесть что добавляется и допники по полю с add - статус надо менять
  showmessage('DEMO');
end;

procedure TF_contracts.B_c_editClick(Sender: TObject);
begin
  if (dm1.zq_contracts.RecordCount>0) and (dm1.zq_contracts.FieldByName('contract_add').IsNull) then
    begin
        with f_contracts_rec do
          begin
            e_contract.Text:=dm1.zq_contracts.FieldByName('contract_name').AsString;
            dt_sign.Date:=dm1.zq_contracts.FieldByName('date_sign').AsDateTime;
            cb_status.ItemIndex:=dm1.zq_contracts.FieldByName('contract_status').AsInteger-1;
            get_list_cb_countragents(cb_one,0);
            cb_one.ItemIndex:=cb_one.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_one_a').AsInteger));
            get_list_cb_countragents(cb_two,0);
            cb_two.ItemIndex:=cb_two.Items.IndexOfObject(tobject(dm1.zq_contracts.FieldByName('id_counteragent_two_a').AsInteger));
            Tag:=1;
            showmodal();
          end;
    end;
end;

procedure TF_contracts.B_delClick(Sender: TObject);
begin
  if dm1.zq_contract_price.RecordCount>0 then
    begin
      dm1.zq_contracts_TMP.SQL.Text:='delete from contract_price where id_contract_price='+dm1.zq_contract_price.FieldByName('id_contract_price').AsString+';';
      dm1.zq_contracts_TMP.ExecSQL();
      dm1.zq_contract_price.Refresh();
      dm1.zq_contracts_TMP.SQL.Clear();
    end;
end;

procedure TF_contracts.B_editClick(Sender: TObject);
begin
  if dm1.zq_contract_price.RecordCount>0 then
    begin
      with f_contract_detail_rec do
        begin
          B_show.Enabled:=false;
          l_select_id.Caption:=dm1.zq_contract_price.FieldByName('id_action_a').AsString;
          e_code.text:=dm1.zq_contract_price.FieldByName('code_action').AsString;
          e_job.text:=dm1.zq_contract_price.FieldByName('descr_action').AsString;
          e_scale.Text:=dm1.zq_contract_price.FieldByName('scale_action').AsString;
          e_price.text:=dm1.zq_contract_price.FieldByName('price').AsString;
          Tag:=1;
          showmodal();
        end;
    end;
end;

procedure TF_contracts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.zq_contracts.Close();
end;

procedure TF_contracts.FormShow(Sender: TObject);
begin
  dm1.zq_contracts.Close();
  dm1.zq_contracts.Open();
end;

end.

unit DM;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZDataset, ZAbstractConnection,
  ZConnection, ZSqlUpdate, ZAbstractDataset, ZAbstractTable,dialogs;

type
  TDM1 = class(TDataModule)
    ZConnection1: TZConnection;
    ZQ_tp_map: TZReadOnlyQuery;
    ZQ_tp_point: TZReadOnlyQuery;
    DS_tp_map: TDataSource;
    DS_tp_point: TDataSource;
    ZQ_lib_cb_TMP: TZReadOnlyQuery;
    ZT_tp: TZTable;
    DS_tp: TDataSource;
    ZQ_tp_map_TMP: TZReadOnlyQuery;
    ZQ_pu: TZReadOnlyQuery;
    ZQ_pu_TMP: TZReadOnlyQuery;
    DS_pu: TDataSource;
    ZQ_pu_tp_point_SN: TZReadOnlyQuery;
    ZQ_pu_tp_point_TMP: TZReadOnlyQuery;
    DS_pu_tp_point_SN: TDataSource;
    ZQ_pu_tp_point_TP: TZReadOnlyQuery;
    DS_pu_tp_point_TP: TDataSource;
    DS_street: TDataSource;
    ZT_street: TZTable;
    ZQ_act: TZReadOnlyQuery;
    DS_act: TDataSource;
    ZQ_act_TMP: TZReadOnlyQuery;
    ZQ_act_reestr: TZReadOnlyQuery;
    ZQ_act_reestr_detail: TZReadOnlyQuery;
    DS_act_reestr: TDataSource;
    DS_act_reestr_detail: TDataSource;
    ZQ_act_reestr_TMP: TZReadOnlyQuery;
    ZQ_pu_upload: TZReadOnlyQuery;
    ZQ_act_upload: TZReadOnlyQuery;
    DS_pu_upload: TDataSource;
    DS_act_upload: TDataSource;
    ZQ_check: TZReadOnlyQuery;
    ZQ_fiz18_search: TZReadOnlyQuery;
    DS_fiz18_search: TDataSource;
    ZQ_pu_pay_act: TZReadOnlyQuery;
    DS_pu_pay_act: TDataSource;
    ZQ_pu_pay_act_detail: TZReadOnlyQuery;
    DS_pu_pay_act_detail: TDataSource;
    ZQ_pu_pay_not_list: TZReadOnlyQuery;
    DS_pu_pay_not_list: TDataSource;
    ZQ_pu_pay_RAM: TZReadOnlyQuery;
    DS_pu_pay_RAM: TDataSource;
    ZQ_pu_pay_TMP: TZReadOnlyQuery;
    ZQ_pu_pay_TMP2: TZReadOnlyQuery;
    ZQ_tp_plan: TZReadOnlyQuery;
    ZQ_tp_plan_gw: TZReadOnlyQuery;
    ZQ_tp_plan_bpu: TZReadOnlyQuery;
    DS_tp_plan: TDataSource;
    DS_tp_plan_bpu: TDataSource;
    DS_tp_plan_gw: TDataSource;
    zq_tp_plan_TMP: TZReadOnlyQuery;
    ZQ_bpu: TZReadOnlyQuery;
    DS_bpu: TDataSource;
    zq_bpu_TMP: TZReadOnlyQuery;
    zq_gw_TMP: TZReadOnlyQuery;
    zq_gw: TZReadOnlyQuery;
    DS_gw: TDataSource;
    zq_counteragents: TZReadOnlyQuery;
    zq_contracts: TZReadOnlyQuery;
    zq_contracts_TMP: TZReadOnlyQuery;
    DS_counteragents: TDataSource;
    zq_counteragents_TMP: TZReadOnlyQuery;
    DS_contracts: TDataSource;
    zq_contract_price: TZReadOnlyQuery;
    DS_contract_price: TDataSource;
    zq_actions_list: TZReadOnlyQuery;
    zq_actions_list_TMP: TZReadOnlyQuery;
    DS_actions_list: TDataSource;
    zq_contract_priceid_contract_price: TIntegerField;
    zq_contract_priceid_contract_a: TIntegerField;
    zq_contract_priceid_action_a: TIntegerField;
    zq_contract_priceprice: TFloatField;
    zq_contract_pricecode_action: TStringField;
    zq_contract_pricedescr_action: TStringField;
    zq_contract_pricescale_action: TStringField;
    zq_ks: TZReadOnlyQuery;
    DS_ks: TDataSource;
    zq_ks_detail: TZReadOnlyQuery;
    DS_ks_detail: TDataSource;
    zq_ks_detailid_ks_action: TIntegerField;
    zq_ks_detailid_ks_a: TIntegerField;
    zq_ks_detailid_action_a: TIntegerField;
    zq_ks_detailcount_: TFloatField;
    zq_ks_detailid_action: TIntegerField;
    zq_ks_detailcode_action: TStringField;
    zq_ks_detaildescr_action: TStringField;
    zq_ks_detailscale_action: TStringField;
    zq_ks_detailprice: TFloatField;
    zq_ks_detailsum_: TFloatField;
    zq_ksid_ks: TIntegerField;
    zq_ksnumber_doc: TIntegerField;
    zq_ksin_out: TSmallintField;
    zq_ksdate_create: TDateField;
    zq_ksdate_from: TDateField;
    zq_ksdate_to: TDateField;
    zq_ksid_contract_a: TIntegerField;
    zq_ksNDS: TFloatField;
    zq_ksks_status: TSmallintField;
    zq_kscontract_name: TStringField;
    zq_kscontract_status: TStringField;
    zq_kss_name1: TStringField;
    zq_kss_name2: TStringField;
    zq_ksdescr_status: TStringField;
    zq_ks_TMP: TZReadOnlyQuery;
    zq_ks_content_show: TZReadOnlyQuery;
    DS_ks_content_show: TDataSource;
    zq_ks_content_showid_action_a: TIntegerField;
    zq_ks_content_showcode_action: TStringField;
    zq_ks_content_showdescr_action: TStringField;
    zq_ks_content_showscale_action: TStringField;
    zq_ks_content_showprice: TFloatField;
    zq_ks_content_pu: TZReadOnlyQuery;
    DS_ks_content_pu: TDataSource;
    DS_ks_content_pu_not: TDataSource;
    zq_ks_content_pu_not: TZReadOnlyQuery;
    procedure DS_ks_content_puDataChange(Sender: TObject; Field: TField);
    procedure DS_ksDataChange(Sender: TObject; Field: TField);
    procedure DS_contractsDataChange(Sender: TObject; Field: TField);
    procedure DS_tp_planDataChange(Sender: TObject; Field: TField);
    procedure DS_pu_pay_actDataChange(Sender: TObject; Field: TField);
    procedure DS_act_reestrDataChange(Sender: TObject; Field: TField);
    procedure DS_tp_mapDataChange(Sender: TObject; Field: TField);
    function check_sn_pu(sn_:string):boolean;
    function check_plomb(pl_:string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

function TDM1.check_plomb(pl_: string): boolean;
begin
  if pl_<>'' then    //если нет пломбы номера, то пропустим на выполнение
    begin
      zq_check.Close();
      zq_check.SQL.Text:='select pu_sn from pu where pu_plomb="'+pl_+'" limit 1';
      zq_check.Open();
      if zq_check.RecordCount>0 then
        begin
          showmessage('Такой Пломба есть!');
          result:=false
        end
      else result:=true;
      zq_check.Close();
      zq_check.SQL.Clear();
    end
   else result:=true;
end;

function TDM1.check_sn_pu(sn_: string): boolean;
begin
  zq_check.Close();
  zq_check.SQL.Text:='select pu_sn from pu where pu_sn="'+sn_+'" limit 1';
  zq_check.Open();
  if zq_check.RecordCount>0 then
    begin
      showmessage('Так Серийник есть!');
      result:=false
    end
  else result:=true;
  zq_check.Close();
  zq_check.SQL.Clear();
end;

procedure TDM1.DS_act_reestrDataChange(Sender: TObject; Field: TField);
begin
  zq_act_reestr_detail.ParamByName('p_act_reestr').AsInteger:=zq_act_reestr.FieldByName('id_act_reestr').AsInteger;
  zq_act_reestr_detail.Open();
  zq_act_reestr_detail.Refresh();
end;

procedure TDM1.DS_contractsDataChange(Sender: TObject; Field: TField);
begin
  zq_contract_price.ParamByName('p_contract').AsInteger:=zq_contracts.FieldByName('id_contract').AsInteger;
  if zq_contract_price.Active=true
    then zq_contract_price.Refresh()
    else zq_contract_price.Open();
end;

procedure TDM1.DS_ksDataChange(Sender: TObject; Field: TField);
begin
  zq_ks_detail.ParamByName('p_ks').AsInteger:=dm1.zq_ks.FieldByName('id_ks').AsInteger;
  zq_ks_detail.Open();
  zq_ks_detail.Refresh();
end;

procedure TDM1.DS_ks_content_puDataChange(Sender: TObject; Field: TField);
begin
  zq_ks_content_pu_not.Open();
  zq_ks_content_pu_not.Refresh();
end;

procedure TDM1.DS_pu_pay_actDataChange(Sender: TObject; Field: TField);
begin
  ZQ_pu_pay_act_detail.ParamByName('p_doc').AsInteger:=zq_pu_pay_act.FieldByName('id_pu_pay_doc').AsInteger;
  ZQ_pu_pay_act_detail.Open();
  ZQ_pu_pay_act_detail.Refresh();
end;

procedure TDM1.DS_tp_mapDataChange(Sender: TObject; Field: TField);
begin
  zq_tp_point.ParamByName('p_tp').AsInteger:=zq_tp_map.FieldByName('id_tp_a').AsInteger;
  zq_tp_point.ParamByName('p_fider').AsInteger:=zq_tp_map.FieldByName('fider').AsInteger;
  zq_tp_point.ParamByName('p_opore').AsString:=zq_tp_map.FieldByName('opore').AsString;
  zq_tp_point.Open();
  zq_tp_point.Refresh();
end;

procedure TDM1.DS_tp_planDataChange(Sender: TObject; Field: TField);
begin
  zq_tp_plan_bpu.ParamByName('p_tp').AsInteger:=zq_tp_plan.FieldByName('id_tp').AsInteger;
  zq_tp_plan_gw.ParamByName('p_tp').AsInteger:=zq_tp_plan.FieldByName('id_tp').AsInteger;
  zq_tp_plan_bpu.Open();
  zq_tp_plan_bpu.Refresh();
  zq_tp_plan_gw.Open();
  zq_tp_plan_gw.Refresh();
end;

end.

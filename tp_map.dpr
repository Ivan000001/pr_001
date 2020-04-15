program tp_map;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  DM in 'DM.pas' {DM1: TDataModule},
  F01_tp_map in 'F01_tp_map.pas' {F_tp_map},
  lib_cb in 'lib_cb.pas',
  F01_tp in 'F01_tp.pas' {F_tp},
  F01_opore_rec in 'F01_opore_rec.pas' {F_opore_rec},
  F01_tp_point in 'F01_tp_point.pas' {F_tp_point},
  F02_pu in 'F02_pu.pas' {F_pu},
  F02_pu_rec in 'F02_pu_rec.pas' {F_pu_rec},
  F03_pu_tp_point in 'F03_pu_tp_point.pas' {F_pu_tp_point},
  F03_pu_tp_point2 in 'F03_pu_tp_point2.pas' {F_pu_tp_point2},
  F04_act in 'F04_act.pas' {F_act},
  F04_act_reestr in 'F04_act_reestr.pas' {F_act_reestr},
  F04_act_rec in 'F04_act_rec.pas' {F_act_rec},
  F04_act_reestr_gen in 'F04_act_reestr_gen.pas' {F_act_reestr_gen},
  F04_act_reestr_change in 'F04_act_reestr_change.pas' {F_act_reestr_change},
  F05_act_upload in 'F05_act_upload.pas' {F_act_upload},
  F06_exp_montage in 'F06_exp_montage.pas' {F_exp_montage},
  lib_export_xls in 'lib_export_xls.pas',
  F06_exp_act_reestr in 'F06_exp_act_reestr.pas' {F_exp_act_reestr},
  F07_fiz18_search in 'F07_fiz18_search.pas' {F_fiz18_search},
  F06_exp_not_sign in 'F06_exp_not_sign.pas' {F_exp_not_sign},
  F08_pu_pay_act in 'F08_pu_pay_act.pas' {F_pu_pay_act},
  F08_pu_pay_act_change_status in 'F08_pu_pay_act_change_status.pas' {F_pu_pay_act_change_status},
  F08_pu_pay_act_rec in 'F08_pu_pay_act_rec.pas' {F_pu_pay_act_rec},
  F01_tp_plan in 'F01_tp_plan.pas' {F_tp_plan},
  F02_bpu in 'F02_bpu.pas' {F_bpu},
  F02_bpu_rec in 'F02_bpu_rec.pas' {F_bpu_rec},
  F02_gw in 'F02_gw.pas' {F_gw},
  F02_gw_rec in 'F02_gw_rec.pas' {F_gw_rec},
  F10_ks in 'F10_ks.pas' {F_ks},
  F09_contracts in 'F09_contracts.pas' {F_contracts},
  F09_counteragents in 'F09_counteragents.pas' {F_counteragents},
  F09_counteragents_rec in 'F09_counteragents_rec.pas' {f_counteragents_rec},
  F09_contracts_rec in 'F09_contracts_rec.pas' {F_contracts_rec},
  F09_contracts_add_rec in 'F09_contracts_add_rec.pas' {F_contracts_add_rec},
  F09_actions_list in 'F09_actions_list.pas' {F_actions_list},
  F09_actions_list_rec in 'F09_actions_list_rec.pas' {F_actions_list_rec},
  F09_contract_detail_rec in 'F09_contract_detail_rec.pas' {F_contract_detail_rec},
  DM_exp in 'DM_exp.pas' {DM_exp1: TDataModule},
  F04_act_reestr_img in 'F04_act_reestr_img.pas' {F_act_reestr_img},
  F10_ks_rec in 'F10_ks_rec.pas' {F_ks_rec},
  lib_import_xls in 'lib_import_xls.pas',
  DM_imp in 'DM_imp.pas' {DM_imp1: TDataModule},
  F01_tp_point_import in 'F01_tp_point_import.pas' {f_tp_point_import},
  F10_ks_out in 'F10_ks_out.pas' {F_ks_out},
  F10_ks_content_rec in 'F10_ks_content_rec.pas' {F_ks_content_rec},
  F10_ks_content_show in 'F10_ks_content_show.pas' {f_ks_content_show},
  F10_ks_content_pu in 'F10_ks_content_pu.pas' {f_ks_content_pu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TF_tp_map, F_tp_map);
  Application.CreateForm(TF_tp, F_tp);
  Application.CreateForm(TF_opore_rec, F_opore_rec);
  Application.CreateForm(TF_tp_point, F_tp_point);
  Application.CreateForm(TF_pu, F_pu);
  Application.CreateForm(TF_pu_rec, F_pu_rec);
  Application.CreateForm(TF_pu_tp_point, F_pu_tp_point);
  Application.CreateForm(TF_pu_tp_point2, F_pu_tp_point2);
  Application.CreateForm(TF_act, F_act);
  Application.CreateForm(TF_act_reestr, F_act_reestr);
  Application.CreateForm(TF_act_rec, F_act_rec);
  Application.CreateForm(TF_act_reestr_gen, F_act_reestr_gen);
  Application.CreateForm(TF_act_reestr_change, F_act_reestr_change);
  Application.CreateForm(TF_act_upload, F_act_upload);
  Application.CreateForm(TF_exp_montage, F_exp_montage);
  Application.CreateForm(TF_exp_act_reestr, F_exp_act_reestr);
  Application.CreateForm(TF_fiz18_search, F_fiz18_search);
  Application.CreateForm(TF_exp_not_sign, F_exp_not_sign);
  Application.CreateForm(TF_pu_pay_act, F_pu_pay_act);
  Application.CreateForm(TF_pu_pay_act_change_status, F_pu_pay_act_change_status);
  Application.CreateForm(TF_pu_pay_act_rec, F_pu_pay_act_rec);
  Application.CreateForm(TF_tp_plan, F_tp_plan);
  Application.CreateForm(TF_bpu, F_bpu);
  Application.CreateForm(TF_bpu_rec, F_bpu_rec);
  Application.CreateForm(TF_gw, F_gw);
  Application.CreateForm(TF_gw_rec, F_gw_rec);
  Application.CreateForm(TF_ks, F_ks);
  Application.CreateForm(TF_contracts, F_contracts);
  Application.CreateForm(TF_counteragents, F_counteragents);
  Application.CreateForm(Tf_counteragents_rec, f_counteragents_rec);
  Application.CreateForm(TF_contracts_rec, F_contracts_rec);
  Application.CreateForm(TF_contracts_add_rec, F_contracts_add_rec);
  Application.CreateForm(TF_actions_list, F_actions_list);
  Application.CreateForm(TF_actions_list_rec, F_actions_list_rec);
  Application.CreateForm(TF_contract_detail_rec, F_contract_detail_rec);
  Application.CreateForm(TDM_exp1, DM_exp1);
  Application.CreateForm(TF_act_reestr_img, F_act_reestr_img);
  Application.CreateForm(TF_ks_rec, F_ks_rec);
  Application.CreateForm(TDM_imp1, DM_imp1);
  Application.CreateForm(Tf_tp_point_import, f_tp_point_import);
  Application.CreateForm(TF_ks_out, F_ks_out);
  Application.CreateForm(TF_ks_content_rec, F_ks_content_rec);
  Application.CreateForm(Tf_ks_content_show, f_ks_content_show);
  Application.CreateForm(Tf_ks_content_pu, f_ks_content_pu);
  Application.Run;
end.

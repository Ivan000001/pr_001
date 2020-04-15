object DM_exp1: TDM_exp1
  OldCreateOrder = False
  Height = 479
  Width = 634
  object ZQ_exp_montage: TZReadOnlyQuery
    Connection = DM1.ZConnection1
    SQL.Strings = (
      'select'
      '  ROW_NUMBER() OVER(ORDER BY pu_sn)AS npp,'
      '  tp.tp_name,'
      '  tp_map_point.fider_a AS fider,'
      '  tp_map_point.opore_a AS opore,'
      '  list_opore_state.descr_opore_state AS opore_state,'
      '  list_type_inline.descr_type_inline AS type_inline,'
      '  list_vvod.descr_vvod AS vvod,'
      '  list_type_outline.descr_type_outline AS type_outline,'
      '  tp_map_point.faze AS faze,'
      '  pu.p_number,'
      '  list_abonent_status.descr_abonent_status AS abonent_status,'
      '  pu.FIO,'
      '  tp.tp_address,'
      '  tp_street.street_name,'
      '  tp_map_point.house,'
      '  tp_map_point.room,'
      '  pu.kadastr,'
      '  pu.sn_old_pu,'
      '  date_format(pu.date_sign,'#39'%d.%m.%Y'#39') AS date_sign,'
      '  list_act_status.descr_act_status as act_status,'
      '  pu_model.pu_model_name,'
      '  pu_model.model_faze,'
      '  pu.pu_sn,'
      '  pu.pu_plomb,'
      '  DATE_FORMAT(pu.date_install,'#39'%d.%m.%Y'#39') AS date_install,'
      '  brigades.name_master,'
      '  list_photo_status.descr_photo_status AS photo_status'
      'from pu'
      'left join tp on tp.id_tp=pu.id_tp_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_map ON tp_map.id_tp_a=tp_map_point.id_tp_a AND tp' +
        '_map.fider=tp_map_point.fider_a AND tp_map.opore=tp_map_point.op' +
        'ore_a '
      
        'LEFT join list_opore_state ON list_opore_state.id_opore_state=tp' +
        '_map.id_opore_state_a'
      'LEFT JOIN list_vvod ON list_vvod.id_vvod=tp_map_point.id_vvod_a'
      
        'LEFT JOIN list_type_inline ON list_type_inline.id_type_inline=tp' +
        '_map.id_type_inline_a'
      
        'LEFT JOIN list_type_outline ON list_type_outline.id_type_outline' +
        '=tp_map_point.id_type_outline_a'
      
        'LEFT JOIN list_abonent_status ON list_abonent_status.id_abonent_' +
        'status=pu.id_abonent_status_a'
      
        'LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_stree' +
        't_a'
      
        'LEFT JOIN list_act_status ON list_act_status.id_act_status=pu.id' +
        '_act_status_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'LEFT JOIN brigades ON brigades.id_brig=pu.id_brig_a'
      
        'LEFT JOIN list_photo_status ON list_photo_status.id_photo_status' +
        '=pu.id_photo_status_a'
      ''
      'WHERE (:p_tp=0 OR :p_tp=pu.id_tp_a)'
      ''
      'ORDER BY npp,fider,opore,abonent_status,pu_sn')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_exp_act_reestr: TZReadOnlyQuery
    Connection = DM1.ZConnection1
    SQL.Strings = (
      'select'
      '  ROW_NUMBER() OVER(ORDER BY pu_sn)AS npp,'
      
        '  TRIM( SUBSTR(tp.tp_name, LOCATE('#39'-'#39', tp.tp_name)+1)) as tp_nam' +
        'e,'
      '  tp.tp_address,'
      '  tp_street.street_name,'
      '  tp_map_point.house,'
      '  tp_map_point.room,'
      '  pu.p_number,'
      '  pu.old_pu_model,'
      '  pu.sn_old_pu,'
      '  round(pu.old_pu_t1+pu.old_pu_t2+pu.old_pu_t3,2) AS old_sum_t,'
      '  pu.old_pu_t1,'
      '  pu.old_pu_t2,'
      '  pu.old_pu_t3,'
      '  pu_model.pu_model_name,'
      '  pu.pu_sn,'
      '  ROUND(pu.new_pu_t1+pu.new_pu_t2+pu.new_pu_t3,2) AS new_sum_t,'
      '  pu.new_pu_t1,'
      '  pu.new_pu_t2,'
      '  pu.new_pu_t3,'
      '  date_format(pu.date_install,'#39'%d.%m.%Y'#39') AS date_install,'
      '  "'#1086#1087#1086#1088#1072'" AS place_install,'
      '  pu.pu_plomb,'
      '  brigades.name_master'
      'from pu'
      'left join tp on tp.id_tp=pu.id_tp_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_map ON tp_map.id_tp_a=tp_map_point.id_tp_a AND tp' +
        '_map.fider=tp_map_point.fider_a AND tp_map.opore=tp_map_point.op' +
        'ore_a'
      
        'LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_stree' +
        't_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'LEFT JOIN brigades ON brigades.id_brig=pu.id_brig_a'
      ''
      
        'WHERE pu.pu_sn IN (SELECT act_reestr_detail.pu_sn_a FROM act_ree' +
        'str_detail WHERE act_reestr_detail.id_act_reestr_a=:p_id_act_ree' +
        'str)'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'p_id_act_reestr'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 152
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'p_id_act_reestr'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_exp_not_sign: TZReadOnlyQuery
    Connection = DM1.ZConnection1
    SQL.Strings = (
      '                      SELECT'
      
        '  ROW_NUMBER() OVER(ORDER BY tp.tp_address,tp_street.street_name' +
        ',tp_map_point.house,tp_map_point.room)AS npp,'
      '  tp.tp_name,'
      '  tp_map_point.fider_a AS fider,'
      '  tp_map_point.opore_a AS opore,'
      '  pu.p_number,'
      '  pu.FIO,'
      '  tp.tp_address,'
      '  tp_street.street_name,'
      '  tp_map_point.house,'
      '  tp_map_point.room,'
      '  pu.kadastr,'
      '  pu.sn_old_pu,'
      '  list_act_status.descr_act_status as act_status,'
      '  pu_model.pu_model_name,'
      '  pu_model.model_faze,'
      '  pu.pu_sn,'
      '  pu.pu_plomb'
      'from pu'
      'left join tp on tp.id_tp=pu.id_tp_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_map ON tp_map.id_tp_a=tp_map_point.id_tp_a AND tp' +
        '_map.fider=tp_map_point.fider_a AND tp_map.opore=tp_map_point.op' +
        'ore_a '
      
        'LEFT join list_opore_state ON list_opore_state.id_opore_state=tp' +
        '_map.id_opore_state_a'
      
        'LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_stree' +
        't_a'
      
        'LEFT JOIN list_act_status ON list_act_status.id_act_status=pu.id' +
        '_act_status_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      ''
      'WHERE (:p_tp=0 OR :p_tp=pu.id_tp_a) AND'
      'pu.id_act_status_a=1 AND pu.id_abonent_status_a=1'
      ''
      ''
      'ORDER BY npp')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 152
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_exp_act_reestr_list: TZReadOnlyQuery
    Connection = DM1.ZConnection1
    SQL.Strings = (
      'select'
      '  act_reestr.id_act_reestr,'
      '  tp.tp_name,'
      '  date_create,'
      '  type_reestr,'
      
        '  concat_ws('#39'\\'#39',:p_path,date_create,concat_ws('#39#39',date_format(da' +
        'te_create,'#39'%Y%m%d'#39'),'#39'_'#39',type_reestr,'#39'_'#39',tp.tp_name,'#39' '#1056#1077#1077#1089#1090' '#1072#1082#1090#1086#1074 +
        ' '#1074' '#1052#1069#1057'.xls'#39'))as path_ext'
      'from act_reestr'
      'left join tp on tp.id_tp=act_reestr.id_tp_a'
      'where (:p_tp=0 or :p_tp=act_reestr.id_tp_a) and'
      '  date_create between :p_from and :p_to'
      'order by date_create desc,tp.tp_name asc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_from'
        ParamType = ptUnknown
        Value = '2019-11-01'
      end
      item
        DataType = ftString
        Name = 'p_to'
        ParamType = ptUnknown
        Value = '2019-11-31'
      end>
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_from'
        ParamType = ptUnknown
        Value = '2019-11-01'
      end
      item
        DataType = ftString
        Name = 'p_to'
        ParamType = ptUnknown
        Value = '2019-11-31'
      end>
  end
  object DS_act_reestr_list: TDataSource
    DataSet = ZQ_exp_act_reestr_list
    Left = 208
    Top = 64
  end
  object zq_exp_m2: TZReadOnlyQuery
    Connection = DM1.ZConnection1
    SQL.Strings = (
      'WITH '
      'A1 AS (SELECT'
      '  tp_map_point.y_id_tp_point AS y_id,'
      '  "'#1058#1086#1095#1082#1072' '#1087#1086#1089#1090#1072#1074#1082#1080'" AS type_point,'
      '  "" AS name_object,'
      '  tp.tp_name_PO,'
      '  tp.tp_name_RES,'
      '  tp.tp_name_PS,'
      '  "" AS name_LEP,'
      '--  ROW_NUMBER() OVER(ORDER BY pu_sn)AS npp,'
      '  tp.tp_name,'
      '  tp_map_point.fider_a AS fider,'
      '  tp_map_point.opore_a AS opore,'
      '  '
      '  list_opore_state.descr_opore_state AS opore_state,'
      '  list_type_inline.descr_type_inline AS type_inline,'
      '  list_vvod.descr_vvod AS vvod,'
      '  list_type_outline.descr_type_outline AS type_outline,'
      '  '
      '  list_abonent_status.descr_abonent_status AS abonent_status,'
      '  tp.tp_address,'
      '  tp_street.street_name,'
      '  tp_map_point.house,'
      '  tp_map_point.room,'
      '  pu.p_number,'
      '  pu.FIO,'
      '  tp_map_point.point_coordinate_1,'
      '  tp_map_point.point_coordinate_2,'
      '  tp_map_point.faze AS ppo_faze,'
      '  pu_model.pu_model_name,'
      '  pu.pu_sn,'
      '  pu.pu_plomb,'
      '  1 AS k_tt,'
      '  NULL AS tt1_sn,'
      '  NULL AS tt1_plomb,'
      '  NULL AS tt2_sn,'
      '  NULL AS tt2_plomb,'
      '  NULL AS tt3_sn,'
      '  NULL AS tt3_plomb,    '
      '  DATE_FORMAT(pu.date_install,'#39'%d.%m.%Y'#39') AS date_install,'
      '  brigades.name_master,'
      '  "" as comments,'
      '  pu.sn_old_pu,'
      '  pu.old_pu_model,'
      '  pu.kadastr,'
      '  NULL AS y_id_act,'
      '  NULL AS st_ident,'
      '  NULL AS source_ident,'
      '  list_act_status.descr_act_status as act_status,'
      '  pu.pu_sn AS pu_sn_adpu,  '
      '  date_format(pu.date_sign,'#39'%d.%m.%Y'#39') AS date_sign,'
      '  pu_model.model_faze,'
      '  list_photo_status.descr_photo_status AS photo_status'
      'from pu'
      'left join tp on tp.id_tp=pu.id_tp_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_map ON tp_map.id_tp_a=tp_map_point.id_tp_a AND tp' +
        '_map.fider=tp_map_point.fider_a AND tp_map.opore=tp_map_point.op' +
        'ore_a '
      
        'LEFT join list_opore_state ON list_opore_state.id_opore_state=tp' +
        '_map.id_opore_state_a'
      'LEFT JOIN list_vvod ON list_vvod.id_vvod=tp_map_point.id_vvod_a'
      
        'LEFT JOIN list_type_inline ON list_type_inline.id_type_inline=tp' +
        '_map.id_type_inline_a'
      
        'LEFT JOIN list_type_outline ON list_type_outline.id_type_outline' +
        '=tp_map_point.id_type_outline_a'
      
        'LEFT JOIN list_abonent_status ON list_abonent_status.id_abonent_' +
        'status=pu.id_abonent_status_a'
      
        'LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_stree' +
        't_a'
      
        'LEFT JOIN list_act_status ON list_act_status.id_act_status=pu.id' +
        '_act_status_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'LEFT JOIN brigades ON brigades.id_brig=pu.id_brig_a'
      
        'LEFT JOIN list_photo_status ON list_photo_status.id_photo_status' +
        '=pu.id_photo_status_a'
      ''
      'WHERE (:p_tp=0 OR :p_tp=pu.id_tp_a)'
      ''
      'ORDER BY fider,opore,abonent_status,pu_sn'
      '),'
      'B AS (SELECT '
      '  bpu.y_id_bpu AS y_id,'
      '  "" AS type_point,'
      '  "" AS name_object,'
      '  tp.tp_name_PO,'
      '  tp.tp_name_RES,'
      '  tp.tp_name_PS,'
      '  "" AS name_LEP,'
      '  tp.tp_name,'
      '  NULL AS fider,'
      '  NULL AS opore,'
      '  null AS opore_state,'
      '  null AS type_inline,'
      '  null AS vvod,'
      '  null AS type_outline,'
      '  "'#1059#1095#1077#1090'" abonent_status,'
      '  tp.tp_address,'
      '  null as street_name,'
      '  NULL AS house,'
      '  NULL AS room,'
      '  NULL AS p_number,'
      '  NULL AS FIO,'
      '  NULL AS point_coordinate_1,'
      '  NULL AS point_coordinate_2,'
      '  2 AS ppo_faze,'
      '  substr(bpu.bpu_model_name,1,12)AS pu_model_name,'
      '  bpu.bpu_sn AS pu_sn,'
      '  bpu.bpu_plomb1 AS pu_plomb,'
      '  bpu.tt1_k AS k_tt,'
      '  bpu.tt1_sn,'
      '  bpu.tt1_plomb,'
      '  bpu.tt2_sn,'
      '  bpu.tt2_plomb,'
      '  bpu.tt3_sn,'
      '  bpu.tt3_plomb,'
      '  bpu.date_install,'
      '  brigades.name_master,'
      '  "" AS comments,'
      '  NULL AS sn_old_pu,'
      '  NULL AS old_pu_model,'
      '  NULL AS kadastr,'
      '    NULL AS y_id_act,'
      '  NULL AS st_ident,'
      '  NULL AS source_ident,'
      '  null as act_status,'
      '  null AS pu_sn_adpu,  '
      '  DATE_FORMAT(NULL,'#39'%d.%m.%Y'#39') AS date_sign,'
      '  null as model_faze,'
      '  null AS photo_status'
      'FROM bpu'
      'left join tp on tp.id_tp=bpu.id_tp_a'
      'LEFT JOIN brigades ON brigades.id_brig=bpu.id_brig_a'
      'WHERE (:p_tp=0 OR :p_tp=bpu.id_tp_a) AND (bpu.bpu_status=2)'
      '),'
      'c AS ('
      'SELECT * FROM b'
      'UNION'
      'SELECT * FROM a1'
      ')'
      'SELECT   ROW_NUMBER() OVER(ORDER BY type_point)AS npp,c.* FROM c')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 32
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end

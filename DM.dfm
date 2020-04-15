object DM1: TDM1
  OldCreateOrder = False
  Height = 584
  Width = 1055
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    ClientCodepage = 'cp1251'
    Properties.Strings = (
      'codepage=cp1251')
    Connected = True
    HostName = 'db-pu01'
    Port = 3306
    Database = 'metz_db_pu'
    User = 'metz'
    Password = '11223344'
    Protocol = 'MariaDB-10'
    Left = 24
    Top = 16
  end
  object ZQ_tp_map: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  id_tp_a,'
      '  tp.tp_name,'
      '  fider,'
      '  opore,'
      '  id_opore_state_a,'
      '  list_opore_state.descr_opore_state,'
      '  id_type_inline_a,'
      '  list_type_inline.descr_type_inline'
      'FROM tp_map'
      'LEFT JOIN tp ON tp.id_tp=tp_map.id_tp_a'
      
        'LEFT JOIN list_opore_state ON list_opore_state.id_opore_state=tp' +
        '_map.id_opore_state_a'
      
        'LEFT JOIN list_type_inline ON list_type_inline.id_type_inline=tp' +
        '_map.id_type_inline_a'
      'where (:p_tp=0 or tp.id_tp=:p_tp)'
      'order by fider,opore')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 24
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_tp_point: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  tp_map_point.*,'
      '  tp_street.street_name,'
      '  list_type_outline.descr_type_outline,'
      '  list_vvod.descr_vvod,'
      '  list_act_status.descr_act_status'
      ''
      'from tp_map_point'
      
        'left JOIN list_type_outline ON list_type_outline.id_type_outline' +
        '=tp_map_point.id_type_outline_a'
      'LEFT JOIN list_vvod ON list_vvod.id_vvod=tp_map_point.id_vvod_a'
      
        'left join tp_street on tp_street.id_street=tp_map_point.id_stree' +
        't_a'
      'left join pu on pu.pu_sn=tp_map_point.pu_sn_a'
      
        '  left join list_act_status on list_act_status.id_act_status=pu.' +
        'id_act_status_a'
      'where'
      
        ' tp_map_point.id_tp_a=:p_tp and fider_a=:p_fider and opore_a=:p_' +
        'opore'
      'order by tp_map_point.house')
    Params = <
      item
        DataType = ftInteger
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'p_fider'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_opore'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'p_fider'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_opore'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_tp_map: TDataSource
    DataSet = ZQ_tp_map
    OnDataChange = DS_tp_mapDataChange
    Left = 56
    Top = 160
  end
  object DS_tp_point: TDataSource
    DataSet = ZQ_tp_point
    Left = 56
    Top = 240
  end
  object ZQ_lib_cb_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 720
    Top = 16
  end
  object ZT_tp: TZTable
    Connection = ZConnection1
    SortedFields = 'tp_name'
    TableName = 'tp'
    IndexFieldNames = 'tp_name Asc'
    Left = 112
    Top = 160
  end
  object DS_tp: TDataSource
    DataSet = ZT_tp
    Left = 144
    Top = 160
  end
  object ZQ_tp_map_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 24
    Top = 112
  end
  object ZQ_pu: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  pu.*,'
      '  tp.tp_name,'
      '  pu_model.pu_model_name,'
      '  brigades.name_master,'
      '  list_photo_status.descr_photo_status,'
      '--  pu_photo.pu_image,'
      '  list_pu_pay_status.descr_pu_pay_status,'
      '  tp_map_point.fider_a,'
      '  tp_map_point.opore_a,'
      '  list_act_status.descr_act_status'
      'FROM pu'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'left join brigades on brigades.id_brig=pu.id_brig_a'
      
        'LEFT JOIN list_photo_status ON list_photo_status.id_photo_status' +
        '=pu.id_photo_status_a'
      '-- left join pu_photo on pu_photo.pu_sn_a=pu.pu_sn'
      
        'LEFT JOIN list_pu_pay_status ON list_pu_pay_status.id_pu_pay_sta' +
        'tus=pu.id_pu_pay_status_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        'left join list_act_status on list_act_status.id_act_status=pu.id' +
        '_act_status_a'
      ''
      'where'
      '  pu_sn like :p_sn  and'
      '  (:p_id_tp=0 or pu.id_tp_a=:p_id_tp) and'
      '--  fider_a like :p_fider  and'
      '--  opore_a like :p_opore  and'
      '  (:p_id_model=0 or pu.id_pu_model_a=:p_id_model) and'
      '  pu_plomb like :p_plomb and'
      '  (:p_id_brig=0 or pu.id_brig_a=:p_id_brig) and'
      '  (date_install between :p_datefrom and :p_dateto) and'
      ''
      
        '  (:p_status_photo=0 or pu.id_photo_status_a=:p_status_photo) an' +
        'd'
      ' -- (:p_act_status=0 or act_package.id_act is not null) and'
      '  (:p_pay_status=0 or pu.id_pu_pay_status_a=:p_pay_status)')
    Params = <
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_id_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_id_model'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_plomb'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_id_brig'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'p_datefrom'
        ParamType = ptUnknown
        Value = 43466d
      end
      item
        DataType = ftDate
        Name = 'p_dateto'
        ParamType = ptUnknown
        Value = 43830d
      end
      item
        DataType = ftString
        Name = 'p_status_photo'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_pay_status'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 280
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_id_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_id_model'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_plomb'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_id_brig'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftDate
        Name = 'p_datefrom'
        ParamType = ptUnknown
        Value = 43466d
      end
      item
        DataType = ftDate
        Name = 'p_dateto'
        ParamType = ptUnknown
        Value = 43830d
      end
      item
        DataType = ftString
        Name = 'p_status_photo'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_pay_status'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_pu_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 280
    Top = 120
  end
  object DS_pu: TDataSource
    DataSet = ZQ_pu
    Left = 320
    Top = 160
  end
  object ZQ_pu_tp_point_SN: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  pu_sn'
      'from pu'
      'left join pu_model on pu_model.id_pu_model=pu.id_pu_model_a'
      ''
      'where'
      '  (:p_tp=0 or id_tp_a=:p_tp) and'
      '  pu_sn like :p_sn and'
      '  id_tp_point_a is null and'
      '  (:p_faze=0 or pu_model.model_faze=:p_faze)'
      'order by pu_sn'
      '  ')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 24
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ZQ_pu_tp_point_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 24
    Top = 392
  end
  object DS_pu_tp_point_SN: TDataSource
    DataSet = ZQ_pu_tp_point_SN
    Left = 56
    Top = 336
  end
  object ZQ_pu_tp_point_TP: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  id_tp_point,'
      '  fider_a,'
      '  opore_a,'
      '  faze,'
      '  concat(concat(nvl(house,'#39#39'),'#39' - '#39'),nvl(room,'#39#39')) as h_r'
      'from tp_map_point'
      'where (:p_tp=0 or id_tp_a=:p_tp) and'
      '(pu_sn_a ='#39#39' or pu_sn_a is null)'
      'order by fider_a,opore_a,faze')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 104
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_pu_tp_point_TP: TDataSource
    DataSet = ZQ_pu_tp_point_TP
    Left = 152
    Top = 336
  end
  object DS_street: TDataSource
    DataSet = ZT_street
    Left = 144
    Top = 208
  end
  object ZT_street: TZTable
    Connection = ZConnection1
    TableName = 'tp_street'
    MasterFields = 'id_tp'
    MasterSource = DS_tp
    LinkedFields = 'id_tp_a'
    Left = 112
    Top = 208
  end
  object ZQ_act: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  pu.id_tp_a,'
      '  tp.tp_name,'
      '  p_number,'
      '  FIO,  '
      '  pu_sn,'
      '  pu_model.pu_model_name,'
      '  pu_plomb,'
      '  date_sign,'
      '  pu.id_brig_sign_a,'
      '  si.name_master AS sign_master,'
      '  br.name_master AS install_master,'
      '  pu.date_install,'
      '  id_abonent_status_a,'
      '  list_abonent_status.descr_abonent_status,'
      '  pu.id_act_status_a,'
      '  list_act_status.descr_act_status,'
      '  pu.id_act_pay_status_a,'
      '  list_act_pay_status.descr_act_pay_status,'
      '  sn_old_pu,'
      '  old_pu_model,'
      '  kadastr,'
      '  old_pu_t1,'
      '  old_pu_t2,'
      '  old_pu_t3,'
      '  new_pu_t1,'
      '  new_pu_t2,'
      '  new_pu_t3,'
      '  tp_map_point.fider_a,'
      '  tp_map_point.opore_a,'
      '  tp.tp_address,'
      '  tp_street.street_name,'
      '  tp_map_point.house,'
      '  tp_map_point.room'
      'FROM pu'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'LEFT JOIN brigades br ON br.id_brig=pu.id_brig_a'
      'LEFT JOIN brigades si ON si.id_brig=pu.id_brig_sign_a'
      
        'LEFT JOIN list_abonent_status ON list_abonent_status.id_abonent_' +
        'status=pu.id_abonent_status_a'
      
        'LEFT JOIN list_act_status ON list_act_status.id_act_status=pu.id' +
        '_act_status_a'
      
        'LEFT JOIN list_act_pay_status ON list_act_pay_status.id_act_pay_' +
        'status=pu.id_act_pay_status_a'
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_str' +
        'eet_a'
      'where'
      '  (:p_tp=0 or pu.id_tp_a=:p_tp) and'
      '  (house like :p_house or house is null) and'
      '  (p_number like :p_number or p_number is null) and'
      '  (FIO like :p_FIO or FIO is null) and'
      '  pu_sn like :p_pu and'
      '  (:p_act_status=0 or pu.id_act_status_a=:p_act_status) and'
      
        '  (:p_act_pay_status=0 or pu.id_act_status_a=:p_act_pay_status) ' +
        'and'
      '  (:p_sign_brig=0 or :p_sign_brig=pu.id_brig_sign_a)'
      
        'ORDER BY tp.tp_name ASC, pu.id_act_status_a DESC, date_sign DESC' +
        ', house asc')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_house'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_number'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_FIO'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_pu'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_act_status'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_act_pay_status'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sign_brig'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 320
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_house'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_number'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_FIO'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_pu'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_act_status'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_act_pay_status'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sign_brig'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_act: TDataSource
    DataSet = ZQ_act
    Left = 360
    Top = 280
  end
  object ZQ_act_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 320
    Top = 336
  end
  object ZQ_act_reestr: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      'act_reestr.*,'
      'tp.tp_name,'
      'list_act_status.descr_act_status,'
      'list_photo_status.descr_photo_status'
      'from act_reestr'
      'left join tp on tp.id_tp=act_reestr.id_tp_a'
      
        'left join list_act_status on list_act_status.id_act_status=act_r' +
        'eestr.id_act_status_a'
      
        'LEFT JOIN list_photo_status ON list_photo_status.id_photo_status' +
        '=act_reestr.id_photo_status_a'
      'where (:p_tp=0 or id_tp_a=:p_tp) and'
      'date_create between :p_datefrom and :p_dateto'
      'order by date_create desc,tp.tp_name')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_datefrom'
        ParamType = ptUnknown
        Value = '2019-01-01'
      end
      item
        DataType = ftString
        Name = 'p_dateto'
        ParamType = ptUnknown
        Value = '2019-12-31'
      end>
    Left = 464
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_datefrom'
        ParamType = ptUnknown
        Value = '2019-01-01'
      end
      item
        DataType = ftString
        Name = 'p_dateto'
        ParamType = ptUnknown
        Value = '2019-12-31'
      end>
  end
  object ZQ_act_reestr_detail: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  *'
      'from act_reestr_detail where id_act_reestr_a=:p_act_reestr')
    Params = <
      item
        DataType = ftString
        Name = 'p_act_reestr'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 464
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'p_act_reestr'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_act_reestr: TDataSource
    DataSet = ZQ_act_reestr
    OnDataChange = DS_act_reestrDataChange
    Left = 520
    Top = 304
  end
  object DS_act_reestr_detail: TDataSource
    DataSet = ZQ_act_reestr_detail
    Left = 504
    Top = 360
  end
  object ZQ_act_reestr_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 464
    Top = 256
  end
  object ZQ_pu_upload: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  tp.tp_name,'
      '  pu_sn,'
      
        '  CONCAT_WS("\\",:p_path,tp.tp_name,concat(pu_sn,".jpeg")) as ex' +
        't_path,'
      
        '  case :p_img_load when 1 then pu_photo.pu_image else null end a' +
        's pu_image'
      'from pu'
      'left join tp on tp.id_tp=pu.id_tp_a'
      'left join pu_photo on pu_photo.pu_sn_a=pu.pu_sn'
      'where (not pu_photo.pu_image is null) and'
      '(:p_tp=0 or pu.id_tp_a=:p_tp) and'
      '(pu_sn like :p_sn)  ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_img_load'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end>
    Left = 592
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_img_load'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
      end>
  end
  object ZQ_act_upload: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  tp.tp_name,'
      '  pu_sn,'
      '  date_sign,'
      
        '  CONCAT_WS("\\",:p_path,tp.tp_name,date_sign,concat(CONCAT_WS("' +
        '",tp.tp_address," ",tp.tp_name," ",tp_street.street_name," ",tp_' +
        'map_point.house,nvl(CONCAT("-",tp_map_point.room),""),'
      '    " ",RIGHT(pu_sn,6)," '#1072#1082#1090'.jpeg"))) as ext_path1,'
      
        '  CONCAT_WS("\\",:p_path,tp.tp_name,date_sign,concat(CONCAT_WS("' +
        '",tp.tp_address," ",tp.tp_name," ",tp_street.street_name," ",tp_' +
        'map_point.house,nvl(CONCAT("-",tp_map_point.room),""),'
      '    " ",RIGHT(pu_sn,6) ," '#1072#1082#1090' '#1086#1089'.jpeg"))) as ext_path2,'
      
        '  CONCAT_WS("\\",:p_path,tp.tp_name,date_sign,concat(CONCAT_WS("' +
        '",tp.tp_address," ",tp.tp_name," ",tp_street.street_name," ",tp_' +
        'map_point.house,nvl(CONCAT("-",tp_map_point.room),""),'
      '    " ", right(pu_sn,6)," '#1076#1080#1089#1087#1083#1077#1081'.jpeg"))) as ext_path3,'
      
        '  case :p_img_load when 1 then act_photo.act_img1 ELSE NULL eND ' +
        'AS act_img1,'
      
        '  case :p_img_load when 1 then act_photo.act_img2 ELSE NULL END ' +
        'AS act_img2,'
      
        '  case :p_img_load when 1 then act_photo.act_img3 ELSE NULL END ' +
        'AS act_img3'
      'FROM pu'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN act_photo ON act_photo.pu_sn_a=pu.pu_sn'
      ''
      
        'LEFT JOIN tp_map_point ON tp_map_point.id_tp_point=pu.id_tp_poin' +
        't_a'
      
        '  LEFT JOIN tp_street ON tp_street.id_street=tp_map_point.id_str' +
        'eet_a'
      'WHERE id_act_status_a<>1 and'
      '(:p_tp=0 or pu.id_tp_a=:p_tp) and'
      '(pu_sn like :p_sn) and'
      'date_sign between :p_from and :p_to'
      'order by tp.tp_name,date_sign,pu_sn'
      ';')
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_img_load'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
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
    Left = 584
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_path'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p_img_load'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_sn'
        ParamType = ptUnknown
        Value = '%%%%'
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
  object DS_pu_upload: TDataSource
    DataSet = ZQ_pu_upload
    Left = 640
    Top = 32
  end
  object DS_act_upload: TDataSource
    DataSet = ZQ_act_upload
    Left = 648
    Top = 80
  end
  object ZQ_check: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 784
    Top = 16
  end
  object ZQ_fiz18_search: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  p_number,'
      '  FIO,'
      '  stat_abon,'
      '  stat_shetc,'
      '  sn_old_pu,'
      '  poselenie,'
      '  street,'
      '  house,'
      '  room,'
      '  tp_number,'
      '  kadastr'
      'FROM list_fiz18'
      'where'
      '  p_number like :p_number and'
      '  FIO like :p_FIO and'
      '  sn_old_pu like :p_sn_old_pu'
      'order by poselenie,street,house,room'
      'limit 15')
    Params = <
      item
        DataType = ftString
        Name = 'p_number'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_FIO'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_sn_old_pu'
        ParamType = ptUnknown
        Value = '%%%%'
      end>
    Left = 16
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'p_number'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_FIO'
        ParamType = ptUnknown
        Value = '%%%%'
      end
      item
        DataType = ftString
        Name = 'p_sn_old_pu'
        ParamType = ptUnknown
        Value = '%%%%'
      end>
  end
  object DS_fiz18_search: TDataSource
    DataSet = ZQ_fiz18_search
    Left = 80
    Top = 464
  end
  object ZQ_pu_pay_act: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'pu_pay_doc.*,'
      'list_pu_pay_status.descr_pu_pay_status'
      'FROM pu_pay_doc'
      
        'LEFT JOIN list_pu_pay_status ON list_pu_pay_status.id_pu_pay_sta' +
        'tus=pu_pay_doc.id_pu_pay_status_a'
      'WHERE date_create BETWEEN :p_from AND :p_to'
      'ORDER BY date_create desc, pu_pay_doc.id_pu_pay_status_a')
    Params = <
      item
        DataType = ftDate
        Name = 'p_from'
        ParamType = ptUnknown
        Value = 43748d
      end
      item
        DataType = ftDate
        Name = 'p_to'
        ParamType = ptUnknown
        Value = '15.12.2019'
      end>
    Left = 248
    Top = 528
    ParamData = <
      item
        DataType = ftDate
        Name = 'p_from'
        ParamType = ptUnknown
        Value = 43748d
      end
      item
        DataType = ftDate
        Name = 'p_to'
        ParamType = ptUnknown
        Value = '15.12.2019'
      end>
  end
  object DS_pu_pay_act: TDataSource
    DataSet = ZQ_pu_pay_act
    OnDataChange = DS_pu_pay_actDataChange
    Left = 288
    Top = 528
  end
  object ZQ_pu_pay_act_detail: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'WITH '
      'A1 AS (with'
      '  A AS ('
      '    SELECT'
      '      COUNT(  pu_pay_doc_detail.pu_sn_a)AS SUM1,'
      '      pu_model.model_faze,'
      '      pu.id_tp_a'
      '    FROM pu_pay_doc_detail'
      '    LEFT JOIN pu ON pu.pu_sn=pu_pay_doc_detail.pu_sn_a'
      '    LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      '    WHERE pu_pay_doc_detail.id_pu_pay_doc_a=:p_doc'
      '    GROUP BY id_tp_a,model_faze),'
      
        '  B1 AS (SELECT id_tp_a,SUM1 AS SUM1 FROM A WHERE a.model_faze=1' +
        '),'
      
        '  B2 AS (SELECT id_tp_a,SUM1 AS SUM3 FROM A WHERE a.model_faze=3' +
        ')'
      'SELECT'
      '  tp.tp_name,'
      '  ifnull(B1.sum1,0) AS SUM1,'
      '  ifnull(B2.sum3,0) AS SUM3,'
      '  (ifnull(B1.sum1,0)+IFNULL(B2.sum3,0)) AS ALL_SUM'
      'FROM A'
      'LEFT JOIN tp ON tp.id_tp=A.id_tp_a'
      'LEFT JOIN B1 ON A.id_tp_a=B1.id_tp_a'
      'LEFT JOIN B2 ON A.id_tp_a=B2.id_tp_a'
      'GROUP BY tp_name'
      ')'
      ''
      ' SELECT * FROM a1'
      ' UNION '
      
        ' SELECT "'#1048#1090#1086#1075#1086':"AS tp_name, SUM(a1.sum1)AS SUM1,SUM(a1.sum3) AS ' +
        'SUM3,SUM(a1.all_sum)AS ALL_SUM FROM A1')
    Params = <
      item
        DataType = ftString
        Name = 'p_doc'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 336
    Top = 528
    ParamData = <
      item
        DataType = ftString
        Name = 'p_doc'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_pu_pay_act_detail: TDataSource
    DataSet = ZQ_pu_pay_act_detail
    Left = 376
    Top = 528
  end
  object ZQ_pu_pay_not_list: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'tp.tp_name,'
      'pu.pu_sn,'
      'pu_model.model_faze'
      'FROM pu'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'WHERE pu.id_pu_pay_status_a=1 '
      'and (:p_faze=0 or :p_faze=pu_model.model_faze) and'
      'not(pu.pu_sn in (select pu_sn from TMP_pu_pay_list)) and'
      'not(pu.pu_sn in (select pu_sn_a from pu_pay_doc_detail))'
      'ORDER BY tp.tp_name,pu_model.model_faze,pu.pu_sn')
    Params = <
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 344
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_pu_pay_not_list: TDataSource
    DataSet = ZQ_pu_pay_not_list
    Left = 376
    Top = 480
  end
  object ZQ_pu_pay_RAM: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from TMP_pu_pay_list'
      'order by tp_name,faze,pu_sn')
    Params = <>
    Left = 240
    Top = 472
  end
  object DS_pu_pay_RAM: TDataSource
    DataSet = ZQ_pu_pay_RAM
    Left = 280
    Top = 472
  end
  object ZQ_pu_pay_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 264
    Top = 424
  end
  object ZQ_pu_pay_TMP2: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 312
    Top = 424
  end
  object ZQ_tp_plan: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'WITH a AS (SELECT'
      'tp_map_point.id_tp_a,'
      'tp_map_point.faze,'
      'COUNT(*) AS sum_'
      'from tp_map_point'
      'GROUP by tp_map_point.id_tp_a,tp_map_point.faze),'
      ''
      'b1 AS (SELECT id_tp_a,sum_ FROM a WHERE faze=1),'
      'b3 AS (SELECT id_tp_a,sum_ FROM a WHERE faze=3),'
      
        'bpu_ AS (SELECT bpu.id_tp_a, COUNT(bpu_sn) AS sum_ FROM bpu GROU' +
        'P BY bpu.id_tp_a),'
      
        'gw_ AS (SELECT gateway.id_tp_a,COUNT(gw_imei) AS sum_ FROM gatew' +
        'ay GROUP BY gateway.id_tp_a)'
      ''
      'SELECT'
      'tp.tp_name,'
      'tp.id_tp,'
      'tp.tp_address,'
      'ifnull(b1.sum_,0) AS plan_1f,'
      'ifnull(b3.sum_,0) AS plan_3f,'
      '(ifnull(b1.sum_,0)+IFNULL(b3.sum_,0))AS plan_all_pu,'
      'ifnull(bpu_.sum_,0) AS bpu_c,'
      'IFNULL(gw_.sum_,0) AS gw_c'
      'FROM tp'
      'LEFT JOIN b1 ON b1.id_tp_a=tp.id_tp'
      'LEFT JOIN b3 ON b3.id_tp_a=tp.id_tp'
      'LEFT JOIN bpu_ ON bpu_.id_tp_a=tp.id_tp'
      'LEFT JOIN gw_ ON gw_.id_tp_a=tp.id_tp'
      ''
      'order by tp.tp_name')
    Params = <>
    Left = 384
    Top = 8
  end
  object ZQ_tp_plan_gw: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  gateway.gw_imei,'
      '  case gateway.gw_status'
      '    when 1 then "'#1085#1077#1090'"'
      '    when 2 then "'#1076#1072'"'
      '  end as status'
      'from gateway where gateway.id_tp_a=:p_tp')
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_tp'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_tp'
        ParamType = ptUnknown
      end>
  end
  object ZQ_tp_plan_bpu: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  bpu.bpu_sn,'
      '  case bpu.bpu_status'
      '    when 1 then "'#1085#1077#1090'"'
      '    when 2 then "'#1076#1072'"'
      '  end as status'
      'from bpu where bpu.id_tp_a=:p_tp')
    Params = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 424
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'p_tp'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_tp_plan: TDataSource
    DataSet = ZQ_tp_plan
    OnDataChange = DS_tp_planDataChange
    Left = 384
    Top = 48
  end
  object DS_tp_plan_bpu: TDataSource
    DataSet = ZQ_tp_plan_bpu
    Left = 424
    Top = 48
  end
  object DS_tp_plan_gw: TDataSource
    DataSet = ZQ_tp_plan_gw
    Left = 456
    Top = 48
  end
  object zq_tp_plan_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 496
    Top = 8
  end
  object ZQ_bpu: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      'tp.tp_name,'
      'case bpu.bpu_status'
      'when 1 then "'#1085#1077#1090'"'
      'when 2 then "'#1076#1072'" END AS status,'
      'bpu.date_install,'
      'brigades.name_master,'
      'bpu.bpu_sn,'
      'bpu.tt1_k,'
      'bpu.tt2_k,'
      'bpu.tt3_k,'
      'list_pu_pay_status.descr_pu_pay_status,'
      'list_pu_pay_metz_status.descr_pu_pay_metz_status'
      'from bpu'
      'LEFT JOIN tp ON tp.id_tp=bpu.id_tp_a'
      'LEFT JOIN brigades ON brigades.id_brig=bpu.id_brig_a'
      
        'LEFT JOIN list_pu_pay_status ON list_pu_pay_status.id_pu_pay_sta' +
        'tus=bpu.id_bpu_pay_a'
      
        'LEFT JOIN list_pu_pay_metz_status ON list_pu_pay_metz_status.id_' +
        'pu_pay_metz_status=bpu.id_bpu_pay_metz_a'
      'where (:p_status=0 or :p_status=bpu.bpu_status)'
      'ORDER BY tp.tp_name')
    Params = <
      item
        DataType = ftString
        Name = 'p_status'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 360
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'p_status'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_bpu: TDataSource
    DataSet = ZQ_bpu
    Left = 400
    Top = 160
  end
  object zq_bpu_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 360
    Top = 120
  end
  object zq_gw_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 448
    Top = 120
  end
  object zq_gw: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      'tp.tp_name,'
      'case gateway.gw_status'
      'when 1 then "'#1085#1077#1090'"'
      'when 2 then "'#1076#1072'" END AS status,'
      'gateway.date_install,'
      'brigades.name_master,'
      'gateway.gw_imei,'
      'list_pu_pay_status.descr_pu_pay_status,'
      'list_pu_pay_metz_status.descr_pu_pay_metz_status'
      'from gateway'
      'LEFT JOIN tp ON tp.id_tp=gateway.id_tp_a'
      'LEFT JOIN brigades ON brigades.id_brig=gateway.id_brig_a'
      
        'LEFT JOIN list_pu_pay_status ON list_pu_pay_status.id_pu_pay_sta' +
        'tus=gateway.id_gw_pay_a'
      
        'LEFT JOIN list_pu_pay_metz_status ON list_pu_pay_metz_status.id_' +
        'pu_pay_metz_status=gateway.id_gw_pay_metz_a'
      'where (:p_status=0 or :p_status=gateway.gw_status)'
      'ORDER BY tp.tp_name')
    Params = <
      item
        DataType = ftString
        Name = 'p_status'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 448
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'p_status'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_gw: TDataSource
    DataSet = zq_gw
    Left = 488
    Top = 160
  end
  object zq_counteragents: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  *,'
      '  case status'
      '  when 2 then "'#1076#1072'"'
      '  when 1 then "'#1085#1077#1090'"'
      '  end as descr_status'
      'from counteragents'
      'order by status desc, short_name asc;')
    Params = <>
    Left = 744
    Top = 128
  end
  object zq_contracts: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      'contracts.*,'
      'c1.short_name AS name_one,'
      'c2.short_name AS name_two,'
      'case contract_status'
      'when 1 then "'#1085#1077#1090'"'
      'when 2 then "'#1076#1072'"'
      'end as descr_status'
      'from contracts'
      
        'left join counteragents c1 ON c1.id_counteragent=contracts.id_co' +
        'unteragent_one_a'
      
        'left join counteragents c2 ON c2.id_counteragent=contracts.id_co' +
        'unteragent_two_a'
      ''
      
        'order by contract_status desc, contract_name asc, date_add_sign ' +
        'desc;'
      '')
    Params = <>
    Left = 744
    Top = 192
  end
  object zq_contracts_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 816
    Top = 192
  end
  object DS_counteragents: TDataSource
    DataSet = zq_counteragents
    Left = 776
    Top = 128
  end
  object zq_counteragents_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 808
    Top = 128
  end
  object DS_contracts: TDataSource
    DataSet = zq_contracts
    OnDataChange = DS_contractsDataChange
    Left = 776
    Top = 192
  end
  object zq_contract_price: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '  contract_price.*,'
      '  list_actions.code_action,'
      '  list_actions.descr_action,'
      '  list_actions.scale_action'
      'from contract_price'
      
        'LEFT JOIN list_actions ON list_actions.id_action=contract_price.' +
        'id_action_a'
      'where contract_price.id_contract_a=:p_contract'
      'order by list_actions.code_action')
    Params = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 744
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end>
    object zq_contract_priceid_contract_price: TIntegerField
      FieldName = 'id_contract_price'
      Required = True
    end
    object zq_contract_priceid_contract_a: TIntegerField
      FieldName = 'id_contract_a'
    end
    object zq_contract_priceid_action_a: TIntegerField
      FieldName = 'id_action_a'
    end
    object zq_contract_priceprice: TFloatField
      FieldName = 'price'
      DisplayFormat = '0.00##'
      currency = True
    end
    object zq_contract_pricecode_action: TStringField
      FieldName = 'code_action'
      Size = 3
    end
    object zq_contract_pricedescr_action: TStringField
      FieldName = 'descr_action'
      Size = 120
    end
    object zq_contract_pricescale_action: TStringField
      FieldName = 'scale_action'
      Size = 10
    end
  end
  object DS_contract_price: TDataSource
    DataSet = zq_contract_price
    Left = 784
    Top = 232
  end
  object zq_actions_list: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  *,'
      '  case status'
      '  when 1 then "'#1085#1077#1090'"'
      '  when 2 then "'#1076#1072'" end as descr_status'
      'from list_actions'
      
        'WHERE (:p_contract=0 OR not(id_action IN (SELECT id_action_a FRO' +
        'M contract_price WHERE id_contract_a=:p_contract)))'
      ''
      'order by code_action, descr_action')
    Params = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 744
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object zq_actions_list_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 824
    Top = 280
  end
  object DS_actions_list: TDataSource
    DataSet = zq_actions_list
    Left = 784
    Top = 280
  end
  object zq_ks: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'ks.*,'
      'contracts.contract_name,'
      'case contracts.contract_status'
      'when 1 then "'#1085#1077#1090'"'
      'when 2 then "'#1076#1072'" END AS contract_status,'
      'c1.short_name as s_name1,'
      'c2.short_name as s_name2,'
      'case ks_status'
      'when 1 then "'#1085#1077#1090'"'
      'when 2 then "'#1076#1072'" END AS descr_status'
      'FROM ks'
      'LEFT JOIN contracts ON contracts.id_contract=ks.id_contract_a'
      
        'LEFT JOIN counteragents c1 ON c1.id_counteragent=contracts.id_co' +
        'unteragent_one_a'
      
        'LEFT JOIN counteragents c2 ON c2.id_counteragent=contracts.id_co' +
        'unteragent_two_a'
      ''
      'WHERE (:p_in_out=0 or in_out=:p_in_out)'
      
        'order by ks.date_create desc,contracts.contract_name asc, ks.num' +
        'ber_doc asc')
    Params = <
      item
        DataType = ftString
        Name = 'p_in_out'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 536
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'p_in_out'
        ParamType = ptUnknown
        Value = '0'
      end>
    object zq_ksid_ks: TIntegerField
      FieldName = 'id_ks'
      Required = True
    end
    object zq_ksnumber_doc: TIntegerField
      FieldName = 'number_doc'
      ReadOnly = True
    end
    object zq_ksin_out: TSmallintField
      FieldName = 'in_out'
    end
    object zq_ksdate_create: TDateField
      FieldName = 'date_create'
    end
    object zq_ksdate_from: TDateField
      FieldName = 'date_from'
    end
    object zq_ksdate_to: TDateField
      FieldName = 'date_to'
    end
    object zq_ksid_contract_a: TIntegerField
      FieldName = 'id_contract_a'
    end
    object zq_ksNDS: TFloatField
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00##'
      currency = True
    end
    object zq_ksks_status: TSmallintField
      FieldName = 'ks_status'
      Required = True
    end
    object zq_kscontract_name: TStringField
      FieldName = 'contract_name'
      Size = 15
    end
    object zq_kscontract_status: TStringField
      FieldName = 'contract_status'
      ReadOnly = True
      Size = 3
    end
    object zq_kss_name1: TStringField
      FieldName = 's_name1'
    end
    object zq_kss_name2: TStringField
      FieldName = 's_name2'
    end
    object zq_ksdescr_status: TStringField
      FieldName = 'descr_status'
      ReadOnly = True
      Size = 3
    end
  end
  object DS_ks: TDataSource
    DataSet = zq_ks
    OnDataChange = DS_ksDataChange
    Left = 576
    Top = 440
  end
  object zq_ks_detail: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'WITH a AS (SELECT'
      'ks_detail.*,'
      'list_actions.*,'
      'round(contract_price.price,2)as price,'
      
        'ROUND((ks_detail.count_ * round(contract_price.price,2)),2) AS s' +
        'um_'
      'FROM ks_detail'
      'LEFT JOIN ks ON ks.id_ks=ks_detail.id_ks_a'
      
        'LEFT JOIN contract_price ON contract_price.id_action_a=ks_detail' +
        '.id_action_a AND contract_price.id_contract_a=ks.id_contract_a'
      
        'LEFT JOIN list_actions ON list_actions.id_action=ks_detail.id_ac' +
        'tion_a'
      'WHERE ks_detail.id_ks_a=:p_ks'
      'ORDER BY code_action,descr_action'
      '),'
      'b AS (SELECT id_ks_a,SUM(sum_)AS all_sum FROM a),'
      'c AS (SELECT id_ks,nds FROM ks WHERE ks.id_ks=:p_ks)'
      ''
      'SELECT * FROM a'
      'UNION'
      'SELECT 0,0,0,0,0,"","'#1048#1058#1054#1043#1054'","",0,0,b.all_sum FROM b'
      'UNION'
      
        'SELECT 0,0,0,0,0,"","'#1053#1044#1057'","%",0,c.nds,ROUND(all_sum/100*c.nds,2)' +
        ' FROM b LEFT join c ON c.id_ks=b.id_ks_a'
      'UNION'
      
        'SELECT 0,0,0,0,0,"","'#1048#1058#1054#1043#1054' '#1089' '#1091#1095#1105#1090#1086#1084' '#1053#1044#1057' ","",0,0,ROUND(b.all_sum' +
        '+ROUND(all_sum/100*c.nds,2),2) FROM b LEFT join c ON c.id_ks=b.i' +
        'd_ks_a'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 536
    Top = 488
    ParamData = <
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
    object zq_ks_detailid_ks_action: TIntegerField
      FieldName = 'id_ks_action'
      Required = True
    end
    object zq_ks_detailid_ks_a: TIntegerField
      FieldName = 'id_ks_a'
      Required = True
    end
    object zq_ks_detailid_action_a: TIntegerField
      FieldName = 'id_action_a'
      Required = True
    end
    object zq_ks_detailcount_: TFloatField
      FieldName = 'count_'
      ReadOnly = True
    end
    object zq_ks_detailid_action: TIntegerField
      FieldName = 'id_action'
      Required = True
    end
    object zq_ks_detailcode_action: TStringField
      FieldName = 'code_action'
      Size = 3
    end
    object zq_ks_detaildescr_action: TStringField
      FieldName = 'descr_action'
      Size = 120
    end
    object zq_ks_detailscale_action: TStringField
      FieldName = 'scale_action'
      Size = 10
    end
    object zq_ks_detailprice: TFloatField
      FieldName = 'price'
      DisplayFormat = '0.00##'
      currency = True
    end
    object zq_ks_detailsum_: TFloatField
      FieldName = 'sum_'
      ReadOnly = True
      DisplayFormat = '0.00##'
      currency = True
    end
  end
  object DS_ks_detail: TDataSource
    DataSet = zq_ks_detail
    Left = 576
    Top = 488
  end
  object zq_ks_TMP: TZReadOnlyQuery
    Connection = ZConnection1
    Params = <>
    Left = 616
    Top = 440
  end
  object zq_ks_content_show: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'contract_price.id_action_a,'
      'list_actions.code_action,'
      'list_actions.descr_action,'
      'list_actions.scale_action,'
      'round(contract_price.price,2) AS price'
      'FROM contract_price'
      
        'LEFT JOIN list_actions ON list_actions.id_action=contract_price.' +
        'id_action_a'
      
        'WHERE contract_price.id_contract_a=:p_contract AND list_actions.' +
        'status=2'
      'AND'
      
        '  NOT(contract_price.id_action_a IN (SELECT id_action_a FROM ks_' +
        'detail WHERE id_ks_a=:p_ks))'
      'order by code_action')
    Params = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 664
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'p_contract'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
    object zq_ks_content_showid_action_a: TIntegerField
      FieldName = 'id_action_a'
    end
    object zq_ks_content_showcode_action: TStringField
      FieldName = 'code_action'
      Size = 3
    end
    object zq_ks_content_showdescr_action: TStringField
      FieldName = 'descr_action'
      Size = 120
    end
    object zq_ks_content_showscale_action: TStringField
      FieldName = 'scale_action'
      Size = 10
    end
    object zq_ks_content_showprice: TFloatField
      FieldName = 'price'
      ReadOnly = True
      DisplayFormat = '0.00##'
      currency = True
    end
  end
  object DS_ks_content_show: TDataSource
    DataSet = zq_ks_content_show
    Left = 704
    Top = 440
  end
  object zq_ks_content_pu: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'ks_content_pu.*,'
      'pu_model.model_faze,'
      'tp.tp_name,'
      'brigades.name_master'
      'FROM ks_content_pu'
      'LEFT JOIN pu ON pu.pu_sn=ks_content_pu.pu_sn_a'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN brigades ON brigades.id_brig=pu.id_brig_a'
      'left join pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'WHERE ks_content_pu.id_ks_a=:p_ks')
    Params = <
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 848
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'p_ks'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object DS_ks_content_pu: TDataSource
    DataSet = zq_ks_content_pu
    OnDataChange = DS_ks_content_puDataChange
    Left = 880
    Top = 400
  end
  object DS_ks_content_pu_not: TDataSource
    DataSet = zq_ks_content_pu_not
    Left = 888
    Top = 448
  end
  object zq_ks_content_pu_not: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      'tp.tp_name,'
      'pu.pu_sn,'
      'pu_model.model_faze,'
      'brigades.name_master'
      'FROM pu'
      'LEFT JOIN tp ON tp.id_tp=pu.id_tp_a'
      'LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'
      'LEFT JOIN brigades ON brigades.id_brig=pu.id_brig_a'
      'WHERE pu.id_pu_pay_status_a=1'
      'AND (:p_faze=0 OR :p_faze=pu_model.model_faze) and'
      'not(pu.pu_sn in (select pu_sn_a FROM ks_content_pu))'
      'ORDER BY tp.tp_name,pu_model.model_faze,pu.pu_sn'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 840
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'p_faze'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end

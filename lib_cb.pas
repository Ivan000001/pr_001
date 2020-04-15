unit lib_cb;

interface
uses
 StdCtrls,classes,SysUtils;

procedure get_list_cb_tp(CB_:TComboBox);   //need
procedure get_list_cb_tp_all(CB_:TComboBox);
procedure get_list_cb_brig_all(CB_:TComboBox);
procedure get_list_cb_brig_null(CB_:TComboBox);
procedure get_list_cb_pu_photo_status(CB_:TComboBox);
procedure get_list_cb_pu_photo_status_all(CB_:TComboBox);
procedure get_list_cb_model_all(CB_:TComboBox);
procedure get_list_cb_act_status_all(CB_:TComboBox);
procedure get_list_cb_act_status(CB_:TComboBox);
procedure get_list_cb_act_pay_status_all(CB_:TComboBox);
procedure get_list_cb_pu_pay_status_all(CB_:TComboBox);
procedure get_list_cb_pu_pay_status(CB_:TComboBox);
procedure get_list_cb_type_line(CB_:TComboBox);       //?
procedure get_list_cb_opore_state(CB_:TComboBox);   //need
procedure get_list_cb_type_inline(CB_:TComboBox);   //need
procedure get_list_cb_type_outline(CB_:TComboBox);
procedure get_list_cb_list_vvod(CB_:TComboBox);
procedure get_list_cb_street(CB_:TComboBox;tp_:integer);
procedure get_list_cb_abonent_status(CB_:TComboBox);
procedure get_list_cb_countragents(CB_:TComboBox;status_:integer);
procedure get_list_cb_contracts(CB_:TComboBox);


implementation

uses dm;

procedure get_list_cb_abonent_status(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_abonent_status,descr_abonent_status FROM list_abonent_status ;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_abonent_status').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_abonent_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
end;

procedure get_list_cb_tp(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_tp,tp_name FROM tp ORDER BY tp_name;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('tp_name').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_tp').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=cb_.Items.Count-1;
end;

procedure get_list_cb_tp_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 as id_tp, "Все" as tp_name from dual union SELECT id_tp,tp_name FROM tp ORDER BY tp_name;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('tp_name').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_tp').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_brig_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_brig,"Все" AS name_master FROM dual UNION SELECT id_brig,name_master FROM brigades where active=1 ORDER BY name_master;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('name_master').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_brig').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_brig_null(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_brig,"" AS name_master FROM dual UNION SELECT id_brig,name_master FROM brigades where active=1 ORDER BY name_master;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('name_master').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_brig').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_pu_photo_status(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_photo_status, descr_photo_status FROM list_photo_status ORDER BY descr_photo_status;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_photo_status').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_photo_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_pu_photo_status_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_photo_status,"Все" AS descr_photo_status FROM dual UNION SELECT id_photo_status, descr_photo_status FROM list_photo_status ORDER BY descr_photo_status;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.Items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_photo_status').AsString,Tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_photo_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_street(CB_:TComboBox;tp_:integer);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_street,street_name FROM tp_street where id_tp_a='+inttostr(tp_)+' ORDER BY street_name;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('street_name').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_street').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=0;
end;

procedure get_list_cb_model_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_pu_model,"Все" AS pu_model_name FROM dual UNION SELECT id_pu_model,concat(concat(pu_model_name," ("),CONCAT(model_faze),")")AS pu_model_name FROM pu_model ORDER BY pu_model_name;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('pu_model_name').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_pu_model').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_act_status_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_act_status,"Все" AS descr_act_status FROM dual UNION SELECT id_act_status, descr_act_status FROM list_act_status ORDER BY descr_act_status;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_act_status').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_act_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;

procedure get_list_cb_act_status(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_act_status, descr_act_status FROM list_act_status;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_act_status').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_act_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
end;



procedure get_list_cb_act_pay_status_all(CB_:TComboBox);
begin
  CB_.Items.Clear();
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 as id_act_pay_status,"Все" as descr_act_pay_status from dual union SELECT id_act_pay_status, descr_act_pay_status FROM list_act_pay_status;';
  dm1.ZQ_lib_cb_TMP.Open();
  dm1.ZQ_lib_cb_TMP.First();
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_act_pay_status').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_act_pay_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next();
    end;
  dm1.ZQ_lib_cb_TMP.Close();
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;


procedure get_list_cb_pu_pay_status(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_pu_pay_status, descr_pu_pay_status FROM list_pu_pay_status ORDER BY descr_pu_pay_status;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_pu_pay_status').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_pu_pay_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_pu_pay_status_all(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='select 0 AS id_pu_pay_status,"Все" AS descr_pu_pay_status FROM dual UNION SELECT id_pu_pay_status, descr_pu_pay_status FROM list_pu_pay_status ORDER BY descr_pu_pay_status;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_pu_pay_status').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_pu_pay_status').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(0))
end;
//tp
procedure get_list_cb_type_line(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_type_line, descr_type_line FROM list_type_line ORDER BY descr_type_line;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_type_line').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_type_line').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
end;

procedure get_list_cb_opore_state(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_opore_state, descr_opore_state FROM list_opore_state ORDER BY descr_opore_state;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_opore_state').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_opore_state').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_type_inline(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_type_inline, descr_type_inline FROM list_type_inline ORDER BY descr_type_inline;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_type_inline').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_type_inline').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_type_outline(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_type_outline, descr_type_outline FROM list_type_outline ORDER BY descr_type_outline;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_type_outline').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_type_outline').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_list_vvod(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_vvod, descr_vvod FROM list_vvod ORDER BY descr_vvod;';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('descr_vvod').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_vvod').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
  CB_.ItemIndex:=CB_.Items.IndexOfObject(tobject(1))
end;

procedure get_list_cb_countragents(CB_:TComboBox;status_:integer);
begin
  CB_.Items.Clear;
  //только активные контрагенты status_=0-все, 1-нет, 2-да
  case status_ of
    0:dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_counteragent,short_name FROM counteragents order by name;';
    1:dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_counteragent,short_name FROM counteragents WHERE STATUS=1;';
    2:dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_counteragent,short_name FROM counteragents WHERE STATUS=2;';
  end;
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('short_name').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_counteragent').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
end;
procedure get_list_cb_contracts(CB_:TComboBox);
begin
  CB_.Items.Clear;
  dm1.ZQ_lib_cb_TMP.SQL.Text:='SELECT id_contract,CONCAT_WS(" ",contract_name,CONCAT_WS("","(",CONCAT_WS(" - ",c1.short_name,c2.short_name),")")) AS str '+
    ' FROM contracts LEFT JOIN counteragents c1 ON c1.id_counteragent=contracts.id_counteragent_one_a LEFT JOIN counteragents c2 ON c2.id_counteragent=contracts.id_counteragent_two_a'+
    ' WHERE contracts.contract_status=2';
  dm1.ZQ_lib_cb_TMP.Open;
  dm1.ZQ_lib_cb_TMP.First;
  while not(dm1.ZQ_lib_cb_TMP.eof) do
    begin
      CB_.items.AddObject(dm1.ZQ_lib_cb_TMP.FieldByName('str').AsString,tobject(dm1.ZQ_lib_cb_TMP.FieldByName('id_contract').AsInteger));
      dm1.ZQ_lib_cb_TMP.Next;
    end;
  dm1.ZQ_lib_cb_TMP.Close;
end;
end.

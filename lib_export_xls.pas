unit lib_export_xls;

interface
uses DB, windows,sysutils ;

procedure create_save_xls_montage(DS_:TDataSet;tp_name,path_file:string);
procedure create_save_xls_m2(DS_:TDataSet;tp_name,path_file:string); //��������� ��������� ������.2
procedure create_save_xls_act_reestr(DS_:TDataSet;Date_:Tdatetime;path_file:string);
procedure create_save_xls_not_sign(DS_:TDataSet;tp_name,path_file:string);

implementation
uses  XLSFile, XLSFormat, XLSWorkbook;

function str_0toNull(st_:string):string;
begin
  if st_='0' then result:='' else result:=st_;
end;

procedure create_save_xls_montage(DS_:TDataSet;tp_name,path_file:string );
var
  xf: TXLSFile;
  i:integer;
  R: TRange;
begin
 { Create TXLSFile object }
  xf:= TXLSFile.Create;
  try
    { Sheet's index is 0-based }
    with xf.Workbook.Sheets[0] do
    begin
      //������ �����
      name:=tp_name;
      Columns[0].WidthPx:= 68;
      Columns[1].WidthPx:= 110;
      Columns[2].WidthPx:= 89;
      Columns[3].WidthPx:= 89;
      Columns[4].WidthPx:= 152;
      Columns[5].WidthPx:= 180;
      Columns[6].WidthPx:= 138;
      Columns[7].WidthPx:= 201;
      Columns[8].WidthPx:= 89;
      Columns[9].WidthPx:= 145;
      Columns[10].WidthPx:=138;
      Columns[11].WidthPx:= 320;
      Columns[12].WidthPx:= 201;
      Columns[13].WidthPx:= 201;
      Columns[14].WidthPx:= 89;
      Columns[15].WidthPx:= 89;
      Columns[16].WidthPx:= 180;
      Columns[17].WidthPx:= 145;
      Columns[18].WidthPx:= 138;
      Columns[19].WidthPx:= 145;
      Columns[20].WidthPx:= 145;
      Columns[21].WidthPx:= 145;
      Columns[22].WidthPx:= 180;
      Columns[23].WidthPx:= 119;
      Columns[24].WidthPx:= 119;
      Columns[25].WidthPx:= 159;
      Columns[26].WidthPx:= 69;
      cells[0,0].Value:='� �/�';
      cells[0,1].Value:='��';
      cells[0,2].Value:='� ������';
      cells[0,3].Value:='� �����';
      cells[0,4].Value:='��������� ������';
      cells[0,5].Value:='��� ����������';
      cells[0,6].Value:='������������� ������ �����';
      cells[0,7].Value:='��� �����';
      cells[0,8].Value:='��������';
      cells[0,9].Value:='������� ����';
      cells[0,10].Value:='��� �����������';
      cells[0,11].Value:='��� �����������';
      cells[0,12].Value:='���������� �����';
      cells[0,13].Value:='�����';
      cells[0,14].Value:='���';
      cells[0,15].Value:='��';
      cells[0,16].Value:='����������� �����';
      cells[0,17].Value:='� ���. ��';
      cells[0,18].Value:='���� ���������� ����';
      cells[0,19].Value:='������ ���������� ����';
      cells[0,20].Value:='��� ������� �����';
      cells[0,21].Value:='�������� �� �� �����������';
      cells[0,22].Value:='��������� ����� ��';
      cells[0,23].Value:='����� ������';
      cells[0,24].Value:='���� ���������';
      cells[0,25].Value:='������������ �� ������';
      cells[0,26].Value:='����';
  r:=ranges.add;
  r.addrect(0,0,0,26);
  r.FillPattern:= xlPatternSolid;
  r.FillPatternBGColorIndex:= 24;
  r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
  r.BorderStyle[xlBorderAll]:= bsThin;
  r.Wrap:=true;
  r.FontHeight:=12;
  r.HAlign:=xlHAlignCenter;
  r.VAlign:=xlVAlignCenter;
  r.DeleteRect(0);

    i:=1;
      ds_.First;
      while not ds_.Eof do
        begin

         cells[i,0].Value:=ds_.FieldByName('npp').AsString;
          cells[i,1].Value:=ds_.FieldByName('tp_name').AsString;
          cells[i,2].Value:=ds_.FieldByName('fider').AsString;
          cells[i,3].Value:=ds_.FieldByName('opore').AsString;
          cells[i,4].Value:=ds_.FieldByName('opore_state').AsString;
          cells[i,5].Value:=ds_.FieldByName('type_inline').AsString;
          cells[i,6].Value:=ds_.FieldByName('vvod').AsString;
          cells[i,7].Value:=ds_.FieldByName('type_outline').AsString;
          cells[i,8].Value:=ds_.FieldByName('faze').AsString;
          cells[i,9].Value:=ds_.FieldByName('p_number').AsString;
          cells[i,10].Value:=ds_.FieldByName('abonent_status').AsString;
          cells[i,11].Value:=ds_.FieldByName('FIO').AsString;
          cells[i,12].Value:=ds_.FieldByName('tp_address').AsString;
          cells[i,13].Value:=ds_.FieldByName('street_name').AsString;
          cells[i,14].Value:=ds_.FieldByName('house').AsString;
          cells[i,15].Value:=ds_.FieldByName('room').AsString;
          cells[i,16].Value:=ds_.FieldByName('kadastr').AsString;  // ��� ������ ���� ��� ����������� ����� - ����� ���������
          cells[i,17].Value:=ds_.FieldByName('sn_old_pu').AsString;
          cells[i,18].Value:=ds_.FieldByName('date_sign').AsString;
          cells[i,19].Value:=ds_.FieldByName('act_status').AsString;
          cells[i,20].Value:=ds_.FieldByName('pu_model_name').AsString;
          cells[i,21].Value:=ds_.FieldByName('model_faze').AsString;
          cells[i,22].Value:=ds_.FieldByName('pu_sn').AsString;
          cells[i,23].Value:=ds_.FieldByName('pu_plomb').AsString;
          cells[i,24].Value:=ds_.FieldByName('date_install').AsString;
          cells[i,25].Value:=ds_.FieldByName('name_master').AsString;
          cells[i,26].Value:=ds_.FieldByName('photo_status').AsString;

          ds_.Next;
          i:=i+1;
        end;
//   r.DeleteRect(0);
       r:=ranges.Add;
       r.AddRect(1,i-1,0,26);
       r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
       r.BorderStyle[xlBorderAll]:= bsThin;
       r.HAlign:=xlHAlignCenter;
       r.Wrap:=true;
       r.FontHeight:=11;

       r:=ranges.Add;
       r.AddRect(1,i-1,11,11);
       r.HAlign:= xlHAlignLeft;

       windowoptions.ZoomPercent:=70;

    end;
    xf.SaveAs(path_file);
  finally
    xf.Destroy;
  end;

end;

procedure create_save_xls_m2(DS_:TDataSet;tp_name,path_file:string );
var
  xf: TXLSFile;
  i:integer;
  R: TRange;
begin
 { Create TXLSFile object }
  xf:= TXLSFile.Create;
  try
    { Sheet's index is 0-based }
    with xf.Workbook.Sheets[0] do
    begin
      //������ �����
      name:=tp_name;
      Columns[0].WidthPx:= 310; cells[0,0].Value:='id';
      Columns[1].WidthPx:= 150; cells[0,1].Value:='��� ��������';
      Columns[2].WidthPx:= 68; cells[0,2].Value:='� �/�';
      Columns[3].WidthPx:= 160; cells[0,3].Value:='������������ �������';
      Columns[4].WidthPx:= 160; cells[0,4].Value:='������������ ��';
      Columns[5].WidthPx:= 150; cells[0,5].Value:='������������ ���';
      Columns[6].WidthPx:= 150; cells[0,6].Value:='������������ ��';
      Columns[7].WidthPx:= 160; cells[0,7].Value:='������������ ��� 6(10)��';
      Columns[8].WidthPx:= 90; cells[0,8].Value:='������������ �� 6(10)/0,4��';
      Columns[9].WidthPx:= 68; cells[0,9].Value:='����� 0,4��';
      Columns[10].WidthPx:= 68; cells[0,10].Value:='����� �����';
//      cells[0,4].Value:='��������� ������';
//      cells[0,5].Value:='��� ����������';
//      cells[0,6].Value:='������������� ������ �����';
//      cells[0,7].Value:='��� �����';
//      cells[0,8].Value:='��������';
      Columns[11].WidthPx:= 110; cells[0,11].Value:='��� �����������';
      Columns[12].WidthPx:= 180; cells[0,12].Value:='���. �����';
      Columns[13].WidthPx:= 180; cells[0,13].Value:='�����';
      Columns[14].WidthPx:= 68; cells[0,14].Value:='���';
      Columns[15].WidthPx:= 68; cells[0,15].Value:='��';
      Columns[16].WidthPx:= 130; cells[0,16].Value:='������� ����';
      Columns[17].WidthPx:= 310; cells[0,17].Value:='��� �����������';
      Columns[18].WidthPx:= 200; cells[0,18].Value:='GPS �.�.';
      Columns[19].WidthPx:= 200; cells[0,19].Value:='GPS �.�.';
      Columns[20].WidthPx:= 80; cells[0,20].Value:='������� ��� �������';
      Columns[21].WidthPx:= 150; cells[0,21].Value:='��� ������� �����';
      Columns[22].WidthPx:= 150; cells[0,22].Value:='��������� ����� ��';
      Columns[23].WidthPx:= 100; cells[0,23].Value:='����� ������';
      Columns[24].WidthPx:= 68; cells[0,24].Value:='�����.��.����';
      Columns[25].WidthPx:= 100; cells[0,25].Value:='����� �-�� � ���� �';
      Columns[26].WidthPx:= 100; cells[0,26].Value:='����� ������ �� ��-�� � ���� A';
      Columns[27].WidthPx:= 100; cells[0,27].Value:='����� �-�� � ���� B';
      Columns[28].WidthPx:= 100; cells[0,28].Value:='����� ������ �� ��-�� � ���� B';
      Columns[29].WidthPx:= 100; cells[0,29].Value:='����� �-�� � ���� C';
      Columns[30].WidthPx:= 100; cells[0,30].Value:='����� ������ �� ��-�� � ���� C';
      Columns[31].WidthPx:= 110; cells[0,31].Value:='���� �������';
      Columns[32].WidthPx:= 150; cells[0,32].Value:='������������ �� ������';
      Columns[33].WidthPx:= 200; cells[0,33].Value:='����������';
      Columns[34].WidthPx:= 120; cells[0,34].Value:='����� ���. ��';
      Columns[35].WidthPx:= 120; cells[0,35].Value:='��� ���. ��';
      Columns[36].WidthPx:= 180; cells[0,36].Value:='����������� �����';
      Columns[37].WidthPx:= 68; cells[0,37].Value:='act id';
      Columns[38].WidthPx:= 68; cells[0,38].Value:='������ �������������';
      Columns[39].WidthPx:= 68; cells[0,39].Value:='�������� �������������';
      Columns[40].WidthPx:= 90; cells[0,40].Value:='������ ����';
      Columns[41].WidthPx:= 150; cells[0,41].Value:='����� �� �� ����';
      Columns[42].WidthPx:= 110; cells[0,42].Value:='���� ���������� ����';
      Columns[43].WidthPx:= 68; cells[0,43].Value:='�������� �� �� ��������';
      Columns[44].WidthPx:= 68; cells[0,44].Value:='����';
  r:=ranges.add;
  r.addrect(0,0,0,44);
  r.FillPattern:= xlPatternSolid;
  r.FillPatternBGColorIndex:= 24;
  r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
  r.BorderStyle[xlBorderAll]:= bsThin;
  r.Wrap:=true;
  r.FontHeight:=12;
  r.HAlign:=xlHAlignCenter;
  r.VAlign:=xlVAlignCenter;
  r.DeleteRect(0);

    i:=1;
      ds_.First;
      while not ds_.Eof do
        begin
          cells[i,0].Value:=ds_.FieldByName('y_id').AsString;
          cells[i,1].Value:=ds_.FieldByName('type_point').AsString;
          cells[i,2].Value:=ds_.FieldByName('npp').AsString;
          cells[i,3].Value:=ds_.FieldByName('name_object').AsString;
          cells[i,4].Value:=ds_.FieldByName('tp_name_PO').AsString;
          cells[i,5].Value:=ds_.FieldByName('tp_name_RES').AsString;
          cells[i,6].Value:=ds_.FieldByName('tp_name_PS').AsString;
          cells[i,7].Value:=ds_.FieldByName('name_LEP').AsString;
          cells[i,8].Value:=ds_.FieldByName('tp_name').AsString;
          cells[i,9].Value:=ds_.FieldByName('fider').AsString;
          cells[i,10].Value:=ds_.FieldByName('opore').AsString;
//          cells[i,4].Value:=ds_.FieldByName('opore_state').AsString;
//          cells[i,5].Value:=ds_.FieldByName('type_inline').AsString;
//          cells[i,6].Value:=ds_.FieldByName('vvod').AsString;
//          cells[i,7].Value:=ds_.FieldByName('type_outline').AsString;
          cells[i,11].Value:=ds_.FieldByName('abonent_status').AsString;
          cells[i,12].Value:=ds_.FieldByName('tp_address').AsString;
          cells[i,13].Value:=ds_.FieldByName('street_name').AsString;
          cells[i,14].Value:=ds_.FieldByName('house').AsString;
          cells[i,15].Value:=ds_.FieldByName('room').AsString;
          cells[i,16].Value:=ds_.FieldByName('p_number').AsString;
          cells[i,17].Value:=ds_.FieldByName('FIO').AsString;
          cells[i,18].Value:=ds_.FieldByName('point_coordinate_1').AsString;
          cells[i,19].Value:=ds_.FieldByName('point_coordinate_2').AsString;
          cells[i,20].Value:=ds_.FieldByName('ppo_faze').AsString;
          cells[i,21].Value:=ds_.FieldByName('pu_model_name').AsString;
          cells[i,22].Value:=ds_.FieldByName('pu_sn').AsString;
          cells[i,23].Value:=ds_.FieldByName('pu_plomb').AsString;
          cells[i,24].Value:=ds_.FieldByName('k_tt').AsString;
          cells[i,25].Value:=ds_.FieldByName('tt1_sn').AsString;
          cells[i,26].Value:=ds_.FieldByName('tt1_plomb').AsString;
          cells[i,27].Value:=ds_.FieldByName('tt2_sn').AsString;
          cells[i,28].Value:=ds_.FieldByName('tt2_plomb').AsString;
          cells[i,29].Value:=ds_.FieldByName('tt3_sn').AsString;
          cells[i,30].Value:=ds_.FieldByName('tt3_plomb').AsString;
          cells[i,31].Value:=ds_.FieldByName('date_install').AsString;
          cells[i,32].Value:=ds_.FieldByName('name_master').AsString;
          cells[i,33].Value:=ds_.FieldByName('comments').AsString;
          cells[i,34].Value:=ds_.FieldByName('sn_old_pu').AsString;
          cells[i,35].Value:=ds_.FieldByName('old_pu_model').AsString;
          cells[i,36].Value:=ds_.FieldByName('kadastr').AsString;  // ��� ������ ���� ��� ����������� ����� - ����� ���������
          cells[i,37].Value:=ds_.FieldByName('y_id_act').AsString;
          cells[i,38].Value:=ds_.FieldByName('st_ident').AsString;
          cells[i,39].Value:=ds_.FieldByName('source_ident').AsString;
          cells[i,40].Value:=ds_.FieldByName('act_status').AsString;
          cells[i,41].Value:=ds_.FieldByName('pu_sn_adpu').AsString;
          cells[i,42].Value:=ds_.FieldByName('date_sign').AsString;
          cells[i,43].Value:=ds_.FieldByName('model_faze').AsString;
          cells[i,44].Value:=ds_.FieldByName('photo_status').AsString;

          ds_.Next;
          i:=i+1;
        end;

//   r.DeleteRect(0);
       r:=ranges.Add;
       r.AddRect(1,i-1,0,44);
       r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
       r.BorderStyle[xlBorderAll]:= bsThin;
       r.HAlign:=xlHAlignCenter;
       r.Wrap:=true;
       r.FontHeight:=11;

       r:=ranges.Add;
       r.AddRect(1,i-1,17,17);
       r.HAlign:= xlHAlignLeft;

       windowoptions.ZoomPercent:=70;

    end;
    xf.SaveAs(path_file);
  finally
    xf.Destroy;
  end;

end;

procedure create_save_xls_act_reestr(DS_:TDataSet;Date_:Tdatetime;path_file:string);
var
  xf: TXLSFile;
  i,ind_f:integer;
  R: TRange;
begin
 { Create TXLSFile object }
  xf:= TXLSFile.Create;
  try
    { Sheet's index is 0-based }
    with xf.Workbook.Sheets[0] do
    begin
      //������ �����
      name:=formatdatetime('yyyymmdd',Date_);

      Columns[0].WidthPx:= 33;
      Columns[1].WidthPx:= 87;
      Columns[2].WidthPx:= 47;
      Columns[3].WidthPx:= 135;
      Columns[4].WidthPx:= 193;
      Columns[5].WidthPx:= 65;
      Columns[6].WidthPx:= 65;
      Columns[7].WidthPx:= 110;
      Columns[8].WidthPx:= 117;
      Columns[9].WidthPx:= 131;
      Columns[10].WidthPx:=61;
      Columns[11].WidthPx:= 61;
      Columns[12].WidthPx:= 54;
      Columns[13].WidthPx:= 54;
      Columns[14].WidthPx:= 110;
      Columns[15].WidthPx:= 124;
      Columns[16].WidthPx:= 71;
      Columns[17].WidthPx:= 71;
      Columns[18].WidthPx:= 71;
      Columns[19].WidthPx:= 71;
      Columns[20].WidthPx:= 82;
      Columns[21].WidthPx:= 82;
      Columns[22].WidthPx:= 68;
      Columns[23].WidthPx:= 117;



      r:=ranges.Add();
      r.AddRect(1,2,0,15);
      r.MergeCells();
      r.Wrap:=true;
      r.Clear();
      r:=ranges.Add();
      r.AddRect(0,0,16,22);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(1,1,16,22);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(2,2,16,22);
      r.MergeCells();
      r.Clear();

      rows[1].Height:=30;
      rows[2].Height:=30;


      cells[1,0].Value:='������ �������� ����� ������� �������� ����� � ������������ '+FormatDateTime('dd.mm.yyyy', Date_)+'�.'+chr(10)+chr(13)+'��� "�����" - "����� ������", �� "�������������" ';
      cells[1,0].HAlign:=xlHAlignCenter;
      cells[1,0].VAlign:=xlVAlignCenter;
      cells[1,0].FontBold:=true;
      cells[1,0].FontName:='Times New Roman';
      cells[1,0].FontHeight:=11;
      cells[1,0].Wrap:=true;

      cells[0,16].Value:= '������ �� �������� "����� ������� �������� �����"';
      cells[0,16].HAlign:=xlHAlignLeft;
      cells[0,16].FontBold:=true;
      cells[0,16].FontName:='Times New Roman';
      cells[0,16].FontHeight:=11;
      cells[0,16].Wrap:=true;

      cells[1,16].Value:= '�� �������� � ���-039/19 �� 15.08.2019�. ����� ��� �� "������������" � ��� "�����"';
      cells[1,16].HAlign:=xlHAlignLeft;
      cells[1,16].FontBold:=false;
      cells[1,16].FontName:='Times New Roman';
      cells[1,16].FontHeight:=11;
      cells[1,16].Wrap:=true;

      cells[2,16].Value:= '������� ����������� ������ (������) (����������� ������� ����� �������������� � �������� ������ ������) ��� ���� ������� ��� �����';
      cells[2,16].HAlign:=xlHAlignLeft;
      cells[2,16].FontBold:=false;
      cells[2,16].FontName:='Times New Roman';
      cells[2,16].FontHeight:=11;
      cells[2,16].Wrap:=true;

      rows[4].Height:=65;

      for i in [0..9,14,15,20..22] do
        begin
          r:=ranges.Add();
          r.AddRect(4,5,i,i);
          r.MergeCells();
          r.Clear();
        end;
      r:=ranges.Add();
      r.AddRect(4,4,10,13);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(4,4,16,19);
      r.MergeCells();
      r.Clear();

      cells[4,0].Value:='� �/�';
      cells[4,1].Value:='���';
      cells[4,2].Value:='��';
      cells[4,3].Value:='������������ ����������� ������';
      cells[4,4].Value:='�����';
      cells[4,5].Value:='���';
      cells[4,6].Value:='��������';
      cells[4,7].Value:='� �������� �����';
      cells[4,8].Value:='����� ������� ��';
      cells[4,9].Value:='��������� ����� ������� ��';
      cells[4,10].Value:='��������� ������� ��';
      cells[5,10].Value:='�����';
      cells[5,11].Value:='�1';
      cells[5,12].Value:='�2';
      cells[5,13].Value:='�3';
      cells[4,14].Value:='����� �������������� ��';
      cells[4,15].Value:='��������� ����� �������������� ��';
      cells[4,16].Value:='��������� �������������� ��';
      cells[5,16].Value:='�����';
      cells[5,17].Value:='�1';
      cells[5,18].Value:='�2';
      cells[5,19].Value:='�3';
      cells[4,20].Value:='���� ���������';
      cells[4,21].Value:='����� ���������';
      cells[4,22].Value:='� ������';
      cells[4,23].Value:='��� ������������� ������';

  r:=ranges.add;
  r.addrect(4,5,0,23);
  r.FillPattern:= xlPatternSolid;
//  r.FillPatternBGColorIndex:= 24;
  r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
  r.BorderStyle[xlBorderAll]:= bsThin;
  r.Wrap:=true;
  r.FontHeight:=11;
  r.HAlign:=xlHAlignCenter;
  r.VAlign:=xlVAlignCenter;
  r.FontName:='Calibri';
  r.FontBold:= true;
  r.DeleteRect(0);

    ind_f:=xf.Workbook.FormatStrings.AddFormat('000000.00');
    i:=6;
      ds_.First;
      while not ds_.Eof do
        begin
          cells[i,0].Value:=ds_.FieldByName('npp').AsString;
          cells[i,1].Value:='����������';
          cells[i,2].Value:=ds_.FieldByName('tp_name').AsString;
          cells[i,3].Value:=ds_.FieldByName('tp_address').AsString;
          cells[i,4].Value:=ds_.FieldByName('street_name').AsString;
          cells[i,5].Value:=ds_.FieldByName('house').AsString;
          cells[1,6].Value:=ds_.FieldByName('room').AsString;
          cells[i,7].Value:=ds_.FieldByName('p_number').AsString;
          cells[i,8].Value:=ds_.FieldByName('old_pu_model').AsString;
          cells[i,9].Value:=ds_.FieldByName('sn_old_pu').AsString;
          cells[i,10].Value:=str_0toNull(ds_.FieldByName('old_sum_t').AsString);
          cells[i,11].Value:=str_0toNull(ds_.FieldByName('old_pu_t1').AsString);
          cells[i,12].Value:=str_0toNull(ds_.FieldByName('old_pu_t2').AsString);
          cells[i,13].Value:=str_0toNull(ds_.FieldByName('old_pu_t3').AsString);
          cells[i,14].Value:=ds_.FieldByName('pu_model_name').AsString;
          cells[i,15].Value:=ds_.FieldByName('pu_sn').AsString;
          if ds_.FieldByName('new_sum_t').AsFloat<>0 then
            begin
              cells[i,16].Value:=ds_.FieldByName('new_sum_t').AsFloat;
              cells[i,16].FormatStringIndex:=ind_f;
            end;
          if ds_.FieldByName('new_pu_t1').AsFloat<>0 then
            begin
              cells[i,17].Value:=ds_.FieldByName('new_pu_t1').AsFloat;  // ��� ������ ���� ��� ����������� ����� - ����� ���������
              cells[i,17].FormatStringIndex:=ind_f;
            end;
          if ds_.FieldByName('new_pu_t2').AsFloat<>0 then
            begin
              cells[i,18].Value:=ds_.FieldByName('new_pu_t2').AsFloat;
              cells[i,18].FormatStringIndex:=ind_f;
            end;
          if ds_.FieldByName('new_pu_t3').AsFloat<>0 then
            begin
              cells[i,19].Value:=ds_.FieldByName('new_pu_t3').AsFloat;
              cells[i,19].FormatStringIndex:=ind_f;
            end;
          cells[i,20].Value:=ds_.FieldByName('date_install').AsString;
          cells[i,21].Value:=ds_.FieldByName('place_install').AsString;
          cells[i,22].Value:=ds_.FieldByName('pu_plomb').AsString;
          cells[i,23].Value:=ds_.FieldByName('name_master').AsString;
          ds_.Next;
          i:=i+1;
        end;

       r:=ranges.Add;
       r.AddRect(5,i-1,0,23);
       r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
       r.BorderStyle[xlBorderAll]:= bsThin;
       r.HAlign:=xlHAlignCenter;
       r.Wrap:=true;
       r.FontHeight:=11;
       r.FontName:='Calibri';
       r:=ranges.Add;

       rows[i+1].Height:=54;
       rows[i+2].Height:=54;

      r:=ranges.Add();
      r.AddRect(i+1,i+1,3,6);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(i+2,i+2,3,6);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(i+1,i+1,7,15);
      r.MergeCells();
      r.Clear();
      r:=ranges.Add();
      r.AddRect(i+2,i+2,7,15);
      r.MergeCells();
      r.Clear();

      cells[i+1,3].Value:='���� ��������� ��� �� "������������"';
      cells[i+1,3].HAlign:=xlHAlignLeft;
      cells[i+1,3].VAlign:=xlVAlignBottom;
      cells[i+1,3].FontBold:=true;
      cells[i+1,3].FontName:='Times New Roman';
      cells[i+1,3].FontHeight:=11;

      cells[i+2,3].Value:='������ ��������� ���������� ������ ��� "�����"';
      cells[i+2,3].HAlign:=xlHAlignLeft;
      cells[i+1,3].VAlign:=xlVAlignBottom;
      cells[i+2,3].FontBold:=true;
      cells[i+2,3].FontName:='Times New Roman';
      cells[i+2,3].FontHeight:=11;

      cells[i+1,7].Value:='_________________________________________________________________________________________';
      cells[i+2,7].Value:='_________________________________________________________________________________________';

              r:=ranges.Add();
      r.AddRect(0,2,16,22);
//      r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
R.BordersOutline(xlColorBlack, bsMedium);

  r.DeleteRect(0);

       windowoptions.ZoomPercent:=70;
       PageSetup.PrintArea.AddRect(0, i+3, 0, 23);
       pagesetup.FitPagesWidth:=1;
//       pagesetup.FitPagesHeight:=1;
       PageSetup.Orientation:= xlLandscape;
       pagesetup.HeaderMargin:=0.70;
       pagesetup.LeftMargin:=0.2;
       pagesetup.RightMargin:=0.2;
       pagesetup.BottomMargin:=0.2;
       pagesetup.HeaderMargin:=0;
       pagesetup.BottomMargin:=0;
       windowoptions.ZoomPercent:=70;
       pagesetup.zoom:=false;
       windowoptions.PageBreakPreview:=true;

    end;
    xf.SaveAs(path_file);
  finally
    xf.Destroy;
  end;
end;

procedure create_save_xls_not_sign(DS_:TDataSet;tp_name,path_file:string);
var
  xf: TXLSFile;
  i:integer;
  R: TRange;
begin
 { Create TXLSFile object }
  xf:= TXLSFile.Create;
  try
    { Sheet's index is 0-based }
    with xf.Workbook.Sheets[0] do
    begin
      //������ �����
      name:=tp_name;
      Columns[0].WidthPx:= 62;
      Columns[1].WidthPx:= 100;
      Columns[2].WidthPx:= 75;
      Columns[3].WidthPx:= 75;
      Columns[4].WidthPx:= 125;
      Columns[5].WidthPx:= 290;
      Columns[6].WidthPx:= 170;
      Columns[7].WidthPx:= 170;
      Columns[8].WidthPx:= 75;
      Columns[9].WidthPx:= 75;
      Columns[10].WidthPx:= 125;
      Columns[11].WidthPx:= 125;
      Columns[12].WidthPx:= 62;
      Columns[13].WidthPx:= 160;
      Columns[14].WidthPx:= 100;
      cells[0,0].Value:='� �/�';
      cells[0,1].Value:='��';
      cells[0,2].Value:='� ������';
      cells[0,3].Value:='� �����';
      cells[0,4].Value:='������� ����';
      cells[0,5].Value:='��� �����������';
      cells[0,6].Value:='���������� �����';
      cells[0,7].Value:='�����';
      cells[0,8].Value:='���';
      cells[0,9].Value:='��';
      cells[0,10].Value:='� ���. ��';
      cells[0,11].Value:='��� ������� �����';
      cells[0,12].Value:='�������� �� �� �����������';
      cells[0,13].Value:='��������� ����� ��';
      cells[0,14].Value:='����� ������';
  r:=ranges.add;
  r.addrect(0,0,0,14);
  r.FillPattern:= xlPatternSolid;
  r.FillPatternBGColorIndex:= 24;
  r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
  r.BorderStyle[xlBorderAll]:= bsThin;
  r.Wrap:=true;
  r.FontHeight:=12;
  r.HAlign:=xlHAlignCenter;
  r.VAlign:=xlVAlignCenter;
  r.DeleteRect(0);

    i:=1;
      ds_.First;
      while not ds_.Eof do
        begin
           rows[i].Height:=20;
         cells[i,0].Value:=ds_.FieldByName('npp').AsString;
          cells[i,1].Value:=ds_.FieldByName('tp_name').AsString;
          cells[i,2].Value:=ds_.FieldByName('fider').AsString;
          cells[i,3].Value:=ds_.FieldByName('opore').AsString;
          cells[i,4].Value:=ds_.FieldByName('p_number').AsString;
          cells[i,5].Value:=ds_.FieldByName('FIO').AsString;
          cells[i,6].Value:=ds_.FieldByName('tp_address').AsString;
          cells[i,7].Value:=ds_.FieldByName('street_name').AsString;
          cells[i,8].Value:=ds_.FieldByName('house').AsString;
          cells[i,9].Value:=ds_.FieldByName('room').AsString;
          cells[i,10].Value:=ds_.FieldByName('sn_old_pu').AsString;
          cells[i,11].Value:=ds_.FieldByName('pu_model_name').AsString;
          cells[i,12].Value:=ds_.FieldByName('model_faze').AsString;
          cells[i,13].Value:=ds_.FieldByName('pu_sn').AsString;
          cells[i,14].Value:=ds_.FieldByName('pu_plomb').AsString;

          ds_.Next;
          i:=i+1;
        end;
//   r.DeleteRect(0);
       r:=ranges.Add;
       r.AddRect(1,i-1,0,14);
       r.BorderColorRGB[xlBorderAll]:= RGB(0, 0, 0);
       r.BorderStyle[xlBorderAll]:= bsThin;
       r.HAlign:=xlHAlignCenter;
       r.Wrap:=true;
       r.FontHeight:=11;
       r.VAlign:=xlVAlignCenter;

       r:=ranges.Add;
       r.AddRect(1,i-1,5,6);
       r.HAlign:= xlHAlignLeft;


       windowoptions.ZoomPercent:=70;
       PageSetup.PrintArea.AddRect(0, i-1, 0, 14);
       pagesetup.FitPagesWidth:=1;
//       pagesetup.FitPagesHeight:=1;
       PageSetup.Orientation:= xlLandscape;
       pagesetup.HeaderMargin:=0.20;
       pagesetup.LeftMargin:=0.2;
       pagesetup.RightMargin:=0.2;
       pagesetup.BottomMargin:=0.2;
       pagesetup.HeaderMargin:=0;
       pagesetup.BottomMargin:=0;
       windowoptions.ZoomPercent:=60;
       pagesetup.zoom:=false;
       windowoptions.PageBreakPreview:=true;


    end;
    xf.SaveAs(path_file);
  finally
    xf.Destroy;
  end;

end;


end.


unit F08_pu_pay_act_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TF_pu_pay_act_rec = class(TForm)
    E_doc: TEdit;
    BitBtn1: TBitBtn;
    DT_create: TDateTimePicker;
    B_apply: TBitBtn;
    DBG2: TDBGrid;
    DBG1: TDBGrid;
    B_left: TBitBtn;
    B_Del: TBitBtn;
    r0: TRadioButton;
    r1: TRadioButton;
    r3: TRadioButton;
    SB1: TStatusBar;
    procedure B_DelClick(Sender: TObject);
    procedure B_leftClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure r3Click(Sender: TObject);
    procedure r1Click(Sender: TObject);
    procedure r0Click(Sender: TObject);
    procedure B_applyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_pay_act_rec: TF_pu_pay_act_rec;

implementation

{$R *.dfm}
uses DM;
procedure TF_pu_pay_act_rec.BitBtn1Click(Sender: TObject);
begin
  if dm1.ZQ_pu_pay_RAM.RecordCount>0 then
    begin
      if F_pu_pay_act_rec.Tag=0 then
        begin
          dm1.ZQ_pu_pay_TMP.SQL.Text:='insert into pu_pay_doc (date_create,doc_name) values("'+formatdatetime('yyyy-mm-dd',DT_create.Date)+'","'+e_doc.Text+'")';
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          DBG1.DataSource.DataSet.DisableControls();
          dm1.ZQ_pu_pay_RAM.First();
          dm1.ZQ_pu_pay_TMP.SQL.Text:='insert into pu_pay_doc_detail (id_pu_pay_doc_a,pu_sn_a) values ';
          while not(dm1.ZQ_pu_pay_RAM.Eof) do
            begin
              dm1.ZQ_pu_pay_TMP.SQL.Add('(LAST_INSERT_ID(),"'+dm1.ZQ_pu_pay_RAM.FieldByName('pu_sn').AsString+'"),');
              dm1.ZQ_pu_pay_RAM.Next();
            end;
          dm1.ZQ_pu_pay_TMP.SQL.Text:= copy(dm1.ZQ_pu_pay_TMP.SQL.Text,1,length(dm1.ZQ_pu_pay_TMP.SQL.Text)-3);
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          dm1.ZQ_pu_pay_TMP.SQL.Text:='update pu_pay_doc set doc_name=concat("'+copy(e_doc.Text,1,pos('-',e_doc.Text))+'",id_pu_pay_doc) where doc_name like "%-new";';
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          DBG1.DataSource.DataSet.EnableControls();
        end;
      if F_pu_pay_act_rec.Tag=1 then
        begin
          dm1.ZQ_pu_pay_TMP.SQL.Text:='delete from pu_pay_doc_detail where id_pu_pay_doc_a='+copy(e_doc.Text,pos('-',e_doc.Text)+1,length(e_doc.Text)-pos('-',e_doc.Text))+';';
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          DBG1.DataSource.DataSet.DisableControls();
          dm1.ZQ_pu_pay_RAM.First();
          dm1.ZQ_pu_pay_TMP.SQL.Text:='insert into pu_pay_doc_detail (id_pu_pay_doc_a,pu_sn_a) values ';
          while not(dm1.ZQ_pu_pay_RAM.Eof) do
            begin
              dm1.ZQ_pu_pay_TMP.SQL.Add('('+copy(e_doc.Text,pos('-',e_doc.Text)+1,length(e_doc.Text)-pos('-',e_doc.Text))+',"'+dm1.ZQ_pu_pay_RAM.FieldByName('pu_sn').AsString+'"),');
              dm1.ZQ_pu_pay_RAM.Next();
            end;
          dm1.ZQ_pu_pay_TMP.SQL.Text:= copy(dm1.ZQ_pu_pay_TMP.SQL.Text,1,length(dm1.ZQ_pu_pay_TMP.SQL.Text)-3);
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          dm1.ZQ_pu_pay_TMP.SQL.Text:='update pu_pay_doc set date_create="'+formatdatetime('yyyy-mm-dd',DT_create.Date)+'" where doc_name ="'+e_doc.Text+'";';
          dm1.ZQ_pu_pay_TMP.ExecSQL();
          DBG1.DataSource.DataSet.EnableControls();
        end;
    end;
  close;
end;

procedure TF_pu_pay_act_rec.B_leftClick(Sender: TObject);
var i:integer;
begin
  if DBG2.SelectedRows.Count>0 then
    begin
      DBG2.Datasource.Dataset.DisableControls();
      for i := 0 to dbg2.SelectedRows.Count - 1 do
        begin
          dbg2.DataSource.DataSet.GotoBookmark(Pointer(DBG2.SelectedRows.Items[i]));
          dm1.ZQ_pu_pay_TMP.SQL.Text:='insert into TMP_pu_pay_list (tp_name,faze,pu_sn) values ("'+dbg2.DataSource.DataSet.FieldByName('tp_name').AsString+'",'+
              inttostr(dbg2.DataSource.DataSet.FieldByName('model_faze').AsInteger)+',"'+dbg2.DataSource.DataSet.FieldByName('pu_sn').AsString+'");';
          dm1.ZQ_pu_pay_TMP.ExecSQL();
        end;
  //    dbg2.DataSource.DataSet.free
      dm1.ZQ_pu_pay_RAM.Close();
      dm1.ZQ_pu_pay_RAM.Open();
      dm1.ZQ_pu_pay_TMP.SQL.Clear();
      dm1.ZQ_pu_pay_not_list.Refresh();
      dbg2.SelectedRows.Clear();
      DBG2.Datasource.Dataset.EnableControls();
    end;

end;

procedure TF_pu_pay_act_rec.B_DelClick(Sender: TObject);
var i:integer;
begin
  if dm1.ZQ_pu_pay_RAM.RecordCount>0 then
    begin
      if DBG1.SelectedRows.Count>0 then
        begin
          DBG1.Datasource.Dataset.DisableControls();
          for i := 0 to DBG1.SelectedRows.Count - 1 do
            begin
              dbg1.DataSource.DataSet.GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
              dm1.ZQ_pu_pay_TMP.SQL.Text:='delete from TMP_pu_pay_list where pu_sn="'+dbg1.DataSource.DataSet.FieldByName('pu_sn').AsString+'";';
              dm1.ZQ_pu_pay_TMP.ExecSQL();
            end;
          dm1.ZQ_pu_pay_RAM.Close();
          dm1.ZQ_pu_pay_RAM.Open();
          dm1.ZQ_pu_pay_TMP.SQL.Clear();
//          dm1.ZQ_pu_pay_not_list.Refresh();
          dbg1.SelectedRows.Clear();
          DBG1.Datasource.Dataset.EnableControls();
        end;
    end;
end;

procedure TF_pu_pay_act_rec.B_applyClick(Sender: TObject);
begin
//  dm1.zq_pu_pay_RAM.Refresh();
//  dm1.ZQ_pu_pay_RAM.
  dm1.ZQ_pu_pay_not_list.Close();
  dm1.ZQ_pu_pay_not_list.Open();
end;

procedure TF_pu_pay_act_rec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm1.ZQ_pu_pay_RAM.Close();
  dm1.ZQ_pu_pay_TMP.SQL.Text:='drop table TMP_pu_pay_list';
  dm1.ZQ_pu_pay_TMP.ExecSQL();
  dm1.ZQ_pu_pay_TMP.SQL.Clear();
  dm1.ZQ_pu_pay_not_list.Close();
  dm1.ZQ_pu_pay_act.Refresh();
end;

procedure TF_pu_pay_act_rec.FormShow(Sender: TObject);
begin
  dm1.ZQ_pu_pay_TMP.SQL.Text:='CREATE TEMPORARY TABLE TMP_pu_pay_list (tp_name char(10),faze TINYINT(4),pu_sn char(13))';
  dm1.ZQ_pu_pay_TMP.ExecSQL();
  if f_pu_pay_act_rec.Tag=1 then
    begin
      dm1.ZQ_pu_pay_TMP.SQL.Text:='SELECT  pu_pay_doc_detail.pu_sn_a,tp.tp_name,pu_model.model_faze from pu_pay_doc_detail'+
        ' left join pu on pu.pu_sn=pu_pay_doc_detail.pu_sn_a'+
        ' LEFT join tp ON tp.id_tp=pu.id_tp_a'+
        ' LEFT JOIN pu_model ON pu_model.id_pu_model=pu.id_pu_model_a'+
        ' where id_pu_pay_doc_a='+copy(e_doc.Text,pos('-',e_doc.Text)+1,length(e_doc.Text)-pos('-',e_doc.Text))+' ORDER BY tp.tp_name,pu_model.model_faze,pu_pay_doc_detail.pu_sn_a';
      dm1.ZQ_pu_pay_TMP.Open();
      dm1.ZQ_pu_pay_TMP.First();
      while not(dm1.ZQ_pu_pay_TMP.Eof) do
        begin
          dm1.ZQ_pu_pay_TMP2.SQL.Text:='insert into TMP_pu_pay_list (tp_name,faze,pu_sn) values ("'+dm1.ZQ_pu_pay_TMP.FieldByName('tp_name').AsString+'",'+
              inttostr(dm1.ZQ_pu_pay_TMP.FieldByName('model_faze').AsInteger)+',"'+dm1.ZQ_pu_pay_TMP.FieldByName('pu_sn_a').AsString+'");';
          dm1.ZQ_pu_pay_TMP2.ExecSQL();
          dm1.ZQ_pu_pay_TMP.Next();
        end;
      dm1.ZQ_pu_pay_TMP2.SQL.Clear();
      dm1.ZQ_pu_pay_TMP.Close();
    end;
  dm1.ZQ_pu_pay_TMP.SQL.Clear();
  dm1.ZQ_pu_pay_RAM.Open();
end;

procedure TF_pu_pay_act_rec.r0Click(Sender: TObject);
begin
  dm1.ZQ_pu_pay_not_list.ParamByName('p_faze').AsInteger:=0;
end;

procedure TF_pu_pay_act_rec.r1Click(Sender: TObject);
begin
  dm1.ZQ_pu_pay_not_list.ParamByName('p_faze').AsInteger:=1;
end;

procedure TF_pu_pay_act_rec.r3Click(Sender: TObject);
begin
  dm1.ZQ_pu_pay_not_list.ParamByName('p_faze').AsInteger:=3;
end;

end.

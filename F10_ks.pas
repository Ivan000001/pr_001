unit F10_ks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_ks = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    B_add: TBitBtn;
    B_edit: TBitBtn;
    B_del: TBitBtn;
    B_c_edit: TBitBtn;
    B_c_add: TBitBtn;
    B_c_del: TBitBtn;
    B_exp: TBitBtn;
    B_show: TBitBtn;
    rb0: TRadioButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    b_change: TBitBtn;
    procedure B_showClick(Sender: TObject);
    procedure B_c_delClick(Sender: TObject);
    procedure B_c_editClick(Sender: TObject);
    procedure B_c_addClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure B_addClick(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb0Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ks: TF_ks;

implementation
uses dm, F10_ks_rec, lib_cb, F10_ks_content_rec, F10_ks_content_pu;
{$R *.dfm}

procedure TF_ks.B_addClick(Sender: TObject);
begin
  with f_ks_rec do
    begin
      e_number.Text:='';
      dt_create.Date:=now();
      dt_from.date:=now();
      dt_to.date:=now();
      get_list_cb_contracts(cb_contract);
      cb_contract.Text:='';
      e_nds.Text:='0';
      if rb0.Checked then
        begin
          rec_rb1.visible:=true;
          rec_rb2.visible:=true;
        end
      else
        begin
          if rb1.Checked then
          rec_rb1.Checked:=true else rec_rb2.Checked:=true;
          rec_rb1.visible:=false;
          rec_rb2.visible:=false;
        end;
      tag:=0;
      showmodal();
    end;
end;

procedure TF_ks.B_c_addClick(Sender: TObject);
begin
  f_ks_content_rec.e_code.Text:='';
  f_ks_content_rec.e_job.Text:='';
  f_ks_content_rec.e_price.Text:='';
  f_ks_content_rec.e_sum_price.Text:='0.00';
  f_ks_content_rec.e_scale.Text:='';
  f_ks_content_rec.e_count.Text:='0';
  f_ks_content_rec.l_id_action.Caption:='';
  f_ks_content_rec.B_show.Enabled:=true;
  f_ks_content_rec.Tag:=0;
  f_ks_content_rec.showmodal();
end;

procedure TF_ks.B_c_delClick(Sender: TObject);
begin
  if dm1.zq_ks_detail.FieldByName('id_ks_action').AsInteger<>0 then
    begin
      dm1.zq_ks_TMP.SQL.Text:='delete from ks_detail where id_ks_action='+dm1.zq_ks_detail.FieldByName('id_ks_action').AsString;
      dm1.zq_ks_TMP.ExecSQL();
      dm1.zq_ks_detail.Refresh();
      showmessage('Удалено');
    end;
end;

procedure TF_ks.B_c_editClick(Sender: TObject);
begin
  if dm1.zq_ks_detail.FieldByName('id_ks_action').AsInteger<>0 then
    begin
      f_ks_content_rec.e_code.text:=dm1.zq_ks_detail.FieldByName('code_action').AsString;
      f_ks_content_rec.e_job.text:=dm1.zq_ks_detail.FieldByName('descr_action').AsString;
      f_ks_content_rec.e_scale.text:=dm1.zq_ks_detail.FieldByName('scale_action').AsString;
      f_ks_content_rec.e_price.text:=dm1.zq_ks_detail.FieldByName('price').AsString;
      f_ks_content_rec.l_id_action.Caption:=dm1.zq_ks_detail.FieldByName('id_action_a').AsString;
      f_ks_content_rec.B_show.Enabled:=false;
      f_ks_content_rec.Tag:=1;
      f_ks_content_rec.ShowModal();
    end;
  
end;

procedure TF_ks.B_editClick(Sender: TObject);
begin
  if dm1.zq_ks.Active then
  if dm1.zq_ks.RecordCount>0 then
    begin
      with f_ks_rec do
        begin
          e_number.Text:=dm1.zq_ks.FieldByName('number_doc').AsString;
          dt_create.Date:=dm1.zq_ks.FieldByName('date_create').AsDateTime;
          dt_from.date:=dm1.zq_ks.FieldByName('date_from').AsDateTime;
          dt_to.date:=dm1.zq_ks.FieldByName('date_to').AsDateTime;
          get_list_cb_contracts(cb_contract);
          cb_contract.ItemIndex:=cb_contract.Items.IndexOfObject(tobject(dm1.zq_ks.FieldByName('id_contract_a').AsInteger));
          e_nds.Text:=dm1.zq_ks.FieldByName('nds').AsString;
          rec_rb1.visible:=false;
          rec_rb2.visible:=false;
          tag:=1;
          showmodal();
        end;
    end;
end;

procedure TF_ks.B_showClick(Sender: TObject);
begin
  if dm1.zq_ks_detail.FieldByName('id_ks_action').AsInteger<>0 then
    case dm1.zq_ks_detail.FieldByName('id_action_a').AsInteger of
    1 : begin
          f_ks_content_pu.e_code.Text:=dm1.zq_ks_detail.FieldByName('code_action').AsString;
          f_ks_content_pu.e_job.Text:=dm1.zq_ks_detail.FieldByName('descr_action').AsString;
          f_ks_content_pu.e_scale.Text:=dm1.zq_ks_detail.FieldByName('scale_action').AsString;
          f_ks_content_pu.e_count.Text:=dm1.zq_ks_detail.FieldByName('count_').AsString;
          dm1.zq_ks_content_pu.ParamByName('p_ks').AsInteger:=dm1.zq_ks.FieldByName('id_ks').AsInteger;
          f_ks_content_pu.show();
        end;
    end;
end;

procedure TF_ks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.zq_ks.Close();
  dm1.zq_ks_detail.Close();
end;

procedure sel_(i_:integer);
begin
  case i_  of
    0: begin
         f_ks.rb0.checked:=true;
         dm1.zq_ks.ParamByName('p_in_out').AsInteger:=0;
       end;
    1: begin
         f_ks.rb1.checked:=true;
         dm1.zq_ks.ParamByName('p_in_out').AsInteger:=1;
       end;
    2: begin
         f_ks.rb2.checked:=true;
         dm1.zq_ks.ParamByName('p_in_out').AsInteger:=2;
       end;
  end;
  if dm1.zq_ks.Active then dm1.zq_ks.Refresh();
end;

procedure TF_ks.FormShow(Sender: TObject);
begin
  dm1.zq_ks.Close();
  sel_(0);
  dm1.zq_ks.Open();
end;

procedure TF_ks.rb0Click(Sender: TObject);
begin
  sel_(0);
end;

procedure TF_ks.rb1Click(Sender: TObject);
begin
  sel_(1);
end;

procedure TF_ks.rb2Click(Sender: TObject);
begin
  sel_(2);
end;

end.

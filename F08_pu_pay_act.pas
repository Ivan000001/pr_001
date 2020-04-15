unit F08_pu_pay_act;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons;

type
  TF_pu_pay_act = class(TForm)
    B_Apply: TBitBtn;
    DT_from: TDateTimePicker;
    DT_to: TDateTimePicker;
    DBGrid1: TDBGrid;
    B_new: TBitBtn;
    B_del: TBitBtn;
    B_change_status: TBitBtn;
    DBGrid2: TDBGrid;
    B_edit: TBitBtn;
    procedure B_newClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure B_ApplyClick(Sender: TObject);
    procedure B_change_statusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_pay_act: TF_pu_pay_act;

implementation

uses DM,F08_pu_pay_act_change_status, F08_pu_pay_act_rec,lib_cb;

{$R *.dfm}

procedure TF_pu_pay_act.B_ApplyClick(Sender: TObject);
begin
  dm1.ZQ_pu_pay_act.Close();
  dm1.ZQ_pu_pay_act.ParamByName('p_from').AsDate:=dt_from.Date;
  dm1.ZQ_pu_pay_act.ParamByName('p_to').AsDate:=dt_to.Date;
  dm1.ZQ_pu_pay_act.Open();
end;

procedure TF_pu_pay_act.B_change_statusClick(Sender: TObject);
begin
  if dm1.ZQ_pu_pay_act.RecordCount>0 then
    begin
      get_list_cb_pu_pay_status(f_pu_pay_act_change_status.cb_pu_pay_act_status);
      f_pu_pay_act_change_status.cb_pu_pay_act_status.ItemIndex:=f_pu_pay_act_change_status.cb_pu_pay_act_status.Items.IndexOfObject(tobject(dm1.ZQ_pu_pay_act.FieldByName('id_pu_pay_status_a').AsInteger));
      f_pu_pay_act_change_status.showmodal();
    end;
end;

procedure TF_pu_pay_act.B_editClick(Sender: TObject);
begin
  if dm1.ZQ_pu_pay_act.RecordCount>0 then
    begin
      f_pu_pay_act_rec.Tag:=1;
      f_pu_pay_act_rec.DT_create.Enabled:=false;
      f_pu_pay_act_rec.DT_create.Date:=dm1.ZQ_pu_pay_act.FieldByName('date_create').AsDateTime;
      f_pu_pay_act_rec.E_doc.Text:=dm1.ZQ_pu_pay_act.FieldByName('doc_name').AsString;
      f_pu_pay_act_rec.showmodal();
    end;
end;

procedure TF_pu_pay_act.B_newClick(Sender: TObject);
begin
  f_pu_pay_act_rec.Tag:=0;
  f_pu_pay_act_rec.DT_create.Date:=now();
  f_pu_pay_act_rec.E_doc.Text:=formatdatetime('yymmdd',f_pu_pay_act_rec.DT_create.Date)+'-new';
  f_pu_pay_act_rec.DT_create.Enabled:=true;
  f_pu_pay_act_rec.show();
end;

procedure TF_pu_pay_act.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu_pay_act.Close();
  dm1.ZQ_pu_pay_act_detail.Close();
end;

procedure TF_pu_pay_act.FormShow(Sender: TObject);
begin
  dt_from.Date:=now()-182;
  dt_to.Date:=now();
end;

end.

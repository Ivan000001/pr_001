unit F06_exp_act_reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, Buttons,FileCtrl;

type
  TF_exp_act_reestr = class(TForm)
    B_exp: TBitBtn;
    B_apply: TBitBtn;
    SB1: TStatusBar;
    cb_tp: TComboBox;
    DT_from: TDateTimePicker;
    DT_to: TDateTimePicker;
    DBGrid1: TDBGrid;
    E_path: TEdit;
    B_dir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_expClick(Sender: TObject);
    procedure B_applyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_dirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_exp_act_reestr: TF_exp_act_reestr;

implementation
uses DM_exp,lib_cb,lib_export_xls;
{$R *.dfm}

procedure TF_exp_act_reestr.B_applyClick(Sender: TObject);
begin
  dm_exp1.ZQ_exp_act_reestr_list.Close();
  dm_exp1.ZQ_exp_act_reestr_list.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm_exp1.ZQ_exp_act_reestr_list.ParamByName('p_from').AsDate:=dt_from.Date;
  dm_exp1.ZQ_exp_act_reestr_list.ParamByName('p_to').AsDate:=dt_to.Date;
  dm_exp1.ZQ_exp_act_reestr_list.ParamByName('p_path').AsString:=e_path.Text;
  dm_exp1.ZQ_exp_act_reestr_list.Open();
 // showmessage('Готово');
  sb1.Panels[0].Text:=  inttostr(dm_exp1.ZQ_exp_act_reestr_list.RecordCount);

end;

procedure TF_exp_act_reestr.B_dirClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_exp_act_reestr.B_expClick(Sender: TObject);
begin
  if dm_exp1.ZQ_exp_act_reestr_list.RecordCount>0 then
    begin
      dm_exp1.ZQ_exp_act_reestr_list.First();
      while not(dm_exp1.ZQ_exp_act_reestr_list.Eof) do
        begin
          dm_exp1.ZQ_exp_act_reestr.Close();
          dm_exp1.ZQ_exp_act_reestr.ParamByName('p_id_act_reestr').AsInteger:=dm_exp1.ZQ_exp_act_reestr_list.FieldByName('id_act_reestr').AsInteger;
          dm_exp1.ZQ_exp_act_reestr.Open();
          forcedirectories(ExtractFilePath(dm_exp1.ZQ_exp_act_reestr_list.FieldByName('path_ext').AsString));
          if (dm_exp1.ZQ_exp_act_reestr_list.FieldByName('type_reestr').AsString='A') then
            create_save_xls_act_reestr(dm_exp1.ZQ_exp_act_reestr,dm_exp1.ZQ_exp_act_reestr_list.FieldByName('date_create').AsDateTime,dm_exp1.ZQ_exp_act_reestr_list.FieldByName('path_ext').AsString);
          if (dm_exp1.ZQ_exp_act_reestr_list.FieldByName('type_reestr').AsString='B') then
            create_save_xls_act_reestr(dm_exp1.ZQ_exp_act_reestr,dm_exp1.ZQ_exp_act_reestr_list.FieldByName('date_create').AsDateTime,dm_exp1.ZQ_exp_act_reestr_list.FieldByName('path_ext').AsString);
          dm_exp1.ZQ_exp_act_reestr.Close();
          dm_exp1.ZQ_exp_act_reestr_list.Next();
        end;
      showmessage('Готово');
    end;
end;

procedure TF_exp_act_reestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sb1.Panels[0].Text:='';
  dm_exp1.ZQ_exp_act_reestr_list.Close();
end;

procedure TF_exp_act_reestr.FormShow(Sender: TObject);
begin
  get_list_cb_tp_all(cb_tp);
  e_path.Text:='c:\1';
  dt_from.Date:=now();
  dt_to.Date:=now();

//  b_apply.Click();
end;

end.

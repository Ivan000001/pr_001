unit F04_act_reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,jpeg,FileCtrl,db;

type
  TF_act_reestr = class(TForm)
    cb_tp: TComboBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    B_Gen: TBitBtn;
    B_Del: TBitBtn;
    B_Change_status: TBitBtn;
    SB1: TStatusBar;
    B_Apply_filter: TBitBtn;
    DT_to: TDateTimePicker;
    DT_from: TDateTimePicker;
    B_load: TBitBtn;
    B_mass_upload: TBitBtn;
    procedure B_mass_uploadClick(Sender: TObject);
    procedure B_loadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Change_statusClick(Sender: TObject);
    procedure B_DelClick(Sender: TObject);
    procedure B_GenClick(Sender: TObject);
    procedure B_Apply_filterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_reestr: TF_act_reestr;

implementation
uses DM,lib_cb, F04_act_reestr_gen, F04_act_reestr_change, F04_act_reestr_img;
{$R *.dfm}

procedure TF_act_reestr.B_Apply_filterClick(Sender: TObject);
begin
  dm1.ZQ_act_reestr.Close();
  dm1.ZQ_act_reestr.ParamByName('p_tp').AsInteger:=integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_act_reestr.ParamByName('p_datefrom').AsDate:=dt_from.Date;
  dm1.ZQ_act_reestr.ParamByName('p_dateto').AsDate:=dt_to.Date;
  dm1.ZQ_act_reestr.Open();
  sb1.Panels[0].Text:=inttostr(dm1.ZQ_act_reestr.RecordCount);
  sb1.Panels[1].Text:=inttostr(dm1.ZQ_act_reestr_detail.RecordCount);
end;

procedure TF_act_reestr.B_Change_statusClick(Sender: TObject);
begin
  if dm1.ZQ_act_reestr.RecordCount>0 then
    begin
      get_list_cb_act_status(f_act_reestr_change.cb_act_status);
      f_act_reestr_change.cb_act_status.ItemIndex:=f_act_reestr_change.cb_act_status.Items.IndexOfObject(tobject(dm1.ZQ_act_reestr.FieldByName('id_act_status_a').AsInteger));
      f_act_reestr_change.showmodal();
    end;
end;

procedure TF_act_reestr.B_DelClick(Sender: TObject);
begin
  if dm1.ZQ_act_reestr.RecordCount>0 then
    begin
      dm1.ZQ_act_reestr_TMP.SQL.Text:='delete from act_reestr_detail where id_act_reestr_a='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString+';';
      dm1.ZQ_act_reestr_TMP.ExecSQL();
      dm1.ZQ_act_reestr_TMP.SQL.Text:='delete from act_reestr where id_act_reestr='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString+';';
      dm1.ZQ_act_reestr_TMP.ExecSQL();
      dm1.ZQ_act_reestr.Refresh();
      dm1.ZQ_act_reestr_TMP.SQL.Clear();
    end;
  
end;

procedure TF_act_reestr.B_GenClick(Sender: TObject);
begin
  f_act_reestr_gen.showmodal();
end;

procedure TF_act_reestr.B_loadClick(Sender: TObject);
var jpg:TJPEGImage;
begin
  if dm1.ZQ_act_reestr.Active=true then
  if (dm1.ZQ_act_reestr.RecordCount>0) then
    begin
      dm1.ZQ_act_reestr_TMP.SQL.Text:='select * from act_reestr_photo where id_act_reestr_a='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
      dm1.ZQ_act_reestr_TMP.Open();
      if dm1.ZQ_act_reestr_TMP.RecordCount>0 then
        begin
          dm1.ZQ_act_reestr_TMP.First();
          if not(dm1.ZQ_act_reestr_TMP.FieldByName('reestr_photo').IsNull) then
            begin
              try
                f_act_reestr_img.image1.Picture.Assign(dm1.ZQ_act_reestr_TMP.FieldByName('reestr_photo'));
              except
                jpg:=TJPEGImage.Create;
                try
                  jpg.Assign(dm1.ZQ_act_reestr_TMP.FieldByName('reestr_photo'));
                  f_act_reestr_img.image1.Picture.Assign(jpg);
                finally
                  jpg.Free;
                end;
              end;
            end
          else
            begin
              f_act_reestr_img.image1.Picture:=nil;
              f_act_reestr_img.Image1.Picture.Graphic:=nil;
              f_act_reestr_img.Image1.Picture.Bitmap:=nil;
            end;
        end;
      dm1.ZQ_act_reestr_TMP.Close();
      dm1.ZQ_act_reestr_TMP.SQL.Clear();
      f_act_reestr_img.showmodal();
    end;
end;

procedure TF_act_reestr.B_mass_uploadClick(Sender: TObject);
var dir:string;
  full_file:string;
begin
  if dm1.ZQ_act_reestr.Active then
  if (dm1.ZQ_act_reestr.RecordCount>0)  then
    begin
      selectdirectory('Выберите директорию для выгрузки','',dir);
      if dir<>'' then
        begin
          dir:=ExcludeTrailingBackslash(dir);
          dm1.zq_act_reestr.First();
          while not(dm1.ZQ_act_reestr.Eof) do
            begin
              if dm1.ZQ_act_reestr.FieldByName('id_photo_status_a').AsInteger=2 then
                begin
                  dm1.ZQ_act_reestr_TMP.SQL.Text:='select * from act_reestr_photo where id_act_reestr_a='+dm1.ZQ_act_reestr.FieldByName('id_act_reestr').AsString;
                  dm1.ZQ_act_reestr_TMP.Open();
                  dm1.ZQ_act_reestr_TMP.First();
                  //чрезмерная бдительность - по факту если статус не 2, то мы сюда даже не попадем по условию уровнем выше
                  if not(dm1.ZQ_act_reestr_TMP.FieldByName('reestr_photo').IsNull) then
                    begin
                      full_file:=dir+'\'+formatdatetime('yyyymmdd',dm1.ZQ_act_reestr.FieldByName('date_create').AsDateTime)+'_'+
                        dm1.ZQ_act_reestr.FieldByName('type_reestr').AsString+'_'+dm1.ZQ_act_reestr.FieldByName('tp_name').AsString+' скан реестра актов в МЭС.jpg';
                      forcedirectories(ExtractFilePath(full_file));
                      tblobfield(dm1.ZQ_act_reestr_TMP.FieldByName('reestr_photo')).SaveToFile(full_file);
                    end;
                  dm1.ZQ_act_reestr_TMP.Close();
                end;
              dm1.ZQ_act_reestr.Next();
            end;
          dm1.ZQ_act_reestr_TMP.SQL.Clear();
          showmessage('Готово');
        end;
    end;
end;

procedure TF_act_reestr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_act_reestr.Close();
  dm1.ZQ_act_reestr_detail.Close();
end;

procedure TF_act_reestr.FormShow(Sender: TObject);
begin
  get_list_cb_tp_all(cb_tp);
  dt_from.Date:=now()-14;
  dt_to.Date:=now();

//  b_apply_filter.Click();

end;

end.

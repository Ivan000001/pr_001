unit F05_act_upload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, DBCtrls,FileCtrl,db;

type
  TF_act_upload = class(TForm)
    B_apply: TBitBtn;
    DBGrid1: TDBGrid;
    cb_tp: TComboBox;
    DT_from: TDateTimePicker;
    DT_to: TDateTimePicker;
    E_path: TEdit;
    B_dir: TBitBtn;
    B_upload: TBitBtn;
    SB1: TStatusBar;
    E_pu: TEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_uploadClick(Sender: TObject);
    procedure B_applyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_dirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_act_upload: TF_act_upload;

implementation
uses DM,lib_cb;
{$R *.dfm}

procedure TF_act_upload.B_applyClick(Sender: TObject);
begin
  e_path.Text:=ExcludeTrailingBackslash(e_path.Text);
  dm1.ZQ_act_upload.Close();
  dm1.ZQ_act_upload.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_act_upload.ParamByName('p_sn').AsString:='%%'+e_pu.Text+'%%';
  dm1.ZQ_act_upload.ParamByName('p_path').AsString:=e_path.Text;
  dm1.ZQ_act_upload.ParamByName('p_from').AsDate:=dt_from.Date;
  dm1.ZQ_act_upload.ParamByName('p_to').AsDate:=dt_to.Date;
  dm1.ZQ_act_upload.ParamByName('p_img_load').AsInteger:=0;//если единица- то подгружать фото в поля
  dm1.ZQ_act_upload.Open();
  sb1.Panels[0].Text:=inttostr(dm1.ZQ_act_upload.RecordCount);
end;

procedure TF_act_upload.B_dirClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_act_upload.B_uploadClick(Sender: TObject);
begin
  dm1.ZQ_act_upload.Close();
  dm1.ZQ_act_upload.ParamByName('p_img_load').AsInteger:=1; //если единица- то подгружать фото в поля
  dm1.ZQ_act_upload.Open();
  dm1.ZQ_act_upload.First();
  while not(dm1.ZQ_act_upload.Eof) do
    begin
      if not(dm1.ZQ_act_upload.FieldByName('act_img1').IsNull) then
        begin
          forcedirectories(ExtractFilePath(dm1.ZQ_act_upload.FieldByName('ext_path1').asstring));
          tblobfield(dm1.ZQ_act_upload.FieldByName('act_img1')).SaveToFile(dm1.ZQ_act_upload.FieldByName('ext_path1').asstring);
        end;
      if not(dm1.ZQ_act_upload.FieldByName('act_img2').IsNull) then
        begin
          forcedirectories(ExtractFilePath(dm1.ZQ_act_upload.FieldByName('ext_path2').asstring));
          tblobfield(dm1.ZQ_act_upload.FieldByName('act_img2')).SaveToFile(dm1.ZQ_act_upload.FieldByName('ext_path2').asstring);
        end;
      if not(dm1.ZQ_act_upload.FieldByName('act_img3').IsNull) then
        begin
          forcedirectories(ExtractFilePath(dm1.ZQ_act_upload.FieldByName('ext_path3').asstring));
          tblobfield(dm1.ZQ_act_upload.FieldByName('act_img3')).SaveToFile(dm1.ZQ_act_upload.FieldByName('ext_path3').asstring);
        end ;
      dm1.ZQ_act_upload.Next;
    end;
  showmessage('Готово');
  dm1.ZQ_act_upload.Close();
  b_apply.Click();
end;

procedure TF_act_upload.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_act_upload.Close();
end;

procedure TF_act_upload.FormShow(Sender: TObject);
begin
  get_list_cb_tp_all(cb_tp);
  e_pu.Text:='';
  e_path.Text:='c:\1';
  dt_from.Date:=now();
  dt_to.Date:=now();
 // b_apply.Click();
end;

end.

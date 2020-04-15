unit F06_exp_montage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,FileCtrl, ComCtrls, Grids, DBGrids,db;

type
  TF_exp_montage = class(TForm)
    B_exp_montage1: TBitBtn;
    Label1: TLabel;
    cb_tp: TComboBox;
    e_path: TEdit;
    B_dir_montage: TBitBtn;
    DBGrid1: TDBGrid;
    e_path_upload: TEdit;
    B_Apply: TBitBtn;
    B_upload: TBitBtn;
    E_pu_sn: TEdit;
    B_dir_upload: TBitBtn;
    B_exp_montage2: TBitBtn;
    sb: TStatusBar;
    procedure B_exp_montage2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_uploadClick(Sender: TObject);
    procedure B_ApplyClick(Sender: TObject);
    procedure B_dir_uploadClick(Sender: TObject);
    procedure B_exp_montage1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_dir_montageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_exp_montage: TF_exp_montage;

implementation
uses DM_exp,lib_cb,lib_export_xls, DM;
{$R *.dfm}

procedure TF_exp_montage.B_ApplyClick(Sender: TObject);
begin
  e_path_upload.Text:=ExcludeTrailingBackslash(e_path_upload.Text);
  dm1.ZQ_pu_upload.Close();
  dm1.ZQ_pu_upload.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_pu_upload.ParamByName('p_sn').AsString:='%%'+e_pu_sn.Text+'%%';
  dm1.ZQ_pu_upload.ParamByName('p_path').AsString:=e_path_upload.Text;
  dm1.ZQ_pu_upload.ParamByName('p_img_load').AsInteger:=0;//если единица- то подгружать фото в поля
  dm1.ZQ_pu_upload.Open();
  sb.Panels[0].Text:=inttostr(dm1.ZQ_pu_upload.RecordCount);
end;

procedure TF_exp_montage.B_dir_montageClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_exp_montage.B_dir_uploadClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path_upload.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_exp_montage.B_exp_montage1Click(Sender: TObject);
var file_:string;
begin
  dm_exp1.ZQ_exp_montage.Close();
  dm_exp1.ZQ_exp_montage.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm_exp1.ZQ_exp_montage.Open();
  file_:=ExcludeTrailingBackslash(e_path.Text)+'\Монтажная ведомость '+cb_tp.Text+'.xls';
  forcedirectories(ExtractFilePath(file_));
  create_save_xls_montage(dm_exp1.ZQ_exp_montage,cb_tp.Text,file_);
  dm_exp1.ZQ_exp_montage.Close();
  showmessage('Готово');
end;

procedure TF_exp_montage.B_exp_montage2Click(Sender: TObject);
var file_:string;
begin
  dm_exp1.ZQ_exp_m2.Close();
  dm_exp1.ZQ_exp_m2.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm_exp1.ZQ_exp_m2.Open();
  file_:=ExcludeTrailingBackslash(e_path.Text)+'\Монтажная ведомость '+cb_tp.Text+'.xls';
  forcedirectories(ExtractFilePath(file_));
  create_save_xls_m2(dm_exp1.ZQ_exp_m2,cb_tp.Text,file_);
  dm_exp1.ZQ_exp_m2.Close();
  showmessage('Готово');

end;

procedure TF_exp_montage.B_uploadClick(Sender: TObject);
var x:tbookmark;
begin
if dm1.ZQ_pu_upload.RecordCount>0 then
begin
  dm1.ZQ_pu_upload.Close();
  dm1.ZQ_pu_upload.ParamByName('p_img_load').AsInteger:=1; //если единица- то подгружать фото в поля
  dm1.ZQ_pu_upload.Open();
  x:=dm1.ZQ_pu_upload.GetBookmark();
  dm1.ZQ_pu_upload.DisableControls();
  dm1.ZQ_pu_upload.First();
  while not(dm1.ZQ_pu_upload.Eof) do
    begin
      if not(dm1.ZQ_pu_upload.FieldByName('pu_image').IsNull) then
        begin
          forcedirectories(ExtractFilePath(dm1.ZQ_pu_upload.FieldByName('ext_path').asstring));
          tblobfield(dm1.ZQ_pu_upload.FieldByName('pu_image')).SaveToFile(dm1.ZQ_pu_upload.FieldByName('ext_path').asstring);
        end ;
      dm1.ZQ_pu_upload.Next;
    end;
  if( dm1.ZQ_pu_upload.BookmarkValid(x)) then dm1.ZQ_pu_upload.GotoBookmark(x);
  dm1.ZQ_pu_upload.EnableControls();
  showmessage('Готово');
  dm1.ZQ_pu_upload.Close();
  dm1.ZQ_pu_upload.ParamByName('p_img_load').AsInteger:=0; //если единица- то подгружать фото в поля
  dm1.ZQ_pu_upload.Open();
end;
end;

procedure TF_exp_montage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu_upload.Close();
end;

procedure TF_exp_montage.FormShow(Sender: TObject);
begin
  get_list_cb_tp(cb_tp);
  e_path.Text:='c:\1';
  e_pu_sn.Text:='';
  e_path_upload.Text:='c:\1';
end;

end.

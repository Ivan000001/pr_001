unit F05_pu_upload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,FileCtrl,db;

type
  TF_pu_upload = class(TForm)
    cb_tp: TComboBox;
    DBGrid1: TDBGrid;
    E_path: TEdit;
    B_Apply: TBitBtn;
    B_upload: TBitBtn;
    SB1: TStatusBar;
    E_pu_sn: TEdit;
    B_dir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_uploadClick(Sender: TObject);
    procedure B_dirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_ApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_upload: TF_pu_upload;

implementation
uses DM,lib_cb;
{$R *.dfm}

procedure TF_pu_upload.B_ApplyClick(Sender: TObject);
begin
  e_path.Text:=ExcludeTrailingBackslash(e_path.Text);
  dm1.ZQ_pu_upload.Close();
  dm1.ZQ_pu_upload.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm1.ZQ_pu_upload.ParamByName('p_sn').AsString:='%%'+e_pu_sn.Text+'%%';
  dm1.ZQ_pu_upload.ParamByName('p_path').AsString:=e_path.Text;
  dm1.ZQ_pu_upload.ParamByName('p_img_load').AsInteger:=0;//если единица- то подгружать фото в поля
  dm1.ZQ_pu_upload.Open();
  sb1.Panels[0].Text:=inttostr(dm1.ZQ_pu_upload.RecordCount);

end;

procedure TF_pu_upload.B_dirClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_pu_upload.B_uploadClick(Sender: TObject);
begin
  dm1.ZQ_pu_upload.Close();
  dm1.ZQ_pu_upload.ParamByName('p_img_load').AsInteger:=1; //если единица- то подгружать фото в поля
  dm1.ZQ_pu_upload.Open();
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
  showmessage('Готово');
  dm1.ZQ_pu_upload.Close();
  b_apply.Click();
end;

procedure TF_pu_upload.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu_upload.Close();
end;

procedure TF_pu_upload.FormShow(Sender: TObject);
begin
  get_list_cb_tp_all(cb_tp);
  e_pu_sn.Text:='';
  e_path.Text:='c:\1';
end;

end.

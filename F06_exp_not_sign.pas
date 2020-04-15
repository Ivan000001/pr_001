unit F06_exp_not_sign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl;

type
  TF_exp_not_sign = class(TForm)
    Label1: TLabel;
    cb_tp: TComboBox;
    E_path: TEdit;
    b_dir: TBitBtn;
    B_OK: TBitBtn;
    procedure B_OKClick(Sender: TObject);
    procedure b_dirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_exp_not_sign: TF_exp_not_sign;

implementation

uses dm_exp,lib_export_xls,lib_cb;

{$R *.dfm}

procedure TF_exp_not_sign.b_dirClick(Sender: TObject);
var dir:string;
begin
  selectdirectory('Выберите директорию для выгрузки','',dir);
  if dir<>'' then e_path.Text:=ExcludeTrailingBackslash(dir);
end;

procedure TF_exp_not_sign.B_OKClick(Sender: TObject);
var file_:string;
begin
  dm_exp1.ZQ_exp_not_sign.Close();
  dm_exp1.ZQ_exp_not_sign.ParamByName('p_tp').AsInteger:=Integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  dm_exp1.ZQ_exp_not_sign.Open();
  file_:=ExcludeTrailingBackslash(e_path.Text)+'\М '+cb_tp.Text+'.xls';
  forcedirectories(ExtractFilePath(file_));
  create_save_xls_not_sign(dm_exp1.ZQ_exp_not_sign,cb_tp.Text,file_);
  dm_exp1.ZQ_exp_not_sign.Close();
  showmessage('Готово');
end;

procedure TF_exp_not_sign.FormShow(Sender: TObject);
begin
  get_list_cb_tp(cb_tp);
  e_path.Text:='c:\1';
end;

end.

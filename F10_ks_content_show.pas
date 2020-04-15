unit F10_ks_content_show;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  Tf_ks_content_show = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ks_content_show: Tf_ks_content_show;

implementation
uses DM, F10_ks_content_rec;
{$R *.dfm}

procedure Tf_ks_content_show.DBGrid1DblClick(Sender: TObject);
begin
  f_ks_content_rec.e_code.text:=dm1.zq_ks_content_show.FieldByName('code_action').AsString;
  f_ks_content_rec.e_job.text:=dm1.zq_ks_content_show.FieldByName('descr_action').AsString;
  f_ks_content_rec.e_scale.text:=dm1.zq_ks_content_show.FieldByName('scale_action').AsString;
  f_ks_content_rec.e_price.text:=dm1.zq_ks_content_show.FieldByName('price').AsString;
  f_ks_content_rec.l_id_action.Caption:=dm1.zq_ks_content_show.FieldByName('id_action_a').AsString;
  f_ks_content_rec.e_count.SetFocus();
  close();
end;

procedure Tf_ks_content_show.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm1.zq_ks_content_show.Close();
end;

procedure Tf_ks_content_show.FormShow(Sender: TObject);
begin
  dm1.zq_ks_content_show.Close();
  dm1.zq_ks_content_show.ParamByName('p_contract').AsInteger:=dm1.zq_ks.FieldByName('id_contract_a').AsInteger;
  dm1.zq_ks_content_show.ParamByName('p_ks').AsInteger:=dm1.zq_ks.FieldByName('id_ks').AsInteger;
  dm1.zq_ks_content_show.Open();
end;

end.

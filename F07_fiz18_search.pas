unit F07_fiz18_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_fiz18_search = class(TForm)
    DBGrid1: TDBGrid;
    E_p_number: TEdit;
    E_FIO: TEdit;
    E_sn_old_pu: TEdit;
    B_Apply_filter: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_Apply_filterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_fiz18_search: TF_fiz18_search;

implementation
uses DM, F04_act_rec;
{$R *.dfm}

procedure TF_fiz18_search.B_Apply_filterClick(Sender: TObject);
begin
  dm1.ZQ_fiz18_search.Close();
  dm1.ZQ_fiz18_search.ParamByName('p_number').AsString:='%%'+e_p_number.Text+'%%';
  dm1.ZQ_fiz18_search.ParamByName('p_FIO').AsString:='%%'+e_FIO.Text+'%%';
  dm1.ZQ_fiz18_search.ParamByName('p_sn_old_pu').AsString:='%%'+e_sn_old_pu.Text+'%%';
  dm1.ZQ_fiz18_search.Open();
end;

procedure TF_fiz18_search.DBGrid1DblClick(Sender: TObject);
begin
  f_act_rec.E_FIO.Text:=dm1.ZQ_fiz18_search.FieldByName('FIO').AsString;
  f_act_rec.E_old_pu.Text:=dm1.ZQ_fiz18_search.FieldByName('sn_old_pu').AsString;
  f_act_rec.E_p_number.Text:=dm1.ZQ_fiz18_search.FieldByName('p_number').AsString;
  f_act_rec.E_kadastr.Text:=dm1.ZQ_fiz18_search.FieldByName('kadastr').AsString;
  close();
end;

procedure TF_fiz18_search.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_fiz18_search.Close();
end;

procedure TF_fiz18_search.FormShow(Sender: TObject);
begin
  b_apply_filter.Click();
end;

end.

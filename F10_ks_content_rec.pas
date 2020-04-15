unit F10_ks_content_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_ks_content_rec = class(TForm)
    B_OK: TBitBtn;
    B_show: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    e_code: TEdit;
    e_job: TEdit;
    e_count: TEdit;
    e_price: TEdit;
    e_sum_price: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    l_id_action: TLabel;
    e_scale: TEdit;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure e_countExit(Sender: TObject);
    procedure e_countKeyPress(Sender: TObject; var Key: Char);
    procedure B_showClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ks_content_rec: TF_ks_content_rec;

implementation

uses dm,F10_ks_content_show;

{$R *.dfm}

procedure TF_ks_content_rec.B_OKClick(Sender: TObject);
begin
  if l_id_action.Caption<>'' then
    begin
      if tag=0 then
        begin
          dm1.zq_ks_TMP.SQL.Text:='insert into ks_detail (id_ks_a,id_action_a,count_) values '+
            '('+dm1.zq_ks.FieldByName('id_ks').AsString+','+l_id_action.Caption+','+e_count.Text+')';
          dm1.zq_ks_TMP.ExecSQL();
        end;
      if tag=1 then
        begin
          dm1.zq_ks_TMP.SQL.Text:='update ks_detail set count_='+e_count.Text+' where id_ks_action='+dm1.zq_ks_detail.FieldByName('id_ks_action').AsString;
          dm1.zq_ks_TMP.ExecSQL();
        end;
      dm1.zq_ks_TMP.SQL.Clear();
      dm1.zq_ks_detail.Refresh();
      close();
    end
  else showmessage('ПУСТО');
end;

procedure TF_ks_content_rec.B_showClick(Sender: TObject);
begin
  f_ks_content_show.showmodal();
end;

procedure TF_ks_content_rec.e_countExit(Sender: TObject);
begin
  if e_count.Text='' then e_count.Text:='0';
  if e_price.Text<>'' then
    e_sum_price.Text:=format('%f',[(strtofloat(e_count.Text)*strtofloat(e_price.Text))]);
  
end;

procedure TF_ks_content_rec.e_countKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #8,'0'..'9' :  ; // цифры и <Back Space>
    '.',',': // разделитель целой и дробной частей числа
        begin
          if Pos(DecimalSeparator,(Sender as TEdit).Text) <> 0
          then Key := Chr(0) // запрет ввода второго разделителя
          else Key := DecimalSeparator; // установим родной для ОС разделитель
        end
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

procedure TF_ks_content_rec.FormShow(Sender: TObject);
begin
  f_ks_content_rec.e_count.SetFocus();
end;

end.

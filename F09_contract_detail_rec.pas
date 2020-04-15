unit F09_contract_detail_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_contract_detail_rec = class(TForm)
    e_price: TEdit;
    Label1: TLabel;
    B_OK: TBitBtn;
    B_show: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    e_code: TEdit;
    e_job: TEdit;
    e_scale: TEdit;
    l_select_id: TLabel;
    procedure e_priceKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_showClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_contract_detail_rec: TF_contract_detail_rec;

implementation

uses dm,F09_actions_list;

{$R *.dfm}

function get_v(st_:string):string;
begin
  if st_<>'' then result:='"'+st_+'"' else result:='null';
end;

function replace_str(source_:string;w_in,w_out:char):string;
var i:integer;
begin
  for I := 1 to length(source_) do
    if source_[i]=w_in then source_[i]:=w_out;
  result:=source_;
end;

function check_price(st_:string):string;
begin
  if st_='' then result:='0' else result:=replace_str(floattostr(trunc(strtofloat(st_)*100)/100),',','.');
end;

procedure TF_contract_detail_rec.B_OKClick(Sender: TObject);
begin
  if e_job.Text<>'' then
    begin
      if f_contract_detail_rec.Tag=0 then
        begin
          dm1.zq_contracts_TMP.SQL.Text:='insert into contract_price (id_contract_a,id_action_a,price) values ('+
            dm1.zq_contracts.FieldByName('id_contract').AsString+','+l_select_id.Caption+','+check_price(e_price.Text)+')';
          dm1.zq_contracts_TMP.ExecSQL();
          dm1.zq_contract_price.Refresh();
          dm1.zq_contracts_TMP.SQL.Clear();
          f_contract_detail_rec.Close();
        end;
      if f_contract_detail_rec.Tag=1 then
        begin
          dm1.zq_contracts_TMP.SQL.Text:='update contract_price set price='+check_price(e_price.text)+
            ' where id_contract_price='+dm1.zq_contract_price.FieldByName('id_contract_price').AsString+';';
          dm1.zq_contracts_TMP.ExecSQL();
          dm1.zq_contract_price.Refresh();
          dm1.zq_contracts_TMP.SQL.Clear();
          f_contract_detail_rec.Close();
        end; 
    end
  else
    showmessage('ПУСТО');
end;

procedure TF_contract_detail_rec.B_showClick(Sender: TObject);
begin
  dm1.zq_actions_list.ParamByName('p_contract').AsInteger:=dm1.zq_contracts.FieldByName('id_contract').AsInteger;
  f_actions_list.Tag:=3;
  f_actions_list.showmodal();
end;

procedure TF_contract_detail_rec.e_priceKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #160,#23,#24,#8,'0'..'9' :  ; // цифры и <Back Space>
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

procedure TF_contract_detail_rec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  l_select_id.Caption:='';
end;

procedure TF_contract_detail_rec.FormShow(Sender: TObject);
begin
  if tag=1 then e_price.SetFocus();;
  
end;

end.

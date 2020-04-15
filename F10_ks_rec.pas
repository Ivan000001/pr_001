unit F10_ks_rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TF_ks_rec = class(TForm)
    Label1: TLabel;
    e_number: TEdit;
    Label2: TLabel;
    e_nds: TEdit;
    Label3: TLabel;
    cb_contract: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dt_create: TDateTimePicker;
    dt_from: TDateTimePicker;
    dt_to: TDateTimePicker;
    B_OK: TBitBtn;
    rec_rb1: TRadioButton;
    rec_rb2: TRadioButton;
    procedure B_OKClick(Sender: TObject);
    procedure e_numberKeyPress(Sender: TObject; var Key: Char);
    procedure e_ndsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ks_rec: TF_ks_rec;

implementation

uses DM;

{$R *.dfm}

function replace_str(source_:string;w_in,w_out:char):string;
var i:integer;
begin
  for I := 1 to length(source_) do
    if source_[i]=w_in then source_[i]:=w_out;
  result:=source_;
end;

function get_in_out:string;
begin
  if f_ks_rec.rec_rb1.Checked then result:='1';
  if f_ks_rec.rec_rb2.Checked then result:='2';
end;

procedure TF_ks_rec.B_OKClick(Sender: TObject);
begin
  if (e_number.Text<>'')and(cb_contract.Text<>'') then
    begin
      if f_ks_rec.Tag=0 then
        begin
          dm1.zq_ks_TMP.SQL.Text:='insert into ks (id_contract_a,number_doc,date_create,date_from,date_to,nds,in_out) values ('+
            inttostr(integer(cb_contract.Items.Objects[cb_contract.ItemIndex]))+','+e_number.Text+',"'+formatdatetime('yyyy-mm-dd',DT_create.Date)+'",'+
            ' "'+formatdatetime('yyyy-mm-dd',DT_from.Date)+'","'+formatdatetime('yyyy-mm-dd',DT_to.Date)+'",'+replace_str(e_nds.Text,',','.')+','+get_in_out+');';
          dm1.zq_ks_TMP.ExecSQL();
          dm1.zq_ks.Refresh();
          dm1.zq_ks_TMP.SQL.Clear();
          f_ks_rec.Close();
        end;
      if f_ks_rec.Tag=1 then
        begin
          dm1.zq_ks_TMP.SQL.Text:='update ks set number_doc="'+e_number.text+'",date_create="'+formatdatetime('yyyy-mm-dd',DT_create.Date)+'", '+
            ' date_from="'+formatdatetime('yyyy-mm-dd',DT_from.Date)+'",date_to="'+formatdatetime('yyyy-mm-dd',DT_to.Date)+'",'+
            ' id_contract_a='+inttostr(integer(cb_contract.Items.Objects[cb_contract.ItemIndex]))+', nds='+replace_str(e_nds.Text,',','.')+
            ' where id_ks='+dm1.zq_ks.FieldByName('id_ks').AsString+';';
          dm1.zq_ks_TMP.ExecSQL();
          dm1.zq_ks.Refresh();
          dm1.zq_ks_TMP.SQL.Clear();
          f_ks_rec.Close();
        end; 
    end
  else
    showmessage('ПУСТО');
end;

procedure TF_ks_rec.e_ndsKeyPress(Sender: TObject; var Key: Char);
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

procedure TF_ks_rec.e_numberKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #160,#23,#24,#8,'0'..'9' :  ; // цифры и <Back Space>
    else   // остальные символы запрещены
      key := Chr(0);
  end;
end;

end.

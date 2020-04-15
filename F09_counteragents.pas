unit F09_counteragents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons;

type
  TF_counteragents = class(TForm)
    B_add: TBitBtn;
    DBGrid1: TDBGrid;
    B_edit: TBitBtn;
    B_del: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label1: TLabel;
    procedure B_delClick(Sender: TObject);
    procedure B_editClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure B_addClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_counteragents: TF_counteragents;

implementation

{$R *.dfm}
uses dm, F09_counteragents_rec;
procedure TF_counteragents.B_addClick(Sender: TObject);
begin
  with F_counteragents_rec do
    begin
      e_short.Text:='';
      e_name.Text:='';
      e_address.Text:='';
      e_OKPO.Text:='';
      cb_status.ItemIndex:=0;
      e_FIO.Text:='';
      e_jobs_post.Text:='';
      Tag:=0;
      showmodal();
    end;
end;

procedure TF_counteragents.B_delClick(Sender: TObject);
begin
  showmessage('DEMO');
end;

procedure TF_counteragents.B_editClick(Sender: TObject);
begin
  if dm1.zq_counteragents.RecordCount>0 then
    begin
      with F_counteragents_rec do
        begin
          e_short.Text:=dm1.zq_counteragents.FieldByName('short_name').AsString;
          e_name.Text:=dm1.zq_counteragents.FieldByName('name').AsString;
          e_address.Text:=dm1.zq_counteragents.FieldByName('address').AsString;
          e_OKPO.Text:=dm1.zq_counteragents.FieldByName('OKPO').AsString;
          cb_status.ItemIndex:=dm1.zq_counteragents.FieldByName('status').AsInteger-1;
          e_FIO.Text:=dm1.zq_counteragents.FieldByName('FIO').AsString;
          e_jobs_post.Text:=dm1.zq_counteragents.FieldByName('jobs_post').AsString;
          Tag:=1;
          showmodal();
        end;
    end;
end;

procedure TF_counteragents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.zq_counteragents.Close();
end;

procedure TF_counteragents.FormShow(Sender: TObject);
begin
  dm1.zq_counteragents.Close();
  dm1.zq_counteragents.Open();
end;

end.

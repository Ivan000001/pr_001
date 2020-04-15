unit F01_tp_plan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TF_tp_plan = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    B_add_bpu: TBitBtn;
    B_del_bpu: TBitBtn;
    B_add_gw: TBitBtn;
    B_del_gw: TBitBtn;
    procedure B_del_gwClick(Sender: TObject);
    procedure B_del_bpuClick(Sender: TObject);
    procedure B_add_gwClick(Sender: TObject);
    procedure B_add_bpuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_tp_plan: TF_tp_plan;

implementation
uses DM,db;
{$R *.dfm}

procedure TF_tp_plan.B_add_bpuClick(Sender: TObject);
var SavePlace: TBookmark;
begin
  saveplace:=dm1.zq_tp_plan.getbookmark();
  dm1.zq_tp_plan_TMP.SQL.Text:='insert into bpu (id_tp_a,bpu_sn) values('+dm1.ZQ_tp_plan.FieldByName('id_tp').AsString+',"'+formatdatetime('mmdd.hhmmsszzz',now())+'");';
  dm1.zq_tp_plan_TMP.ExecSQL();
  dm1.ZQ_tp_plan.Refresh();
  dm1.ZQ_tp_plan.GotoBookmark(saveplace);
  dm1.ZQ_tp_plan.FreeBookmark(saveplace);
  dm1.zq_tp_plan_TMP.SQL.Clear();
end;

procedure TF_tp_plan.B_del_bpuClick(Sender: TObject);
var SavePlace: TBookmark;
begin
  saveplace:=dm1.zq_tp_plan.getbookmark();
  dm1.zq_tp_plan_TMP.SQL.Text:='delete from bpu where id_tp_a='+dm1.ZQ_tp_plan.FieldByName('id_tp').AsString+' and bpu_sn="'+dm1.ZQ_tp_plan_bpu.FieldByName('bpu_sn').AsString+'" and bpu.bpu_status=1';
  dm1.zq_tp_plan_TMP.ExecSQL();
  dm1.ZQ_tp_plan.Refresh();
  dm1.ZQ_tp_plan.GotoBookmark(saveplace);
  dm1.ZQ_tp_plan.FreeBookmark(saveplace);
  dm1.zq_tp_plan_TMP.SQL.Clear();
end;

procedure TF_tp_plan.B_del_gwClick(Sender: TObject);
var SavePlace: TBookmark;
begin
  saveplace:=dm1.zq_tp_plan.getbookmark();
  dm1.zq_tp_plan_TMP.SQL.Text:='delete from gateway where id_tp_a='+dm1.ZQ_tp_plan.FieldByName('id_tp').AsString+' and gw_imei="'+dm1.ZQ_tp_plan_gw.FieldByName('gw_imei').AsString+'" and gateway.gw_status=1';
  dm1.zq_tp_plan_TMP.ExecSQL();
  dm1.ZQ_tp_plan.Refresh();
  dm1.ZQ_tp_plan.GotoBookmark(saveplace);
  dm1.ZQ_tp_plan.FreeBookmark(saveplace);
  dm1.zq_tp_plan_TMP.SQL.Clear();
end;

procedure TF_tp_plan.B_add_gwClick(Sender: TObject);
var SavePlace: TBookmark;
begin
  saveplace:=dm1.zq_tp_plan.getbookmark();
  dm1.zq_tp_plan_TMP.SQL.Text:='insert into gateway (id_tp_a,gw_imei) values('+dm1.ZQ_tp_plan.FieldByName('id_tp').AsString+',"'+formatdatetime('mmdd.hhmmsszzz',now())+'");';
  dm1.zq_tp_plan_TMP.ExecSQL();
  dm1.ZQ_tp_plan.Refresh();
  dm1.ZQ_tp_plan.GotoBookmark(saveplace);
  dm1.ZQ_tp_plan.FreeBookmark(saveplace);
  dm1.zq_tp_plan_TMP.SQL.Clear();
end;

procedure TF_tp_plan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_tp_plan_gw.Close();
  dm1.ZQ_tp_plan_bpu.Close();
  dm1.ZQ_tp_plan.Close();
end;

procedure TF_tp_plan.FormShow(Sender: TObject);
begin
  dm1.ZQ_tp_plan.Open();
end;

end.

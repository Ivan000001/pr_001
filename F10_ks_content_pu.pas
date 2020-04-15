unit F10_ks_content_pu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  Tf_ks_content_pu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    e_code: TEdit;
    e_job: TEdit;
    e_count: TEdit;
    Label4: TLabel;
    e_scale: TEdit;
    SB: TStatusBar;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RG: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure RGClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ks_content_pu: Tf_ks_content_pu;

implementation
uses dm;
{$R *.dfm}

procedure check_;
begin
  if f_ks_content_pu.RG.ItemIndex=0 then dm1.zq_ks_content_pu_not.ParamByName('p_faze').AsInteger:=0;
  if f_ks_content_pu.RG.ItemIndex=1 then dm1.zq_ks_content_pu_not.ParamByName('p_faze').AsInteger:=1;
  if f_ks_content_pu.RG.ItemIndex=2 then dm1.zq_ks_content_pu_not.ParamByName('p_faze').AsInteger:=3;
end;

procedure Tf_ks_content_pu.BitBtn1Click(Sender: TObject);
var i:integer;
  str:string;
begin
  if dbgrid2.SelectedRows.Count>0 then
    begin
      for i := 0 to dbgrid2.SelectedRows.Count - 1 do
        begin
          dm1.zq_ks_content_pu_not.GotoBookmark(pointer(dbgrid2.SelectedRows.items[i]));
          str:=str+','+dm1.zq_ks_content_pu_not.FieldByName('pu_sn').AsString;
        end;  
    end;
  
end;

procedure Tf_ks_content_pu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.zq_ks_content_pu.Close();
end;

procedure Tf_ks_content_pu.FormShow(Sender: TObject);
begin
  dm1.zq_ks_content_pu.Close();
  rg.ItemIndex:=0;
  check_();
  dm1.zq_ks_content_pu.Open();
  sb.Panels[0].Text:=inttostr(dm1.zq_ks_content_pu.RecordCount);
  sb.Panels[2].Text:=inttostr(dm1.zq_ks_content_pu_not.RecordCount);
end;

procedure Tf_ks_content_pu.RGClick(Sender: TObject);
begin
  check_();
  dm1.zq_ks_content_pu_not.Refresh();
  sb.Panels[2].Text:=inttostr(dm1.zq_ks_content_pu_not.RecordCount);
end;

end.

unit F03_pu_tp_point;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TF_pu_tp_point = class(TForm)
    cb_tp: TComboBox;
    DBG_pu: TDBGrid;
    B_OK: TBitBtn;
    B_Clear: TBitBtn;
    rb0: TRadioButton;
    rb1: TRadioButton;
    rb3: TRadioButton;
    procedure rb3Click(Sender: TObject);
    procedure rb0Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure DBG_puDblClick(Sender: TObject);
    procedure B_ClearClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function get_sn_show_pu_tp_point(tp_:integer;old_pu_sn_,faze_:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_tp_point: TF_pu_tp_point;

implementation
uses DM,lib_cb;
{$R *.dfm}
var
  globe_pu_sn:string;

procedure TF_pu_tp_point.B_ClearClick(Sender: TObject);
begin
  globe_pu_sn:='';
  close();
end;

procedure TF_pu_tp_point.B_OKClick(Sender: TObject);
begin
  globe_pu_sn:=dm1.ZQ_pu_tp_point_SN.FieldByName('pu_sn').AsString;
  close();
end;

procedure TF_pu_tp_point.DBG_puDblClick(Sender: TObject);
begin
  b_ok.Click();
end;

procedure TF_pu_tp_point.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu_tp_point_SN.Active:=false;
end;

procedure TF_pu_tp_point.FormShow(Sender: TObject);
begin
  dm1.ZQ_pu_tp_point_SN.Active:=true;
end;

function TF_pu_tp_point.get_sn_show_pu_tp_point(tp_: integer;old_pu_sn_,faze_: string): string;
begin
  globe_pu_sn:=old_pu_sn_;
  result:='';
  get_list_cb_tp(cb_tp);
  cb_tp.ItemIndex:=cb_tp.Items.IndexOfObject(tobject(tp_));
  dm1.ZQ_pu_tp_point_SN.ParamByName('p_tp').AsInteger:=integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  if faze_<>'' then dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger:=strtoint(faze_)
              else dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger:=0;
  case dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger of
  1: rb1.Checked:=true;
  3: rb3.Checked:=true;
  else rb0.Checked:=true;
  end;           
  showmodal();
  result:=globe_pu_sn;
end;

procedure TF_pu_tp_point.rb0Click(Sender: TObject);
begin
  dm1.ZQ_pu_tp_point_SN.Close();
  dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger:=0;
  dm1.ZQ_pu_tp_point_SN.Open();
end;

procedure TF_pu_tp_point.rb1Click(Sender: TObject);
begin
  dm1.ZQ_pu_tp_point_SN.Close();
  dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger:=1;
  dm1.ZQ_pu_tp_point_SN.Open();
end;

procedure TF_pu_tp_point.rb3Click(Sender: TObject);
begin
  dm1.ZQ_pu_tp_point_SN.Close();
  dm1.ZQ_pu_tp_point_SN.ParamByName('p_faze').AsInteger:=3;
  dm1.ZQ_pu_tp_point_SN.Open();
end;

end.

unit F03_pu_tp_point2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TF_pu_tp_point2 = class(TForm)
    cb_tp: TComboBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    B_Clear: TBitBtn;
    B_OK: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure B_ClearClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function get_tp_point_show_opore(tp_,old_point_:integer;var fider_,opore_:string):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pu_tp_point2: TF_pu_tp_point2;

implementation
uses DM, lib_cb;
{$R *.dfm}
var
  globe_fider:string;
  globe_opore:string;
  globe_point:integer;

procedure TF_pu_tp_point2.B_ClearClick(Sender: TObject);
begin
  globe_fider:='';
  globe_opore:='';
  globe_point:=0;
  close();
end;

procedure TF_pu_tp_point2.B_OKClick(Sender: TObject);
begin
  globe_fider:=dm1.ZQ_pu_tp_point_TP.FieldByName('fider_a').AsString;
  globe_opore:=dm1.ZQ_pu_tp_point_TP.FieldByName('opore_a').AsString;
  globe_point:=dm1.ZQ_pu_tp_point_TP.FieldByName('id_tp_point').AsInteger;
  close();
end;

procedure TF_pu_tp_point2.DBGrid1DblClick(Sender: TObject);
begin
  b_ok.Click()
end;

procedure TF_pu_tp_point2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.ZQ_pu_tp_point_TP.Close();
end;

procedure TF_pu_tp_point2.FormShow(Sender: TObject);
begin
  dm1.ZQ_pu_tp_point_TP.Open();
end;

function TF_pu_tp_point2.get_tp_point_show_opore(tp_,old_point_: integer;var fider_,opore_:string): integer;
begin
  globe_point:=old_point_;
  get_list_cb_tp(cb_tp);
  cb_tp.ItemIndex:=cb_tp.Items.IndexOfObject(tobject(tp_));
  dm1.ZQ_pu_tp_point_TP.ParamByName('p_tp').AsInteger:=integer(cb_tp.Items.Objects[cb_tp.ItemIndex]);
  ShowModal();
  fider_:=globe_fider;
  opore_:=globe_opore;
  result:=globe_point;
end;

end.

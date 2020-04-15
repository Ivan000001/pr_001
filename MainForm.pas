unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    B_tp: TBitBtn;
    B_pu: TBitBtn;
    B_pu_rename: TBitBtn;
    BitBtn3: TBitBtn;
    B_Act: TBitBtn;
    B_Rep: TBitBtn;
    B_tp_plan: TBitBtn;
    B_Reestr: TBitBtn;
    B_act_upload: TBitBtn;
    B_exp_montage: TBitBtn;
    B_pu_pay: TBitBtn;
    B_act_pay: TBitBtn;
    B_exp_act_reestr: TBitBtn;
    B_exp_not_sign: TBitBtn;
    B_fiz18: TBitBtn;
    B_bpu: TBitBtn;
    B_buh: TBitBtn;
    B_sklad: TBitBtn;
    B_gw: TBitBtn;
    B_exp_pu_sort: TBitBtn;
    B_exp_pu_law: TBitBtn;
    B_contracts: TBitBtn;
    B_ks_pay: TBitBtn;
    B_param: TBitBtn;
    B_exp_: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    B_reestr_law: TBitBtn;
    procedure B_ks_payClick(Sender: TObject);
    procedure B_contractsClick(Sender: TObject);
    procedure B_gwClick(Sender: TObject);
    procedure B_bpuClick(Sender: TObject);
    procedure B_tp_planClick(Sender: TObject);
    procedure B_pu_payClick(Sender: TObject);
    procedure B_fiz18Click(Sender: TObject);
    procedure B_exp_not_signClick(Sender: TObject);
    procedure B_exp_act_reestrClick(Sender: TObject);
    procedure B_exp_montageClick(Sender: TObject);
    procedure B_act_uploadClick(Sender: TObject);
    procedure B_ReestrClick(Sender: TObject);
    procedure B_ActClick(Sender: TObject);
    procedure B_puClick(Sender: TObject);
    procedure B_tpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses F01_tp_map, F02_pu, F04_act, F04_act_reestr, F05_pu_upload, F05_act_upload,
  F06_exp_montage, F06_exp_act_reestr, F06_exp_not_sign, F07_fiz18_search,
  F08_pu_pay_act, F01_tp_plan, F02_bpu, F02_gw, F09_contracts, F10_ks;

{$R *.dfm}

procedure TForm1.B_ActClick(Sender: TObject);
begin
  f_act.show();
end;

procedure TForm1.B_act_uploadClick(Sender: TObject);
begin
  f_act_upload.show();
end;

procedure TForm1.B_bpuClick(Sender: TObject);
begin
  f_bpu.show();
end;

procedure TForm1.B_contractsClick(Sender: TObject);
begin
  f_contracts.show();
end;

procedure TForm1.B_exp_act_reestrClick(Sender: TObject);
begin
  f_exp_act_reestr.show();
end;

procedure TForm1.B_exp_montageClick(Sender: TObject);
begin
  f_exp_montage.show();
end;

procedure TForm1.B_exp_not_signClick(Sender: TObject);
begin
  f_exp_not_sign.show();
end;

procedure TForm1.B_fiz18Click(Sender: TObject);
begin
  f_fiz18_search.show();
end;

procedure TForm1.B_gwClick(Sender: TObject);
begin
  f_gw.show();
end;

procedure TForm1.B_ks_payClick(Sender: TObject);
begin
  f_ks.show();
end;

procedure TForm1.B_puClick(Sender: TObject);
begin
  f_pu.show();
end;

procedure TForm1.B_pu_payClick(Sender: TObject);
begin
  f_pu_pay_act.show();
end;

procedure TForm1.B_ReestrClick(Sender: TObject);
begin
  f_act_reestr.show();
end;

procedure TForm1.B_tpClick(Sender: TObject);
begin
  f_tp_map.show();
end;

procedure TForm1.B_tp_planClick(Sender: TObject);
begin
  f_tp_plan.show();
end;

end.

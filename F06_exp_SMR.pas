unit F06_exp_SMR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_exp_SMR = class(TForm)
    Label1: TLabel;
    cb_tp: TComboBox;
    e_dir1: TEdit;
    B_dir1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_exp_SMR: TF_exp_SMR;

implementation

{$R *.dfm}

end.

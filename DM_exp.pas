unit DM_exp;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZDataset;

type
  TDM_exp1 = class(TDataModule)
    ZQ_exp_montage: TZReadOnlyQuery;
    ZQ_exp_act_reestr: TZReadOnlyQuery;
    ZQ_exp_not_sign: TZReadOnlyQuery;
    ZQ_exp_act_reestr_list: TZReadOnlyQuery;
    DS_act_reestr_list: TDataSource;
    zq_exp_m2: TZReadOnlyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_exp1: TDM_exp1;

implementation
uses dm;
{$R *.dfm}

end.

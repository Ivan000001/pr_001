unit DM_imp;

interface

uses
  SysUtils, Classes, DB;

type
  TDM_imp1 = class(TDataModule)
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_imp1: TDM_imp1;

implementation

{$R *.dfm}

end.

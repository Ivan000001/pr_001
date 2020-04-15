unit F_tp_map01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    B_Apply_filter01: TBitBtn;
    B_New_tp: TBitBtn;
    DB_tp_list: TDBGrid;
    DB_tp_point: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses DM;
{$R *.dfm}

end.

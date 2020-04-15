unit F01_tp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TF_tp = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_tp: TF_tp;

implementation
uses dm, F01_tp_map;
{$R *.dfm}

procedure TF_tp.DBGrid1DblClick(Sender: TObject);
begin
  close;
end;

procedure TF_tp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_tp_map.cb_tp.ItemIndex:=f_tp_map.cb_tp.Items.IndexOfObject(tobject(dm1.ZT_tp.FieldByName('id_tp').asinteger));
  dm1.ZT_tp.Active:=false;
  dm1.ZT_street.Active:=false;
end;

end.

unit uFrmConSeguroItem;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Buttons,
  Grids,
  DBGrids,
  DB,
  ADODB,
  DBCtrls,
  IBCustomDataSet,
  IBQuery;

type
  TfrmConSeguroItem = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    DS1: TDataSource;
    Q1: TIBQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);

    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    //    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConSeguroItem: TfrmConSeguroItem;

implementation

uses
  uFrmConSeguro,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmConSeguroItem.BitBtn2Click(Sender: TObject);
begin
  if frmConSeguro <> nil then
  begin
    Q1.Close;
    Close;
    frmConSeguro.bitbtn15.SetFocus;
  end;

end;

procedure TfrmConSeguroItem.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
  begin
    Q1.Locate('CODITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
    Q1.Locate('ITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
    Q1.Locate('ITEMNOMECLASSE', Edit1.text, [lopartialkey, locaseinsensitive]);
  end
  else
  begin
    if edit1.Text = '' then
    begin
    end;
  end;
end;

procedure TfrmConSeguroItem.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    bitBtn1.Click;
    Key := #0;
  end
  else
  begin
    if key <> #13 then
    begin
    end
  end;
end;

procedure TfrmConSeguroItem.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Edit1.SetFocus;
  Edit1.Clear;

  with Q1 do
  begin
    Q1.Close;
    Q1.SQL.Clear;
    Q1.SQL.Add('select CODITEM, ITEM, ITEMNOMECLASSE');
    Q1.SQL.Add('from DONATE');
    Q1.SQL.Add('where NOMECOMPDISCORCOD =:codigo');
    // linha para atender as condições
    Q1.SQL.Add('GROUP BY CODITEM, ITEM, ITEMNOMECLASSE');
    Q1.ParamByName('codigo').Text := frmConSeguro.EDIT2.Text;
    Q1.Open;
  end;
  Q1.First;
  Q1.Last;
  Panel2.Caption := 'Itens listados.: ' + intTostr(Q1.RecordCount);
end;

procedure TfrmConSeguroItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmConSeguroItem.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmConSeguroItem.BitBtn1Click(Sender: TObject);
begin
  if frmConSeguro <> nil then
  begin
    frmConSeguro.DBEDIT11.Text := Q1['ITEM'];
    frmConSeguro.edit3.Text := Q1['CODITEM'];
    frmConSeguro.bitbtn15.SetFocus;
    Close;
  end;
end;

procedure TfrmConSeguroItem.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguroItem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmConSeguroItem.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  //Q1.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

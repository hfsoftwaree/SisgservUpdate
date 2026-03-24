unit uFrmLctoCPPesquisaFor;

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
  IBCustomDataSet,
  IBQuery;

type
  TfrmLctoCPPesquisaForn = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    Query1: TIBQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoCPPesquisaForn: TfrmLctoCPPesquisaForn;

implementation

uses
  uFrmLctoCPManutencao,
  uFrmLctoContasPagar,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoCPPesquisaForn.BitBtn2Click(Sender: TObject);
begin
  if frmLctoContasPagar = nil then
  else if frmLctoContasPagar.Tag = 1 then
  begin
    frmLctoContasPagar.edit1.Text := '';
    DM.QCredor.Close;
    Close;
  end;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 11 then
  begin
    DM.QCredor.Close;
    Close;
  end;
end;

procedure TfrmLctoCPPesquisaForn.Edit1Change(Sender: TObject);
begin
  //if edit1.Text = '' then
  //begin
  //DM.QFornecedor.First;
  //end
  //else
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    DM.QFornecedor.Locate('NOMEFORNECEDOR', Edit1.text, [lopartialkey,
        locaseinsensitive]);
  end
  else
  begin
    if (edit1.Text >= '0') and (edit1.Text <= '9') then
    begin
      DM.QFornecedor.Locate('CODIGOFORNECEDOR', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    end
  end;
end;

procedure TfrmLctoCPPesquisaForn.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    bitbtn1.Click;
    Key := #0;
  end;
end;

procedure TfrmLctoCPPesquisaForn.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  //DM.QFornecedor.Open;
  Edit1.SetFocus;
  Edit1.Clear;
  with DM.QFornecedor do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Fornecedor');
    SQL.Add('Order by NOMEFORNECEDOR');
    Open;
  end;

  with query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Count(*) as CODIGOFORNECEDOR from FORNECEDOR');
    Open;
  end;
  panel2.Caption := query1.FieldByName('CODIGOFORNECEDOR').AsString;
  query1.Close;
end;

procedure TfrmLctoCPPesquisaForn.BitBtn1Click(Sender: TObject);
begin
  if frmLctoContasPagar = nil then
  else if frmLctoContasPagar.Tag = 1 then
  begin

    frmLctoContasPagar.edit1.Text := DM.QFornecedor['CODIGOFORNECEDOR'];
    frmLctoContasPagar.DBEDIT2.Text := DM.QFornecedor['NOMEFORNECEDOR'];
    frmLctoContasPagar.DBEDIT6.Text := DM.QFornecedor['CODIGOFORNECEDOR'];
    frmLctoContasPagar.dbmemo1.SetFocus;
    Close;
  end;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 11 then
  begin

    frmLctoCPManutencao.edit1.Text := DM.QFornecedor['CODIGOFORNECEDOR'];
    frmLctoCPManutencao.FORNECEDOR.Text := DM.QFornecedor['NOMEFORNECEDOR'];
    frmLctoCPManutencao.Bitbtn7.SetFocus;
    Close;
  end;

end;

procedure TfrmLctoCPPesquisaForn.DBGrid1KeyPress(Sender: TObject; var Key:
  Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoCPPesquisaForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmLctoCPPesquisaForn.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #40 then
  begin
    dbgrid1.SetFocus;
  end

end;

procedure TfrmLctoCPPesquisaForn.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoCPPesquisaForn.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmLctoCPPesquisaForn.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  with DM.Qfornecedor do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from FORNECEDOR');
    //    SQL.Add('Where PADROES_INATIVO =:busca');
    SQL.Add('ORDER BY ' + Column.FieldName);
    Column.Title.Font.Style := [fsBold];
    //    ParamByName('busca').Text := '2';
    Open;
  end;
end;

end.

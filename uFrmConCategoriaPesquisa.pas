unit uFrmConCategoriaPesquisa;

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
  TfrmConCategoriaPesquisa = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Query1: TIBQuery;
    DataSource2: TDataSource;
    categoria: TIBQuery;
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
  frmConCategoriaPesquisa: TfrmConCategoriaPesquisa;

implementation

uses
  uFrmLctoCPManutencao,
  uFrmLctoCRManutencao,
  uFrmLctoContasPagar,
  uFrmLctoContasReceber,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmConCategoriaPesquisa.BitBtn2Click(Sender: TObject);
begin
  if frmLctoContasPagar = nil then
  else if frmLctoContasPagar.Tag = 1 then
  begin
    frmLctoContasPagar.edit2.Text := '';
    Close;
  end;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 1 then
  begin
    Close;
  end;

  if frmLctoContasReceber = nil then
  else if frmLctoContasReceber.Tag = 1 then
  begin
    frmLctoContasReceber.edit2.Text := '';
    Close;
  end;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 1 then
  begin
    Close;
  end;
end;

procedure TfrmConCategoriaPesquisa.Edit1Change(Sender: TObject);
begin
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    categoria.Locate('NOME', Edit1.text, [lopartialkey, locaseinsensitive]);
  end
  else
  begin
    if (edit1.Text >= '0') and (edit1.Text <= '9') then
    begin
      categoria.Locate('ID_CODIGO', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    end
  end;
end;

procedure TfrmConCategoriaPesquisa.Edit1KeyPress(Sender: TObject; var Key:
  Char);
begin
  if key = #13 then
  begin
    bitbtn1.Click;
    Key := #0;
  end;
end;

procedure TfrmConCategoriaPesquisa.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  //DM.QFornecedor.Open;
  Edit1.SetFocus;
  Edit1.Clear;
  with categoria do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CATEGORIA');
    SQL.Add('Order by NOME');
    Open;
  end;

  with query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Count(*) as ID_CODIGO from CATEGORIA');
    Open;
  end;
  panel2.Caption := query1.FieldByName('ID_CODIGO').AsString;
  query1.Close;
end;

procedure TfrmConCategoriaPesquisa.BitBtn1Click(Sender: TObject);
begin
  if frmLctoContasPagar = nil then
  else if frmLctoContasPagar.Tag = 1 then
  begin
    frmLctoContasPagar.edit2.Text := CATEGORIA['ID_CODIGO'];
    frmLctoContasPagar.DBedit7.Text := CATEGORIA['ID_CODIGO'];
    frmLctoContasPagar.DBEDIT3.Text := CATEGORIA['NOME'];
    frmLctoContasPagar.Edit3.SetFocus;
    Close;
  end;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 1 then
  begin
    frmLctoCPManutencao.edit2.Text := CATEGORIA['ID_CODIGO'];
    frmLctoCPManutencao.EDIT4.Text := CATEGORIA['NOME'];
    frmLctoCPManutencao.Edit3.SetFocus;
    Close;
  end;

  if frmLctoContasReceber = nil then
  else if frmLctoContasReceber.Tag = 1 then
  begin
    frmLctoContasReceber.edit2.Text := CATEGORIA['ID_CODIGO'];
    frmLctoContasReceber.DBedit7.Text := CATEGORIA['ID_CODIGO'];
    frmLctoContasReceber.DBEDIT3.Text := CATEGORIA['NOME'];
    frmLctoContasReceber.Edit3.SetFocus;
    Close;
  end;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 1 then
  begin
    frmLctoCRManutencao.edit2.Text := CATEGORIA['ID_CODIGO'];
    frmLctoCRManutencao.EDIT4.Text := CATEGORIA['NOME'];
    frmLctoCRManutencao.Edit3.SetFocus;
    Close;
  end;

end;

procedure TfrmConCategoriaPesquisa.DBGrid1KeyPress(Sender: TObject; var Key:
  Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmConCategoriaPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
  categoria.Close;
end;

procedure TfrmConCategoriaPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #40 then
  begin
    dbgrid1.SetFocus;
  end

end;

procedure TfrmConCategoriaPesquisa.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConCategoriaPesquisa.DBGrid1KeyDown(Sender: TObject; var Key:
  Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmConCategoriaPesquisa.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  with categoria do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from CATEGORIA');
    SQL.Add('ORDER BY ' + Column.FieldName);
    Column.Title.Font.Style := [fsBold];
    Open;
  end;
end;

end.

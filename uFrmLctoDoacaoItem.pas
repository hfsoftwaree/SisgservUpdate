unit uFrmLctoDoacaoItem;

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
  IBTable,
  IBQuery;

type
  TfrmLctoDoacaoItem = class(TForm)
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
  frmLctoDoacaoItem: TfrmLctoDoacaoItem;

implementation

uses
  uFrmLctoDoacao,
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmLctoDoacaoItem.BitBtn2Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    Q1.Close;
    Close;
    frmLctoDoacao.dbedit21.SetFocus;
  end;

end;

procedure TfrmLctoDoacaoItem.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    try
      Q1.Locate('CODITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
      Q1.Locate('ITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
      Q1.Locate('ITEMNOMECLASSE', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    except
    end;
end;

procedure TfrmLctoDoacaoItem.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmLctoDoacaoItem.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;

  //    TABLE.Filtered :=false;
  //    TABLE.Filter :=  'NOMECOMPDISCORCOD =' +QuotedStr(frmdonate.DBEdit16.Text)+ 'AND TIPOLCTOCOD <>' + '9';
    //  TABLE.Filtered:=True;
      //TABLE.Open;
  //    TABLE.First;
    //  TABLE.Last;
      //Panel2.Caption := 'Itens listados.: ' + intTostr(TABLE.RecordCount);
  //    TABLE.First;

  //CONSULTA E AGRUPA SEGUROS VENCIDOS
  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select CODITEM, ITEM, ITEMNOMECLASSE');
    SQL.Add('FROM DONATE');
    SQL.add('where REGISTRADOPARACOD = :codigo AND ITEM_INATIVO =:codigo1');
    SQL.Add('AND CODITEM <> :coditem');
    // Excluir o lançamento específico da consulta
    SQL.Add('GROUP BY CODITEM, ITEM, ITEMNOMECLASSE');
    SQL.ADD('ORDER BY ITEM ASC');
    ParamByName('codigo').Text := frmLctoDoacao.DBEdit16.Text;
    ParamByName('codigo1').Text := '0';
    ParamByName('coditem').Text := '72'; //Renovacao de seguro
    Open;
    q1.First;
    q1.Last;
    Panel2.Caption := 'Itens listados.: ' + intTostr(Q1.RecordCount);
  end;

  Edit1.SetFocus;
  Edit1.Clear;

end;

procedure TfrmLctoDoacaoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmLctoDoacaoItem.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoDoacaoItem.BitBtn1Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    frmLctoDoacao.TABLE.Edit;
    frmLctoDoacao.DBEDIT11.Text := Q1['ITEM'];
    frmLctoDoacao.DBEDIT23.Text := Q1['ITEMNOMECLASSE'];
    frmLctoDoacao.edit3.Text := Q1['CODITEM'];
    frmLctoDoacao.TABLE['CODITEM'] := Q1['CODITEM'];
    frmLctoDoacao.dbedit21.SetFocus;
    Close;
  end;

end;

procedure TfrmLctoDoacaoItem.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacaoItem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmLctoDoacaoItem.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DM.T_VENDEDOR.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

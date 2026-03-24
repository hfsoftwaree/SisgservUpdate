unit uFrmLctoDoacaoBanco;

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
  TfrmLctoDoacaoBanco = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Query1: TIBQuery;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoDoacaoBanco: TfrmLctoDoacaoBanco;

implementation

uses
  uFrmLctoDoacao,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoDoacaoBanco.BitBtn2Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    QUERY1.Close;
    Close;
    frmLctoDoacao.DBedit9.SetFocus;
  end;
end;

procedure TfrmLctoDoacaoBanco.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    try
      QUERY1.Locate('GRAUIND', Edit1.text, [lopartialkey, locaseinsensitive]);
      QUERY1.Locate('NOMEGRAU', Edit1.text, [lopartialkey, locaseinsensitive]);
      QUERY1.Locate('APELIDO', Edit1.text, [lopartialkey, locaseinsensitive]);
    except
    end;
end;

procedure TfrmLctoDoacaoBanco.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
  //   Key:=#0;
end;

procedure TfrmLctoDoacaoBanco.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Edit1.SetFocus;
  Edit1.Clear;
  try
    with QUERY1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from SUBPRODUTO');
      SQL.Add('Order by NOMEGRAU');
      Open;
    end;
    PaneL2.Caption := '' + intTostr(QUERY1.RecordCount);
  finally
  end;
end;

procedure TfrmLctoDoacaoBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
  if frmLctoDoacao.Tag = 1 then
    //begin
      //    frmdonate.edit4.Text := QUERY1['GRAUIND'];
        //  frmdonate.dbedit5.Text := QUERY1['NOMEGRAU'];
end;

procedure TfrmLctoDoacaoBanco.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoDoacaoBanco.BitBtn1Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    frmLctoDoacao.TABLE.Edit;
    frmLctoDoacao.DBedit18.Text := QUERY1['GRAUIND'];
    frmLctoDoacao.dbedit5.Text := QUERY1['NOMEGRAU'];
    frmLctoDoacao.dbedit17.Text := QUERY1['APELIDO'];
    frmLctoDoacao.DBedit9.SetFocus;
  end;
end;

procedure TfrmLctoDoacaoBanco.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacaoBanco.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

end.

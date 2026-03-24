unit uFrmLctoCompartilhamentoItem;

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
  TfrmLctoCompartilhamentoItem = class(TForm)
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
    DataSource1: TDataSource;
    table: TIBTable;
    tableCODLCTO: TIntegerField;
    tableCODSERV: TFloatField;
    tableSERVIDOR: TIBStringField;
    tableCODTIPOITEM: TFloatField;
    tableTIPOITEM: TIBStringField;
    tableCODITEM: TFloatField;
    tableITEM: TIBStringField;
    tableVALPAGO: TFloatField;
    tableDTACOMPRA: TDateTimeField;
    tableDTASEGURO: TDateTimeField;
    tableDTASEGUROREN: TDateTimeField;
    tableCODSEGUROVENC: TFloatField;
    tableSEGUROVENCIDO: TIBStringField;
    tableQTDEITEM: TFloatField;
    tableNOMECOMPDISCOR: TIBStringField;
    tableNOMECOMPJOGO: TIBStringField;
    tableREGISTRADOPARA: TIBStringField;
    tablePAIS: TIBStringField;
    tableTERRITORIO: TIBStringField;
    tableLOCALBASE: TIBStringField;
    tableINTEGRANTES: TIBStringField;
    tableTRANSFITEM: TIBStringField;
    tableTRANSFITEMPARA: TIBStringField;
    tableNOMEPAGADOR: TIBStringField;
    tableBANCORECEBEDOR: TIBStringField;
    tableTICKET: TFloatField;
    tableTICKETLINK: TIBStringField;
    tableOBS1: TIBStringField;
    tableOBS2: TIBStringField;
    tableRES1: TIBStringField;
    tableRES2: TIBStringField;
    tableRES3: TIBStringField;
    tableRES4: TIBStringField;
    tableRES5: TIBStringField;
    tableRES6: TIBStringField;
    tableRES7: TIBStringField;
    tableDATACADASTRO: TDateTimeField;
    tableEXIGESEGCOD: TIBStringField;
    tableEXIGSEGNOME: TIBStringField;
    tableSEGVENCPADRAOCOD: TIBStringField;
    tableSEGVENCPADRAONOME: TIBStringField;
    tableNOMECOMPDISCORCOD: TIBStringField;
    tableREGISTRADOPARACOD: TIBStringField;
    tableBANCORECEBEDORAPEL: TIBStringField;
    tableBANCORECEBEDORCOD: TIBStringField;
    tableDELITEMVENCCOD: TIBStringField;
    tableDELITEMVENCDATA: TIBStringField;
    tableTIPOLCTOCOD: TIBStringField;
    tableTIPOLCTONOME: TIBStringField;
    tableITEMMODELO: TIBStringField;
    tableSEGUROTIPOCOD: TIBStringField;
    tableSEGUROTIPONOME: TIBStringField;
    tableSTATUSCOD: TIBStringField;
    tableSTATUSNOME: TIBStringField;
    tableSTATUSOBS: TIBStringField;
    tableITEMID: TIBStringField;
    tableITEMNOMECLASSE: TIBStringField;
    tableVALDESCONTO: TFloatField;
    tableVALTOTAL: TFloatField;
    tableITEMREFERENCIA: TIBStringField;
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
  frmLctoCompartilhamentoItem: TfrmLctoCompartilhamentoItem;

implementation

uses
  uFrmLctoCompartilhamento,
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmLctoCompartilhamentoItem.BitBtn2Click(Sender: TObject);
begin
  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 3 then
  begin
    Q1.Close;
    Close;
    frmLctoCompartilhamento.edit3.SetFocus;
  end;

end;

procedure TfrmLctoCompartilhamentoItem.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    try
      q1.Locate('CODITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
      q1.Locate('ITEM', Edit1.text, [lopartialkey, locaseinsensitive]);
      q1.Locate('ITEMNOMECLASSE', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    except
    end;
end;

procedure TfrmLctoCompartilhamentoItem.Edit1KeyPress(Sender: TObject; var Key:
  Char);
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

procedure TfrmLctoCompartilhamentoItem.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;

  //    TABLE.Filtered :=false;
    //  TABLE.Filter :=  'NOMECOMPDISCORCOD =' +QuotedStr(frmcompartilhamento.DBEdit4.Text);//+ 'AND TIPOLCTOCOD =' + QuotedStr('1');
      //TABLE.Filtered:=True;
  //    TABLE.Open;
    //  TABLE.First;
      //TABLE.Last;
  //    Panel2.Caption := 'Itens listados.: ' + intTostr(TABLE.RecordCount);
    //  TABLE.First;

  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select CODITEM, ITEM, ITEMNOMECLASSE');
    SQL.Add('FROM DONATE');
    q1.sql.add('where REGISTRADOPARACOD = :codigo');
    SQL.Add('GROUP BY CODITEM, ITEM, ITEMNOMECLASSE');
    SQL.ADD('ORDER BY ITEM ASC');
    ParamByName('codigo').Text := frmLctoCompartilhamento.DBEdit4.Text;
    Open;
    q1.First;
    q1.Last;
    Panel2.Caption := 'Itens listados.: ' + intTostr(Q1.RecordCount);
  end;

  Edit1.SetFocus;
  Edit1.Clear;

end;

procedure TfrmLctoCompartilhamentoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmLctoCompartilhamentoItem.DBGrid1KeyPress(Sender: TObject; var Key:
  Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoCompartilhamentoItem.BitBtn1Click(Sender: TObject);
begin
  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 3 then
  begin
    frmLctoCompartilhamento.TABLE1.Edit;
    frmLctoCompartilhamento.edit3.Text := Q1['CODITEM'];
    frmLctoCompartilhamento.DBEDIT11.Text := Q1['ITEM'];
    frmLctoCompartilhamento.TABLE1['ITEMNOME'] := Q1['ITEM'];
    frmLctoCompartilhamento.TABLE1['ITEMCOD'] := Q1['CODITEM'];
    frmLctoCompartilhamento.edit5.SetFocus;

    Close;
  end;
end;

procedure TfrmLctoCompartilhamentoItem.Edit1KeyDown(Sender: TObject; var Key:
  Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoCompartilhamentoItem.DBGrid1KeyDown(Sender: TObject; var Key:
  Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmLctoCompartilhamentoItem.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DM.T_VENDEDOR.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

unit uFrmConLog;

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
  StdCtrls,
  Mask,
  DBCtrls,
  ExtCtrls,
  ComCtrls,
  ImgList,
  Buttons,
  Grids,
  DBGrids,
  DB,
  ADODB,
  EDBZero,
  EChkIE,
  EChkCNPJ,
  EKeyNav,
  IBCustomDataSet,
  IBTable,
  EChkCPF,
  EDBDate,
  IBQuery,
  shellapi,
  EDBCombo,
  Gauges,
  EDBNum,
  EDateEd,
  SSBaseXP,
  CJVBlinkLabel,
  DateUtils,
  RXDBCtrl;

type
  TfrmConLog = class(TForm)
    PageControl1: TPageControl;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    Image1: TImage;
    TABLE: TIBTable;
    Label1: TLabel;
    TABLECODLCTO: TIntegerField;
    TABLECODSERV: TFloatField;
    TABLESERVIDOR: TIBStringField;
    TABLECODTIPOITEM: TFloatField;
    TABLETIPOITEM: TIBStringField;
    TABLECODITEM: TFloatField;
    TABLEITEM: TIBStringField;
    TABLEVALPAGO: TFloatField;
    TABLEDTACOMPRA: TDateTimeField;
    TABLEDTASEGURO: TDateTimeField;
    TABLEDTASEGUROREN: TDateTimeField;
    TABLECODSEGUROVENC: TFloatField;
    TABLESEGUROVENCIDO: TIBStringField;
    TABLEQTDEITEM: TFloatField;
    TABLENOMECOMPDISCOR: TIBStringField;
    TABLENOMECOMPJOGO: TIBStringField;
    TABLEREGISTRADOPARA: TIBStringField;
    TABLEPAIS: TIBStringField;
    TABLETERRITORIO: TIBStringField;
    TABLELOCALBASE: TIBStringField;
    TABLEINTEGRANTES: TIBStringField;
    TABLETRANSFITEM: TIBStringField;
    TABLETRANSFITEMPARA: TIBStringField;
    TABLENOMEPAGADOR: TIBStringField;
    TABLEBANCORECEBEDOR: TIBStringField;
    TABLETICKET: TFloatField;
    TABLETICKETLINK: TIBStringField;
    TABLEOBS1: TIBStringField;
    TABLEOBS2: TIBStringField;
    TABLERES1: TIBStringField;
    TABLERES2: TIBStringField;
    TABLERES3: TIBStringField;
    TABLERES4: TIBStringField;
    TABLERES5: TIBStringField;
    TABLERES6: TIBStringField;
    TABLERES7: TIBStringField;
    TABLEDATACADASTRO: TDateTimeField;
    TABLEEXIGESEGCOD: TIBStringField;
    TABLEEXIGSEGNOME: TIBStringField;
    TABLESEGVENCPADRAOCOD: TIBStringField;
    TABLESEGVENCPADRAONOME: TIBStringField;
    TABLENOMECOMPDISCORCOD: TIBStringField;
    TABLEREGISTRADOPARACOD: TIBStringField;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    TABLEBANCORECEBEDORAPEL: TIBStringField;
    TABLEBANCORECEBEDORCOD: TIBStringField;
    TABLEDELITEMVENCCOD: TIBStringField;
    TABLEDELITEMVENCDATA: TIBStringField;
    TABLETIPOLCTOCOD: TIBStringField;
    TABLETIPOLCTONOME: TIBStringField;
    TABLEITEMMODELO: TIBStringField;
    TABLESEGUROTIPOCOD: TIBStringField;
    TABLESEGUROTIPONOME: TIBStringField;
    TABLESTATUSCOD: TIBStringField;
    TABLESTATUSNOME: TIBStringField;
    TABLESTATUSOBS: TIBStringField;
    TABLEITEMID: TIBStringField;
    TABLEITEMNOMECLASSE: TIBStringField;
    det: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DS1: TDataSource;
    T1: TIBTable;
    T1CODLCTO: TIntegerField;
    T1NOMEDISCORD: TIBStringField;
    T1NOMEJOGO: TIBStringField;
    T1IDDISCORD: TIBStringField;
    T1IDSTEAM: TIBStringField;
    T1LINKSTEAM: TIBStringField;
    T1IDBATTLEYE: TIBStringField;
    T1IDBOEMIA: TIBStringField;
    T1CODBAN: TIBStringField;
    T1BANDESCRICAO: TIBStringField;
    T1BANOBS: TIBStringField;
    T1DTANASCIMENTO: TDateTimeField;
    T1DTACADASTRO: TDateTimeField;
    T1CONTATOFONE: TIBStringField;
    T1CONTATOEMAIL: TIBStringField;
    T1CONTATORESPONSAVEL: TIBStringField;
    T1OBSDIVERSA: TIBStringField;
    T1LOCALBASE: TIBStringField;
    T1TERRITORIO: TIBStringField;
    T1JOGASOLO: TIBStringField;
    T1INTEGRANTES: TIBStringField;
    T1SEGUROTIPOCOD: TIBStringField;
    T1SEGUROTIPONOME: TIBStringField;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    TABLEVALDESCONTO: TFloatField;
    TABLEVALTOTAL: TFloatField;
    TABLEITEMREFERENCIA: TIBStringField;
    Bevel1: TBevel;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    Q1: TIBQuery;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DS2: TDataSource;
    T2: TIBTable;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure TabSheet3Show(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure detClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit3Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConLog: TfrmConLog;

implementation

uses
  uFrmLctoDoacao;

{$R *.dfm}

procedure TfrmConLog.BitBtn3Click(Sender: TObject);
begin
  t1.cancel;
  t1.Filtered := false;
  TABLE.Cancel;
  table.Filtered := false;
  frmConLog := nil;
  Close;
end;

procedure TfrmConLog.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Consulta log';
end;

procedure TfrmConLog.FormDestroy(Sender: TObject);
begin
  Q1.Close;
  TABLE.Close;
  t1.close;
end;

procedure TfrmConLog.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;
end;

procedure TfrmConLog.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  table.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

procedure TfrmConLog.TabSheet3Show(Sender: TObject);
var
  total: Real;
begin
  //TABLE.Cancel;
  //Label1.Caption := 'Pesquisa lançamento';
  Edit1.SetFocus;
end;

procedure TfrmConLog.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConLog.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConLog.BitBtn15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConLog.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConLog.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConLog.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConLog.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConLog.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConLog.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConLog.BitBtn15KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmConLog.Edit1Change(Sender: TObject);
begin
  if edit1.Text = '' then
  begin
    GroupBox3.Enabled := false;

    table.Filtered := false;
    tabLe.CLOSE;
    label2.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);
    label3.Visible := false;
    det.Enabled := false;

  end
  else
  begin
    if edit1.Text <> '' then
    begin
      GroupBox3.Enabled := true;

      table.Filtered := false;
      table.Filter := 'ITEMID like' + QuotedStr('%' + edit1.Text + '%');
      table.Filtered := True;
      table.Open;

      if table.RecordCount <> 0 then
      begin
        table.Filtered := false;
        table.Filter := 'ITEMID like' + QuotedStr('%' + edit1.Text + '%');
        table.Filtered := True;
        table.Open;
        table.Last;
        LABEL2.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);
        table.First;
        label3.Visible := false;
        det.Enabled := true;

        with Q1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select CODLCTO, COMPARTILHADOCOD, COMPARTILHADONOME, OBS');
          SQL.Add('FROM COMPARTILHAMENTO');
          q1.sql.add('where COMPRADORCOD = :codigo AND ITEMCOD = :codigo1');
          SQL.ADD('ORDER BY COMPARTILHADONOME ASC');
          ParamByName('codigo').Text := DBEdit1.Text;
          ParamByName('codigo1').Text := DBEdit2.Text;
          Open;
          q1.First;
          q1.Last;
          //      Panel2.Caption := 'Itens listados.: ' + intTostr(Q1.RecordCount);
        end;

      end
      else
      begin
        if table.RecordCount = 0 then
        begin
          table.Filtered := false;
          table.Open;
          table.Last;
          LABEL2.Caption := '' + intTostr(table.RecordCount);
          table.First;
          label3.Visible := true;
          det.Enabled := false;
        end
      end;
    end;
  end;
end;

procedure TfrmConLog.detClick(Sender: TObject);
begin
  if table['ITEMID'] = '' then
  begin
    Application.MessageBox('Não é possível abrir o cadastro do item selesionado, pois o mesmo não possui um ID log cadastrado!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if table['ITEMID'] <> '' then
    begin
      try
        Self.Tag := 1;
        Application.CreateForm(TfrmLctoDoacao, frmLctoDoacao);
        frmLctoDoacao.ShowModal;
      finally
        frmLctoDoacao.Free;
      end;
    end;
  end;
end;

procedure TfrmConLog.DBEdit1Change(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
  begin
    t1.close;
    t1.Filtered := false;
    t1.Filter := 'CODLCTO = ' + QuotedStr(DBEdit1.Text);
    //t1.IndexFieldNames := ('CODLCTO');
    t1.Filtered := True;
    t1.Open;
    t1.last;
    Label4.Caption := t1['NOMEJOGO'];
  end
  else
  begin
    if DBEdit1.Text = '' then
    begin
      Label4.Caption := '';
    end;
  end;
end;

procedure TfrmConLog.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex = 1 then
  begin
    table.Filtered := false;
    table.Filter := 'TIPOLCTOCOD =' + '8' + 'AND ITEMID =' +
      QuotedStr(Edit1.Text);
    TABLE.Filtered := TRUE;

    LABEL2.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);
  end
  else
  begin
    if combobox1.ItemIndex = 0 then
    begin
      table.Filtered := false;
      table.Filter := 'ITEMID like' + QuotedStr('%' + edit1.Text + '%');
      table.Filtered := True;

      LABEL2.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);
    end;
  end;
end;

procedure TfrmConLog.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Q1.RecordCount <> 0 then
  begin
    dbgrid2.Canvas.Font.Style := [fsbold];
    dbgrid2.Canvas.Brush.Color := $0080FF00; //verde
    dbgrid2.DefaultDrawColumnCell(rect, datacol, column, state);
  end
  else
  begin
    dbgrid2.Canvas.Font.Style := [fsbold];
    dbgrid2.Canvas.Brush.Color := $000080FF; //laranja
    dbgrid2.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TfrmConLog.DBEdit3Change(Sender: TObject);
begin
  if DBEdit3.Text <> '' then
  begin
    t2.close;
    t2.Filtered := false;
    t2.Filter := 'CODLCTO = ' + QuotedStr(DBEdit3.Text);
    //t1.IndexFieldNames := ('CODLCTO');
    t2.Filtered := True;
    t2.Open;
    t2.last;
    Label6.Caption := t2['NOMEJOGO'];
  end
  else
  begin
    if DBEdit3.Text = '' then
    begin
      Label6.Caption := '';
    end;
  end;
end;

end.

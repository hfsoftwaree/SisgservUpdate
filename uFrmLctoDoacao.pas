unit uFrmLctoDoacao;

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
  SSBaseXP;

type
  TfrmLctoDoacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    Image1: TImage;
    TABLE: TIBTable;
    Label1: TLabel;
    g: TLabel;
    Gauge1: TGauge;
    CheckBox2: TCheckBox;
    dsplayer: TDataSource;
    Queryplayer: TIBQuery;
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
    Edit6: TEdit;
    Panel18: TPanel;
    Edit2: TEdit;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit8: TDBEdit;
    Panel3: TPanel;
    Panel17: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBComboBox4: TDBComboBox;
    Panel13: TPanel;
    Panel5: TPanel;
    DBEdit6: TDBEdit;
    Panel27: TPanel;
    bancod: TDBEdit;
    Panel28: TPanel;
    DATACADASTRAMENTO: TEvDBDateEdit;
    Panel31: TPanel;
    DBComboBox2: TDBComboBox;
    DBMemo2: TDBMemo;
    Panel12: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit14: TDBEdit;
    Panel4: TPanel;
    DBComboBox1: TDBComboBox;
    Panel30: TPanel;
    Panel11: TPanel;
    DBComboBox3: TDBComboBox;
    DBEdit4: TDBEdit;
    Edit1: TEdit;
    BitBtn8: TBitBtn;
    DBEdit7: TDBEdit;
    Edit3: TEdit;
    BitBtn9: TBitBtn;
    DBEdit11: TDBEdit;
    Edit4: TEdit;
    BitBtn10: TBitBtn;
    DBEdit5: TDBEdit;
    VALUNITARIO: TEvDBNumEdit;
    BitBtn11: TBitBtn;
    dtcompra: TEvDBDateEdit;
    dtseguro: TEvDBDateEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Panel10: TPanel;
    Panel16: TPanel;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBEdit16: TDBEdit;
    Edit5: TEdit;
    BitBtn12: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    table1: TIBTable;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    IBStringField1: TIBStringField;
    FloatField2: TFloatField;
    IBStringField2: TIBStringField;
    FloatField3: TFloatField;
    IBStringField3: TIBStringField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    FloatField5: TFloatField;
    IBStringField4: TIBStringField;
    FloatField6: TFloatField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    FloatField7: TFloatField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    DateTimeField4: TDateTimeField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IBStringField31: TIBStringField;
    BitBtn13: TBitBtn;
    BitBtn15: TBitBtn;
    DBMemo1: TDBMemo;
    DBEdit17: TDBEdit;
    TABLEBANCORECEBEDORAPEL: TIBStringField;
    TABLEBANCORECEBEDORCOD: TIBStringField;
    DBEdit18: TDBEdit;
    Label2: TLabel;
    EvDBDateEdit1: TEvDBDateEdit;
    EvDBDateEdit2: TEvDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    TABLEDELITEMVENCCOD: TIBStringField;
    TABLEDELITEMVENCDATA: TIBStringField;
    TABLETIPOLCTOCOD: TIBStringField;
    TABLETIPOLCTONOME: TIBStringField;
    Panel19: TPanel;
    DBComboBox7: TDBComboBox;
    DBEdit19: TDBEdit;
    dlancamento: TDataSource;
    tlancamento: TIBTable;
    tlancamentoCODLCTO: TIntegerField;
    tlancamentoNOME: TIBStringField;
    TABLEITEMMODELO: TIBStringField;
    Label5: TLabel;
    valtotal: TLabel;
    TABLESEGUROTIPOCOD: TIBStringField;
    TABLESEGUROTIPONOME: TIBStringField;
    Label6: TLabel;
    BitBtn14: TBitBtn;
    DBGrid2: TDBGrid;
    TABLESTATUSCOD: TIBStringField;
    TABLESTATUSNOME: TIBStringField;
    TABLESTATUSOBS: TIBStringField;
    TABLEITEMID: TIBStringField;
    table1BANCORECEBEDORAPEL: TIBStringField;
    table1BANCORECEBEDORCOD: TIBStringField;
    table1DELITEMVENCCOD: TIBStringField;
    table1DELITEMVENCDATA: TIBStringField;
    table1TIPOLCTOCOD: TIBStringField;
    table1TIPOLCTONOME: TIBStringField;
    table1ITEMMODELO: TIBStringField;
    table1SEGUROTIPOCOD: TIBStringField;
    table1SEGUROTIPONOME: TIBStringField;
    table1STATUSCOD: TIBStringField;
    table1STATUSNOME: TIBStringField;
    table1STATUSOBS: TIBStringField;
    table1ITEMID: TIBStringField;
    Panel20: TPanel;
    DBEdit21: TDBEdit;
    Label7: TLabel;
    DBMemo3: TDBMemo;
    TABLEITEMNOMECLASSE: TIBStringField;
    Label8: TLabel;
    table1ITEMNOMECLASSE: TIBStringField;
    table1VALDESCONTO: TFloatField;
    table1VALTOTAL: TFloatField;
    table1ITEMREFERENCIA: TIBStringField;
    Label9: TLabel;
    DBEdit20: TDBEdit;
    TABLEVALDESCONTO: TFloatField;
    TABLEVALTOTAL: TFloatField;
    TABLEITEMREFERENCIA: TIBStringField;
    DBEdit22: TDBEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    DSQDONATE: TDataSource;
    QDONATE: TIBQuery;
    BitBtn16: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Edit12: TEdit;
    DBEdit23: TDBEdit;
    Label12: TLabel;
    BitBtn17: TBitBtn;
    TABLEITEM_INATIVO: TIBStringField;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit24: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MaskEdit8Enter(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure EvCheckCPF1Error(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure TIPOPESSOAEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBComboBox3Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DATACADASTRAMENTOChange(Sender: TObject);
    procedure dtcompraEnter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure dtseguroEnter(Sender: TObject);
    procedure DBComboBox5Change(Sender: TObject);
    procedure DBComboBox6Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure DBEdit12Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit15Change(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit18Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBComboBox7Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
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
    procedure dtseguroExit(Sender: TObject);
    procedure DBEdit20KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit24Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoDoacao: TfrmLctoDoacao;

implementation

uses
  uFrmConLog,
  uFrmConLog1,
  uFrmLctoDoacaoItem,
  uFrmLctoDoacaoBanco,
  uFrmLctoDoacaoPlayer,
  uFrmLctoDoacaoItem1,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

function ConverteData(Data: string): string;
begin
  Result := Copy(Data, 4, 3) + Copy(Data, 1, 3) + Copy(Data, 7, 4);
end;

class function ListaServidor: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with DM.TEssencia do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('ESSENCIA').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

class function ListaTipoItem: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with DM.TSETORES do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('NOMESETOR').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

class function ListaItem: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with DM.TSETORES do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('NOMESETOR').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

class function Listatipolancamento: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with frmLctoDoacao.tlancamento do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('NOME').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

procedure TfrmLctoDoacao.FormShow(Sender: TObject);
begin
  if frmConLog = nil then
  begin
    //showmessage('nada');
    PageControl1.ActivePage := TabSheet1;
    Label1.Caption := 'Doação';
    DM.TEssencia.Open;
    tlancamento.Open;

    TABLE.close;
    TABLE.Filtered := false;
    TABLE.Filter := 'STATUSCOD = ' + '0';
    //TABLE.IndexFieldNames := ('');
    TABLE.Filtered := True;
    TABLE.Open;

    TABLE.Edit;
    edit1.Text := dbedit12.Text;
    edit5.Text := dbedit16.Text;
    edit3.Text := dbedit10.Text;
    DBComboBox3.Items := ListaServidor;
    DBComboBox7.Items := Listatipolancamento;
    DBCOMBOBOX3.SetFocus;

    with Queryplayer do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from PLAYER');
      Open;
    end;
  end;

  if frmConLog <> nil then
  begin
    //showmessage('criado');
    PageControl1.ActivePage := TabSheet1;
    Label1.Caption := 'Doação';
    DM.TEssencia.Open;
    tlancamento.Open;
    TABLE.Open;
    TABLE.Locate('ITEMID', frmConLog.Edit1.text, [lopartialkey,
        locaseinsensitive]);
    TABLE.Edit;
    edit1.Text := dbedit12.Text;
    edit5.Text := dbedit16.Text;
    edit3.Text := dbedit10.Text;
    DBComboBox3.Items := ListaServidor;
    DBComboBox7.Items := Listatipolancamento;
    DBCOMBOBOX3.SetFocus;
    with Queryplayer do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from PLAYER');
      Open;
    end;
  end;
end;

procedure TfrmLctoDoacao.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmLctoDoacao.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmLctoDoacao.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmLctoDoacao.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmLctoDoacao.Edit1Change(Sender: TObject);
begin
  DM.TFornecedor.Locate('NOMEFORNECEDOR', Edit2.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmLctoDoacao.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmLctoDoacao.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmLctoDoacao.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    qdonate.Cancel;
    qdonate.Close;
    TABLE.Cancel;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    TABLE.Append;
    edit1.Clear;
    edit5.Clear;
    edit3.Clear;
    edit4.Clear;
    dbcombobox3.SetFocus;
    //box.ItemIndex := -1;
    datacadastramento.Text := DateToStr(Now);
    //table.edit;
    table['PAIS'] := 'BR';
    label8.Visible := false;
    dbgrid2.Visible := false;
    label9.Visible := false;
    DBEdit20.Visible := false;
  end;
end;

procedure TfrmLctoDoacao.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBCombobox3.Text = '' then
    begin
      Application.MessageBox('Servidor deve ser informado!', 'Dados Basicos',
        mb_Ok + mb_IconInformation);
      PageControl1.ActivePage := TabSheet1;
      DBCombobox3.SetFocus;
    end
    else
    begin
      if DBCombobox7.Text = '' then
      begin
        Application.MessageBox('Tipo de lançamento deve ser informado!',
          'Dados Basicos', mb_Ok + mb_IconInformation);
        PageControl1.ActivePage := TabSheet1;
        DBCombobox7.SetFocus;
      end
      else
      begin
        if DBEdit7.Text = '' then
        begin
          Application.MessageBox('Comprador[id discord] deve ser informado!',
            'Dados Basicos', mb_Ok + mb_IconInformation);
          PageControl1.ActivePage := TabSheet1;
          bitbtn8.SetFocus;
        end
        else
        begin
          if DBEdit11.Text = '' then
          begin
            Application.MessageBox('Item deve ser informado!', 'Dados Basicos',
              mb_Ok + mb_IconInformation);
            PageControl1.ActivePage := TabSheet1;
            bitbtn9.SetFocus;
          end;
        end;
      end;
    end;
  end;

  if (DBCombobox3.Text <> '') and (DBCombobox7.Text <> '') and (DBEDIT7.Text <>
    '') and (DBEDIT11.Text <> '') then
  begin
    with Queryplayer do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from PLAYER');
      SQL.add('where CODLCTO = :codigo');
      ParamByName('codigo').Text := edit1.Text;
      Open;
    end;
  end;

  if Application.MessageBox('Confirma Inclusão/Alteração?', 'Confirmação',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    TABLE.Edit;
    qdonate.Cancel; //utilizado para consultar e preencher o dbedit8
    qdonate.Close;

    TABLE['STATUSCOD'] := queryplayer['STATUSCOD'];
    TABLE['STATUSNOME'] := queryplayer['STATUSNOME'];
    if TABLE.FieldByName('ITEM_INATIVO').IsNull then
      TABLE['ITEM_INATIVO'] := '0';

    if VALUNITARIO.Value = 0 then
      table['VALPAGO'] := '0';

    TABLE.Post;
    label8.Visible := false;
    dbgrid2.Visible := false;
    label9.Visible := false;
    DBEdit20.Visible := false;

    if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      with Queryplayer do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from PLAYER');
        Open;
      end;
      //        end;

      label6.Caption := '';
      TABLE.Append;
      table['PAIS'] := 'BR';
      datacadastramento.Text := DateToStr(Now);
      DBCombobox3.SetFocus;
      BitBtn4.Enabled := False;
      BitBtn5.Enabled := False;
      BitBtn6.Enabled := False;
      BitBtn3.Enabled := False;
    end
    else
    begin
      with Queryplayer do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from PLAYER');
        Open;
      end;
      //  end;

      label6.Caption := '';
      TABLE.Refresh;
      PageControl1.ActivePage := TabSheet1;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn3.Enabled := true;
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn3Click(Sender: TObject);
begin

  //edit3.Text := '';
  self.Tag := 0;
  qdonate.Cancel;
  qdonate.Close;
  TABLE.Cancel;
  table.Filtered := false;
  DM.TEssencia.Cancel;
  tlancamento.Cancel;
  Close;
end;

procedure TfrmLctoDoacao.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
end;

procedure TfrmLctoDoacao.BitBtn6Click(Sender: TObject);
begin
  TABLE.Cancel;
  Label1.Caption := 'Pesquisa lançamento';
  PageControl1.ActivePage := TabSheet3;
  Edit2.SetFocus;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
end;

procedure TfrmLctoDoacao.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmLctoDoacao.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmLctoDoacao.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Doação';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
end;

procedure TfrmLctoDoacao.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmLctoDoacao.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmLctoDoacao.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmLctoDoacao.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmLctoDoacao.FormDestroy(Sender: TObject);
begin
  TABLE.Close;
end;

procedure TfrmLctoDoacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;
end;

procedure TfrmLctoDoacao.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  table.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

procedure TfrmLctoDoacao.TabSheet3Show(Sender: TObject);
var
  total: Real;
begin
  TABLE.Cancel;
  Label1.Caption := 'Pesquisa lançamento';
  Edit2.SetFocus;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  table.Last;
  table.First;
  g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
  //mesmo comando do botao cancelar
  TABLE.Cancel;
  BitBtn4.Enabled := true;
  BitBtn5.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
  //comando botao cancelar end

  if edit2.Text <> '' then
  begin
    if Combobox1.ItemIndex = 0 then
    begin
      bitbtn14.Enabled := false;
      table.close;
      table.Filtered := false;
      table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text);
      TABLE.IndexFieldNames := ('CODLCTO');
      table.Filtered := True;
      table.Open;

      total := 0;
      table.Last;
      table.First;
      g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
      if not table.Eof then
        repeat
          total := TABLE['VALPAGO'] + total;
          table.Next;
        until table.Eof;
    end;
    valtotal.Caption := FormatCurr('#0.00', total);
    label5.Visible := true;
    valtotal.Visible := true;
    table.First;
  end;
  g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
end;

procedure TfrmLctoDoacao.DBComboBox3Change(Sender: TObject);
begin
  DM.TEssencia.Locate('ESSENCIA', dbcombobox3.text, [lopartialkey,
      locaseinsensitive]);
  dbedit4.Text := DM.TEssencia['CODIGO'];
end;

procedure TfrmLctoDoacao.BitBtn11Click(Sender: TObject);
var
  Endereco: string;
begin
  if dbedit14.Text <> '' then
  begin
    dbedit14.Text := Trim(dbedit14.Text);
    if (Pos('http://', dbedit14.Text) or
      Pos('https://', dbedit14.Text)) <> 0 then
      Endereco := dbedit14.Text
    else
    begin
      Endereco := 'http://' + dbedit14.Text; // Padrão
      dbedit14.Text := 'http://' + dbedit14.Text;
    end;
    ShellExecute(Handle, 'open', PCHAR(Endereco), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    Application.MessageBox('Não há url cadastrada para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end;

end;

procedure TfrmLctoDoacao.BitBtn9Click(Sender: TObject);
begin
  self.Tag := 1;

  if dbedit19.Text = '' then
  begin
    Application.MessageBox('Tipo de lançamento deve ser informado, Verifíque!',
      'Informação', mb_Ok + mb_IconInformation);
    DBCombobox7.SetFocus;
  end
  else
  begin
    if dbedit7.Text = '' then
    begin
      Application.MessageBox('Comprador deve ser informado, Verifíque!',
        'Informação', mb_Ok + mb_IconInformation);
      Edit1.SetFocus;
    end
    else
    begin
      if DBEDIT2.Text = '' then
      begin
        Application.MessageBox('[Registrado para] deve ser informado, Verifíque!', 'Informação', mb_Ok + mb_IconInformation);
        edit5.SetFocus;
      end;
    end;
  end;

  if (dbedit19.Text <> '') and (dbedit7.Text <> '') and (dbedit2.Text <> '')
    then
  begin

    DM.T_VENDEDOR.Open;
    if DM.T_VENDEDOR.RecordCount = 0 then
    begin
      DM.T_VENDEDOR.Close;
      Application.MessageBox('Não há item cadastrado, Verifíque!', 'Item', mb_Ok
        + mb_IconExclamation);
    end
    else
    begin

      if dbedit19.Text = '9' then
      begin
        try
          DM.T_VENDEDOR.Close;
          Application.CreateForm(TfrmLctoDoacaoItem, frmLctoDoacaoItem);
          frmLctoDoacaoItem.ShowModal;
        finally
          frmLctoDoacaoItem.Free;
        end
      end
      else
      begin
        if dbedit19.Text <> '9' then
        begin
          try
            DM.T_VENDEDOR.Close;
            Application.CreateForm(TfrmLctoDoacaoItem1, frmLctoDoacaoItem1);
            frmLctoDoacaoItem1.ShowModal;
          finally
            frmLctoDoacaoItem1.Free;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn2Click(Sender: TObject);
begin
  with Queryplayer do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from PLAYER');
    Open;
  end;

  qdonate.Cancel;
  qdonate.Close;
  TABLE.Cancel;
  label8.Visible := false;
  dbgrid2.Visible := false;
  label9.Visible := false;
  DBEdit20.Visible := false;

  BitBtn4.Enabled := true;
  BitBtn5.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
  label6.Caption := '';
  if (dbedit12.Text = '') and (dbedit16.Text = '') and (dbedit10.Text = '') and
    (dbedit18.Text = '') then
  begin
    edit1.Clear;
    edit5.Clear;
    edit3.Clear;
    edit4.Clear;
  end
  else
  begin
    if (dbedit12.Text <> '') and (dbedit16.Text <> '') and (dbedit10.Text <> '')
      and (dbedit18.Text <> '') then
    begin

    end;
  end;
end;

procedure TfrmLctoDoacao.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if DBmemo2.Lines.Text = '' then
    begin
      Key := #8;
      bitbtn1.SetFocus;
    end
    else
  end
  else
end;

procedure TfrmLctoDoacao.BitBtn8Click(Sender: TObject);
begin
  self.Tag := 1;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit2Enter(Sender: TObject);
begin
  if dbedit2.Text <> '' then
  begin

  end
  else
  begin
    if dbedit7.Text <> '' then
    begin
      if Application.MessageBox('O item será registrado para o player pagador?',
        'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        dbedit2.Text := dbedit7.Text;
        dbedit8.SetFocus;
      end
      else
      begin

      end
    end;
  end;
end;

procedure TfrmLctoDoacao.DATACADASTRAMENTOChange(Sender: TObject);
begin
  panel11.Caption := datacadastramento.Text;
end;

procedure TfrmLctoDoacao.dtcompraEnter(Sender: TObject);
begin
  if dtcompra.Text = '  /  /    ' then
  begin
    dtcompra.Text := DateToStr(Now);
  end
  else
  begin
    if dtcompra.Text <> '  /  /    ' then
    begin

    end
  end;
end;

procedure TfrmLctoDoacao.DBEdit6Enter(Sender: TObject);
begin
  if dbedit6.Text = '' then
  begin
    dbedit6.Text := '1';
    dbedit6.SelectAll;
  end;
end;

procedure TfrmLctoDoacao.dtseguroEnter(Sender: TObject);
var
  dataatual, novadata: TDateTime;
begin
  label8.Visible := true;
  dbgrid2.Visible := true;
  if dbedit16.Text <> '' then
  begin
    if dbedit15.Text = '0' then //seguro total
    begin
      table1.close;
      table1.Filtered := false;
      table1.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(dbEdit16.Text) +
        'and SEGVENCPADRAOCOD= ' + '0';
      table1.IndexFieldNames := 'DTASEGURO';
      table1.Filtered := True;
      table1.Open;
      table1.First;

      if table1.RecordCount <> 0 then
      begin
        if dbedit19.Text <> '6' then
        begin
          table1.last; //ultimo reg
          table.Edit;
          table['DTASEGURO'] := table1['DTASEGURO'];
          //      table1.close;
          //      table1.Filtered :=false;
              //  showmessage('1');

        end
        else
        begin
          if dbedit19.Text = '6' then
          begin
            table1.close;
            table1.Filtered := false;
            table1.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(dbEdit16.Text) +
              'and SEGVENCPADRAOCOD= ' + '0' + 'and TIPOLCTOCOD= ' + '6';
            table1.IndexFieldNames := 'DTASEGURO';
            table1.Filtered := True;
            table1.Open;

            if table1.RecordCount <> 0 then
            begin
              table1.last;
              table.Edit;
              dataatual := table1['DTASEGURO'];
              novadata := dataatual + 30;
              table['DTASEGURO'] := (DateToStr(novadata));
              //          table1.close;
              //          table1.Filtered :=false;
                   //       showmessage('2');

            end
            else
            begin
              if table1.RecordCount = 0 then
              begin
                table1.close;
                table1.Filtered := false;
                table1.Filter := 'REGISTRADOPARACOD = ' +
                  QuotedStr(dbEdit16.Text) + 'and SEGVENCPADRAOCOD= ' + '0';
                table1.IndexFieldNames := 'DTASEGURO'; //TODOS ESTAVAO CODLCTO
                table1.Filtered := True;
                table1.Open;
                table1.First;

                table1.last;
                table.Edit;
                dataatual := table1['DTASEGURO'];
                novadata := dataatual + 30;
                table['DTASEGURO'] := (DateToStr(novadata));
                //          table1.close;
                //          table1.Filtered :=false;
                        //    showmessage('3 ');

              end;
            end;
          end;
        end;
        //        end;
      end
      else
      begin

        if table1.RecordCount = 0 then
        begin
          table.Edit;
          dataatual := dtcompra.DateValue;
          novadata := dataatual + 30;
          table['DTASEGURO'] := (DateToStr(novadata));
          //  table1.close;
          //  table1.Filtered :=false;
           //   showmessage('4 ');

        end;
      end;
    end;

    if dbedit15.Text = '1' then //seguro por item
    begin
      table1.close;
      table1.Filtered := false;
      table1.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(dbEdit16.Text) +
        'and CODITEM= ' + QuotedStr(dbEdit10.Text) + 'and SEGVENCPADRAOCOD= ' +
        '1';
      table1.IndexFieldNames := 'DTASEGURO';
      table1.Filtered := True;
      table1.Open;
      table1.First;

      if table1.RecordCount <> 0 then
      begin
        if dbedit19.Text <> '6' then //6 - SEGURO
        begin
          table1.last;
          table.Edit;
          dataatual := dtcompra.DateValue;
          novadata := dataatual + 30;
          table['DTASEGURO'] := (DateToStr(novadata));

          //      table1.last; //ultimo reg
            //    table.Edit;
              //  table['DTASEGURO'] := table1['DTASEGURO'];
             //   showmessage('1/2');
        end
        else
        begin
          if dbedit19.Text = '6' then
          begin
            table1.close;
            table1.Filtered := false;
            table1.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(dbEdit16.Text) +
              'and CODITEM= ' + QuotedStr(dbEdit10.Text) +
              'and SEGVENCPADRAOCOD= '
              + '1' + 'and TIPOLCTOCOD= ' + '6';
            table1.IndexFieldNames := 'DTASEGURO';
            table1.Filtered := True;
            table1.Open;

            if table1.RecordCount <> 0 then
            begin
              //            table1.last;
              table.Edit;
              label9.Visible := true;
              DBEdit20.Visible := true;
              dataatual := table1['DTASEGURO'];
              novadata := dataatual + 30;
              table['DTASEGURO'] := (DateToStr(novadata));
              //          table1.close;
              //          table1.Filtered :=false;
                     //     showmessage('2/2');
            end
            else
            begin
              if table1.RecordCount = 0 then
              begin
                label9.Visible := true;
                DBEdit20.Visible := true;
                table1.close;
                table1.Filtered := false;
                table1.Filter := 'REGISTRADOPARACOD = ' +
                  QuotedStr(dbEdit16.Text) + 'and CODITEM= ' +
                  QuotedStr(dbEdit10.Text) + 'and SEGVENCPADRAOCOD= ' + '1';
                table1.IndexFieldNames := 'DTASEGURO';
                table1.Filtered := True;
                table1.Open;
                //            table1.First;

                //            table1.last;
                table.Edit;

                Dbedit20.Text := table1['CODLCTO'];

                dataatual := table1['DTASEGURO'];
                novadata := dataatual + 30;
                table['DTASEGURO'] := (DateToStr(novadata));
                //          table1.close;
                //          table1.Filtered :=false;
                       //     showmessage('3/2 ');
              end;
            end;
          end;
        end;
        //        end;
      end
      else
      begin

        if table1.RecordCount = 0 then
        begin
          table.Edit;
          dataatual := dtcompra.DateValue;
          novadata := dataatual + 30;
          table['DTASEGURO'] := (DateToStr(novadata));
          //  table1.close;
          //  table1.Filtered :=false;
            //  showmessage('4/2 ');
        end;
      end;
    end;
    //  dataatual := dtcompra.DateValue;
    //  novadata := dataatual + 30;
    //  table['DTASEGURO'] := (DateToStr(novadata));
    //  label6.Caption := 'Data sugerida';
    //  showmessage('5 ');
    //end;
    if dbedit16.Text = '' then
    begin
    end
  end;
end;

procedure TfrmLctoDoacao.DBComboBox5Change(Sender: TObject);
begin
  if dbcombobox5.ItemIndex = 0 then
  begin
    dbedit13.Text := '0';
    //dbcombobox6.Enabled := true;
    dtseguro.Enabled := true;
  end
  else
  begin
    if dbcombobox5.ItemIndex = 1 then
    begin
      dbedit13.Text := '1';
      dbcombobox6.ItemIndex := -1;
      dtseguro.Clear;
      dbedit15.Clear;
      //dbcombobox6.Enabled := false;
      dtseguro.Enabled := false;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBComboBox6Change(Sender: TObject);
var
  dataatual, novadata: TDateTime;
begin
  if dbcombobox6.ItemIndex = 0 then
  begin
    dbedit15.Text := '0';
  end
  else
  begin
    if dbcombobox6.ItemIndex = 1 then
    begin
      dbedit15.Text := '1';
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn12Click(Sender: TObject);
begin
  self.Tag := 2;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit16Change(Sender: TObject);
begin
  EDIT5.Text := DBEDIT16.Text;
end;

procedure TfrmLctoDoacao.DBEdit12Change(Sender: TObject);
begin
  EDIT1.Text := DBEDIT12.Text;
end;

procedure TfrmLctoDoacao.BitBtn10Click(Sender: TObject);
begin
  self.Tag := 1;
  DM.TSUBPRODUTOS.Open;
  if DM.TSUBPRODUTOS.RecordCount = 0 then
  begin
    DM.TSUBPRODUTOS.Close;
    Application.MessageBox('Não hà banco cadastrado!', 'Informação', mb_Ok +
      mb_IconInformation);
  end
  else
  begin
    try
      DM.TSUBPRODUTOS.Close;
      Application.CreateForm(TfrmLctoDoacaoBanco, frmLctoDoacaoBanco);
      frmLctoDoacaoBanco.ShowModal;
    finally
      frmLctoDoacaoBanco.Free;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit15Change(Sender: TObject);
var
  //transf para o evento onenter do campo dtseguro
  dataatual, novadata: TDateTime;
begin
  if dbedit15.Text = '0' then
  begin
    table1.close;
    table1.Filtered := false;
    table1.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(dbEdit16.Text) +
      'and SEGVENCPADRAOCOD= ' + '0';
    table1.IndexFieldNames := 'CODLCTO';
    table1.Filtered := True;
    table1.Open;
    table1.First;

    if table1.RecordCount <> 0 then
    begin
      if dbedit19.Text <> '6' then
      begin
        table.Edit;
        table['DTASEGURO'] := table1['DTASEGURO'];
        table1.close;
        table1.Filtered := false;
      end
      else
      begin
        if dbedit19.Text = '6' then
        begin
          table.Edit;
          table1.Last;
          dataatual := table1['DTASEGURO'];
          novadata := dataatual + 30;
          table['DTASEGURO'] := (DateToStr(novadata));
          //      table1.close;
          //      table1.Filtered :=false;
        end;
      end;
    end;

    if table1.RecordCount = 0 then
    begin
      table.Edit;
      dataatual := dtcompra.DateValue;
      novadata := dataatual + 30;
      table['DTASEGURO'] := (DateToStr(novadata));
      label6.Caption := 'Data sugerida';
      table1.close;
      table1.Filtered := false;
    end;

  end
  else
  begin
    if dbedit15.Text = '1' then
    begin
      dataatual := dtcompra.DateValue;
      novadata := dataatual + 30;
      table['DTASEGURO'] := (DateToStr(novadata));
    end;
  end;

end;

procedure TfrmLctoDoacao.BitBtn19Click(Sender: TObject);
begin
  self.Tag := 3;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn13Click(Sender: TObject);
begin
  if bitbtn15.Tag = 1 then
  begin
    bitbtn14.Enabled := true;

    TABLE.close;
    TABLE.Filtered := false;
    TABLE.Filter := 'STATUSCOD = ' + '0';
    TABLE.IndexFieldNames := ('CODLCTO');
    TABLE.Filtered := True;
    TABLE.Open;

    //table.Filtered :=false;
    //table.Refresh;
    //TABLE.IndexFieldNames := ('CODLCTO');
    TABLE.Last;
    TABLE.First;
    //table.Refresh;
    g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
    edit2.Clear;
    edit6.Clear;
    bitbtn15.Tag := 0;
    label5.Visible := false;
    valtotal.Visible := false;

    label10.Visible := false;
    label11.Visible := false;
    label11.Caption := 'id';
    edit12.Clear;
  end
  else
  begin
    if bitbtn15.Tag = 0 then
    begin
      bitbtn14.Enabled := true;
      //showmessage('teste');
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn15Click(Sender: TObject);
var
  total: Real;
begin
  bitbtn15.Tag := 1;
  if edit2.Text = '' then
  begin
    Application.MessageBox('Selecione um player para pesquisa!', 'Pesquisa',
      mb_Ok + mb_IconExclamation);
    bitbtn19.SetFocus;
  end
  else
  begin
    if edit2.Text <> '' then
    begin
      if Combobox1.ItemIndex = 0 then
      begin
        bitbtn14.Enabled := false;
        table.close;
        table.Filtered := false;
        table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text);
        TABLE.IndexFieldNames := ('DTASEGURO');
        table.Filtered := True;
        table.Open;

        total := 0;
        table.Last;
        table.First;
        g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
        if not table.Eof then
          repeat
            total := TABLE['VALPAGO'] + total;
            table.Next;
          until table.Eof;
      end;
      valtotal.Caption := FormatCurr('#0.00', total);
      label5.Visible := true;
      valtotal.Visible := true;
      table.First;
    end;

    //consulta e mostra idsteam
    with queryplayer do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select CODLCTO, STATUSCOD, STATUSNOME, IDSTEAM from PLAYER');
      SQL.add('where CODLCTO = :codigo');
      ParamByName('codigo').Text := edit2.Text;
      Open;

      if queryplayer['IDSTEAM'] <> '<null>' then
        try
          begin
            label10.Visible := true;
            label11.Visible := true;
            label11.Caption := queryplayer['IDSTEAM'];
          end;

          if queryplayer['IDSTEAM'] = '<null>' then
        except
          begin
            label10.Visible := true;
            label11.Visible := true;
            label11.Caption := 'Não cadastrado!';
          end;
        end;

      if Combobox1.ItemIndex = 1 then
      begin
        bitbtn14.Enabled := false;
        table.close;
        table.Filtered := false;
        table.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(Edit2.Text);
        table.IndexFieldNames := 'REGISTRADOPARA';
        table.Filtered := True;
        table.Open;
        table.last;
        table.First;
        g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
      end;

      if Combobox1.ItemIndex = 2 then //MOSTRA ITEM ATIVO
      begin
        bitbtn14.Enabled := false;
        table.close;
        table.Filtered := false;
        table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text) +
          'AND ITEM_INATIVO = ' + '0';
        TABLE.IndexFieldNames := ('DTASEGURO');
        table.Filtered := True;
        table.Open;

        total := 0;
        table.Last;
        table.First;
        g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
        if not table.Eof then
          repeat
            total := TABLE['VALPAGO'] + total;
            table.Next;
          until table.Eof;
      end;
      valtotal.Caption := FormatCurr('#0.00', total);
      label5.Visible := true;
      valtotal.Visible := true;
      table.First;
    end;

    if Combobox1.ItemIndex = 3 then //MOSTRA ITEM INATIVO
    begin
      bitbtn14.Enabled := false;
      table.close;
      table.Filtered := false;
      table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text) +
        'AND ITEM_INATIVO = ' + '1';
      TABLE.IndexFieldNames := ('DTASEGURO');
      table.Filtered := True;
      table.Open;

      total := 0;
      table.Last;
      table.First;
      g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
      if not table.Eof then
        repeat
          total := TABLE['VALPAGO'] + total;
          table.Next;
        until table.Eof;
    end;
    valtotal.Caption := FormatCurr('#0.00', total);
    label5.Visible := true;
    valtotal.Visible := true;
    table.First;
  end;
end;

procedure TfrmLctoDoacao.DBEdit10Change(Sender: TObject);
begin
  EDIT3.Text := DBEDIT10.Text;
end;

procedure TfrmLctoDoacao.DBEdit18Change(Sender: TObject);
begin
  EDIT4.Text := DBEDIT18.Text;
end;

procedure TfrmLctoDoacao.BitBtn5Click(Sender: TObject);
var
  total: Real;
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.StatusBar1.Panels[1].Text <> ' Usuário: admin' then
    begin
      Application.MessageBox('É preciso estar logado como "admin" para executar esta ação!', 'Informação', mb_Ok + mb_IconInformation);
    end
    else
    begin
      TABLE.Open;
      if TABLE.RecordCount = 0 then
      begin
        TABLE.Close;
        Application.MessageBox('Não hà registro para ser excluído!', 'Exclusão',
          mb_Ok + mb_IconInformation);
      end
      else
      begin
        TABLE.Open;
        if TABLE.RecordCount <> 0 then
        begin
          if checkbox2.Checked = false then
          begin
            if
              Application.MessageBox('Confirma exclusão do registro selecionado?',
              'Confirmação',
              mb_YesNo + mb_ICONQUESTION) = idYes then
            begin
              TABLE.Delete;
              g.Caption := 'Item cadastrado.: ' +
                intTostr(DM.T_VENDEDOR.RecordCount);

              if valtotal.Visible = true then
              begin
                total := 0;
                table.Last;
                table.First;
                if not table.Eof then
                  repeat
                    total := TABLE['VALPAGO'] + total;
                    table.Next;
                  until table.Eof;
              end;
              valtotal.Caption := FormatCurr('#0.00', total);
              //label5.Visible := true;
              //valtotal.Visible := true;
              table.First;

            end;
          end
          else
          begin
            if checkbox2.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os registros serão excluídos. Continua?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                TABLE.Last;
                TABLE.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := TABLE.RecordCount;
                while not TABLE.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  TABLE.Delete;
                  g.Caption := 'Item cadastrado.: ' +
                    intTostr(TABLE.RecordCount);
                end;
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBComboBox7Change(Sender: TObject);
begin
  if dbcombobox7.Text <> '' then
  begin
    tlancamento.Locate('NOME', dbcombobox7.text, [lopartialkey,
        locaseinsensitive]);
    dbedit19.Text := tlancamento['CODLCTO'];
  end
  else
  begin
    if dbcombobox7.Text = '' then
    begin
      dbedit19.Clear;
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn14Click(Sender: TObject);
var
  total: Real;
begin
  total := 0;
  table.Last;
  table.First;
  g.Caption := 'Lançamento(s).: ' + intTostr(TABLE.RecordCount);
  gauge1.Visible := true;
  gauge1.MaxValue := 0;
  Gauge1.MaxValue := TABLE.RecordCount;
  if not table.Eof then
  begin
    repeat
      Gauge1.Progress := Gauge1.Progress + 1;
      total := TABLE['VALPAGO'] + total;
      table.Next;
    until table.Eof;
  end;
  valtotal.Caption := FormatCurr('#0,000.00', total);
  label5.Visible := true;
  valtotal.Visible := true;
  table.First;
  gauge1.Visible := false;
  gauge1.MaxValue := 0;
end;

procedure TfrmLctoDoacao.TabSheet1Show(Sender: TObject);
begin
  label5.Visible := false;
  valtotal.Visible := false;
end;

procedure TfrmLctoDoacao.DBComboBox7Exit(Sender: TObject);
begin
  if dbedit19.Text = '6' then
  begin
    dbcombobox5.Enabled := false;
  end
  else
  begin
    if dbedit19.Text <> '6' then
    begin
      dbcombobox5.Enabled := true;
    end;
  end;
end;

procedure TfrmLctoDoacao.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacao.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacao.BitBtn15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacao.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacao.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.dtseguroExit(Sender: TObject);
begin
  //label8.Visible := false;
  //dbgrid2.Visible := false;
end;

procedure TfrmLctoDoacao.DBEdit20KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoDoacao.DBGrid2CellClick(Column: TColumn);
var
  dataatual, novadata: TDateTime;
begin
  table.Edit;

  Dbedit20.Text := table1['CODLCTO'];

  dataatual := table1['DTASEGURO'];
  novadata := dataatual + 30;
  table['DTASEGURO'] := (DateToStr(novadata));

end;

procedure TfrmLctoDoacao.DBGrid2ColEnter(Sender: TObject);
begin
  table.Edit;
  Dbedit20.Text := table1['CODLCTO'];
end;

procedure TfrmLctoDoacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmprincipal.Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
    SQL.Add('FROM DONATE');
    frmprincipal.q1.sql.add('where STATUSCOD = :codigo');
    SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
    SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
    // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
    SQL.ADD('ORDER BY DTASEGURO DESC');
    ParamByName('Hoje').AsDate := Date;
    ParamByName('codigo').Text := '0';
    Open;
    frmprincipal.q1.First;
    frmprincipal.q1.Last;
  end;

  if frmprincipal.Q1.RecordCount <> 0 then
  begin
    frmprincipal.label9.Caption := 'Há ' + intTostr(frmprincipal.Q1.RecordCount)
      + ' seguro(s) vencido(s). Clique aqui para visualizar';
  end
  else
  begin
    if frmprincipal.Q1.RecordCount = 0 then
    begin
      frmprincipal.label9.Caption := 'Há ' +
        intTostr(frmprincipal.Q1.RecordCount) +
        ' seguro(s) vencido(s). Clique aqui para visualizar';
    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit8Exit(Sender: TObject);
begin
  //if dbedit8.Text <> '' then
    //  begin
      //edit7.Text := dbedit8.Text ;
      //edit8.Text := edit5.Text ;
  //    end
    //  else
      //begin
  //if dbedit8.Text = '' then
    //  begin

      //end;
  //end;
end;

procedure TfrmLctoDoacao.DBEdit9Exit(Sender: TObject);
begin
  if dbedit9.Text <> '' then
  begin
    edit9.Text := dbedit9.Text;
  end
  else
  begin
    if dbedit9.Text = '' then
    begin

    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit9Enter(Sender: TObject);
begin
  if Edit5.Text = Edit8.Text then
  begin
    if edit9.Text <> '' then
    begin
      TABLE['TICKET'] := Edit9.text;
    end
    else
    begin
      if edit9.Text = '' then
      begin

      end;
    end;

    if Edit5.Text <> Edit8.Text then
    begin
      Edit9.Clear;
    end;
  end;
end;

procedure TfrmLctoDoacao.DBEdit8Enter(Sender: TObject);
begin
  if dbedit8.Text = '' then
  begin
    with qdonate do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DONATE');
      SQL.add('where REGISTRADOPARACOD = :codigo');
      ParamByName('codigo').Text := edit5.Text;
      Open;
      qdonate.Last;
      table.Edit;
      TABLE['NOMEPAGADOR'] := qdonate['NOMEPAGADOR'];
    end
  end
  else
  begin
    if dbedit8.Text <> '' then
    begin
      //    showmessage('ja preenchido');
    end;
  end;
end;

procedure TfrmLctoDoacao.BitBtn16Click(Sender: TObject);
begin
  try
    frmPrincipal.EvKeyNavigator1.Active := true;
    Application.CreateForm(TfrmConlog1, frmConlog1);
    frmConlog1.ShowModal;
  finally
    frmConlog1.Free;
  end;
end;

procedure TfrmLctoDoacao.Label11Click(Sender: TObject);
begin
  edit12.Text := label11.Caption;
  edit12.SelectAll;
  edit12.CopyToClipboard;
  label11.Hint := 'Copiado!';
end;

procedure TfrmLctoDoacao.BitBtn17Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma baixa do item selecionado?',
    'Confirmação',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    TABLE.Edit;
    TABLE['ITEM_INATIVO'] := '1';
    TABLE.Post;
  end;
end;

procedure TfrmLctoDoacao.DBEdit24Change(Sender: TObject);
begin
  label13.Caption := dbedit24.Text;
end;

end.

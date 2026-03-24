unit uFrmConPlayerInativo;

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
  TfrmConPlayerInativo = class(TForm)
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
    DataSource1: TDataSource;
    table1: TIBTable;
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
    Q1: TIBQuery;
    DS1: TDataSource;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Edit4: TEdit;
    table1CODLCTO: TIntegerField;
    table1NOMEDISCORD: TIBStringField;
    table1NOMEJOGO: TIBStringField;
    table1IDDISCORD: TIBStringField;
    table1IDSTEAM: TIBStringField;
    table1LINKSTEAM: TIBStringField;
    table1IDBATTLEYE: TIBStringField;
    table1IDBOEMIA: TIBStringField;
    table1CODBAN: TIBStringField;
    table1BANDESCRICAO: TIBStringField;
    table1BANOBS: TIBStringField;
    table1DTANASCIMENTO: TDateTimeField;
    table1DTACADASTRO: TDateTimeField;
    table1CONTATOFONE: TIBStringField;
    table1CONTATOEMAIL: TIBStringField;
    table1CONTATORESPONSAVEL: TIBStringField;
    table1OBSDIVERSA: TIBStringField;
    table1LOCALBASE: TIBStringField;
    table1TERRITORIO: TIBStringField;
    table1JOGASOLO: TIBStringField;
    table1INTEGRANTES: TIBStringField;
    table1SEGUROTIPOCOD: TIBStringField;
    table1SEGUROTIPONOME: TIBStringField;
    table1STATUSNOME: TIBStringField;
    table1STATUSCOD: TIBStringField;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
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
    procedure BitBtn10Click(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
    procedure detClick(Sender: TObject);
    procedure BitBtn15KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit4Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConPlayerInativo: TfrmConPlayerInativo;

implementation

uses
  uFrmLctoDoacaoBanco,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmConPlayerInativo.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmConPlayerInativo.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmConPlayerInativo.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmConPlayerInativo.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmConPlayerInativo.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConPlayerInativo.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConPlayerInativo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConPlayerInativo.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConPlayerInativo.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConPlayerInativo.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Doação';

end;

procedure TfrmConPlayerInativo.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmConPlayerInativo.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConPlayerInativo.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmConPlayerInativo.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmConPlayerInativo.FormDestroy(Sender: TObject);
begin
  self.Tag := 0;
  TABLE.Close;
end;

procedure TfrmConPlayerInativo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmConPlayerInativo.BitBtn10Click(Sender: TObject);
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

procedure TfrmConPlayerInativo.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConPlayerInativo.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConPlayerInativo.BitBtn15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConPlayerInativo.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConPlayerInativo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConPlayerInativo.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConPlayerInativo.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConPlayerInativo.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConPlayerInativo.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConPlayerInativo.FormShow(Sender: TObject);
begin
  //CONSULTA E AGRUPA SEGUROS VENCIDOS
  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
    SQL.Add('FROM DONATE');
    q1.sql.add('where STATUSCOD = :codigo');
    SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO, STATUSCOD');
    SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
    // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
    SQL.ADD('ORDER BY REGISTRADOPARA ASC');
    ParamByName('Hoje').AsDate := Date;
    ParamByName('codigo').Text := '1';
    Open;
    q1.First;
    q1.Last;
    label2.Caption := 'Player(s) inativo(s).: ' + intTostr(Q1.RecordCount);
  end;

  edit4.SetFocus;
end;

procedure TfrmConPlayerInativo.detClick(Sender: TObject);
var
  seguro: Real;
  seguro1: string;
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.alterar.Caption <> 'False' then
    begin
      //TABLE DONATE
      table.close;
      table.Filtered := false;
      table.Filter := 'REGISTRADOPARACOD = ' +
        QuotedStr(q1.FIELDBYNAME('REGISTRADOPARACOD').ASSTRING);
      table.Filtered := True;
      table.Open;

      //TABLE PLAYER
      table1.close;
      table1.Filtered := false;
      table1.Filter := 'CODLCTO = ' +
        QuotedStr(q1.FIELDBYNAME('REGISTRADOPARACOD').ASSTRING);
      table1.Filtered := True;
      table1.Open;

      if
        Application.MessageBox('Ao prosseguir o player selecionado será ativado e ocultado da consulta. Continua?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        //ATIVA TODOS OS LANCAMENTOS DA TABLE DONATE PARA O PLAYER SELECINADO
        seguro := 0;
        seguro1 := string('ATIVO');
        table.First;
        TABLE.Edit;
        TABLE['STATUSCOD'] := '0';
        TABLE['STATUSNOME'] := 'ATIVO';
        if not table.Eof then
        begin
          repeat
            table.Next;
            table.Edit;
            TABLE['STATUSCOD'] := seguro;
            TABLE['STATUSNOME'] := seguro1;
          until table.Eof;
        end;

        //INATIVA O PLAYER DA TABELA PLAYER
        TABLE1.Edit;
        TABLE1['STATUSCOD'] := '0';
        TABLE1['STATUSNOME'] := 'ATIVO';

        //FILTRA NOVAMENTE A CONSULTA
        with Q1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
          SQL.Add('FROM DONATE');
          q1.sql.add('where STATUSCOD = :codigo');
          SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO, STATUSCOD');
          SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
          // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
          SQL.ADD('ORDER BY DTASEGURO ASC');
          ParamByName('Hoje').AsDate := Date;
          ParamByName('codigo').Text := '1';
          Open;
          q1.First;
          q1.Last;
          label2.Caption := 'Player(s) inativo(s).: ' +
            intTostr(Q1.RecordCount);
          //      frmprincipal.label9.Caption := 'Há ' + intTostr(Q1.RecordCount)+ ' seguro(s) vencido(s). Clique aqui para visualizar';
        end;

        table.Post;
        table1.Post;
      end;
    end;
  end;
end;

procedure TfrmConPlayerInativo.BitBtn15KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmConPlayerInativo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  lLinha: integer;
begin
  //CONDICAO PARA MUDAR A COR DOS REGISTROS COM DATA MAIOR Q DATA ATUAL. NAO UTILIZADO
//  if Q1.FieldByName('DTASEGURO').AsDateTime > Date()then
  //begin
    //dbgrid1.Canvas.Font.Style := [fsbold];
//    dbgrid1.Canvas.Brush.Color := $0080FF00;
  //  dbgrid1.DefaultDrawColumnCell(rect, datacol, column, state);
    //end
//    else
  //begin
//  end;

end;

procedure TfrmConPlayerInativo.Edit4Change(Sender: TObject);
begin
  if edit4.Text <> '' then
  begin
    Q1.Locate('REGISTRADOPARACOD', Edit4.text, [lopartialkey,
        locaseinsensitive]);
    Q1.Locate('REGISTRADOPARA', Edit4.text, [lopartialkey, locaseinsensitive]);
  end
  else
  begin
    if edit4.Text = '' then
    begin
      Q1.First;
    end;
  end;
end;

procedure TfrmConPlayerInativo.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO, MAX(DTASEGURO) as DTASEGURO');
    SQL.Add('FROM DONATE');
    SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, NOMECOMPJOGO');
    SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
    // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
    SQL.ADD('ORDER BY ' + Column.FieldName);
    Column.Title.Font.Style := [fsBold];
    ParamByName('Hoje').AsDate := Date;
    Open;
    q1.First;
    q1.Last;
    q1.First;
    label2.Caption := 'Seguro(s) vencido(s).: ' + intTostr(Q1.RecordCount);
  end;
end;

end.

unit uFrmConSeguro1;

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
  RXDBCtrl,
  EDBNav;

type
  TfrmConSeguro1 = class(TForm)
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
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DataSource2: TDataSource;
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
    DBEdit5: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    T1STATUSNOME: TIBStringField;
    T1STATUSCOD: TIBStringField;
    Edit1: TEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit6: TDBEdit;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConSeguro1: TfrmConSeguro1;

implementation

uses
  uFrmLctoDoacao,
  uFrmLctoDoacaoBanco,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmConSeguro1.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro1.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro1.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro1.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro1.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro1.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro1.BitBtn3Click(Sender: TObject);
begin
  t1.Filtered := false;
  t1.Close;
  Close;
end;

procedure TfrmConSeguro1.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro1.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro1.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Doação';

end;

procedure TfrmConSeguro1.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmConSeguro1.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro1.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmConSeguro1.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmConSeguro1.FormDestroy(Sender: TObject);
begin
  self.Tag := 0;
  TABLE.Close;
end;

procedure TfrmConSeguro1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmConSeguro1.BitBtn10Click(Sender: TObject);
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

procedure TfrmConSeguro1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro1.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro1.BitBtn15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro1.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro1.FormShow(Sender: TObject);
begin
  bitbtn1.Tag := 1;
  //CONSULTA E AGRUPA SEGUROS VENCIDOS
  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
    SQL.Add('FROM DONATE');
    q1.sql.add('where STATUSCOD = :codigo');
    SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
    SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
    // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
    SQL.ADD('ORDER BY DTASEGURO DESC');
    ParamByName('Hoje').AsDate := Date;
    ParamByName('codigo').Text := '0';
    Open;
    q1.First;
    q1.Last;
    label2.Caption := 'Seguro(s) vencido(s).: ' + intTostr(Q1.RecordCount);
  end;
  edit4.SetFocus;
end;

procedure TfrmConSeguro1.detClick(Sender: TObject);
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
        Application.MessageBox('Ao prosseguir o player selecionado será inativado e ocultado da consulta. Continua?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        //INATIVA TODOS OS LANCAMENTOS DA TABLE DONATE PARA O PLAYER SELECINADO
        seguro := 1;
        seguro1 := string('INATIVO');
        table.First;
        TABLE.Edit;
        TABLE['STATUSCOD'] := '1';
        TABLE['STATUSNOME'] := 'INATIVO';
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
        TABLE1['STATUSCOD'] := '1';
        TABLE1['STATUSNOME'] := 'INATIVO';

        //FILTRA NOVAMENTE A CONSULTA
        with Q1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
          SQL.Add('FROM DONATE');
          q1.sql.add('where STATUSCOD = :codigo');
          SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
          SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
          // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
          SQL.ADD('ORDER BY DTASEGURO DESC');
          ParamByName('Hoje').AsDate := Date;
          ParamByName('codigo').Text := '0';
          Open;
          q1.First;
          q1.Last;
          label2.Caption := 'Seguro(s) vencido(s).: ' +
            intTostr(Q1.RecordCount);
          frmprincipal.label9.Caption := 'Há ' + intTostr(Q1.RecordCount) +
            ' seguro(s) vencido(s). Clique aqui para visualizar';
        end;

        table.Post;
        table1.Post;
      end;
    end;
  end;
end;

procedure TfrmConSeguro1.BitBtn15KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmConSeguro1.DBGrid1DrawColumnCell(Sender: TObject;
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

//edit1.Text := Q1['REGISTRADOPARACOD'];

end;

procedure TfrmConSeguro1.Edit4Change(Sender: TObject);
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

procedure TfrmConSeguro1.DBGrid1TitleClick(Column: TColumn);
begin
  if bitbtn1.Tag = 0 then
  begin
    //FILTRA NOVAMENTE A CONSULTA
    with Q1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
      SQL.Add('FROM DONATE');
      q1.sql.add('where STATUSCOD = :codigo');
      SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
      SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
      // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
      SQL.ADD('ORDER BY ' + Column.FieldName);
      ParamByName('Hoje').AsDate := Date;
      ParamByName('codigo').Text := '1';
      Open;
      q1.First;
      q1.Last;
      label2.Caption := 'Seguro(s) vencido(s).: ' + intTostr(Q1.RecordCount);
    end;
  end
  else
  begin

    if bitbtn1.Tag = 1 then
    begin
      //FILTRA NOVAMENTE A CONSULTA
      with Q1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
        SQL.Add('FROM DONATE');
        q1.sql.add('where STATUSCOD = :codigo');
        SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
        SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
        // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
        SQL.ADD('ORDER BY ' + Column.FieldName);
        ParamByName('Hoje').AsDate := Date;
        ParamByName('codigo').Text := '0';
        Open;
        q1.First;
        q1.Last;
        label2.Caption := 'Seguro(s) vencido(s).: ' + intTostr(Q1.RecordCount);
      end;
    end;
  end;
end;

procedure TfrmConSeguro1.BitBtn1Click(Sender: TObject);
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

      if bitbtn1.Tag = 1 then
      begin
        //FILTRA NOVAMENTE A CONSULTA
        with Q1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
          SQL.Add('FROM DONATE');
          q1.sql.add('where STATUSCOD = :codigo');
          SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
          SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
          // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
          SQL.ADD('ORDER BY DTASEGURO DESC');
          ParamByName('Hoje').AsDate := Date;
          ParamByName('codigo').Text := '1';
          Open;
          q1.First;
          q1.Last;
          label2.Caption := 'Seguro(s) vencido(s).: ' +
            intTostr(Q1.RecordCount);
          bitbtn1.Tag := 0;
          bitbtn1.Caption := 'Mostrar Ativos';
          det.Enabled := false;
          bitbtn2.Enabled := false;
          label4.Caption := 'Inativos';
          label4.Font.Color := clRed;
        end;
      end
      else
      begin

        if bitbtn1.Tag = 0 then
        begin
          //FILTRA NOVAMENTE A CONSULTA
          with Q1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
            SQL.Add('FROM DONATE');
            q1.sql.add('where STATUSCOD = :codigo');
            SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
            SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
            // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
            SQL.ADD('ORDER BY DTASEGURO DESC');
            ParamByName('Hoje').AsDate := Date;
            ParamByName('codigo').Text := '0';
            Open;
            q1.First;
            q1.Last;
            label2.Caption := 'Seguro(s) vencido(s).: ' +
              intTostr(Q1.RecordCount);
            bitbtn1.Tag := 1;
            bitbtn1.Caption := 'Mostrar Inativos';
            det.Enabled := true;
            bitbtn2.Enabled := true;
            label4.Caption := 'Ativos';
            label4.Font.Color := clBlue;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmConSeguro1.DBEdit5Change(Sender: TObject);
begin
  t1.Filtered := false;
  t1.Filter := 'CODLCTO = ' +
    QuotedStr(q1.FIELDBYNAME('REGISTRADOPARACOD').ASSTRING);
  t1.Filtered := True;
  t1.Open;
  label5.Caption := T1['NOMEJOGO'];
end;

procedure TfrmConSeguro1.Label11Click(Sender: TObject);
begin
  edit1.Text := label11.Caption;
  edit1.SelectAll;
  edit1.CopyToClipboard;
  label11.Hint := 'Copiado!';
end;

procedure TfrmConSeguro1.BitBtn2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmLctoDoacao, frmLctoDoacao);
    frmLctoDoacao.ShowModal;
  finally
    frmLctoDoacao.Free;

    //frmconslog1
    t1.Filtered := false;
    t1.Close;
    Close;
  end;
end;

procedure TfrmConSeguro1.BitBtn4Click(Sender: TObject);
begin
  DBMemo1.Enabled := true;
  T1.Edit;
  dbmemo1.SetFocus;
  bitbtn4.Enabled := false;
end;

procedure TfrmConSeguro1.DBMemo1Exit(Sender: TObject);
begin
  t1.Post;
  dbmemo1.Enabled := false;
  bitbtn4.Enabled := true;
  bitbtn3.SetFocus;
end;

procedure TfrmConSeguro1.DBEdit6Change(Sender: TObject);
begin
  if dbedit6.Text <> '' then
  begin
    label10.Visible := true;
    label11.Visible := true;
    label11.Caption := dbedit6.Text;
  end;

  if dbedit6.text = '' then
  begin
    label10.Visible := true;
    label11.Visible := true;
    label11.Caption := 'Não cadastrado!';
  end;

end;

end.

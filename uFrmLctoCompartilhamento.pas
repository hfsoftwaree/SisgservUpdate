unit uFrmLctoCompartilhamento;

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
  ImgList,
  ComCtrls,
  ToolWin,
  XP_MenuBar,
  StdCtrls,
  DBCtrls,
  Mask,
  EDBZero,
  ExtCtrls,
  Buttons,
  Grids,
  DBGrids,
  DB,
  IBCustomDataSet,
  IBTable,
  EChkCPF,
  EChkCNPJ,
  EDBNum,
  Gauges,
  ShellAPI,
  Registry,
  IBQuery,
  RxLookup,
  AleDbPickList,
  EDBDate;

type
  TfrmLctoCompartilhamento = class(TForm)
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel17: TPanel;
    ImageList1: TImageList;
    Panel4: TPanel;
    DBMemo1: TDBMemo;
    g: TLabel;
    Panel5: TPanel;
    CheckBox2: TCheckBox;
    Gauge1: TGauge;
    BitBtn5: TBitBtn;
    Panel6: TPanel;
    Panel9: TPanel;
    DataSource1: TDataSource;
    Table1: TIBTable;
    Panel18: TPanel;
    BitBtn15: TBitBtn;
    Edit2: TEdit;
    Table1CODLCTO: TIntegerField;
    Table1COMPRADORCOD: TIBStringField;
    Table1COMPRADORNOME: TIBStringField;
    Table1COMPARTILHADOCOD: TIBStringField;
    Table1COMPARTILHADONOME: TIBStringField;
    Table1IDLOG: TIBStringField;
    Table1OBS: TIBStringField;
    Edit3: TEdit;
    BitBtn9: TBitBtn;
    DBEdit11: TDBEdit;
    Edit4: TEdit;
    BitBtn8: TBitBtn;
    DBEdit7: TDBEdit;
    Edit5: TEdit;
    BitBtn12: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit21: TDBEdit;
    Table1ITEMCOD: TIBStringField;
    Table1ITEMNOME: TIBStringField;
    Queryplayer: TIBQuery;
    dsplayer: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    P: TLabel;
    C: TLabel;
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
    DBEdit8: TDBEdit;
    DataSource3: TDataSource;
    T2: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    DBEdit9: TDBEdit;
    Panel7: TPanel;
    dtcompra: TEvDBDateEdit;
    Table1DATA: TDateTimeField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoCompartilhamento: TfrmLctoCompartilhamento;

implementation

uses
  uFrmCadItem,
  uFrmLctoDoacaoPlayer,
  uDM,
  uFrmPrincipal,
  uFrmConSeguroItem,
  uFrmLctoCompartilhamentoItem;

{$R *.dfm}

class function ListaItemTipo: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with DM.TTIPOCONTATO do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('NOMECONTATO').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

class function ListaItemTipo1: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with frmCadItem.Table1 do
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

class function ListaItemTipo2: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with frmCadItem.Table1 do
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

procedure TfrmLctoCompartilhamento.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    BitBtn1.Enabled := true;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    Table1.Append;
    table1['DATA'] := DateToStr(Now);
    EDIT4.SetFocus;
  end;
end;

procedure TfrmLctoCompartilhamento.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBEdit11.Text = '' then
    begin
      Application.MessageBox('Item deve ser informado!', 'Cadastro', mb_Ok +
        mb_IconInformation);
      Edit3.SetFocus;
    end
    else
    begin
      if DBEdit7.Text = '' then
      begin
        Application.MessageBox('Proprietário do item deve ser informado!',
          'Cadastro', mb_Ok + mb_IconInformation);
        Edit4.SetFocus;
      end
      else
      begin
        if DBEdit2.Text = '' then
        begin
          Application.MessageBox('Mod vinculado deve ser informado!',
            'Cadastro', mb_Ok + mb_IconInformation);
          Edit5.SetFocus;
        end;
      end;
    end;

    if (Dbedit11.Text <> '') and (DBEdit7.Text <> '') and (DBEdit2.Text <> '')
      then
    begin
      if Application.MessageBox('Confirma a Inclusão/Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          Table1.Post;
          if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            Table1.Append;
            Edit4.SetFocus;
          end
          else
          begin
            Table1.Refresh;
            Edit4.SetFocus;
            BitBtn4.Enabled := True;
            BitBtn6.Enabled := True;
            BitBtn3.Enabled := True;
          end;
        except
          Application.MessageBox('Item já cadastrado!', 'Informação', mb_Ok +
            mb_IconExclamation);
        end;
      end;
    end;
  end;
end;

procedure TfrmLctoCompartilhamento.BitBtn2Click(Sender: TObject);
begin
  Table1.Cancel;
  BitBtn4.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
end;

procedure TfrmLctoCompartilhamento.BitBtn3Click(Sender: TObject);
begin
  table1.Cancel;
  table1.Close;
  Close;
end;

procedure TfrmLctoCompartilhamento.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
  begin
    Table1.Locate('CODLCTO', Edit1.text, [lopartialkey, locaseinsensitive]);
    Table1.Locate('ITEMNOME', Edit1.text, [lopartialkey, locaseinsensitive]);
    Table1.Locate('COMPRADORNOME', Edit1.text, [lopartialkey,
        locaseinsensitive]);
    Table1.Locate('COMPARTILHADONOME', Edit1.text, [lopartialkey,
        locaseinsensitive]);
  end
  else
  begin
    if edit1.Text = '' then
    begin
    end;
  end;
end;

procedure TfrmLctoCompartilhamento.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Lançamento de compartilhamento';
  TABLE1.Close;
  TABLE1.Open;

  with Queryplayer do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from PLAYER');
    Open;
  end;
end;

procedure TfrmLctoCompartilhamento.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  Edit3.SetFocus;
end;

procedure TfrmLctoCompartilhamento.BitBtn6Click(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa';
  PageControl1.ActivePage := TabSheet2;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  //g.Caption := 'Item cadastrado.: ' + intTostr(DM.T_VENDEDOR.RecordCount); alterado para onshow do tabsheet
end;

procedure TfrmLctoCompartilhamento.TabSheet1Show(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  //Edit1.SetFocus;
end;

procedure TfrmLctoCompartilhamento.DBEdit11Exit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmLctoCompartilhamento.TabSheet2Show(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa';
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  table1.Open;
  Table1.Last;
  Table1.First;
  g.Caption := 'Item cadastrado.: ' + intTostr(Table1.RecordCount);
end;

procedure TfrmLctoCompartilhamento.DBEdit2Exit(Sender: TObject);
begin
  BITBTN1.Click;
end;

procedure TfrmLctoCompartilhamento.FormDestroy(Sender: TObject);
begin
  //if frmpesquisavendedor <> nil then   //<> nil(nada) significa q o form esta criado
  //begin
    //if frmpesquisavendedor.Tag = 1 then
  //  begin
    //frmPrincipal.EvKeyNavigator1.Active := true;
  //  frmpesquisavendedor.edit1.SetFocus;
    //end
  //  else
    //begin
  //if frmpesquisavendedor = nil then
  //begin
  //TABLE1.Close;
end;

procedure TfrmLctoCompartilhamento.DBGrid1KeyDown(Sender: TObject; var Key:
  Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmLctoCompartilhamento.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  TABLE1.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];
end;

procedure TfrmLctoCompartilhamento.BitBtn5Click(Sender: TObject);
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
      Table1.Open;
      if Table1.RecordCount = 0 then
      begin
        Table1.Close;
        Application.MessageBox('Não hà registro para ser excluído!', 'Exclusão',
          mb_Ok + mb_IconInformation);
      end
      else
      begin
        Table1.Open;
        if Table1.RecordCount <> 0 then
        begin
          if checkbox2.Checked = false then
          begin
            if
              Application.MessageBox('Confirma exclusão do registro selecionado?',
              'Confirmação',
              mb_YesNo + mb_ICONQUESTION) = idYes then
            begin
              Table1.Delete;
              g.Caption := 'Item cadastrado.: ' + intTostr(Table1.RecordCount);
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
                Table1.Last;
                Table1.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := Table1.RecordCount;
                while not Table1.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  Table1.Delete;
                  g.Caption := 'Item cadastrado.: ' +
                    intTostr(Table1.RecordCount);
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

procedure TfrmLctoCompartilhamento.BitBtn8Click(Sender: TObject);
var
  Endereco: string;
begin
  self.Tag := 13;
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

procedure TfrmLctoCompartilhamento.DBComboBox3KeyPress(Sender: TObject; var Key:
  Char);
begin
  if (Key = #27) then // O 27 é o código ASCII do ESC
  begin
    DM.T_VENDEDOR.FieldByName('LINKMODSTEAM').asstring := '';
  end;
end;

procedure TfrmLctoCompartilhamento.DBEdit10KeyPress(Sender: TObject; var Key:
  Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoCompartilhamento.DBEdit11KeyPress(Sender: TObject; var Key:
  Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoCompartilhamento.BitBtn9Click(Sender: TObject);
begin
  self.Tag := 3;
  if DBEDIT4.Text = '' then
  begin
    Application.MessageBox('Proprietário deve ser informado, Verifíque!',
      'Informação', mb_Ok + mb_IconInformation);
    edit4.SetFocus;
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoCompartilhamentoItem,
        frmLctoCompartilhamentoItem);
      frmLctoCompartilhamentoItem.ShowModal;
    finally
      frmLctoCompartilhamentoItem.Free;
    end;
  end;
end;

procedure TfrmLctoCompartilhamento.BitBtn12Click(Sender: TObject);
begin
  self.Tag := 4;

  if DBEDIT4.Text = '' then
  begin
    Application.MessageBox('Proprietário deve ser informado, Verifíque!',
      'Informação', mb_Ok + mb_IconInformation);
    edit4.SetFocus;
  end
  else
  begin
    if DBEDIT3.Text = '' then
    begin
      Application.MessageBox('Item deve ser informado, Verifíque!',
        'Informação', mb_Ok + mb_IconInformation);
      edit3.SetFocus;
    end
  end;

  if (dbedit4.Text <> '') and (DBEDIT3.Text <> '') then
  begin
    if Queryplayer.RecordCount = 0 then
    begin
      Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item',
        mb_Ok + mb_IconExclamation);
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
end;

procedure TfrmLctoCompartilhamento.Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoCompartilhamento.Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoCompartilhamento.Edit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmLctoCompartilhamento.DBEdit3Change(Sender: TObject);
begin
  edit3.Text := DBEDIT3.Text;
end;

procedure TfrmLctoCompartilhamento.DBEdit4Change(Sender: TObject);
begin
  edit4.Text := DBEDIT4.Text;
end;

procedure TfrmLctoCompartilhamento.DBEdit6Change(Sender: TObject);
begin
  edit5.Text := DBEDIT5.Text;
end;

procedure TfrmLctoCompartilhamento.DBEdit8Change(Sender: TObject);
begin
  if DBEdit8.Text = '' then
  begin
    t2.Filtered := False;
    t2.Close;
    C.Caption := '';
    Exit;
  end;

  t2.Close;
  t2.Filtered := False;
  t2.Filter := 'CODLCTO = ' + QuotedStr(DBEdit8.Text);
  t2.Filtered := True;
  t2.Open;

  if not t2.IsEmpty then
    C.Caption := t2.FieldByName('NOMEJOGO').AsString
  else
    C.Caption := '';

  t2.Filtered := False;
  t2.Close;
end;

procedure TfrmLctoCompartilhamento.DBEdit9Change(Sender: TObject);
begin
  if DBEdit9.Text = '' then
  begin
    t1.Filtered := false;
    t1.Close;
    P.Caption := '';
    Exit;
  end;

  t1.Close;
  t1.Filtered := False;
  t1.Filter := 'CODLCTO = ' + QuotedStr(DBEDit9.Text);
  t1.Filtered := True;
  t1.Open;

  if not t1.IsEmpty then
    P.Caption := t1.FieldByName('NOMEJOGO').AsString
  else
    P.Caption := '';

  t1.Filtered := false;
  t1.Close;
end;

end.

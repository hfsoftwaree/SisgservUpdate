unit uFrmCadItem;

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
  AleDbPickList;

type
  TfrmCadItem = class(TForm)
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBEdit2: TDBEdit;
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
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    g: TLabel;
    Panel5: TPanel;
    CheckBox2: TCheckBox;
    Gauge1: TGauge;
    BitBtn5: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    DBEdit5: TDBEdit;
    Panel8: TPanel;
    DBEdit6: TDBEdit;
    BitBtn8: TBitBtn;
    Panel9: TPanel;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    DataSource1: TDataSource;
    Table1: TIBTable;
    Table1CODLCTO: TIntegerField;
    Table1NOME: TIBStringField;
    Table1LINK: TIBStringField;
    Table1OBS: TIBStringField;
    DBComboBox3: TDBComboBox;
    Panel10: TPanel;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit9: TDBEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Panel18: TPanel;
    BitBtn15: TBitBtn;
    Edit2: TEdit;
    Panel13: TPanel;
    DBEdit12: TDBEdit;
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
    procedure DBComboBox1Change(Sender: TObject);
    procedure dbcombobox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox3Change(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItem: TfrmCadItem;

implementation

uses
  uFrmLctoDoacaoItem1,
  uDM,
  uFrmPrincipal;

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

procedure TfrmCadItem.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DM.T_VENDEDOR.Cancel;
    BitBtn1.Enabled := true;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    DM.T_VENDEDOR.Append;
    DBCombobox1.SetFocus;
  end;
end;

procedure TfrmCadItem.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBComboBox1.Text = '' then
    begin
      Application.MessageBox('Tipo de item deve ser informado!', 'Cadastro',
        mb_Ok + mb_IconInformation);
      DBComboBox1.SetFocus;
    end
    else
    begin
      if DBEdit2.Text = '' then
      begin
        Application.MessageBox('Nome popular do item deve ser informado!',
          'Cadastro', mb_Ok + mb_IconInformation);
        DBEdit2.SetFocus;
      end
      else
      begin
        if DBComboBox3.Text = '' then
        begin
          Application.MessageBox('Mod vinculado deve ser informado!',
            'Cadastro', mb_Ok + mb_IconInformation);
          DBComboBox3.SetFocus;
        end
      end;
    end;

    if (DBComboBox1.Text <> '') and (DBEdit2.Text <> '') and (DBComboBox3.Text
      <>
      '') then
    begin
      if Application.MessageBox('Confirma a Inclusão/Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          TABLE1.Locate('NOME', dbcombobox3.text, [lopartialkey,
              locaseinsensitive]);
          DBEDIT7.Text := table1['CODLCTO'];
          DM.T_VENDEDOR.Post;
          if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.T_VENDEDOR.Append;
            DBCombobox1.SetFocus;
          end
          else
          begin
            DM.T_VENDEDOR.Refresh;
            DBCombobox1.SetFocus;
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

procedure TfrmCadItem.BitBtn2Click(Sender: TObject);
begin
  DM.T_VENDEDOR.Cancel;
  BitBtn4.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
  DBCombobox1.SetFocus;
end;

procedure TfrmCadItem.BitBtn3Click(Sender: TObject);
begin
  DM.T_VENDEDOR.cancel;
  DM.TTIPOCONTATO.Cancel;
  DM.T_VENDEDOR.Filtered := false;
  TABLE1.Cancel;
  Close;
end;

procedure TfrmCadItem.Edit1Change(Sender: TObject);
begin
  DM.T_VENDEDOR.Locate('CODIGOVENDEDOR', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  DM.T_VENDEDOR.Locate('NOMEVENDEDOR', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  DM.T_VENDEDOR.Locate('NOMECLASSE', Edit1.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmCadItem.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de item';
  DM.TTIPOCONTATO.Close;
  DM.TTIPOCONTATO.Open;
  TABLE1.Close;
  TABLE1.Filtered := false;
  TABLE1.Open;
  DM.T_VENDEDOR.Close;
  DM.T_VENDEDOR.Open;
  DBComboBox1.Items := ListaItemTipo;
  DBComboBox3.Items := ListaItemTipo1;
  DM.T_VENDEDOR.First;
end;

procedure TfrmCadItem.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de item';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBCombobox1.SetFocus;
end;

procedure TfrmCadItem.BitBtn6Click(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa item';
  PageControl1.ActivePage := TabSheet2;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  //g.Caption := 'Item cadastrado.: ' + intTostr(DM.T_VENDEDOR.RecordCount); alterado para onshow do tabsheet
end;

procedure TfrmCadItem.TabSheet1Show(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de item';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBComboBox1.SetFocus;
end;

procedure TfrmCadItem.DBEdit11Exit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmCadItem.TabSheet2Show(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa item';
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  DM.T_VENDEDOR.Last;
  DM.T_VENDEDOR.First;
  g.Caption := 'Item cadastrado.: ' + intTostr(DM.T_VENDEDOR.RecordCount);
  ComboBox1.Items := ListaItemTipo2;
end;

procedure TfrmCadItem.DBEdit2Exit(Sender: TObject);
begin
  BITBTN1.Click;
end;

procedure TfrmCadItem.FormDestroy(Sender: TObject);
begin
  if frmLctoDoacaoItem1 <> nil then
    //<> nil(nada) significa q o form esta criado
  begin
    if frmLctoDoacaoItem1.Tag = 1 then
    begin
      frmPrincipal.EvKeyNavigator1.Active := true;
      frmLctoDoacaoItem1.edit1.SetFocus;
    end
    else
    begin
      if frmLctoDoacaoItem1 = nil then
      begin
        DM.T_VENDEDOR.Close;
        TABLE1.Close;
        DM.TTIPOCONTATO.Close;
      end;
    end;
  end;
end;

procedure TfrmCadItem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadItem.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  dm.T_VENDEDOR.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];
end;

procedure TfrmCadItem.BitBtn5Click(Sender: TObject);
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
      DM.T_VENDEDOR.Open;
      if DM.T_VENDEDOR.RecordCount = 0 then
      begin
        DM.T_VENDEDOR.Close;
        Application.MessageBox('Não hà registro para ser excluído!', 'Exclusão',
          mb_Ok + mb_IconInformation);
      end
      else
      begin
        DM.T_VENDEDOR.Open;
        if DM.T_VENDEDOR.RecordCount <> 0 then
        begin
          if checkbox2.Checked = false then
          begin
            if
              Application.MessageBox('Confirma exclusão do registro selecionado?',
              'Confirmação',
              mb_YesNo + mb_ICONQUESTION) = idYes then
            begin
              DM.T_VENDEDOR.Delete;
              g.Caption := 'Item cadastrado.: ' +
                intTostr(DM.T_VENDEDOR.RecordCount);
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
                DM.T_VENDEDOR.Last;
                DM.T_VENDEDOR.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.T_VENDEDOR.RecordCount;
                while not DM.T_VENDEDOR.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.T_VENDEDOR.Delete;
                  g.Caption := 'Item cadastrado.: ' +
                    intTostr(DM.T_VENDEDOR.RecordCount);
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

procedure TfrmCadItem.BitBtn8Click(Sender: TObject);
var
  Endereco: string;
begin
  if dbedit5.Text <> '' then
  begin
    dbedit5.Text := Trim(dbedit5.Text);
    if (Pos('http://', dbedit5.Text) or
      Pos('https://', dbedit5.Text)) <> 0 then
      Endereco := dbedit5.Text
    else
    begin
      Endereco := 'http://' + dbedit5.Text; // Padrão
      dbedit5.Text := 'http://' + dbedit5.Text;
    end;
    ShellExecute(Handle, 'open', PCHAR(Endereco), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    Application.MessageBox('Não há url cadastrada para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end;
end;

procedure TfrmCadItem.DBComboBox1Change(Sender: TObject);
begin
  if DBComboBox1.Text = '' then
  begin
    exit;
  end
  else
  begin
    if DbComboBox1.Text <> '0' then
    begin
      DM.TTIPOCONTATO.Locate('NOMECONTATO', dbcombobox1.text, [lopartialkey,
          locaseinsensitive]);
      dbedit8.Text := DM.TTIPOCONTATO['CODIGOCONTATO'];
    end;
  end;
end;

procedure TfrmCadItem.dbcombobox2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbedit5.Text;
end;

procedure TfrmCadItem.DBComboBox3Change(Sender: TObject);
begin
  //TABLE1.Locate('NOME',dbcombobox3.text,[lopartialkey,locaseinsensitive]);
  //DBEDIT7.Text := table1['CODLCTO']; transf para botao gravar

  if TABLE1.Locate('NOME', dbcombobox3.text, [lopartialkey, locaseinsensitive])
    then
  begin
    if table1['LINK'] = null then
    begin
      DM.T_VENDEDOR.Edit;
      DM.T_VENDEDOR.FieldByName('LINKMODSTEAM').asstring := '';
      exit;
    end
    else
    begin
      if table1['LINK'] <> '' then
      begin
        DM.T_VENDEDOR.Edit;
        DM.T_VENDEDOR.FieldByName('LINKMODSTEAM').asstring :=
          frmCadItem.table1['LINK'];
      end;
    end;
  end;
end;

procedure TfrmCadItem.DBComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then // O 27 é o código ASCII do ESC
  begin
    DM.T_VENDEDOR.FieldByName('LINKMODSTEAM').asstring := '';
  end;
end;

procedure TfrmCadItem.DBEdit9Change(Sender: TObject);
begin
  label3.Caption := dbedit9.Text;
end;

procedure TfrmCadItem.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmCadItem.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmCadItem.ComboBox1Change(Sender: TObject);
begin
  TABLE1.Locate('NOME', combobox1.text, [lopartialkey, locaseinsensitive]);
  EDIT2.Text := table1['CODLCTO'];
end;

procedure TfrmCadItem.BitBtn15Click(Sender: TObject);
begin
  if bitbtn15.Tag = 0 then
  begin
    if combobox1.Text = '' then
    begin
      Application.MessageBox('Selecione um mod para filtrar!', 'Informação',
        mb_Ok + mb_IconInformation);
      combobox1.SetFocus;
    end
    else
    begin
      if combobox1.Text <> '' then
      begin
        if bitbtn15.Tag = 0 then
        begin
          Combobox1.Enabled := false;
          bitbtn15.Caption := 'Cancelar Filtro';
          DM.T_VENDEDOR.close;
          DM.T_VENDEDOR.Filtered := false;
          DM.T_VENDEDOR.Filter := 'MODCODLCTO = ' + QuotedStr(Edit2.Text);
          DM.T_VENDEDOR.IndexFieldNames := 'NOMEVENDEDOR';
          DM.T_VENDEDOR.Filtered := True;
          DM.T_VENDEDOR.Open;
          DM.T_VENDEDOR.Last;
          g.Caption := 'Lançamento(s).: ' + intTostr(DM.T_VENDEDOR.RecordCount);
          DM.T_VENDEDOR.First;
          bitbtn15.Tag := 1;
        end
      end
    end
  end
  else
  begin
    if bitbtn15.Tag = 1 then
    begin
      Combobox1.Enabled := true;
      bitbtn15.Caption := 'Aplicar Filtro';
      DM.T_VENDEDOR.close;
      DM.T_VENDEDOR.Filtered := false;
      DM.T_VENDEDOR.Open;
      //  DM.T_VENDEDOR.Refresh;
      DM.T_VENDEDOR.Last;
      g.Caption := 'Lançamento(s).: ' + intTostr(DM.T_VENDEDOR.RecordCount);
      DM.T_VENDEDOR.First;
      bitbtn15.Tag := 0;

    end;
  end;
end;

end.

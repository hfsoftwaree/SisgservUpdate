unit uFrmCadPlayer;

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
  Gauges;

type
  TfrmCadPlayer = class(TForm)
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
    Panel1: TPanel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Panel17: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBComboBox4: TDBComboBox;
    Panel13: TPanel;
    Panel5: TPanel;
    DBEdit6: TDBEdit;
    Panel23: TPanel;
    Panel24: TPanel;
    DBComboBox1: TDBComboBox;
    Panel26: TPanel;
    Panel27: TPanel;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    bancod: TDBEdit;
    Panel28: TPanel;
    Panel30: TPanel;
    DATACADASTRAMENTO: TEvDBDateEdit;
    DS: TDataSource;
    BitBtn12: TBitBtn;
    Image1: TImage;
    DBMemo1: TDBMemo;
    Panel31: TPanel;
    DBComboBox2: TDBComboBox;
    DBMemo2: TDBMemo;
    TABLE: TIBTable;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    EvDBDateEdit1: TEvDBDateEdit;
    DBEdit9: TDBEdit;
    box: TComboBox;
    bannome: TDBEdit;
    Label1: TLabel;
    g: TLabel;
    Gauge1: TGauge;
    CheckBox2: TCheckBox;
    BitBtn8: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox3: TDBComboBox;
    Panel15: TPanel;
    Panel16: TPanel;
    DBComboBox5: TDBComboBox;
    DBEdit13: TDBEdit;
    Panel18: TPanel;
    DBComboBox6: TDBComboBox;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    TABLECODLCTO: TIntegerField;
    TABLENOMEDISCORD: TIBStringField;
    TABLENOMEJOGO: TIBStringField;
    TABLEIDDISCORD: TIBStringField;
    TABLEIDSTEAM: TIBStringField;
    TABLELINKSTEAM: TIBStringField;
    TABLEIDBATTLEYE: TIBStringField;
    TABLEIDBOEMIA: TIBStringField;
    TABLECODBAN: TIBStringField;
    TABLEBANDESCRICAO: TIBStringField;
    TABLEBANOBS: TIBStringField;
    TABLEDTANASCIMENTO: TDateTimeField;
    TABLEDTACADASTRO: TDateTimeField;
    TABLECONTATOFONE: TIBStringField;
    TABLECONTATOEMAIL: TIBStringField;
    TABLECONTATORESPONSAVEL: TIBStringField;
    TABLEOBSDIVERSA: TIBStringField;
    TABLELOCALBASE: TIBStringField;
    TABLETERRITORIO: TIBStringField;
    TABLEJOGASOLO: TIBStringField;
    TABLEINTEGRANTES: TIBStringField;
    TABLESEGUROTIPOCOD: TIBStringField;
    TABLESEGUROTIPONOME: TIBStringField;
    TABLESTATUSNOME: TIBStringField;
    TABLESTATUSCOD: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BOXChange(Sender: TObject);
    procedure bancodChange(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DATACADASTRAMENTOChange(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox5Change(Sender: TObject);
    procedure DBComboBox6Change(Sender: TObject);
    procedure DBEdit14Change(Sender: TObject);
    procedure DBComboBox5Exit(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlayer: TfrmCadPlayer;

implementation

uses
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmCadPlayer.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de player';
  TABLE.Open;
  TABLE.Edit;
  TABLE.IndexFieldNames := ('IDDISCORD');
  DBEDIT2.SetFocus;
end;

procedure TfrmCadPlayer.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadPlayer.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadPlayer.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadPlayer.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadPlayer.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadPlayer.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadPlayer.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    TABLE.Cancel;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    TABLE.Append;
    dbedit2.SetFocus;
    box.ItemIndex := -1;
    datacadastramento.Text := DateToStr(Now);
    dbcombobox6.ItemIndex := 0;
    table['STATUSCOD'] := '0';
    //////////////////////////////
    if dbedit17.Text = '' then
    begin
      if dbedit14.Text = '0' then
      begin
        DBEDIT17.Text := 'ATIVO';
      end
      else
      begin
        if dbedit14.Text = '1' then
        begin
          DBEDIT17.Text := 'INATIVO';
        end;
      end;
    end;
    /////////////////////////////
  end;
end;

procedure TfrmCadPlayer.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBEdit5.Text = '' then
    begin
      Application.MessageBox('Nome de usuário do discord deve ser informado.         ATENÇÃO: Esse ID é valor único. O mesmo utilizado para criar a conta no discord e não o nome de exibição!', 'Dados Basicos', mb_Ok + mb_IconInformation);
      PageControl1.ActivePage := TabSheet1;
      DBEdit5.SetFocus;
    end
    else
    begin
      if DBEdit3.Text = '' then
      begin
        Application.MessageBox('Nome em jogo deve ser informado!',
          'Dados Basicos', mb_Ok + mb_IconInformation);
        PageControl1.ActivePage := TabSheet1;
        DBEdit3.SetFocus;
      end
      else
      begin
        if DBCombobox5.Text = '' then
        begin
          Application.MessageBox('Tipo de seguro deve ser informado!',
            'Dados Basicos', mb_Ok + mb_IconInformation);
          PageControl1.ActivePage := TabSheet1;
          DBCombobox5.SetFocus;
        end
        else
        begin
          if DBCombobox6.Text = '' then
          begin
            Application.MessageBox('Status deve ser informado!',
              'Dados Basicos', mb_Ok + mb_IconInformation);
            PageControl1.ActivePage := TabSheet1;
            DBCombobox6.SetFocus;
          end;
        end;
      end;
    end;
  end;

  if (DBEDIT5.Text <> '') and (DBEDIT3.Text <> '') and (DBCombobox5.Text <> '')
    and (DBCombobox6.Text <> '') then
  begin
    if Application.MessageBox('Confirma Inclusão/Alteração?', 'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      try
        if datacadastramento.Field.Text = '' then
        begin
          datacadastramento.Text := DateToStr(Now);
        end;
        TABLE.Post;
        if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
          mb_YesNo + mb_ICONQUESTION) = idYes then
        begin
          //    PageControl1.ActivePage := TabSheet1;
          TABLE.Append;
          DBEDIT2.SetFocus;
          BitBtn4.Enabled := False;
          BitBtn5.Enabled := False;
          BitBtn6.Enabled := False;
          BitBtn3.Enabled := False;
        end
        else
        begin
          PageControl1.ActivePage := TabSheet1;
          BitBtn4.Enabled := true;
          BitBtn5.Enabled := true;
          BitBtn6.Enabled := true;
          BitBtn3.Enabled := true;
          TABLE.Refresh;
        end;
      except
        Application.MessageBox('Nome discord já cadastrado, Verifique!',
          'Player', mb_Ok + mb_IconExclamation);
      end;
    end;
  end;
end;

procedure TfrmCadPlayer.BitBtn5Click(Sender: TObject);
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
              g.Caption := 'Player (s) cadastrado (s).: ' +
                intTostr(TABLE.RecordCount);
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
                  g.Caption := 'Player (s) cadastrado (s).: ' +
                    intTostr(TABLE.RecordCount);
                end;
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
              end;
            end;

            if bancod.Text = '' then
            begin
              box.ItemIndex := -1;
            end
            else
            begin
              if bancod.Text = '0' then
              begin
                box.ItemIndex := 0;
              end
              else
              begin
                if bancod.text = '1' then
                begin
                  box.ItemIndex := 1;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadPlayer.BitBtn2Click(Sender: TObject);
begin
  TABLE.Cancel;
  BitBtn4.Enabled := True;
  BitBtn5.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
end;

procedure TfrmCadPlayer.BitBtn3Click(Sender: TObject);
begin
  //edit3.Text := '';
  TABLE.Cancel;
  Close;
end;

procedure TfrmCadPlayer.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de player';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
end;

procedure TfrmCadPlayer.BitBtn6Click(Sender: TObject);
begin
  TABLE.IndexFieldNames := ('IDDISCORD');
  Label1.Caption := 'Pesquisa player';
  PageControl1.ActivePage := TabSheet3;
  Edit2.SetFocus;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  //g.Caption := 'Player (s) cadastrado (s).: ' + intTostr(TABLE.RecordCount);
end;

procedure TfrmCadPlayer.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadPlayer.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadPlayer.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de player';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
end;

procedure TfrmCadPlayer.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmCadPlayer.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadPlayer.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmCadPlayer.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmCadPlayer.FormDestroy(Sender: TObject);
begin
  TABLE.Close;
end;

procedure TfrmCadPlayer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadPlayer.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  TABLE.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

//----------------
function EhNumero(const S: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Length(S) do
  begin
    if not (S[I] in ['0'..'9']) then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure TfrmCadPlayer.Edit2Change(Sender: TObject);
var
  texto: string;
begin
  texto := Trim(Edit2.Text);
  if texto = '' then
    Exit;

  try
    // Busca direta por IDSTEAM se for um número grande (provavelmente IDSteam)
    if EhNumero(texto) and (Length(texto) >= 17) then
    begin
      if table.Locate('IDSTEAM', texto, []) then
        Exit;
    end;

    // Para buscas textuais, evita buscar com menos de 3 letras
    if Length(texto) < 3 then
      Exit;

    // Busca parcial em outros campos
    if table.Locate('CODLCTO', texto, [loPartialKey, loCaseInsensitive]) then
      Exit;
    if table.Locate('IDDISCORD', texto, [loPartialKey, loCaseInsensitive]) then
      Exit;
    if table.Locate('NOMEDISCORD', texto, [loPartialKey, loCaseInsensitive])
      then
      Exit;
    if table.Locate('NOMEJOGO', texto, [loPartialKey, loCaseInsensitive]) then
      Exit;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

//--------------------

procedure TfrmCadPlayer.BitBtn12Click(Sender: TObject);
var
  Mail: string;
begin
  if dbedit16.Text <> '' then
  begin
    Mail := 'mailto:' + dbedit16.Text;
    ShellExecute(GetDesktopWindow, 'open', pchar(Mail), nil, nil,
      sw_ShowNormal);
  end
  else
  begin
    if dbedit16.Text = '' then
    begin
      Application.MessageBox('Não há e-mail cadastrada para executar esta ação!',
        'Informação', mb_Ok + mb_IconInformation);
      dbedit16.SetFocus;
    end;
  end;
end;

procedure TfrmCadPlayer.BOXChange(Sender: TObject);
begin
  if box.ItemIndex = 0 then
  begin
    bancod.Text := '0';
    bannome.Text := 'SIM'
  end
  else
  begin
    if box.ItemIndex = 1 then
    begin
      bancod.Text := '1';
      bannome.Text := 'NAO';
    end;
  end;
end;

procedure TfrmCadPlayer.bancodChange(Sender: TObject);
begin
  if bancod.Text = '' then
  begin
    box.ItemIndex := -1;
  end
  else
  begin
    if bancod.Text = '0' then
    begin
      box.ItemIndex := 0;
    end
    else
    begin
      if bancod.text = '1' then
      begin
        box.ItemIndex := 1;
      end;
    end;
  end;
end;

procedure TfrmCadPlayer.DBEdit16Change(Sender: TObject);
begin
  if dbedit16.Text <> '' then
  begin
    bitbtn12.Visible := true;
  end
  else
  begin
    if dbedit16.Text = '' then
    begin
      bitbtn12.Visible := false;
    end;
  end;
end;

procedure TfrmCadPlayer.TabSheet3Show(Sender: TObject);
begin
  TABLE.IndexFieldNames := ('IDDISCORD');
  Label1.Caption := 'Pesquisa player';
  Edit2.SetFocus;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  table.Last;
  table.First;
  g.Caption := 'Player (s) cadastrado (s).: ' + intTostr(TABLE.RecordCount);
end;

procedure TfrmCadPlayer.BitBtn8Click(Sender: TObject);
var
  Endereco: string;
begin
  if dbedit6.Text <> '' then
  begin
    dbedit6.Text := Trim(dbedit6.Text);
    if (Pos('http://', dbedit6.Text) or
      Pos('https://', dbedit6.Text)) <> 0 then
      Endereco := dbedit6.Text
    else
    begin
      Endereco := 'http://' + dbedit6.Text; // Padrão
      dbedit6.Text := 'http://' + dbedit6.Text;
    end;
    ShellExecute(Handle, 'open', PCHAR(Endereco), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    Application.MessageBox('Não há url cadastrada para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end;

end;

procedure TfrmCadPlayer.DATACADASTRAMENTOChange(Sender: TObject);
begin
  panel15.Caption := datacadastramento.Text;
end;

procedure TfrmCadPlayer.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if DBmemo1.Lines.Text = '' then
    begin
      Key := #8;
      EvDBDateEdit1.SetFocus;
    end
    else
  end
  else
end;

procedure TfrmCadPlayer.DBMemo2KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCadPlayer.DBComboBox5Change(Sender: TObject);
begin
  if DBCombobox5.Text = 'SEGURO TOTAL' then
  begin
    dbedit13.Text := '0';
    //table['SEGUROTIPOCOD'] := 0;
  end
  else
  begin
    if DBCombobox5.text = 'SEGURO POR ITEM' then
    begin
      table['SEGUROTIPOCOD'] := '1';
    end
    else
    begin
      if DBCombobox5.text = 'NÃO EXIGIDO' then
      begin
        table['SEGUROTIPOCOD'] := 2;
      end;
    end;
  end;
end;

procedure TfrmCadPlayer.DBComboBox6Change(Sender: TObject);
begin
  if dbcombobox6.ItemIndex = 0 then
  begin
    table['STATUSCOD'] := '0';
  end
  else
  begin
    if dbcombobox6.ItemIndex = 1 then
    begin
      table['STATUSCOD'] := '1';
    end;
  end;
end;

procedure TfrmCadPlayer.DBEdit14Change(Sender: TObject);
begin
  if dbedit14.Text = '0' then
  begin
    dbcombobox6.Font.Color := clblue;
  end
  else
  begin
    if dbedit14.Text = '1' then
    begin
      dbcombobox6.Font.Color := clred;
    end
  end;
end;

procedure TfrmCadPlayer.DBComboBox5Exit(Sender: TObject);
begin
  if dbedit13.Text = '1' then
  begin
    Application.MessageBox('Opção indisponivel nesta versão!', 'Informação',
      mb_Ok + mb_IconInformation);
    DBComboBox5.SetFocus;
  end
  else

end;

procedure TfrmCadPlayer.Panel6Click(Sender: TObject);
begin
  if dbedit8.Text = '' then
  begin
    Application.MessageBox('Não há informação a ser copiado. Verifique!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if dbedit8.Text <> '' then
      dbedit8.SelectAll;
    dbedit8.CopyToClipboard;
    panel6.Hint := 'Copiado!';
  end;
end;

procedure TfrmCadPlayer.Panel5Click(Sender: TObject);
begin
  if dbedit10.Text = '' then
  begin
    Application.MessageBox('Não há informação a ser copiado. Verifique!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if dbedit10.Text <> '' then
      dbedit10.SelectAll;
    dbedit10.CopyToClipboard;
    panel5.Hint := 'Copiado!';
  end;
end;

procedure TfrmCadPlayer.Panel8Click(Sender: TObject);
begin
  if dbedit7.Text = '' then
  begin
    Application.MessageBox('Não há informação a ser copiado. Verifique!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if dbedit7.Text <> '' then
      dbedit7.SelectAll;
    dbedit7.CopyToClipboard;
    panel8.Hint := 'Copiado!';
  end;
end;

end.

unit uFrmCadFornecedor;

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
  shellapi;

type
  TfrmCadFornecedor = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    EvCheckCNPJ1: TEvCheckCNPJ;
    EvCheckIE1: TEvCheckIE;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Image1: TImage;
    Panel1: TPanel;
    DBEdit13: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit1: TMaskEdit;
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
    Panel15: TPanel;
    DBEdit14: TDBEdit;
    MaskEdit4: TMaskEdit;
    Panel16: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    MaskEdit7: TMaskEdit;
    DBEdit25: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit22: TDBEdit;
    EvDBZeroEdit1: TEvDBZeroEdit;
    MaskEdit6: TMaskEdit;
    DBEdit20: TDBEdit;
    Panel23: TPanel;
    Panel24: TPanel;
    DBComboBox1: TDBComboBox;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    DBComboBox3: TDBComboBox;
    Panel14: TPanel;
    Panel22: TPanel;
    Panel25: TPanel;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    MaskEdit8: TMaskEdit;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    DBEdit10: TDBEdit;
    Label1: TLabel;
    EvCheckCPF1: TEvCheckCPF;
    DBEDIT11: TDBLookupComboBox;
    UF: TDBEdit;
    MASKEDIT5: TDBEdit;
    Panel: TPanel;
    TabSheet4: TTabSheet;
    Panel29: TPanel;
    DBMemo4: TDBMemo;
    Panel28: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    TIPOPESSOA: TDBLookupComboBox;
    BitBtn8: TBitBtn;
    DBEdit4: TDBEdit;
    Edit3: TEdit;
    Panel30: TPanel;
    DATACADASTRAMENTO: TEvDBDateEdit;
    DataSource1: TDataSource;
    Query1: TIBQuery;
    BitBtn12: TBitBtn;
    BitBtn9: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure DBEdit12Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure DBEdit13Change(Sender: TObject);
    procedure DBEdit14Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit8Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit6Change(Sender: TObject);
    procedure MaskEdit7Change(Sender: TObject);
    procedure DBEdit24Change(Sender: TObject);
    procedure DBEdit25Change(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MaskEdit8Enter(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure EvCheckCPF1Error(Sender: TObject);
    procedure DBEDIT11Enter(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure UFEnter(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure TIPOPESSOAClick(Sender: TObject);
    procedure TIPOPESSOAEnter(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedor: TfrmCadFornecedor;

implementation

uses
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmCadFornecedor.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de Fornecedores';
  DbLookupComboBox1.SetFocus;
  DM.TFornecedor.Open;
  DM.TFornecedor.Edit;
  DM.TFornecedor.IndexFieldNames := ('NOMEFORNECEDOR');
  DBGrid1.Fields[3].EditMask := '99-9999-9999;0;_';
  DBGrid1.Fields[4].EditMask := '99-9999-9999;0;_';

  //DM.QMunicipio.Open;
  with DM.QMunicipio do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Municipio Order by NOM_MUNIC');
    Open;
  end;

  //    DM.QTipopessoa.Open;
  with DM.QTipopessoa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CREDORTIPO Order by TIPONOME');
    Open;
    DM.QTipopessoa.Last;
  end;
end;

procedure TfrmCadFornecedor.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadFornecedor.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadFornecedor.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadFornecedor.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmCadFornecedor.MaskEdit1Change(Sender: TObject);
begin
  DBEdit9.Text := MasKEdit1.Text;
end;

procedure TfrmCadFornecedor.DBEdit9Change(Sender: TObject);
begin
  MaskEdit1.Text := DBEdit9.Text;
end;

procedure TfrmCadFornecedor.MaskEdit2Change(Sender: TObject);
begin
  DBEdit12.Text := MaskEdit2.Text;
end;

procedure TfrmCadFornecedor.DBEdit12Change(Sender: TObject);
begin
  MaskEdit2.Text := DBEdit12.Text;

end;

procedure TfrmCadFornecedor.MaskEdit3Change(Sender: TObject);
begin
  DBEdit13.Text := MaskEdit3.Text;
end;

procedure TfrmCadFornecedor.DBEdit13Change(Sender: TObject);
begin
  MaskEdit3.Text := DBEdit13.Text;
end;

procedure TfrmCadFornecedor.DBEdit14Change(Sender: TObject);
begin
  MaskEdit4.Text := DBEdit14.Text;
end;

procedure TfrmCadFornecedor.MaskEdit4Change(Sender: TObject);
begin
  DBEdit14.Text := MaskEdit4.Text;
end;

procedure TfrmCadFornecedor.MaskEdit8Change(Sender: TObject);
begin
  DBEdit10.Text := MaskEdit8.Text;
end;

procedure TfrmCadFornecedor.Edit1Change(Sender: TObject);
begin
  DM.TFornecedor.Locate('NOMEFORNECEDOR', Edit2.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmCadFornecedor.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadFornecedor.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadFornecedor.MaskEdit6Change(Sender: TObject);
begin
  DBEdit24.Text := MaskEdit6.Text;
end;

procedure TfrmCadFornecedor.MaskEdit7Change(Sender: TObject);
begin
  DBEdit25.Text := MaskEdit7.Text;
end;

procedure TfrmCadFornecedor.DBEdit24Change(Sender: TObject);
begin
  MaskEdit6.Text := DBEdit24.Text;
end;

procedure TfrmCadFornecedor.DBEdit25Change(Sender: TObject);
begin
  MaskEdit7.Text := DBEdit25.Text;
end;

procedure TfrmCadFornecedor.MaskEdit1Exit(Sender: TObject);
begin
  if MaskEdit1.Text = '' then
  begin
    DBEDIT9.Text := '00000000';
  end
  else
  begin
    if length(MaskEdit1.Text) < 8 then
    begin
      Application.MessageBox('Campo preenchido incorretamente, Verefique!',
        'Informação', mb_Ok + mb_IconInformation);
      MaskEdit1.SetFocus;
    end
    else
      exit;
  end;
end;

procedure TfrmCadFornecedor.MaskEdit2Exit(Sender: TObject);
begin
  if MaskEdit2.Text = '' then
  begin
    DBEDIT12.Text := '0000000000';
  end
  else
  begin
    if length(MaskEdit2.Text) < 9 then
    begin
      Application.MessageBox('Campo preenchido incorretamente, Verefique!',
        'Informação', mb_Ok + mb_IconInformation);
      MaskEdit2.SetFocus;
    end
    else
      exit;
  end;
end;

procedure TfrmCadFornecedor.MaskEdit3Exit(Sender: TObject);
begin
  if MaskEdit3.Text = '' then
  begin
    DBEDIT13.Text := '0000000000';
  end
  else
  begin
    if length(MaskEdit3.Text) < 9 then
    begin
      Application.MessageBox('Campo preenchido incorretamente, Verefique!',
        'Informação', mb_Ok + mb_IconInformation);
      MaskEdit3.SetFocus;
    end
    else
      exit;
  end;
end;

procedure TfrmCadFornecedor.MaskEdit6Exit(Sender: TObject);
begin
  if MaskEdit6.Text = '' then
  begin
    exit;
  end
  else
  begin
    if length(MaskEdit6.Text) < 9 then
    begin
      Application.MessageBox('Campo preenchido incorretamente, Verefique!',
        'Informação', mb_Ok + mb_IconInformation);
      MaskEdit6.SetFocus;
    end
    else
      exit;
  end;
end;

procedure TfrmCadFornecedor.MaskEdit7Exit(Sender: TObject);
begin
  if MaskEdit7.Text = '' then
  begin
    exit;
  end
  else
  begin
    if length(MaskEdit7.Text) < 9 then
    begin
      Application.MessageBox('Campo preenchido incorretamente, Verefique!',
        'Informação', mb_Ok + mb_IconInformation);
      MaskEdit7.SetFocus;
    end
    else
      exit;
  end;
end;

procedure TfrmCadFornecedor.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DM.TFornecedor.Cancel;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    DBlOOKUPcOMBObOX1.SetFocus;
    DM.TFornecedor.Append;
    DM.TFornecedor['DATACADASTRAMENTO'] := DateToStr(Now);
  end;
end;

procedure TfrmCadFornecedor.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBLookupCombobox1.Text = '' then
    begin
      Application.MessageBox('Tipo de Fornecedor deve ser informado!',
        'Dados Basicos', mb_Ok + mb_IconInformation);
      PageControl1.ActivePage := TabSheet1;
      DBLookupCombobox1.SetFocus;
    end
    else
    begin
      if DBEdit2.Text = '' then
      begin
        Application.MessageBox('Razão Social/Nome deve ser informado!',
          'Dados Basicos', mb_Ok + mb_IconInformation);
        PageControl1.ActivePage := TabSheet1;
        DBEdit2.SetFocus;
      end
      else
      begin
        if DBEdit3.Text = '' then
        begin
          Application.MessageBox('Nome de Fantasia deve ser informado!',
            'Dados Basicos', mb_Ok + mb_IconInformation);
          PageControl1.ActivePage := TabSheet1;
          DBEdit3.SetFocus;
        end;
      end;
    end;

    if (DBLookupCombobox1.Text <> '') and (DBEDIT2.Text <> '') and (DBEDIT3.Text
      <> '') then
    begin
      //if MaskEdit4.Text = '' then DBEdit14.Text := '00000000000000';
      //if MaskEdit8.Text = '' then DBEdit10.Text := '00000000000';
      //if MaskEdit5.Text = '' then MASKEDIT5.Text := '000000000';
      //begin
      if Application.MessageBox('Confirma Inclusão/Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          DM.TFornecedor.Post;
          //    DM.TFornecedor.Refresh;
          if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            //    PageControl1.ActivePage := TabSheet1;
              //  DBlOOKUPcOMBObOX1.SetFocus;
            DM.TFornecedor.Append;
            BitBtn4.Enabled := False;
            BitBtn5.Enabled := False;
            BitBtn6.Enabled := False;
            BitBtn3.Enabled := False;
          end
          else
          begin
            PageControl1.ActivePage := TabSheet1;
            DBlOOKUPcOMBObOX1.SetFocus;
            BitBtn4.Enabled := true;
            BitBtn5.Enabled := true;
            BitBtn6.Enabled := true;
            BitBtn3.Enabled := true;
          end;
        except
          Application.MessageBox('Inscrição Estadual já cadastrada, Verifique!',
            'Fornecedor', mb_Ok + mb_IconExclamation);
        end;
      end;
    end;
  end;
end;

procedure TfrmCadFornecedor.BitBtn5Click(Sender: TObject);
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
      DM.TFornecedor.Open;
      if DM.TFornecedor.RecordCount = 0 then
      begin
        DM.TFornecedor.Close;
        Application.MessageBox('Não hà fornecedores para serem Excluídos!',
          'Alteração', mb_Ok + mb_IconInformation);
      end
      else
      begin

        DM.TFornecedor.Open;
        if DM.TFornecedor.RecordCount <> 0 then
        begin
          if Application.MessageBox('Confirma Exclusão deste Fornecedor?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TFornecedor.Delete;
            //DM.TFornecedor.Refresh;
            Panel.Caption := 'Fornecedor(es) Cadastrado(s).: ' +
              intTostr(DM.TFornecedor.RecordCount);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadFornecedor.BitBtn2Click(Sender: TObject);
begin
  DM.TFornecedor.Cancel;
  BitBtn4.Enabled := True;
  BitBtn5.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
end;

procedure TfrmCadFornecedor.BitBtn3Click(Sender: TObject);
begin
  edit3.Text := '';
  tipopessoa.KeyValue := ' ';
  DM.TFornecedor.Cancel;
  Close;
end;

procedure TfrmCadFornecedor.DBEdit10Change(Sender: TObject);
begin
  MaskEdit8.Text := DBEdit10.Text;
end;

procedure TfrmCadFornecedor.DBEdit16Exit(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadFornecedor.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Fornecedores';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBlOOKUPcOMBObOX1.SetFocus;
end;

procedure TfrmCadFornecedor.BitBtn6Click(Sender: TObject);
begin
  if DM.TFornecedor.RecordCount = 0 then
  begin
    Application.MessageBox('Não hà Fornecedores cadastrados para execução deste menu!', 'Pesquisa', mb_Ok + mb_IconInformation);
    DBEdit2.SetFocus;
  end
  else
  begin
    DM.TFornecedor.IndexFieldNames := ('NOMEFORNECEDOR');
    Label1.Caption := 'Pesquisa de Fornecedores';
    PageControl1.ActivePage := TabSheet3;
    Edit2.SetFocus;
    BitBtn6.Visible := False;
    BitBtn7.Visible := True;
  end;
end;

procedure TfrmCadFornecedor.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadFornecedor.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadFornecedor.DBComboBox6Exit(Sender: TObject);
begin
  if DBComboBox6.Text = 'PESSOA JURÍDICA' then
  begin
    MaskEdit4.Enabled := True;
    MaskEdit4.SetFocus;
    MaskEdit5.Enabled := True;
    MaskEdit8.Clear;
    DBEdit7.Clear;
    MaskEdit8.Enabled := False;
    DBEdit7.Enabled := False;
  end
  else
  begin
    MaskEdit4.Clear;
    MaskEdit5.Clear;
    MaskEdit4.Enabled := False;
    MaskEdit5.Enabled := True;
    MaskEdit5.SetFocus;
    MaskEdit8.Enabled := True;
    DBEdit7.Enabled := True;
  end;
end;

procedure TfrmCadFornecedor.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Fornecedor';
end;

procedure TfrmCadFornecedor.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmCadFornecedor.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmCadFornecedor.DBEDIT11Enter(Sender: TObject);
begin
  DBEdit11.DropDown;
end;

procedure TfrmCadFornecedor.TabSheet3Show(Sender: TObject);
begin
  if (tipopessoa.Text = '') then
  begin
    with query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Count(*) as CODIGOFORNECEDOR from FORNECEDOR');
      Open;
    end;
    panel.Caption := 'Fornecedor(es) Cadastrado(s).: ' +
      query1.FieldByName('CODIGOFORNECEDOR').AsString;
    query1.Close;
  end;

end;

procedure TfrmCadFornecedor.UFEnter(Sender: TObject);
begin
  uf.EditText := DM.QMunicipio['SIG_UF'];
end;

procedure TfrmCadFornecedor.DBEdit22Exit(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet4;
end;

procedure TfrmCadFornecedor.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmCadFornecedor.DBLookupComboBox1Click(Sender: TObject);
begin
  dbedit4.Text := DM.QTipopessoa['CODIGOTIPO'];
end;

procedure TfrmCadFornecedor.TIPOPESSOAClick(Sender: TObject);
begin
  edit3.Text := DM.QTipopessoa['CODIGOTIPO'];
  //DM.TFornecedor.Filtered := false;
  //DM.TFornecedor.Close;
  DM.TFornecedor.Filter := 'CODIGOTIPOPESSOA =' + (edit3.Text);
  DM.TFornecedor.Filtered := TRUE;
  DM.TFornecedor.Open;
  DM.TFornecedor.IndexFieldNames := 'NOMEFORNECEDOR';

  with query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Count(*) as CODIGOFORNECEDOR from FORNECEDOR');
    SQL.Add('Where CODIGOTIPOPESSOA =:codigo');
    ParamByName('codigo').Text := edit3.Text; // preenche o parametro
    Open;
  end;
  panel.Caption := 'Fornecedor(es) Cadastrado(s).: ' +
    query1.FieldByName('CODIGOFORNECEDOR').AsString;
  query1.Close;
end;

procedure TfrmCadFornecedor.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmCadFornecedor.BitBtn8Click(Sender: TObject);
begin
  edit3.Text := '';
  tipopessoa.KeyValue := ' ';
  DM.TFornecedor.Filtered := false;
  DM.TFornecedor.Close;
  DM.TFornecedor.Open;

  with query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Count(*) as CODIGOFORNECEDOR from FORNECEDOR');
    Open;
  end;
  panel.Caption := 'Fornecedor(es) Cadastrado(s).: ' +
    query1.FieldByName('CODIGOFORNECEDOR').AsString;
  query1.Close;
end;

procedure TfrmCadFornecedor.FormDestroy(Sender: TObject);
begin
  DM.TFornecedor.Filtered := false;
  DM.TFornecedor.Close;
  DM.QMunicipio.Close;
end;

procedure TfrmCadFornecedor.DBEdit3Enter(Sender: TObject);
begin
  if dbedit3.Text = '' then
  begin
    dm.TFornecedor.Edit;
    dbedit3.Text := dbedit2.Text;
    dbedit3.SelectAll;
  end
end;

procedure TfrmCadFornecedor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadFornecedor.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DM.TFornecedor.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

procedure TfrmCadFornecedor.Edit2Change(Sender: TObject);
begin
  DM.Tfornecedor.Locate('NOMEFANTASIA', Edit2.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmCadFornecedor.BitBtn12Click(Sender: TObject);
var
  Mail: string;
begin
  Mail := 'mailto:' + dbedit15.Text;
  ShellExecute(GetDesktopWindow, 'open', pchar(Mail), nil, nil, sw_ShowNormal);
end;

procedure TfrmCadFornecedor.BitBtn9Click(Sender: TObject);
var
  Mail: string;
begin
  Mail := 'mailto:' + dbedit22.Text;
  ShellExecute(GetDesktopWindow, 'open', pchar(Mail), nil, nil, sw_ShowNormal);
end;

end.

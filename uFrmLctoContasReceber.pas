unit uFrmLctoContasReceber;

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
  jpeg,
  EDBNum,
  EDBDate,
  IBQuery,
  RxLookup;

type
  TfrmLctoContasReceber = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    ImageList1: TImageList;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel17: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel13: TPanel;
    Panel23: TPanel;
    Panel28: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    emissao: TEvDBDateEdit;
    vencimento: TEvDBDateEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    valor: TEvDBNumEdit;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    CPAGAR: TIBTable;
    DBEdit6: TDBEdit;
    DataSource2: TDataSource;
    IBQuery1: TIBQuery;
    BitBtn16: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    CPAGARID_CODIGO: TIntegerField;
    CPAGARDATA_EMISSAO: TDateField;
    CPAGARDATA_VENCIMENTO: TDateField;
    CPAGARID_CLIENTE: TIntegerField;
    CPAGARNOME_CLIENTE: TIBStringField;
    CPAGARHISTORICO: TIBStringField;
    CPAGARID_CATEGORIA: TIBBCDField;
    CPAGARNOME_CATEGORIA: TIBStringField;
    CPAGARID_SUB_CATEGORIA: TIBBCDField;
    CPAGARNOME_SUB_CATEGORIA: TIBStringField;
    CPAGARDOCUMENTO: TIBStringField;
    CPAGARVALOR: TFloatField;
    CPAGARSELECAO: TIBStringField;
    CPAGARJUROS: TFloatField;
    CPAGARMULTA: TFloatField;
    CPAGARVALOR_TOTAL: TFloatField;
    CPAGARDATA_PAGAMENTO: TDateField;
    CPAGARSTATUS_CODIGO: TIBStringField;
    Panel5: TPanel;
    combobox1: TRxDBLookupCombo;
    CPAGARDESC: TFloatField;
    CPAGARSERVIDORCOD: TIBStringField;
    CPAGARSERVIDORNOME: TIBStringField;
    DBEdit9: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure emissaoEnter(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure combobox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoContasReceber: TfrmLctoContasReceber;

implementation

uses
  uFrmLctoCRManutencao,
  uFrmConCategoriaPesquisa,
  uFrmLctoDoacaoPlayer,
  uFrmCadSubCategoriaPesq,
  uDM;

{$R *.dfm}

procedure TfrmLctoContasReceber.BitBtn3Click(Sender: TObject);
begin
  CPAGAR.Cancel;
  Close;
end;

procedure TfrmLctoContasReceber.FormShow(Sender: TObject);
begin
  DM.TEssencia.Open;
  if frmLctoCRManutencao = nil then
  begin
    CPAGAR.Open;
    CPAGAR.Append;

    with ibquery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select CODLCTO, IDDISCORD from PLAYER');
      sql.Add('Order by IDDISCORD');
      open;
    end;
    self.Tag := 1;
  end
  else
  begin
    if frmLctoCRManutencao.Tag = 1 then
    begin
      CPAGAR.Open;
      CPAGAR.Append;

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODLCTO, IDDISCORD from PLAYER');
        sql.Add('Order by IDDISCORD');
        open;
      end;
      self.Tag := 1;
    end;

    if frmLctoCRManutencao.Tag = 2 then
    begin
      cpagar.Filter := 'ID_CODIGO = ' +
        QuotedStr(frmLctoCRManutencao.DBEdit1.Text);
      cpagar.Filtered := True;
      cpagar.Open;
      CPAGAR.Edit;

      EDIT1.Text := DBEDIT6.Text;

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODLCTO, IDDISCORD from PLAYER');
        sql.Add('Order by IDDISCORD');
        open;
      end;
      self.Tag := 1;
    end;
  end;
end;

procedure TfrmLctoContasReceber.BitBtn2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  CPAGAR.Cancel;
  CPAGAR.Append;
  emissao.SetFocus;
end;

procedure TfrmLctoContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  total: Real;
begin
  self.Tag := 0;
  DM.TEssencia.Close;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 1 then
  begin
    self.Tag := 0;
    ibquery1.Close;
    cpagar.Close;

    frmLctoCRManutencao.Tag := 0;
    with frmLctoCRManutencao.contasreceber do
    begin
      close;
      SQL.Clear;
      SQL.Add('Select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:codigo');
      SQL.Add('Order by DATA_VENCIMENTO');
      ParamByName('codigo').AsString := '0';
      Open;
    end;

    total := 0;
    frmLctoCRManutencao.contasreceber.Last;
    frmLctoCRManutencao.contasreceber.First;

    if not frmLctoCRManutencao.contasreceber.Eof then
    begin
      repeat
        total := frmLctoCRManutencao.contasreceber['VALOR'] + total;
        frmLctoCRManutencao.contasreceber.Next;
      until frmLctoCRManutencao.contasreceber.Eof;
    end;
    frmLctoCRManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
      total);
    frmLctoCRManutencao.contasreceber.First;
  end;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 2 then
  begin
    self.Tag := 0;
    ibquery1.Close;
    cpagar.Filtered := false;
    cpagar.Close;
    frmLctoCRManutencao.Tag := 0;

    if frmLctoCRManutencao.tipo.ItemIndex = 0 then
    begin
      with frmLctoCRManutencao.contasreceber do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_RECEBER');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '0';
        Open;
      end;

      total := 0;
      frmLctoCRManutencao.contasreceber.Last;
      frmLctoCRManutencao.contasreceber.First;

      if not frmLctoCRManutencao.contasreceber.Eof then
      begin
        repeat
          total := frmLctoCRManutencao.contasreceber['VALOR'] + total;
          frmLctoCRManutencao.contasreceber.Next;
        until frmLctoCRManutencao.contasreceber.Eof;
      end;
      frmLctoCRManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCRManutencao.contasreceber.First;
    end;

    if frmLctoCRManutencao.tipo.ItemIndex = 1 then
    begin
      with frmLctoCRManutencao.contasreceber do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_RECEBER');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '1';
        Open;
      end;
      total := 0;
      frmLctoCRManutencao.contasreceber.Last;
      frmLctoCRManutencao.contasreceber.First;

      if not frmLctoCRManutencao.contasreceber.Eof then
      begin
        repeat
          total := frmLctoCRManutencao.contasreceber['VALOR'] + total;
          frmLctoCRManutencao.contasreceber.Next;
        until frmLctoCRManutencao.contasreceber.Eof;
      end;
      frmLctoCRManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCRManutencao.contasreceber.First;
    end;

    if frmLctoCRManutencao.tipo.ItemIndex = 2 then
    begin
      with frmLctoCRManutencao.contasreceber do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_RECEBER');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '2';
        Open;
      end;
      total := 0;
      frmLctoCRManutencao.contasreceber.Last;
      frmLctoCRManutencao.contasreceber.First;

      if not frmLctoCRManutencao.contasreceber.Eof then
      begin
        repeat
          total := frmLctoCRManutencao.contasreceber['VALOR'] + total;
          frmLctoCRManutencao.contasreceber.Next;
        until frmLctoCRManutencao.contasreceber.Eof;
      end;
      frmLctoCRManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCRManutencao.contasreceber.First;
    end;

    if frmLctoCRManutencao.tipo.ItemIndex = 3 then
    begin
      with frmLctoCRManutencao.contasreceber do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_RECEBER');
        SQL.Add('Order by DATA_VENCIMENTO');
        Open;
      end;
      total := 0;
      frmLctoCRManutencao.contasreceber.Last;
      frmLctoCRManutencao.contasreceber.First;

      if not frmLctoCRManutencao.contasreceber.Eof then
      begin
        repeat
          total := frmLctoCRManutencao.contasreceber['VALOR'] + total;
          frmLctoCRManutencao.contasreceber.Next;
        until frmLctoCRManutencao.contasreceber.Eof;
      end;
      frmLctoCRManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCRManutencao.contasreceber.First;
    end;

  end;
end;

procedure TfrmLctoContasReceber.BitBtn1Click(Sender: TObject);
var
  total: Real;
begin
  if emissao.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data de Emissão deve ser informada!', 'Cadastro',
      mb_Ok + mb_IconInformation);
    emissao.SetFocus;
  end
  else
  begin
    if vencimento.Text = '  /  /    ' then
    begin
      Application.MessageBox('Data de Vencimento deve ser informada!',
        'Cadastro', mb_Ok + mb_IconInformation);
      vencimento.SetFocus;
    end
    else
    begin
      if DBedit2.Text = '' then
      begin
        Application.MessageBox('Player deve ser informada!', 'Cadastro', mb_Ok +
          mb_IconInformation);
        dbedit2.SetFocus;
      end
      else
      begin
        if DBedit3.Text = '' then
        begin
          Application.MessageBox('Categoria deve ser informada!', 'Cadastro',
            mb_Ok + mb_IconInformation);
          edit2.SetFocus;
        end
        else
        begin
          if DBedit4.Text = '' then
          begin
            Application.MessageBox('Sub-Categoria deve ser informada!',
              'Cadastro', mb_Ok + mb_IconInformation);
            edit3.SetFocus;
          end
          else
          begin
            if valor.Text = '' then
            begin
              Application.MessageBox('Valor deve ser informado!', 'Cadastro',
                mb_Ok + mb_IconInformation);
              valor.SetFocus;
            end;
          end;
        end;
      end;
    end;
  end;

  if (emissao.Text <> '  /  /    ') and (vencimento.Text <> '  /  /    ') and
    (DBedit2.Text <> '') and (DBedit3.Text <> '') and (DBedit4.Text <> '') and
    (valor.Text <> '') then
  begin
    if Application.MessageBox('Confirma Inclusão?', 'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      cpagar['STATUS_CODIGO'] := '0';
      cpagar.Post;
      if Application.MessageBox('Incluir outra conta?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        EDIT1.Clear;
        EDIT2.Clear;
        EDIT3.Clear;
        cpagar.Append;
        emissao.Text := DateToStr(Now);
        emissao.SetFocus;
      end
      else
      begin
        bitbtn3.Click;
      end;
    end
    else
    begin
      emissao.SetFocus;
    end;
  end;
end;

procedure TfrmLctoContasReceber.Edit1Change(Sender: TObject);
begin
  DBEDIT6.Text := EDIT1.Text;

  if (edit1.Text = '') then
  begin
    DBEDIT6.Text := '';
    DBEDIT2.Text := '';
  end;
end;

procedure TfrmLctoContasReceber.emissaoEnter(Sender: TObject);
begin
  if emissao.Text = '  /  /    ' then
  begin
    emissao.text := DateToStr(Now);
  end;
end;

procedure TfrmLctoContasReceber.BitBtn16Click(Sender: TObject);
begin
  try
    self.Tag := 5;
    Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
    frmLctoDoacaoPlayer.ShowModal;
  finally
    frmLctoDoacaoPlayer.Free;
  end;
end;

procedure TfrmLctoContasReceber.BitBtn4Click(Sender: TObject);
begin
  self.Tag := 1;
  try
    Application.CreateForm(TfrmConCategoriaPesquisa, frmConCategoriaPesquisa);
    frmConCategoriaPesquisa.ShowModal;
  finally
    frmConCategoriaPesquisa.Free;
  end;
end;

procedure TfrmLctoContasReceber.Edit2Change(Sender: TObject);
begin
  DBEDIT7.Text := EDIT2.Text;

  if (edit2.Text = '') then
  begin
    DBEDIT3.Text := '';
    DBEDIT7.Text := '';
  end;
end;

procedure TfrmLctoContasReceber.Edit3Change(Sender: TObject);
begin
  DBEDIT8.Text := EDIT3.Text;

  if (edit3.Text = '') then
  begin
    DBEDIT4.Text := '';
    DBEDIT8.Text := '';
  end;
end;

procedure TfrmLctoContasReceber.BitBtn5Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmCadSubCategoriaPesq, frmCadSubCategoriaPesq);
    frmCadSubCategoriaPesq.ShowModal;
  finally
    frmCadSubCategoriaPesq.Free;
  end;
end;

procedure TfrmLctoContasReceber.DBEdit7Change(Sender: TObject);
begin
  EDIT2.Text := DBEDIT7.Text;
end;

procedure TfrmLctoContasReceber.DBEdit8Change(Sender: TObject);
begin
  EDIT3.Text := DBEDIT8.Text;
end;

procedure TfrmLctoContasReceber.DBEdit6Change(Sender: TObject);
begin
  EDIT1.Text := DBEDIT6.Text;
end;

procedure TfrmLctoContasReceber.combobox1Change(Sender: TObject);
begin
  DBedit9.Text := DM.TEssencia['CODIGO'];
end;

end.

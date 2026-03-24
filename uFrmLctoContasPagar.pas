unit uFrmLctoContasPagar;

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
  IBQuery;

type
  TfrmLctoContasPagar = class(TForm)
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
    CPAGARID_CODIGO: TIntegerField;
    CPAGARDATA_EMISSAO: TDateField;
    CPAGARDATA_VENCIMENTO: TDateField;
    CPAGARID_FORNECEDOR: TIntegerField;
    CPAGARNOME_FORNECEDOR: TIBStringField;
    CPAGARHISTORICO: TIBStringField;
    CPAGARID_CATEGORIA: TIBBCDField;
    CPAGARNOME_CATEGORIA: TIBStringField;
    CPAGARID_SUB_CATEGORIA: TIBBCDField;
    CPAGARNOME_SUB_CATEGORIA: TIBStringField;
    CPAGARDOCUMENTO: TIBStringField;
    CPAGARVALOR: TFloatField;
    CPAGARSELECAO: TIBStringField;
    CPAGARJURO: TFloatField;
    CPAGARMULTA: TFloatField;
    CPAGARVALOR_TOTAL: TFloatField;
    BitBtn16: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    CPAGARDATA_PAGAMENTO: TDateField;
    CPAGARSTATUS_CODIGO: TIBStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoContasPagar: TfrmLctoContasPagar;

implementation

uses
  uFrmLctoCPManutencao,
  uFrmConCategoriaPesquisa,
  uFrmLctoCPPesquisaFor,
  uFrmCadSubCategoriaPesq;

{$R *.dfm}

procedure TfrmLctoContasPagar.BitBtn3Click(Sender: TObject);
begin
  CPAGAR.Cancel;
  Close;
end;

procedure TfrmLctoContasPagar.FormShow(Sender: TObject);
begin
  if frmLctoCPManutencao = nil then
  begin
    CPAGAR.Open;
    CPAGAR.Append;

    with ibquery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select CODIGOFORNECEDOR, NOMEFORNECEDOR from FORNECEDOR');
      sql.Add('Order by CODIGOFORNECEDOR');
      open;
    end;

    self.Tag := 1;
  end
  else
  begin

    if frmLctoCPManutencao.Tag = 1 then
    begin
      CPAGAR.Open;
      CPAGAR.Append;

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODIGOFORNECEDOR, NOMEFORNECEDOR from FORNECEDOR');
        sql.Add('Order by CODIGOFORNECEDOR');
        open;
      end;

      self.Tag := 1;
    end;

    if frmLctoCPManutencao.Tag = 2 then
    begin
      cpagar.Filter := 'ID_CODIGO = ' +
        QuotedStr(frmLctoCPManutencao.DBEdit1.Text);
      cpagar.Filtered := True;
      cpagar.Open;
      CPAGAR.Edit;

      EDIT1.Text := DBEDIT6.Text;

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODIGOFORNECEDOR, NOMEFORNECEDOR from FORNECEDOR');
        sql.Add('Order by CODIGOFORNECEDOR');
        open;
      end;

      self.Tag := 1;
    end;
  end;
end;

procedure TfrmLctoContasPagar.BitBtn2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  CPAGAR.Cancel;
  CPAGAR.Append;
  emissao.SetFocus;
end;

procedure TfrmLctoContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  total: Real;
begin
  self.tag := 0;
  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 1 then
  begin
    self.Tag := 0;
    ibquery1.Close;
    cpagar.Close;

    frmLctoCPManutencao.Tag := 0;
    with frmLctoCPManutencao.contaspagar do
    begin
      close;
      SQL.Clear;
      SQL.Add('Select * from CONTAS_PAGAR');
      SQL.Add('Where STATUS_CODIGO =:codigo');
      SQL.Add('Order by DATA_VENCIMENTO');
      ParamByName('codigo').AsString := '0';
      Open;
    end;

    total := 0;
    frmLctoCPManutencao.contaspagar.Last;
    frmLctoCPManutencao.contaspagar.First;

    if not frmLctoCPManutencao.contaspagar.Eof then
    begin
      repeat
        total := frmLctoCPManutencao.contaspagar['VALOR'] + total;
        frmLctoCPManutencao.contaspagar.Next;
      until frmLctoCPManutencao.contaspagar.Eof;
    end;
    frmLctoCPManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
      total);
    frmLctoCPManutencao.contaspagar.First;
  end;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 2 then
  begin
    self.Tag := 0;
    ibquery1.Close;
    cpagar.Filtered := false;
    cpagar.Close;
    frmLctoCPManutencao.Tag := 0;

    if frmLctoCPManutencao.tipo.ItemIndex = 0 then
    begin
      with frmLctoCPManutencao.contaspagar do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_PAGAR');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '0';
        Open;
      end;
      total := 0;
      frmLctoCPManutencao.contaspagar.Last;
      frmLctoCPManutencao.contaspagar.First;

      if not frmLctoCPManutencao.contaspagar.Eof then
      begin
        repeat
          total := frmLctoCPManutencao.contaspagar['VALOR'] + total;
          frmLctoCPManutencao.contaspagar.Next;
        until frmLctoCPManutencao.contaspagar.Eof;
      end;
      frmLctoCPManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCPManutencao.contaspagar.First;
    end;

    if frmLctoCPManutencao.tipo.ItemIndex = 1 then
    begin
      with frmLctoCPManutencao.contaspagar do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_PAGAR');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '1';
        Open;
      end;
      total := 0;
      frmLctoCPManutencao.contaspagar.Last;
      frmLctoCPManutencao.contaspagar.First;

      if not frmLctoCPManutencao.contaspagar.Eof then
      begin
        repeat
          total := frmLctoCPManutencao.contaspagar['VALOR'] + total;
          frmLctoCPManutencao.contaspagar.Next;
        until frmLctoCPManutencao.contaspagar.Eof;
      end;
      frmLctoCPManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCPManutencao.contaspagar.First;
    end;

    if frmLctoCPManutencao.tipo.ItemIndex = 2 then
    begin
      with frmLctoCPManutencao.contaspagar do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_PAGAR');
        SQL.Add('Where STATUS_CODIGO =:codigo');
        SQL.Add('Order by DATA_VENCIMENTO');
        ParamByName('codigo').AsString := '2';
        Open;
      end;
      total := 0;
      frmLctoCPManutencao.contaspagar.Last;
      frmLctoCPManutencao.contaspagar.First;

      if not frmLctoCPManutencao.contaspagar.Eof then
      begin
        repeat
          total := frmLctoCPManutencao.contaspagar['VALOR'] + total;
          frmLctoCPManutencao.contaspagar.Next;
        until frmLctoCPManutencao.contaspagar.Eof;
      end;
      frmLctoCPManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCPManutencao.contaspagar.First;
    end;

    if frmLctoCPManutencao.tipo.ItemIndex = 3 then
    begin
      with frmLctoCPManutencao.contaspagar do
      begin
        close;
        SQL.Clear;
        SQL.Add('Select * from CONTAS_PAGAR');
        SQL.Add('Order by DATA_VENCIMENTO');
        Open;
      end;
      total := 0;
      frmLctoCPManutencao.contaspagar.Last;
      frmLctoCPManutencao.contaspagar.First;

      if not frmLctoCPManutencao.contaspagar.Eof then
      begin
        repeat
          total := frmLctoCPManutencao.contaspagar['VALOR'] + total;
          frmLctoCPManutencao.contaspagar.Next;
        until frmLctoCPManutencao.contaspagar.Eof;
      end;
      frmLctoCPManutencao.Label9.Caption := 'Total.:  ' + FormatCurr('#0.00',
        total);
      frmLctoCPManutencao.contaspagar.First;
    end;
  end;
end;

procedure TfrmLctoContasPagar.BitBtn1Click(Sender: TObject);
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
        Application.MessageBox('Fornecedor deve ser informada!', 'Cadastro',
          mb_Ok + mb_IconInformation);
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

procedure TfrmLctoContasPagar.Edit1Change(Sender: TObject);
begin
  DBEDIT6.Text := EDIT1.Text;

  if (edit1.Text = '') then
  begin
    DBEDIT6.Text := '';
    DBEDIT2.Text := '';
  end;
end;

procedure TfrmLctoContasPagar.emissaoEnter(Sender: TObject);
begin
  if emissao.Text = '  /  /    ' then
  begin
    emissao.text := DateToStr(Now);
  end;
end;

procedure TfrmLctoContasPagar.BitBtn16Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmLctoCPPesquisaForn, frmLctoCPPesquisaForn);
    frmLctoCPPesquisaForn.ShowModal;
  finally
    frmLctoCPPesquisaForn.Free;
  end;
end;

procedure TfrmLctoContasPagar.BitBtn4Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmConCategoriaPesquisa, frmConCategoriaPesquisa);
    frmConCategoriaPesquisa.ShowModal;
  finally
    frmConCategoriaPesquisa.Free;
  end;
end;

procedure TfrmLctoContasPagar.Edit2Change(Sender: TObject);
begin
  DBEDIT7.Text := EDIT2.Text;

  if (edit2.Text = '') then
  begin
    DBEDIT3.Text := '';
    DBEDIT7.Text := '';
  end;
end;

procedure TfrmLctoContasPagar.Edit3Change(Sender: TObject);
begin
  DBEDIT8.Text := EDIT3.Text;

  if (edit3.Text = '') then
  begin
    DBEDIT4.Text := '';
    DBEDIT8.Text := '';
  end;
end;

procedure TfrmLctoContasPagar.BitBtn5Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmCadSubCategoriaPesq, frmCadSubCategoriaPesq);
    frmCadSubCategoriaPesq.ShowModal;
  finally
    frmCadSubCategoriaPesq.Free;
  end;
end;

procedure TfrmLctoContasPagar.DBEdit7Change(Sender: TObject);
begin
  EDIT2.Text := DBEDIT7.Text;
end;

procedure TfrmLctoContasPagar.DBEdit8Change(Sender: TObject);
begin
  EDIT3.Text := DBEDIT8.Text;
end;

procedure TfrmLctoContasPagar.DBEdit6Change(Sender: TObject);
begin
  EDIT1.Text := DBEDIT6.Text;
end;

end.

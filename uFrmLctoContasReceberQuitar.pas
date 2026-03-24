unit uFrmLctoContasReceberQuitar;

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
  TfrmLctoContasReceberQuitar = class(TForm)
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
    Panel13: TPanel;
    Panel23: TPanel;
    Panel28: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    emissao: TEvDBDateEdit;
    vencimento: TEvDBDateEdit;
    Edit1: TEdit;
    valor: TEvDBNumEdit;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    CPAGAR: TIBTable;
    DataSource2: TDataSource;
    IBQuery1: TIBQuery;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    juro: TEvDBNumEdit;
    multa: TEvDBNumEdit;
    desc: TEvDBNumEdit;
    valtotal: TEvDBNumEdit;
    Panel9: TPanel;
    dtapagto: TEvDBDateEdit;
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
    CPAGARDESC: TFloatField;
    Panel11: TPanel;
    DBEdit3: TDBEdit;
    CPAGARSERVIDORCOD: TIBStringField;
    CPAGARSERVIDORNOME: TIBStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure emissaoEnter(Sender: TObject);
    procedure juroExit(Sender: TObject);
    procedure multaExit(Sender: TObject);
    procedure descExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoContasReceberQuitar: TfrmLctoContasReceberQuitar;

implementation

uses
  uFrmLctoCRManutencao;

{$R *.dfm}

procedure TfrmLctoContasReceberQuitar.BitBtn3Click(Sender: TObject);
begin
  CPAGAR.Cancel;
  Close;
end;

procedure TfrmLctoContasReceberQuitar.FormShow(Sender: TObject);
begin
  if frmLctoCRManutencao = nil then
  begin
    CPAGAR.Open;
    CPAGAR.Append;

    with ibquery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select CODIGOCREDOR, NOMECREDOR from CREDOR');
      sql.Add('Order by CODIGOCREDOR');
      open;
    end;

    self.Tag := 1;
  end
  else
  begin

    if frmLctoCRManutencao.Tag = 3 then
    begin
      cpagar.Filter := 'ID_CODIGO = ' +
        QuotedStr(frmLctoCRManutencao.DBEdit1.Text);
      cpagar.Filtered := True;
      cpagar.Open;
      CPAGAR.Edit;

      EDIT1.Text := CPAGAR['ID_CLIENTE'];
      CPAGAR['DATA_PAGAMENTO'] := DateToStr(Now);

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODIGOCREDOR, NOMECREDOR from CREDOR');
        sql.Add('Order by CODIGOCREDOR');
        open;
      end;

      CPAGAR['VALOR_TOTAL'] := CPAGAR['VALOR'];
      self.Tag := 1;
    end;

  end;
end;

procedure TfrmLctoContasReceberQuitar.BitBtn2Click(Sender: TObject);
begin
  //edit1.Clear ;
  CPAGAR.Cancel;
  CPAGAR.Append;
  JURO.SetFocus;
end;

procedure TfrmLctoContasReceberQuitar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  total: Real;
begin
  self.tag := 0;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 3 then
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

procedure TfrmLctoContasReceberQuitar.BitBtn1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma Baixa deste titulo?', 'Confirmação',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    cpagar['STATUS_CODIGO'] := '2';
    cpagar.Post;
    CPAGAR.Cancel;
    Close;
  end
  else
  begin
    dtapagto.SetFocus;
  end;
end;

procedure TfrmLctoContasReceberQuitar.emissaoEnter(Sender: TObject);
begin
  if emissao.Text = '  /  /    ' then
  begin
    emissao.text := DateToStr(Now);
  end;
end;

procedure TfrmLctoContasReceberQuitar.juroExit(Sender: TObject);
var
  vn1, vn2, vn3, vn4, vsoma: Real;
begin
  if juro.Value <> 0 then
  begin
    vn1 := 0;
    vn2 := 0;
    vn3 := 0;
    vn4 := 0;
    vsoma := 0;
    vn1 := (valor.Value);
    vn2 := (juro.Value);
    vn3 := (multa.Value);
    vn4 := (desc.Value);
    vsoma := vn1 + vn2 + vn3 - vn4;
    valtotal.Text := FloatToStr(vsoma);
  end
  else
  begin
    if juro.Value = 0 then
    begin
      vn1 := 0;
      vn2 := 0;
      vn3 := 0;
      vn4 := 0;
      vsoma := 0;
      vn1 := (valor.Value);
      vn2 := (juro.Value);
      vn3 := (multa.Value);
      vn4 := (desc.Value);
      vsoma := vn1 + vn2 + vn3 - vn4;
      valtotal.Text := FloatToStr(vsoma);
    end;
  end;
end;

procedure TfrmLctoContasReceberQuitar.multaExit(Sender: TObject);
var
  vn1, vn2, vn3, vn4, vsoma: Real;
begin
  if multa.Value <> 0 then
  begin
    vn1 := 0;
    vn2 := 0;
    vn3 := 0;
    vn4 := 0;
    vsoma := 0;
    vn1 := (valor.Value);
    vn2 := (juro.Value);
    vn3 := (multa.Value);
    vn4 := (desc.Value);
    vsoma := vn1 + vn2 + vn3 - vn4;
    valtotal.Text := FloatToStr(vsoma);
  end
  else
  begin
    if multa.Value = 0 then
    begin
      vn1 := 0;
      vn2 := 0;
      vn3 := 0;
      vn4 := 0;
      vsoma := 0;
      vn1 := (valor.Value);
      vn2 := (juro.Value);
      vn3 := (multa.Value);
      vn4 := (desc.Value);
      vsoma := vn1 + vn2 + vn3 - vn4;
      valtotal.Text := FloatToStr(vsoma);
    end;
  end;
end;

procedure TfrmLctoContasReceberQuitar.descExit(Sender: TObject);
var
  vn1, vn2, vn3, vn4, vsoma: Real;
begin
  if desc.Value <> 0 then
  begin
    if desc.Value > valor.Value then
    begin
      Application.MessageBox('Valor do desconto maior que o principal. Verífique!', 'Informação', mb_Ok + mb_IconInformation);
      desc.SetFocus;
    end
    else
      vn1 := 0;
    vn2 := 0;
    vn3 := 0;
    vn4 := 0;
    vsoma := 0;
    vn1 := (valor.Value);
    vn2 := (juro.Value);
    vn3 := (multa.Value);
    vn4 := (desc.Value);
    vsoma := vn1 + vn2 + vn3 - vn4;
    valtotal.Text := FloatToStr(vsoma);
  end
  else
  begin
    if desc.Value = 0 then
    begin
      vn1 := 0;
      vn2 := 0;
      vn3 := 0;
      vn4 := 0;
      vsoma := 0;
      vn1 := (valor.Value);
      vn2 := (juro.Value);
      vn3 := (multa.Value);
      vn4 := (desc.Value);
      vsoma := vn1 + vn2 + vn3 - vn4;
      valtotal.Text := FloatToStr(vsoma);
    end;
  end;
end;

end.

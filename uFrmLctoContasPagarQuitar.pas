unit uFrmLctoContasPagarQuitar;

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
  TfrmLctoContasPagarQuitar = class(TForm)
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
    CPAGARDATA_PAGAMENTO: TDateField;
    CPAGARSTATUS_CODIGO: TIBStringField;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    juro: TEvDBNumEdit;
    multa: TEvDBNumEdit;
    desc: TEvDBNumEdit;
    valtotal: TEvDBNumEdit;
    CPAGARDESC: TFloatField;
    Panel9: TPanel;
    dtapagto: TEvDBDateEdit;
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
  frmLctoContasPagarQuitar: TfrmLctoContasPagarQuitar;

implementation

uses
  uFrmLctoCPManutencao;

{$R *.dfm}

procedure TfrmLctoContasPagarQuitar.BitBtn3Click(Sender: TObject);
begin
  CPAGAR.Cancel;
  Close;
end;

procedure TfrmLctoContasPagarQuitar.FormShow(Sender: TObject);
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

    if frmLctoCPManutencao.Tag = 3 then
    begin
      cpagar.Filter := 'ID_CODIGO = ' +
        QuotedStr(frmLctoCPManutencao.DBEdit1.Text);
      cpagar.Filtered := True;
      cpagar.Open;
      CPAGAR.Edit;

      EDIT1.Text := CPAGAR['ID_FORNECEDOR'];
      CPAGAR['DATA_PAGAMENTO'] := DateToStr(Now);

      with ibquery1 do
      begin
        close;
        SQL.Clear;
        SQL.Add('select CODIGOFORNECEDOR, NOMEFORNECEDOR from FORNECEDOR');
        sql.Add('Order by CODIGOFORNECEDOR');
        open;
      end;

      CPAGAR['VALOR_TOTAL'] := CPAGAR['VALOR'];
      self.Tag := 1;
    end;

  end;
end;

procedure TfrmLctoContasPagarQuitar.BitBtn2Click(Sender: TObject);
begin
  //edit1.Clear ;
  CPAGAR.Cancel;
  CPAGAR.Append;
  JURO.SetFocus;
end;

procedure TfrmLctoContasPagarQuitar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  total: Real;
begin
  self.tag := 0;

  if frmLctoCPManutencao = nil then
  else if frmLctoCPManutencao.Tag = 3 then
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

procedure TfrmLctoContasPagarQuitar.BitBtn1Click(Sender: TObject);
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

procedure TfrmLctoContasPagarQuitar.emissaoEnter(Sender: TObject);
begin
  if emissao.Text = '  /  /    ' then
  begin
    emissao.text := DateToStr(Now);
  end;
end;

procedure TfrmLctoContasPagarQuitar.juroExit(Sender: TObject);
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

procedure TfrmLctoContasPagarQuitar.multaExit(Sender: TObject);
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

procedure TfrmLctoContasPagarQuitar.descExit(Sender: TObject);
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

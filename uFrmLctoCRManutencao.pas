unit uFrmLctoCRManutencao;

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
  ENumEd,
  EDateEd,
  ToolEdit,
  CurrEdit,
  IBQuery;

type
  TfrmLctoCRManutencao = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ImageList1: TImageList;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    FORNECEDOR: TEdit;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    tipo: TRadioGroup;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dataini: TEvDateEdit;
    datafi: TEvDateEdit;
    GroupBox3: TGroupBox;
    DBMemo2: TDBMemo;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    DataSource1: TDataSource;
    contasreceber: TIBQuery;
    DBEdit1: TDBEdit;
    Edit6: TEdit;
    Panel1: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label9: TLabel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    ds1: TDataSource;
    table: TIBTable;
    Label8: TLabel;
    contasreceberID_CODIGO: TIntegerField;
    contasreceberDATA_EMISSAO: TDateField;
    contasreceberDATA_VENCIMENTO: TDateField;
    contasreceberID_CLIENTE: TIntegerField;
    contasreceberNOME_CLIENTE: TIBStringField;
    contasreceberHISTORICO: TIBStringField;
    contasreceberID_CATEGORIA: TIBBCDField;
    contasreceberNOME_CATEGORIA: TIBStringField;
    contasreceberID_SUB_CATEGORIA: TIBBCDField;
    contasreceberNOME_SUB_CATEGORIA: TIBStringField;
    contasreceberDOCUMENTO: TIBStringField;
    contasreceberVALOR: TFloatField;
    contasreceberSELECAO: TIBStringField;
    contasreceberJUROS: TFloatField;
    contasreceberMULTA: TFloatField;
    contasreceberVALOR_TOTAL: TFloatField;
    contasreceberDATA_PAGAMENTO: TDateField;
    contasreceberSTATUS_CODIGO: TIBStringField;
    contasreceberDESC: TFloatField;
    tableID_CODIGO: TIntegerField;
    tableDATA_EMISSAO: TDateField;
    tableDATA_VENCIMENTO: TDateField;
    tableID_CLIENTE: TIntegerField;
    tableNOME_CLIENTE: TIBStringField;
    tableHISTORICO: TIBStringField;
    tableID_CATEGORIA: TIBBCDField;
    tableNOME_CATEGORIA: TIBStringField;
    tableID_SUB_CATEGORIA: TIBBCDField;
    tableNOME_SUB_CATEGORIA: TIBStringField;
    tableDOCUMENTO: TIBStringField;
    tableVALOR: TFloatField;
    tableSELECAO: TIBStringField;
    tableJUROS: TFloatField;
    tableMULTA: TFloatField;
    tableVALOR_TOTAL: TFloatField;
    tableDATA_PAGAMENTO: TDateField;
    tableSTATUS_CODIGO: TIBStringField;
    tableDESC: TFloatField;
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
    GroupBox4: TGroupBox;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure contasreceberAfterOpen(DataSet: TDataSet);
    procedure tipoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoCRManutencao: TfrmLctoCRManutencao;

implementation

uses
  uFrmConCategoriaPesquisa,
  uFrmLctoContasReceber,
  uFrmLctoContasReceberQuitar,
  uFrmLctoDoacaoPlayer,
  uFrmCadSubCategoriaPesq,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoCRManutencao.BitBtn3Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmConCategoriaPesquisa, frmConCategoriaPesquisa);
    frmConCategoriaPesquisa.ShowModal;
  finally
    frmConCategoriaPesquisa.Free;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn9Click(Sender: TObject);
begin
  t1.Filtered := false;
  t1.Close;
  Close;
end;

procedure TfrmLctoCRManutencao.FormShow(Sender: TObject);
var
  total: Real;
begin
  if frmLctoCRManutencao.Tag <> 12 then
  begin
    with contasreceber do
    begin
      close;
      SQL.Clear;
      SQL.Add('Select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:codigo');
      SQL.Add('Order by DATA_VENCIMENTO');
      ParamByName('codigo').AsString := '0';
      Open;
      label8.Caption := 'Contas a receber encontradas.: ' +
        intTostr(contasreceber.RecordCount);
    end;
    total := 0;
    contasreceber.Last;
    contasreceber.First;

    if not contasreceber.Eof then
    begin
      repeat
        total := contasreceber['VALOR'] + total;
        contasreceber.Next;
      until contasreceber.Eof;
    end;
    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
    contasreceber.First;
  end
  else
  begin
    if frmLctoCRManutencao.Tag = 12 then
    begin

    end;
  end;
end;

procedure TfrmLctoCRManutencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  contasreceber.Close;
end;

procedure TfrmLctoCRManutencao.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      SELF.Tag := 1;
      Application.CreateForm(TfrmLctoContasReceber, frmLctoContasReceber);
      frmLctoContasReceber.ShowModal;
    finally
      frmLctoContasReceber.Free;
    end;
  end;
end;

procedure TfrmLctoCRManutencao.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  if tipo.ItemIndex = 0 then
  begin
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    with contasreceber do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:busca');
      SQL.Add('ORDER BY ' + Column.FieldName);
      Column.Title.Font.Style := [fsBold];
      ParamByName('busca').Text := '0';
      Open;
    end;
  end;

  if tipo.ItemIndex = 1 then
  begin
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    with contasreceber do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:busca');
      SQL.Add('ORDER BY ' + Column.FieldName);
      Column.Title.Font.Style := [fsBold];
      ParamByName('busca').Text := '1';
      Open;
    end;
  end;

  if tipo.ItemIndex = 2 then
  begin
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    with contasreceber do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:busca');
      SQL.Add('ORDER BY ' + Column.FieldName);
      Column.Title.Font.Style := [fsBold];
      ParamByName('busca').Text := '2';
      Open;
    end;
  end;

  if tipo.ItemIndex = 3 then
  begin
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    with contasreceber do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_RECEBER');
      SQL.Add('ORDER BY ' + Column.FieldName);
      Column.Title.Font.Style := [fsBold];
      Open;
    end;
  end;

end;

procedure TfrmLctoCRManutencao.contasreceberAfterOpen(
  DataSet: TDataSet);
begin
  TFloatField(contasreceber.FieldByName('VALOR')).DisplayFormat := ',0.00';

end;

procedure TfrmLctoCRManutencao.tipoClick(Sender: TObject);
var
  total: Real;
begin

  case (Tipo.ItemIndex) of
    0:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '0';
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := true;
      end;

    1:
      begin
        with contasreceber do
        begin
          Close;
          SQL.Text :=
            'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO =:codigo';
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('Hoje').AsDate := Date;
          ParamByName('codigo').AsString := '0';
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := true;
      end;

    2:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '2';
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR_TOTAL'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := true;
        bitbtn10.Visible := false;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := false;
      end;

    3:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Order by DATA_VENCIMENTO');
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total); //se for para mostrar tem q mostrar o VALOR e VALOR_TOTAL
          Label9.Caption := '';
          contasreceber.First;
        end;
        bitbtn11.Enabled := false;
        bitbtn10.Enabled := false;
        bitbtn2.Enabled := false;
      end;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn2Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      SELF.Tag := 2;
      Application.CreateForm(TfrmLctoContasReceber, frmLctoContasReceber);
      frmLctoContasReceber.ShowModal;
    finally
      frmLctoContasReceber.Free;
    end;
  end;
end;

procedure TfrmLctoCRManutencao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;
end;

procedure TfrmLctoCRManutencao.BitBtn6Click(Sender: TObject);
var
  total: Real;
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if contasreceber.RecordCount = 0 then
    begin
      Application.MessageBox('Não a lançamento para sere Excluído!', 'Exclusão',
        mb_Ok + mb_IconInformation);
    end
    else
    begin
      if Application.MessageBox('Confirma Exclusão desta Conta?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        EDIT6.Text := DBEDIT1.Text;
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('DELETE from CONTAS_RECEBER Where ID_CODIGO =:codigo');
          ParamByName('codigo').AsInteger := StrToInt(edit6.text);
          ExecSQL;
        end;

        case (Tipo.ItemIndex) of
          0:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '0';
                Open;

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
            end;

          1:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '1';
                Open;

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
            end;

          2:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '2';
                Open;

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
            end;

          3:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Order by DATA_VENCIMENTO');
                Open;

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
            end;
        end;
      end;
    end;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn17Click(Sender: TObject);
begin
  contasreceber.First;
end;

procedure TfrmLctoCRManutencao.BitBtn18Click(Sender: TObject);
begin
  contasreceber.Prior;
end;

procedure TfrmLctoCRManutencao.BitBtn19Click(Sender: TObject);
begin
  contasreceber.Next;
end;

procedure TfrmLctoCRManutencao.BitBtn20Click(Sender: TObject);
begin
  contasreceber.Last;
end;

procedure TfrmLctoCRManutencao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if contasreceber.RecordCount <> 0 then
  begin
    //  if contasreceber.FieldByName('DATA_VENCIMENTO').AsDateTime > Date()then
    if contasreceber.FieldByName('STATUS_CODIGO').Text = '2' then
    begin
      dbgrid1.Canvas.Font.Style := [fsbold];
      dbgrid1.Canvas.Brush.Color := $0080FF00; //verde
      dbgrid1.DefaultDrawColumnCell(rect, datacol, column, state);

    end
    else
    begin
      dbgrid1.Canvas.Font.Style := [fsbold];
      dbgrid1.Canvas.Brush.Color := $000080FF; //laranja
      dbgrid1.DefaultDrawColumnCell(rect, datacol, column, state);

    end;
    if contasreceber.RecordCount = 0 then
    begin

    end;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn11Click(Sender: TObject);
var
  total: Real;
begin
  //TABLE CONTAS PAGAR
  table.close;
  table.Filtered := false;
  table.Filter := 'ID_CODIGO = ' +
    QuotedStr(contasreceber.FIELDBYNAME('ID_CODIGO').ASSTRING);
  table.Filtered := True;
  table.Open;

  if
    Application.MessageBox('Ao prosseguir o registro selecionado será estornado. Continua?', 'Confirmação',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    table.Edit;
    table['DATA_PAGAMENTO'] := null;
    table['JUROS'] := null;
    table['MULTA'] := null;
    table['DESC'] := null;
    table['VALOR_TOTAL'] := null;
    table['STATUS_CODIGO'] := '0';
    table.Post;
    table.Filtered := false;
    table.Close;

    with contasreceber do
    begin
      close;
      SQL.Clear;
      SQL.Add('Select * from CONTAS_RECEBER');
      SQL.Add('Where STATUS_CODIGO =:codigo');
      SQL.Add('Order by DATA_VENCIMENTO');
      ParamByName('codigo').AsString := '2';
      Open;
      label8.Caption := 'Contas a receber encontradas.: ' +
        intTostr(contasreceber.RecordCount);
    end;
    total := 0;
    contasreceber.Last;
    contasreceber.First;

    if not contasreceber.Eof then
    begin
      repeat
        total := contasreceber['VALOR'] + total;
        contasreceber.Next;
      until contasreceber.Eof;
    end;
    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
    contasreceber.First;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn10Click(Sender: TObject);
begin
  try
    SELF.Tag := 3;
    Application.CreateForm(TfrmLctoContasReceberQuitar,
      frmLctoContasReceberQuitar);
    frmLctoContasReceberQuitar.ShowModal;
  finally
    frmLctoContasReceberQuitar.Free;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn4Click(Sender: TObject);
begin
  try
    self.Tag := 12;
    Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
    frmLctoDoacaoPlayer.ShowModal;
  finally
    frmLctoDoacaoPlayer.Free;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn1Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmCadSubCategoriaPesq, frmCadSubCategoriaPesq);
    frmCadSubCategoriaPesq.ShowModal;
  finally
    frmCadSubCategoriaPesq.Free;
  end;
end;

procedure TfrmLctoCRManutencao.BitBtn7Click(Sender: TObject);
var
  total: Real;
begin
  //filtra somene pelo clliente
  if (edit1.Text <> '') and (dataini.Text = '') and (datafi.Text = '') or
    (dataini.Text = '  /  /    ') or (datafi.Text = '  /  /    ') then
  begin
    case (Tipo.ItemIndex) of
      0:
        begin
          with contasreceber do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_RECEBER');
            SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CLIENTE =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('codigo').AsString := '0';
            ParamByName('ID').AsString := edit1.Text;
            Open;
            label8.Caption := 'Contas a receber encontradas.: ' +
              intTostr(contasreceber.RecordCount);

            total := 0;
            contasreceber.Last;
            contasreceber.First;

            if not contasreceber.Eof then
            begin
              repeat
                total := contasreceber['VALOR'] + total;
                contasreceber.Next;
              until contasreceber.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contasreceber.First;
          end;
          bitbtn11.Visible := false;
          bitbtn10.Visible := true;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      1:
        begin
          with contasreceber do
          begin
            Close;
            SQL.Text :=
              'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_CLIENTE =:ID';
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('Hoje').AsDate := Date;
            ParamByName('codigo').Text := '0';
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a receber encontradas.: ' +
              intTostr(contasreceber.RecordCount);

            total := 0;
            contasreceber.Last;
            contasreceber.First;

            if not contasreceber.Eof then
            begin
              repeat
                total := contasreceber['VALOR'] + total;
                contasreceber.Next;
              until contasreceber.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contasreceber.First;
          end;
          bitbtn11.Visible := false;
          bitbtn10.Visible := true;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      2:
        begin
          with contasreceber do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_RECEBER');
            SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CLIENTE =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('codigo').AsString := '2';
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a receber encontradas.: ' +
              intTostr(contasreceber.RecordCount);

            total := 0;
            contasreceber.Last;
            contasreceber.First;

            if not contasreceber.Eof then
            begin
              repeat
                total := contasreceber['VALOR_TOTAL'] + total;
                contasreceber.Next;
              until contasreceber.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contasreceber.First;
          end;
          bitbtn11.Visible := true;
          bitbtn10.Visible := false;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      3:
        begin
          with contasreceber do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_RECEBER');
            SQL.Add('Where ID_CLIENTE =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a receber encontradas.: ' +
              intTostr(contasreceber.RecordCount);

            total := 0;
            contasreceber.Last;
            contasreceber.First;

            if not contasreceber.Eof then
            begin
              repeat
                total := contasreceber['VALOR'] + total;
                contasreceber.Next;
              until contasreceber.Eof;
            end;
            //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
            Label9.Caption := '';
            contasreceber.First;
          end;
          bitbtn11.Enabled := false;
          bitbtn10.Enabled := false;
        end;
    end;
  end
  else
  begin
    //filtra pelo cliente + periodo
    if (edit1.Text <> '') and (dataini.Text <> '') and (datafi.Text <> '') then
    begin
      case (Tipo.ItemIndex) of
        0:
          begin
            with contasreceber do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_RECEBER');
              SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CLIENTE =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('codigo').AsString := '0';
              ParamByName('ID').AsString := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a receber encontradas.: ' +
                intTostr(contasreceber.RecordCount);

              total := 0;
              contasreceber.Last;
              contasreceber.First;

              if not contasreceber.Eof then
              begin
                repeat
                  total := contasreceber['VALOR'] + total;
                  contasreceber.Next;
                until contasreceber.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contasreceber.First;
            end;
            bitbtn11.Visible := false;
            bitbtn10.Visible := true;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        1:
          begin
            with contasreceber do
            begin
              Close;
              SQL.Text :=
                'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_CLIENTE =:ID AND DATA_VENCIMENTO between :inicio AND :fim';
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('Hoje').AsDate := Date;
              ParamByName('codigo').Text := '0';
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a receber encontradas.: ' +
                intTostr(contasreceber.RecordCount);

              total := 0;
              contasreceber.Last;
              contasreceber.First;

              if not contasreceber.Eof then
              begin
                repeat
                  total := contasreceber['VALOR'] + total;
                  contasreceber.Next;
                until contasreceber.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contasreceber.First;
            end;
            bitbtn11.Visible := false;
            bitbtn10.Visible := true;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        2:
          begin
            with contasreceber do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_RECEBER');
              SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CLIENTE =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('codigo').AsString := '2';
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a receber encontradas.: ' +
                intTostr(contasreceber.RecordCount);

              total := 0;
              contasreceber.Last;
              contasreceber.First;

              if not contasreceber.Eof then
              begin
                repeat
                  total := contasreceber['VALOR_TOTAL'] + total;
                  contasreceber.Next;
                until contasreceber.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contasreceber.First;
            end;
            bitbtn11.Visible := true;
            bitbtn10.Visible := false;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        3:
          begin
            with contasreceber do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_RECEBER');
              SQL.Add('Where ID_CLIENTE =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a receber encontradas.: ' +
                intTostr(contasreceber.RecordCount);

              total := 0;
              contasreceber.Last;
              contasreceber.First;

              if not contasreceber.Eof then
              begin
                repeat
                  total := contasreceber['VALOR'] + total;
                  contasreceber.Next;
                until contasreceber.Eof;
              end;
              //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
              Label9.Caption := '';
              contasreceber.First;
            end;
            bitbtn11.Enabled := false;
            bitbtn10.Enabled := false;
          end;
      end;
    end
    else
    begin
      //filtra somente pelo periodo
      if (edit1.Text = '') and (dataini.Text <> '') and (datafi.Text <> '') then
      begin
        case (Tipo.ItemIndex) of
          0:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where STATUS_CODIGO =:codigo AND DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '0';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a receber encontradas.: ' +
                  intTostr(contasreceber.RecordCount);

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
              bitbtn11.Visible := false;
              bitbtn10.Visible := true;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          1:
            begin
              with contasreceber do
              begin
                Close;
                SQL.Text :=
                  'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND DATA_VENCIMENTO between :inicio AND :fim';
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('Hoje').AsDate := Date;
                ParamByName('codigo').Text := '0';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a receber encontradas.: ' +
                  intTostr(contasreceber.RecordCount);

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
              bitbtn11.Visible := false;
              bitbtn10.Visible := true;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          2:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where STATUS_CODIGO =:codigo AND DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '2';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a receber encontradas.: ' +
                  intTostr(contasreceber.RecordCount);

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR_TOTAL'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contasreceber.First;
              end;
              bitbtn11.Visible := true;
              bitbtn10.Visible := false;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          3:
            begin
              with contasreceber do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_RECEBER');
                SQL.Add('Where DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a receber encontradas.: ' +
                  intTostr(contasreceber.RecordCount);

                total := 0;
                contasreceber.Last;
                contasreceber.First;

                if not contasreceber.Eof then
                begin
                  repeat
                    total := contasreceber['VALOR'] + total;
                    contasreceber.Next;
                  until contasreceber.Eof;
                end;
                //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                Label9.Caption := '';
                contasreceber.First;
              end;
              bitbtn11.Enabled := false;
              bitbtn10.Enabled := false;
            end;
        end;
      end
      else
      begin

        //filtra somente por categoria
        if (edit2.Text <> '') then
        begin
          case (Tipo.ItemIndex) of
            0:
              begin
                with contasreceber do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_RECEBER');
                  SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('codigo').AsString := '0';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a receber encontradas.: ' +
                    intTostr(contasreceber.RecordCount);

                  total := 0;
                  contasreceber.Last;
                  contasreceber.First;

                  if not contasreceber.Eof then
                  begin
                    repeat
                      total := contasreceber['VALOR'] + total;
                      contasreceber.Next;
                    until contasreceber.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contasreceber.First;
                end;
                bitbtn11.Visible := false;
                bitbtn10.Visible := true;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            1:
              begin
                with contasreceber do
                begin
                  Close;
                  SQL.Text :=
                    'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_CATEGORIA =:ID';
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('Hoje').AsDate := Date;
                  ParamByName('codigo').Text := '0';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a receber encontradas.: ' +
                    intTostr(contasreceber.RecordCount);

                  total := 0;
                  contasreceber.Last;
                  contasreceber.First;

                  if not contasreceber.Eof then
                  begin
                    repeat
                      total := contasreceber['VALOR'] + total;
                      contasreceber.Next;
                    until contasreceber.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contasreceber.First;
                end;
                bitbtn11.Visible := false;
                bitbtn10.Visible := true;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            2:
              begin
                with contasreceber do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_RECEBER');
                  SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('codigo').AsString := '2';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a receber encontradas.: ' +
                    intTostr(contasreceber.RecordCount);

                  total := 0;
                  contasreceber.Last;
                  contasreceber.First;

                  if not contasreceber.Eof then
                  begin
                    repeat
                      total := contasreceber['VALOR_TOTAL'] + total;
                      contasreceber.Next;
                    until contasreceber.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contasreceber.First;
                end;
                bitbtn11.Visible := true;
                bitbtn10.Visible := false;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            3:
              begin
                with contasreceber do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_RECEBER');
                  SQL.Add('Where ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a receber encontradas.: ' +
                    intTostr(contasreceber.RecordCount);

                  total := 0;
                  contasreceber.Last;
                  contasreceber.First;

                  if not contasreceber.Eof then
                  begin
                    repeat
                      total := contasreceber['VALOR'] + total;
                      contasreceber.Next;
                    until contasreceber.Eof;
                  end;
                  //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                  Label9.Caption := '';
                  contasreceber.First;
                end;
                bitbtn11.Enabled := false;
                bitbtn10.Enabled := false;
              end;
          end;
        end
        else
        begin
          //filtra somente por sub-categoria
          if (edit3.Text <> '') then
          begin
            case (Tipo.ItemIndex) of
              0:
                begin
                  with contasreceber do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_RECEBER');
                    SQL.Add('Where STATUS_CODIGO =:codigo AND ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('codigo').AsString := '0';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a receber encontradas.: ' +
                      intTostr(contasreceber.RecordCount);

                    total := 0;
                    contasreceber.Last;
                    contasreceber.First;

                    if not contasreceber.Eof then
                    begin
                      repeat
                        total := contasreceber['VALOR'] + total;
                        contasreceber.Next;
                      until contasreceber.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contasreceber.First;
                  end;
                  bitbtn11.Visible := false;
                  bitbtn10.Visible := true;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              1:
                begin
                  with contasreceber do
                  begin
                    Close;
                    SQL.Text :=
                      'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_SUB_CATEGORIA =:ID';
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('Hoje').AsDate := Date;
                    ParamByName('codigo').Text := '0';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a receber encontradas.: ' +
                      intTostr(contasreceber.RecordCount);

                    total := 0;
                    contasreceber.Last;
                    contasreceber.First;

                    if not contasreceber.Eof then
                    begin
                      repeat
                        total := contasreceber['VALOR'] + total;
                        contasreceber.Next;
                      until contasreceber.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contasreceber.First;
                  end;
                  bitbtn11.Visible := false;
                  bitbtn10.Visible := true;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              2:
                begin
                  with contasreceber do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_RECEBER');
                    SQL.Add('Where STATUS_CODIGO =:codigo AND ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('codigo').AsString := '2';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a receber encontradas.: ' +
                      intTostr(contasreceber.RecordCount);

                    total := 0;
                    contasreceber.Last;
                    contasreceber.First;

                    if not contasreceber.Eof then
                    begin
                      repeat
                        total := contasreceber['VALOR_TOTAL'] + total;
                        contasreceber.Next;
                      until contasreceber.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contasreceber.First;
                  end;
                  bitbtn11.Visible := true;
                  bitbtn10.Visible := false;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              3:
                begin
                  with contasreceber do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_RECEBER');
                    SQL.Add('Where ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a receber encontradas.: ' +
                      intTostr(contasreceber.RecordCount);

                    total := 0;
                    contasreceber.Last;
                    contasreceber.First;

                    if not contasreceber.Eof then
                    begin
                      repeat
                        total := contasreceber['VALOR'] + total;
                        contasreceber.Next;
                      until contasreceber.Eof;
                    end;
                    //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                    Label9.Caption := '';
                    contasreceber.First;
                  end;
                  bitbtn11.Enabled := false;
                  bitbtn10.Enabled := false;
                end;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfrmLctoCRManutencao.BitBtn8Click(Sender: TObject);
var
  total: Real;
begin
  edit1.Text := '';
  FORNECEDOR.Text := '';
  dataini.Text := '';
  datafi.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
  edit5.Text := '';

  case (Tipo.ItemIndex) of
    0:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '0';
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
      end;

    1:
      begin
        with contasreceber do
        begin
          Close;
          SQL.Text :=
            'SELECT * FROM CONTAS_RECEBER WHERE DATA_VENCIMENTO <= :Hoje';
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('Hoje').AsDate := Date;
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
      end;

    2:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '2';
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Visible := true;
        bitbtn10.Visible := false;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
      end;

    3:
      begin
        with contasreceber do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_RECEBER');
          SQL.Add('Order by DATA_VENCIMENTO');
          Open;
          label8.Caption := 'Contas a receber encontradas.: ' +
            intTostr(contasreceber.RecordCount);

          total := 0;
          contasreceber.Last;
          contasreceber.First;

          if not contasreceber.Eof then
          begin
            repeat
              total := contasreceber['VALOR'] + total;
              contasreceber.Next;
            until contasreceber.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contasreceber.First;
        end;
        bitbtn11.Enabled := false;
        bitbtn10.Enabled := false;
      end;
  end;
end;

procedure TfrmLctoCRManutencao.DBEdit5Change(Sender: TObject);
begin
  t1.Filtered := false;
  t1.Filter := 'CODLCTO = ' +
    QuotedStr(contasreceber.FIELDBYNAME('ID_CLIENTE').ASSTRING);
  t1.Filtered := True;
  t1.Open;
  label10.Caption := T1['NOMEJOGO'];
end;

end.

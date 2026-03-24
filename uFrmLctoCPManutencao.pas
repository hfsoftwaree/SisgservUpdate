unit uFrmLctoCPManutencao;

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
  TfrmLctoCPManutencao = class(TForm)
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
    contaspagar: TIBQuery;
    contaspagarID_CODIGO: TIntegerField;
    contaspagarDATA_EMISSAO: TDateField;
    contaspagarDATA_VENCIMENTO: TDateField;
    contaspagarID_FORNECEDOR: TIntegerField;
    contaspagarNOME_FORNECEDOR: TIBStringField;
    contaspagarHISTORICO: TIBStringField;
    contaspagarID_CATEGORIA: TIBBCDField;
    contaspagarNOME_CATEGORIA: TIBStringField;
    contaspagarID_SUB_CATEGORIA: TIBBCDField;
    contaspagarNOME_SUB_CATEGORIA: TIBStringField;
    contaspagarDOCUMENTO: TIBStringField;
    contaspagarVALOR: TFloatField;
    contaspagarSELECAO: TIBStringField;
    contaspagarJURO: TFloatField;
    contaspagarMULTA: TFloatField;
    contaspagarVALOR_TOTAL: TFloatField;
    contaspagarDATA_PAGAMENTO: TDateField;
    contaspagarSTATUS_CODIGO: TIBStringField;
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
    tableID_CODIGO: TIntegerField;
    tableDATA_EMISSAO: TDateField;
    tableDATA_VENCIMENTO: TDateField;
    tableID_FORNECEDOR: TIntegerField;
    tableNOME_FORNECEDOR: TIBStringField;
    tableHISTORICO: TIBStringField;
    tableID_CATEGORIA: TIBBCDField;
    tableNOME_CATEGORIA: TIBStringField;
    tableID_SUB_CATEGORIA: TIBBCDField;
    tableNOME_SUB_CATEGORIA: TIBStringField;
    tableDOCUMENTO: TIBStringField;
    tableVALOR: TFloatField;
    tableSELECAO: TIBStringField;
    tableJURO: TFloatField;
    tableMULTA: TFloatField;
    tableVALOR_TOTAL: TFloatField;
    tableDATA_PAGAMENTO: TDateField;
    tableSTATUS_CODIGO: TIBStringField;
    tableDESC: TFloatField;
    contaspagarDESC: TFloatField;
    Label8: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure contaspagarAfterOpen(DataSet: TDataSet);
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
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoCPManutencao: TfrmLctoCPManutencao;

implementation

uses
  uFrmConCategoriaPesquisa,
  uFrmLctoContasPagar,
  uFrmLctoContasPagarQuitar,
  uFrmLctoCPPesquisaFor,
  uFrmCadSubCategoriaPesq,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoCPManutencao.BitBtn3Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmConCategoriaPesquisa, frmConCategoriaPesquisa);
    frmConCategoriaPesquisa.ShowModal;
  finally
    frmConCategoriaPesquisa.Free;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn9Click(Sender: TObject);
begin

  Close;
end;

procedure TfrmLctoCPManutencao.FormShow(Sender: TObject);
var
  total: Real;
begin
  if frmLctoCPManutencao.Tag <> 11 then
  begin
    with contaspagar do
    begin
      close;
      SQL.Clear;
      SQL.Add('Select * from CONTAS_PAGAR');
      SQL.Add('Where STATUS_CODIGO =:codigo');
      SQL.Add('Order by DATA_VENCIMENTO');
      ParamByName('codigo').AsString := '0';
      Open;
      label8.Caption := 'Contas a pagar encontradas.: ' +
        intTostr(contaspagar.RecordCount);
    end;

    total := 0;
    //      contaspagar.Last;
    contaspagar.First;

    if not contaspagar.Eof then
    begin
      repeat
        total := contaspagar['VALOR'] + total;
        contaspagar.Next;
      until contaspagar.Eof;
    end;
    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
    contaspagar.First;
  end
  else
  begin
    if frmLctoCPManutencao.Tag = 11 then
    begin

    end;
  end;
end;

procedure TfrmLctoCPManutencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.Tag := 0;
  contaspagar.Close;
end;

procedure TfrmLctoCPManutencao.BitBtn5Click(Sender: TObject);
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
      Application.CreateForm(TfrmLctoContasPagar, frmLctoContasPagar);
      frmLctoContasPagar.ShowModal;
    finally
      frmLctoContasPagar.Free;
    end;
  end;
end;

procedure TfrmLctoCPManutencao.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  if tipo.ItemIndex = 0 then
  begin
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    with contaspagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_PAGAR');
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
    with contaspagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_PAGAR');
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
    with contaspagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_PAGAR');
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
    with contaspagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CONTAS_PAGAR');
      SQL.Add('ORDER BY ' + Column.FieldName);
      Column.Title.Font.Style := [fsBold];
      Open;
    end;
  end;

end;

procedure TfrmLctoCPManutencao.contaspagarAfterOpen(
  DataSet: TDataSet);
begin
  TFloatField(contaspagar.FieldByName('VALOR')).DisplayFormat := ',0.00';

end;

procedure TfrmLctoCPManutencao.tipoClick(Sender: TObject);
var
  total: Real;
begin
  case (Tipo.ItemIndex) of
    0:
      begin
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '0';
          Open;
          label8.Caption := 'Contas a pagar encontradas.: ' +
            intTostr(contaspagar.RecordCount);

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := true;
      end;

    1:
      begin
        with contaspagar do
        begin
          Close;
          SQL.Text :=
            'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo';
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('Hoje').AsDate := Date;
          ParamByName('codigo').Text := '0';
          Open;
          label8.Caption := 'Contas a pagar encontradas.: ' +
            intTostr(contaspagar.RecordCount);

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
        bitbtn11.Visible := false;
        bitbtn10.Visible := true;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := true;
      end;

    2:
      begin
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '2';
          Open;
          label8.Caption := 'Contas a pagar encontradas.: ' +
            intTostr(contaspagar.RecordCount);

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR_TOTAL'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
        bitbtn11.Visible := true;
        bitbtn10.Visible := false;
        bitbtn11.Enabled := true;
        bitbtn10.Enabled := true;
        bitbtn2.Enabled := false;
      end;

    3:
      begin
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Order by DATA_VENCIMENTO');
          Open;
          label8.Caption := 'Contas a pagar encontradas.: ' +
            intTostr(contaspagar.RecordCount);

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
          Label9.Caption := '';
          contaspagar.First;
        end;
        bitbtn11.Enabled := false;
        bitbtn10.Enabled := false;
        bitbtn2.Enabled := false;
      end;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn2Click(Sender: TObject);
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
      Application.CreateForm(TfrmLctoContasPagar, frmLctoContasPagar);
      frmLctoContasPagar.ShowModal;
    finally
      frmLctoContasPagar.Free;
    end;
  end;
end;

procedure TfrmLctoCPManutencao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;
end;

procedure TfrmLctoCPManutencao.BitBtn6Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if contaspagar.RecordCount = 0 then
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
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('DELETE from CONTAS_PAGAR Where ID_CODIGO =:codigo');
          ParamByName('codigo').AsInteger := StrToInt(edit6.text);
          ExecSQL;
        end;

        case (Tipo.ItemIndex) of
          0:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '0';
                Open;
              end;
            end;

          1:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '1';
                Open;
              end;
            end;

          2:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where STATUS_CODIGO =:codigo');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '2';
                Open;
              end;
            end;

          3:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Order by DATA_VENCIMENTO');
                Open;
              end;
            end;
        end;
      end;
    end;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn17Click(Sender: TObject);
begin
  contaspagar.First;
end;

procedure TfrmLctoCPManutencao.BitBtn18Click(Sender: TObject);
begin
  contaspagar.Prior;
end;

procedure TfrmLctoCPManutencao.BitBtn19Click(Sender: TObject);
begin
  contaspagar.Next;
end;

procedure TfrmLctoCPManutencao.BitBtn20Click(Sender: TObject);
begin
  contaspagar.Last;
end;

procedure TfrmLctoCPManutencao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if contaspagar.RecordCount <> 0 then
  begin
    if contaspagar.FieldByName('STATUS_CODIGO').Text <> '0' then
    begin
      dbgrid1.Canvas.Font.Style := [fsbold];
      dbgrid1.Canvas.Brush.Color := $008CFF8C;
      //    $0080FF00
      dbgrid1.DefaultDrawColumnCell(rect, datacol, column, state);
    end
    else
    begin
      dbgrid1.Canvas.Font.Style := [fsbold];
      dbgrid1.Canvas.Brush.Color := $005353FF;
      //    $000080FF;
      dbgrid1.DefaultDrawColumnCell(rect, datacol, column, state);
    end;

    if gdSelected in State then
    begin
      DBGrid1.Canvas.Brush.Color := $00FF9B37;
      DBGrid1.Canvas.Font.Color := clwhite;
    end;
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, state);

    if contaspagar.RecordCount = 0 then
    begin

    end;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn4Click(Sender: TObject);
begin
  self.Tag := 11;
  try
    Application.CreateForm(TfrmLctoCPPesquisaForn, frmLctoCPPesquisaForn);
    frmLctoCPPesquisaForn.ShowModal;
  finally
    frmLctoCPPesquisaForn.Free;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn1Click(Sender: TObject);
begin
  try
    self.tag := 1;
    Application.CreateForm(TfrmCadSubCategoriaPesq, frmCadSubCategoriaPesq);
    frmCadSubCategoriaPesq.ShowModal;
  finally
    frmCadSubCategoriaPesq.Free;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn7Click(Sender: TObject);
var
  total: Real;
begin
  //filtra somene pelo fornecedor
  if (edit1.Text <> '') and (dataini.Text = '') and (datafi.Text = '') or
    (dataini.Text = '  /  /    ') or (datafi.Text = '  /  /    ') then
  begin
    case (Tipo.ItemIndex) of
      0:
        begin
          with contaspagar do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_PAGAR');
            SQL.Add('Where STATUS_CODIGO =:codigo AND ID_FORNECEDOR =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('codigo').AsString := '0';
            ParamByName('ID').AsString := edit1.Text;
            Open;
            label8.Caption := 'Contas a pagar encontradas.: ' +
              intTostr(contaspagar.RecordCount);

            total := 0;
            contaspagar.Last;
            contaspagar.First;

            if not contaspagar.Eof then
            begin
              repeat
                total := contaspagar['VALOR'] + total;
                contaspagar.Next;
              until contaspagar.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contaspagar.First;
          end;
          bitbtn11.Visible := false;
          bitbtn10.Visible := true;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      1:
        begin
          with contaspagar do
          begin
            Close;
            SQL.Text :=
              'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_FORNECEDOR =:ID';
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('Hoje').AsDate := Date;
            ParamByName('codigo').Text := '0';
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a pagar encontradas.: ' +
              intTostr(contaspagar.RecordCount);

            total := 0;
            contaspagar.Last;
            contaspagar.First;

            if not contaspagar.Eof then
            begin
              repeat
                total := contaspagar['VALOR'] + total;
                contaspagar.Next;
              until contaspagar.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contaspagar.First;
          end;
          bitbtn11.Visible := false;
          bitbtn10.Visible := true;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      2:
        begin
          with contaspagar do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_PAGAR');
            SQL.Add('Where STATUS_CODIGO =:codigo AND ID_FORNECEDOR =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('codigo').AsString := '2';
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a pagar encontradas.: ' +
              intTostr(contaspagar.RecordCount);

            total := 0;
            contaspagar.Last;
            contaspagar.First;

            if not contaspagar.Eof then
            begin
              repeat
                total := contaspagar['VALOR_TOTAL'] + total;
                contaspagar.Next;
              until contaspagar.Eof;
            end;
            Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
            contaspagar.First;
          end;
          bitbtn11.Visible := true;
          bitbtn10.Visible := false;
          bitbtn11.Enabled := true;
          bitbtn10.Enabled := true;
        end;

      3:
        begin
          with contaspagar do
          begin
            close;
            SQL.Clear;
            SQL.Add('Select * from CONTAS_PAGAR');
            SQL.Add('Where ID_FORNECEDOR =:ID');
            SQL.Add('Order by DATA_VENCIMENTO');
            ParamByName('ID').Text := edit1.Text;
            Open;
            label8.Caption := 'Contas a pagar encontradas.: ' +
              intTostr(contaspagar.RecordCount);

            total := 0;
            contaspagar.Last;
            contaspagar.First;

            if not contaspagar.Eof then
            begin
              repeat
                total := contaspagar['VALOR'] + total;
                contaspagar.Next;
              until contaspagar.Eof;
            end;
            //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
            Label9.Caption := '';
            contaspagar.First;
          end;
          bitbtn11.Enabled := false;
          bitbtn10.Enabled := false;
        end;
    end;
  end
  else
  begin
    //filtra pelo fornecedor + periodo
    if (edit1.Text <> '') and (dataini.Text <> '') and (datafi.Text <> '') then
    begin
      case (Tipo.ItemIndex) of
        0:
          begin
            with contaspagar do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_PAGAR');
              SQL.Add('Where STATUS_CODIGO =:codigo AND ID_FORNECEDOR =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('codigo').AsString := '0';
              ParamByName('ID').AsString := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a pagar encontradas.: ' +
                intTostr(contaspagar.RecordCount);

              total := 0;
              contaspagar.Last;
              contaspagar.First;

              if not contaspagar.Eof then
              begin
                repeat
                  total := contaspagar['VALOR'] + total;
                  contaspagar.Next;
                until contaspagar.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contaspagar.First;
            end;
            bitbtn11.Visible := false;
            bitbtn10.Visible := true;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        1:
          begin
            with contaspagar do
            begin
              Close;
              SQL.Text :=
                'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_FORNECEDOR =:ID AND DATA_VENCIMENTO between :inicio AND :fim';
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('Hoje').AsDate := Date;
              ParamByName('codigo').Text := '0';
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a pagar encontradas.: ' +
                intTostr(contaspagar.RecordCount);

              total := 0;
              contaspagar.Last;
              contaspagar.First;

              if not contaspagar.Eof then
              begin
                repeat
                  total := contaspagar['VALOR'] + total;
                  contaspagar.Next;
                until contaspagar.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contaspagar.First;
            end;
            bitbtn11.Visible := false;
            bitbtn10.Visible := true;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        2:
          begin
            with contaspagar do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_PAGAR');
              SQL.Add('Where STATUS_CODIGO =:codigo AND ID_FORNECEDOR =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('codigo').AsString := '2';
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a pagar encontradas.: ' +
                intTostr(contaspagar.RecordCount);

              total := 0;
              contaspagar.Last;
              contaspagar.First;

              if not contaspagar.Eof then
              begin
                repeat
                  total := contaspagar['VALOR_TOTAL'] + total;
                  contaspagar.Next;
                until contaspagar.Eof;
              end;
              Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
              contaspagar.First;
            end;
            bitbtn11.Visible := true;
            bitbtn10.Visible := false;
            bitbtn11.Enabled := true;
            bitbtn10.Enabled := true;
          end;

        3:
          begin
            with contaspagar do
            begin
              close;
              SQL.Clear;
              SQL.Add('Select * from CONTAS_PAGAR');
              SQL.Add('Where ID_FORNECEDOR =:ID AND DATA_VENCIMENTO between :inicio AND :fim');
              SQL.Add('Order by DATA_VENCIMENTO');
              ParamByName('ID').Text := edit1.Text;
              ParamByName('inicio').AsDateTime := dataini.DateValue;
              // preenche o parametro 'inicio'
              ParamByName('fim').AsDateTime := datafi.DateValue;
              // preenche o parametro 'fim'
              Open;
              label8.Caption := 'Contas a pagar encontradas.: ' +
                intTostr(contaspagar.RecordCount);

              total := 0;
              contaspagar.Last;
              contaspagar.First;

              if not contaspagar.Eof then
              begin
                repeat
                  total := contaspagar['VALOR'] + total;
                  contaspagar.Next;
                until contaspagar.Eof;
              end;
              //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
              Label9.Caption := '';
              contaspagar.First;
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
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where STATUS_CODIGO =:codigo AND DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '0';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a pagar encontradas.: ' +
                  intTostr(contaspagar.RecordCount);

                total := 0;
                contaspagar.Last;
                contaspagar.First;

                if not contaspagar.Eof then
                begin
                  repeat
                    total := contaspagar['VALOR'] + total;
                    contaspagar.Next;
                  until contaspagar.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contaspagar.First;
              end;
              bitbtn11.Visible := false;
              bitbtn10.Visible := true;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          1:
            begin
              with contaspagar do
              begin
                Close;
                SQL.Text :=
                  'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND DATA_VENCIMENTO between :inicio AND :fim';
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('Hoje').AsDate := Date;
                ParamByName('codigo').Text := '0';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a pagar encontradas.: ' +
                  intTostr(contaspagar.RecordCount);

                total := 0;
                contaspagar.Last;
                contaspagar.First;

                if not contaspagar.Eof then
                begin
                  repeat
                    total := contaspagar['VALOR'] + total;
                    contaspagar.Next;
                  until contaspagar.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contaspagar.First;
              end;
              bitbtn11.Visible := false;
              bitbtn10.Visible := true;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          2:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where STATUS_CODIGO =:codigo AND DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('codigo').AsString := '2';
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a pagar encontradas.: ' +
                  intTostr(contaspagar.RecordCount);

                total := 0;
                contaspagar.Last;
                contaspagar.First;

                if not contaspagar.Eof then
                begin
                  repeat
                    total := contaspagar['VALOR_TOTAL'] + total;
                    contaspagar.Next;
                  until contaspagar.Eof;
                end;
                Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                contaspagar.First;
              end;
              bitbtn11.Visible := true;
              bitbtn10.Visible := false;
              bitbtn11.Enabled := true;
              bitbtn10.Enabled := true;
            end;

          3:
            begin
              with contaspagar do
              begin
                close;
                SQL.Clear;
                SQL.Add('Select * from CONTAS_PAGAR');
                SQL.Add('Where DATA_VENCIMENTO between :inicio AND :fim');
                SQL.Add('Order by DATA_VENCIMENTO');
                ParamByName('inicio').AsDateTime := dataini.DateValue;
                // preenche o parametro 'inicio'
                ParamByName('fim').AsDateTime := datafi.DateValue;
                // preenche o parametro 'fim'
                Open;
                label8.Caption := 'Contas a pagar encontradas.: ' +
                  intTostr(contaspagar.RecordCount);

                total := 0;
                contaspagar.Last;
                contaspagar.First;

                if not contaspagar.Eof then
                begin
                  repeat
                    total := contaspagar['VALOR'] + total;
                    contaspagar.Next;
                  until contaspagar.Eof;
                end;
                //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                Label9.Caption := '';
                contaspagar.First;
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
                with contaspagar do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_PAGAR');
                  SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('codigo').AsString := '0';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a pagar encontradas.: ' +
                    intTostr(contaspagar.RecordCount);

                  total := 0;
                  contaspagar.Last;
                  contaspagar.First;

                  if not contaspagar.Eof then
                  begin
                    repeat
                      total := contaspagar['VALOR'] + total;
                      contaspagar.Next;
                    until contaspagar.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contaspagar.First;
                end;
                bitbtn11.Visible := false;
                bitbtn10.Visible := true;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            1:
              begin
                with contaspagar do
                begin
                  Close;
                  SQL.Text :=
                    'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_CATEGORIA =:ID';
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('Hoje').AsDate := Date;
                  ParamByName('codigo').Text := '0';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a pagar encontradas.: ' +
                    intTostr(contaspagar.RecordCount);

                  total := 0;
                  contaspagar.Last;
                  contaspagar.First;

                  if not contaspagar.Eof then
                  begin
                    repeat
                      total := contaspagar['VALOR'] + total;
                      contaspagar.Next;
                    until contaspagar.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contaspagar.First;
                end;
                bitbtn11.Visible := false;
                bitbtn10.Visible := true;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            2:
              begin
                with contaspagar do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_PAGAR');
                  SQL.Add('Where STATUS_CODIGO =:codigo AND ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('codigo').AsString := '2';
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a pagar encontradas.: ' +
                    intTostr(contaspagar.RecordCount);

                  total := 0;
                  contaspagar.Last;
                  contaspagar.First;

                  if not contaspagar.Eof then
                  begin
                    repeat
                      total := contaspagar['VALOR_TOTAL'] + total;
                      contaspagar.Next;
                    until contaspagar.Eof;
                  end;
                  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                  contaspagar.First;
                end;
                bitbtn11.Visible := true;
                bitbtn10.Visible := false;
                bitbtn11.Enabled := true;
                bitbtn10.Enabled := true;
              end;

            3:
              begin
                with contaspagar do
                begin
                  close;
                  SQL.Clear;
                  SQL.Add('Select * from CONTAS_PAGAR');
                  SQL.Add('Where ID_CATEGORIA =:ID');
                  SQL.Add('Order by DATA_VENCIMENTO');
                  ParamByName('ID').AsString := Edit2.Text;
                  Open;
                  label8.Caption := 'Contas a pagar encontradas.: ' +
                    intTostr(contaspagar.RecordCount);

                  total := 0;
                  contaspagar.Last;
                  contaspagar.First;

                  if not contaspagar.Eof then
                  begin
                    repeat
                      total := contaspagar['VALOR'] + total;
                      contaspagar.Next;
                    until contaspagar.Eof;
                  end;
                  //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                  Label9.Caption := '';
                  contaspagar.First;
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
                  with contaspagar do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_PAGAR');
                    SQL.Add('Where STATUS_CODIGO =:codigo AND ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('codigo').AsString := '0';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a pagar encontradas.: ' +
                      intTostr(contaspagar.RecordCount);

                    total := 0;
                    contaspagar.Last;
                    contaspagar.First;

                    if not contaspagar.Eof then
                    begin
                      repeat
                        total := contaspagar['VALOR'] + total;
                        contaspagar.Next;
                      until contaspagar.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contaspagar.First;
                  end;
                  bitbtn11.Visible := false;
                  bitbtn10.Visible := true;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              1:
                begin
                  with contaspagar do
                  begin
                    Close;
                    SQL.Text :=
                      'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje AND STATUS_CODIGO = :codigo AND ID_SUB_CATEGORIA =:ID';
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('Hoje').AsDate := Date;
                    ParamByName('codigo').Text := '0';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a pagar encontradas.: ' +
                      intTostr(contaspagar.RecordCount);

                    total := 0;
                    contaspagar.Last;
                    contaspagar.First;

                    if not contaspagar.Eof then
                    begin
                      repeat
                        total := contaspagar['VALOR'] + total;
                        contaspagar.Next;
                      until contaspagar.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contaspagar.First;
                  end;
                  bitbtn11.Visible := false;
                  bitbtn10.Visible := true;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              2:
                begin
                  with contaspagar do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_PAGAR');
                    SQL.Add('Where STATUS_CODIGO =:codigo AND ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('codigo').AsString := '2';
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a pagar encontradas.: ' +
                      intTostr(contaspagar.RecordCount);

                    total := 0;
                    contaspagar.Last;
                    contaspagar.First;

                    if not contaspagar.Eof then
                    begin
                      repeat
                        total := contaspagar['VALOR_TOTAL'] + total;
                        contaspagar.Next;
                      until contaspagar.Eof;
                    end;
                    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
                    contaspagar.First;
                  end;
                  bitbtn11.Visible := true;
                  bitbtn10.Visible := false;
                  bitbtn11.Enabled := true;
                  bitbtn10.Enabled := true;
                end;

              3:
                begin
                  with contaspagar do
                  begin
                    close;
                    SQL.Clear;
                    SQL.Add('Select * from CONTAS_PAGAR');
                    SQL.Add('Where ID_SUB_CATEGORIA =:ID');
                    SQL.Add('Order by DATA_VENCIMENTO');
                    ParamByName('ID').AsString := Edit3.Text;
                    Open;
                    label8.Caption := 'Contas a pagar encontradas.: ' +
                      intTostr(contaspagar.RecordCount);

                    total := 0;
                    contaspagar.Last;
                    contaspagar.First;

                    if not contaspagar.Eof then
                    begin
                      repeat
                        total := contaspagar['VALOR'] + total;
                        contaspagar.Next;
                      until contaspagar.Eof;
                    end;
                    //        Label9.Caption := 'Total.:  '+ FormatCurr('#0.00',total);
                    Label9.Caption := '';
                    contaspagar.First;
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

procedure TfrmLctoCPManutencao.BitBtn8Click(Sender: TObject);
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
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '0';
          Open;

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
      end;

    1:
      begin
        with contaspagar do
        begin
          Close;
          SQL.Text :=
            'SELECT * FROM CONTAS_PAGAR WHERE DATA_VENCIMENTO <= :Hoje';
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('Hoje').AsDate := Date;
          Open;

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;

        end;
      end;

    2:
      begin
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Where STATUS_CODIGO =:codigo');
          SQL.Add('Order by DATA_VENCIMENTO');
          ParamByName('codigo').AsString := '2';
          Open;

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
      end;

    3:
      begin
        with contaspagar do
        begin
          close;
          SQL.Clear;
          SQL.Add('Select * from CONTAS_PAGAR');
          SQL.Add('Order by DATA_VENCIMENTO');
          Open;

          total := 0;
          contaspagar.Last;
          contaspagar.First;

          if not contaspagar.Eof then
          begin
            repeat
              total := contaspagar['VALOR'] + total;
              contaspagar.Next;
            until contaspagar.Eof;
          end;
          Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
          contaspagar.First;
        end;
      end;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn10Click(Sender: TObject);
begin
  try
    SELF.Tag := 3;
    Application.CreateForm(TfrmLctoContasPagarQuitar, frmLctoContasPagarQuitar);
    frmLctoContasPagarQuitar.ShowModal;
  finally
    frmLctoContasPagarQuitar.Free;
  end;
end;

procedure TfrmLctoCPManutencao.BitBtn11Click(Sender: TObject);
var
  total: Real;
begin
  //TABLE CONTAS PAGAR
  table.close;
  table.Filtered := false;
  table.Filter := 'ID_CODIGO = ' +
    QuotedStr(CONTASPAGAR.FIELDBYNAME('ID_CODIGO').ASSTRING);
  table.Filtered := True;
  table.Open;

  if
    Application.MessageBox('Ao prosseguir o registro selecionado será estornado. Continua?', 'Confirmação',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    table.Edit;
    table['DATA_PAGAMENTO'] := null;
    table['JURO'] := null;
    table['MULTA'] := null;
    table['DESC'] := null;
    table['VALOR_TOTAL'] := null;
    table['STATUS_CODIGO'] := '0';
    table.Post;
    table.Filtered := false;
    table.Close;

    with contaspagar do
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
    contaspagar.First;

    if not contaspagar.Eof then
    begin
      repeat
        total := contaspagar['VALOR'] + total;
        contaspagar.Next;
      until contaspagar.Eof;
    end;
    Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
    contaspagar.First;

  end;
  with contaspagar do
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
  contaspagar.First;

  if not contaspagar.Eof then
  begin
    repeat
      total := contaspagar['VALOR'] + total;
      contaspagar.Next;
    until contaspagar.Eof;
  end;
  Label9.Caption := 'Total.:  ' + FormatCurr('#0.00', total);
  contaspagar.First;

end;
end.

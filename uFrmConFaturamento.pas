unit uFrmConFaturamento;

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
  EDBNum,
  DBCtrls,
  ExtCtrls,
  Buttons,
  DB,
  IBCustomDataSet,
  IBTable,
  jpeg,
  Gauges,
  EDateEd,
  Grids,
  DBGrids,
  DbPrgrss,
  SSBaseXP,
  RxLookup;

type
  TfrmConFaturamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel2: TBevel;
    label5: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Tipo: TRadioGroup;
    Image1: TImage;
    Gauge1: TGauge;
    periodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dataini: TEvDateEdit;
    datafi: TEvDateEdit;
    TABLE: TIBTable;
    TABLECODLCTO: TIntegerField;
    TABLECODSERV: TFloatField;
    TABLESERVIDOR: TIBStringField;
    TABLECODTIPOITEM: TFloatField;
    TABLETIPOITEM: TIBStringField;
    TABLECODITEM: TFloatField;
    TABLEITEM: TIBStringField;
    TABLEVALPAGO: TFloatField;
    TABLEDTACOMPRA: TDateTimeField;
    TABLEDTASEGURO: TDateTimeField;
    TABLEDTASEGUROREN: TDateTimeField;
    TABLECODSEGUROVENC: TFloatField;
    TABLESEGUROVENCIDO: TIBStringField;
    TABLEQTDEITEM: TFloatField;
    TABLENOMECOMPDISCOR: TIBStringField;
    TABLENOMECOMPJOGO: TIBStringField;
    TABLEREGISTRADOPARA: TIBStringField;
    TABLEPAIS: TIBStringField;
    TABLETERRITORIO: TIBStringField;
    TABLELOCALBASE: TIBStringField;
    TABLEINTEGRANTES: TIBStringField;
    TABLETRANSFITEM: TIBStringField;
    TABLETRANSFITEMPARA: TIBStringField;
    TABLENOMEPAGADOR: TIBStringField;
    TABLEBANCORECEBEDOR: TIBStringField;
    TABLETICKET: TFloatField;
    TABLETICKETLINK: TIBStringField;
    TABLEOBS1: TIBStringField;
    TABLEOBS2: TIBStringField;
    TABLERES1: TIBStringField;
    TABLERES2: TIBStringField;
    TABLERES3: TIBStringField;
    TABLERES4: TIBStringField;
    TABLERES5: TIBStringField;
    TABLERES6: TIBStringField;
    TABLERES7: TIBStringField;
    TABLEDATACADASTRO: TDateTimeField;
    TABLEEXIGESEGCOD: TIBStringField;
    TABLEEXIGSEGNOME: TIBStringField;
    TABLESEGVENCPADRAOCOD: TIBStringField;
    TABLESEGVENCPADRAONOME: TIBStringField;
    TABLENOMECOMPDISCORCOD: TIBStringField;
    TABLEREGISTRADOPARACOD: TIBStringField;
    TABLEBANCORECEBEDORAPEL: TIBStringField;
    TABLEBANCORECEBEDORCOD: TIBStringField;
    TABLEDELITEMVENCCOD: TIBStringField;
    TABLEDELITEMVENCDATA: TIBStringField;
    TABLETIPOLCTOCOD: TIBStringField;
    TABLETIPOLCTONOME: TIBStringField;
    TABLEITEMMODELO: TIBStringField;
    TABLESEGUROTIPOCOD: TIBStringField;
    TABLESEGUROTIPONOME: TIBStringField;
    TABLESTATUSCOD: TIBStringField;
    TABLESTATUSNOME: TIBStringField;
    TABLESTATUSOBS: TIBStringField;
    TABLEITEMID: TIBStringField;
    TABLEITEMNOMECLASSE: TIBStringField;
    TABLEVALDESCONTO: TFloatField;
    TABLEVALTOTAL: TFloatField;
    TABLEITEMREFERENCIA: TIBStringField;
    DS: TDataSource;
    DataFinal: TEdit;
    DataInicial: TEdit;
    ds1: TDataSource;
    table1: TIBTable;
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
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    tipo1: TRadioGroup;
    combobox1: TRxDBLookupCombo;
    Edit1: TEdit;
    table1SERVIDORCOD: TIBStringField;
    table1SERVIDORNOME: TIBStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure datainiChange(Sender: TObject);
    procedure datafiChange(Sender: TObject);
    procedure TipoClick(Sender: TObject);
    procedure datainiExit(Sender: TObject);
    procedure datafiExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tipo1Click(Sender: TObject);
    procedure combobox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConFaturamento: TfrmConFaturamento;

implementation

uses
  uDM;

{$R *.dfm}

class function ListaServidor: TStrings;
begin
  Result := TStringList.Create;
  Result.Clear;
  Result.BeginUpdate;
  with DM.TEssencia do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName('ESSENCIA').AsString);
      Next;
    end;
  end;
  Result.EndUpdate;
end;

function ConverteData(Data: string): string;
begin
  Result := Copy(Data, 4, 3) + Copy(Data, 1, 3) + Copy(Data, 7, 4);
end;

procedure TfrmConFaturamento.BitBtn3Click(Sender: TObject);
var
  total, total1, total2, total3: Real;
begin
  if tipo1.ItemIndex = 0 then
  begin
    case (Tipo.ItemIndex) of
      0:
        begin
          //soma doacao
          table.close;
          table.Filtered := false;
          table.Open;
          table.Last;
          table.First;

          table1.close;
          table1.Filtered := false;

          total := 0;
          gauge1.Visible := true;
          gauge1.MaxValue := 0;
          Gauge1.MaxValue := TABLE.RecordCount;
          if not table.Eof then
          begin
            repeat
              Gauge1.Progress := Gauge1.Progress + 1;
              total := TABLE['VALPAGO'] + total;
              table.Next;
            until table.Eof;
          end;
          label5.Caption := FormatCurr('#0.00', total);
          label5.Visible := true;
          table.First;
          gauge1.Visible := false;
          gauge1.MaxValue := 0;

          //soma contas a receber
          table1.close;
          table1.Filtered := false;
          table1.Filter := 'STATUS_CODIGO = ' + '2';
          table1.Filtered := True;
          table1.Open;

          total1 := 0;
          gauge1.Visible := true;
          gauge1.MaxValue := 0;
          Gauge1.MaxValue := TABLE1.RecordCount;
          if not table1.Eof then
          begin
            repeat
              Gauge1.Progress := Gauge1.Progress + 1;
              total1 := TABLE1['VALOR_TOTAL'] + total1;
              table1.Next;
            until table1.Eof;
          end;
          label6.Caption := FormatCurr('#0.00', total1);
          label6.Visible := true;
          table1.First;
          gauge1.Visible := false;
          gauge1.MaxValue := 0;

          //soma doacao + contas a receber
          label8.caption := FormatCurr('#0.00', total + total1);
        end;
    end;

    case (Tipo.ItemIndex) of
      1:
        begin
          if (DataInicial.Text = '') or (DataFinal.Text = '') then
          begin
            Application.MessageBox('Para o tipo de consulta selecionado o período deve ser informado!', 'Informação', mb_Ok + mb_IconInformation);
            dataini.SetFocus;
          end
          else
          begin
            if (DataInicial.Text <> '') and (DataFinal.Text <> '') then
            begin
              table.close;
              table.Filtered := false;

              table.close;
              table.Filtered := false;
              table.Filter := 'DTACOMPRA >= ' + QuotedStr(datainicial.Text) +
                'and DTACOMPRA <= ' + QuotedStr(datafinal.Text);
              table.Filtered := True;
              table.Open;

              if table.RecordCount <> 0 then
              begin
                //soma doacao
                total := 0;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := TABLE.RecordCount;
                if not table.Eof then
                begin
                  repeat
                    Gauge1.Progress := Gauge1.Progress + 1;
                    total := TABLE['VALPAGO'] + total;
                    table.Next;
                  until table.Eof;
                end;
                label5.Caption := FormatCurr('#0.00', total);
                label5.Visible := true;
                table.First;
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
              end
              else
              begin
                if table.RecordCount = 0 then
                begin
                  label5.Caption := '0,00';
                end;
              end;

              //soma contas a receber
              table1.close;
              table1.Filtered := false;
              table1.Filter := 'DATA_PAGAMENTO >= ' + QuotedStr(datainicial.Text)
                + 'and DATA_PAGAMENTO <= ' + QuotedStr(datafinal.Text) +
                'and STATUS_CODIGO = ' + '2';
              table1.Filtered := True;
              table1.Open;

              if table1.RecordCount <> 0 then
              begin
                total1 := 0;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := table1.RecordCount;
                if not table1.Eof then
                begin
                  repeat
                    Gauge1.Progress := Gauge1.Progress + 1;
                    total1 := table1['VALOR_TOTAL'] + total1;
                    table1.Next;
                  until table1.Eof;
                end;
                label6.Caption := FormatCurr('#0.00', total1);
                label6.Visible := true;
                table1.First;
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
              end
              else
              begin
                if table1.RecordCount = 0 then
                begin
                  label6.Caption := '0,00';
                end;
              end;

              total2 := 0;
              if not table.Eof then
              begin
                repeat
                  total2 := TABLE['VALPAGO'] + total2;
                  table.Next;
                until table.Eof;
              end;

              total3 := 0;
              if not table1.Eof then
              begin
                repeat
                  total3 := TABLE1['VALOR_TOTAL'] + total3;
                  table1.Next;
                until table1.Eof;
              end;

              label8.Caption := FormatCurr('#0.00', total2 + total3);
            end;
          end;
        end;
    end;
  end
  else
  begin
    if tipo1.ItemIndex = 1 then // por servidor
    begin
      case (Tipo.ItemIndex) of
        0:
          begin
            //soma doacao
            table.close;
            table.Filtered := false;
            table.Filter := 'CODSERV = ' + QuotedStr(Edit1.Text);
            table.Filtered := True;
            table.Open;
            table.Last;
            table.First;

            table1.close;
            table1.Filtered := false;

            total := 0;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := TABLE.RecordCount;
            if not table.Eof then
            begin
              repeat
                Gauge1.Progress := Gauge1.Progress + 1;
                total := TABLE['VALPAGO'] + total;
                table.Next;
              until table.Eof;
            end;
            label5.Caption := FormatCurr('#0.00', total);
            label5.Visible := true;
            table.First;
            gauge1.Visible := false;
            gauge1.MaxValue := 0;

            //soma contas a receber
            table1.close;
            table1.Filtered := false;
            table1.Filter := 'SERVIDORCOD = ' + QuotedStr(Edit1.Text) +
              'AND STATUS_CODIGO = ' + '2';
            table1.Filtered := True;
            table1.Open;

            total1 := 0;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := TABLE1.RecordCount;
            if not table1.Eof then
            begin
              repeat
                Gauge1.Progress := Gauge1.Progress + 1;
                total1 := TABLE1['VALOR_TOTAL'] + total1;
                table1.Next;
              until table1.Eof;
            end;
            label6.Caption := FormatCurr('#0.00', total1);
            label6.Visible := true;
            table1.First;
            gauge1.Visible := false;
            gauge1.MaxValue := 0;

            //soma doacao + contas a receber
            label8.caption := FormatCurr('#0.00', total + total1);
          end;
      end;

      case (Tipo.ItemIndex) of
        1:
          begin
            if (DataInicial.Text = '') or (DataFinal.Text = '') then
            begin
              Application.MessageBox('Para o tipo de consulta selecionado o período deve ser informado!', 'Informação', mb_Ok + mb_IconInformation);
              dataini.SetFocus;
            end
            else
            begin
              if (DataInicial.Text <> '') and (DataFinal.Text <> '') then
              begin
                table.close;
                table.Filtered := false;

                table.close;
                table.Filtered := false;
                table.Filter := 'CODSERV = ' + QuotedStr(Edit1.Text) +
                  'AND DTACOMPRA >= ' + QuotedStr(datainicial.Text) +
                  'and DTACOMPRA <= ' + QuotedStr(datafinal.Text);
                table.Filtered := True;
                table.Open;

                if table.RecordCount <> 0 then
                begin
                  //soma doacao
                  total := 0;
                  gauge1.Visible := true;
                  gauge1.MaxValue := 0;
                  Gauge1.MaxValue := TABLE.RecordCount;
                  if not table.Eof then
                  begin
                    repeat
                      Gauge1.Progress := Gauge1.Progress + 1;
                      total := TABLE['VALPAGO'] + total;
                      table.Next;
                    until table.Eof;
                  end;
                  label5.Caption := FormatCurr('#0.00', total);
                  label5.Visible := true;
                  table.First;
                  gauge1.Visible := false;
                  gauge1.MaxValue := 0;
                end
                else
                begin
                  if table.RecordCount = 0 then
                  begin
                    label5.Caption := '0,00';
                  end;
                end;

                //soma contas a receber
                table1.close;
                table1.Filtered := false;
                table1.Filter := 'SERVIDORCOD = ' + QuotedStr(Edit1.Text) +
                  'AND DATA_PAGAMENTO >= ' + QuotedStr(datainicial.Text) +
                  'and DATA_PAGAMENTO <= ' + QuotedStr(datafinal.Text) +
                  'and STATUS_CODIGO = ' + '2';
                table1.Filtered := True;
                table1.Open;

                if table1.RecordCount <> 0 then
                begin
                  total1 := 0;
                  gauge1.Visible := true;
                  gauge1.MaxValue := 0;
                  Gauge1.MaxValue := table1.RecordCount;
                  if not table1.Eof then
                  begin
                    repeat
                      Gauge1.Progress := Gauge1.Progress + 1;
                      total1 := table1['VALOR_TOTAL'] + total1;
                      table1.Next;
                    until table1.Eof;
                  end;
                  label6.Caption := FormatCurr('#0.00', total1);
                  label6.Visible := true;
                  table1.First;
                  gauge1.Visible := false;
                  gauge1.MaxValue := 0;
                end
                else
                begin
                  if table1.RecordCount = 0 then
                  begin
                    label6.Caption := '0,00';
                  end;
                end;

                total2 := 0;
                if not table.Eof then
                begin
                  repeat
                    total2 := TABLE['VALPAGO'] + total2;
                    table.Next;
                  until table.Eof;
                end;

                total3 := 0;
                if not table1.Eof then
                begin
                  repeat
                    total3 := TABLE1['VALOR_TOTAL'] + total3;
                    table1.Next;
                  until table1.Eof;
                end;

                label8.Caption := FormatCurr('#0.00', total2 + total3);
              end;
            end;
          end;
      end;
    end;
  end;
end;

procedure TfrmConFaturamento.BitBtn1Click(Sender: TObject);
begin
  DM.TEssencia.Close;
  table.Cancel;
  table1.Cancel;
  label5.Caption := '';
  label6.Caption := '';
  label8.Caption := '';
  Close;
end;

procedure TfrmConFaturamento.Panel2Click(Sender: TObject);
begin
  self.Visible := false;
end;

procedure TfrmConFaturamento.datainiChange(Sender: TObject);
begin
  if dataini.Text <> '  /  /    ' then
  begin
    DataInicial.Text := ConverteData(dataini.Text);
  end;
end;

procedure TfrmConFaturamento.datafiChange(Sender: TObject);
begin
  if datafi.Text <> '  /  /    ' then
  begin
    DataFinal.Text := ConverteData(datafi.Text);
  end;
end;

procedure TfrmConFaturamento.TipoClick(Sender: TObject);
begin
  case (Tipo.ItemIndex) of
    0:
      begin
        periodo.Enabled := false;
        dataini.Text := '';
        datafi.Text := '';
        datainicial.Text := '';
        datafinal.Text := '';
        label5.Caption := '';
        label6.Caption := '';
        label8.Caption := '';
      end
  else
    begin
      case (Tipo.ItemIndex) of
        1:
          begin
            periodo.Enabled := true;
            label5.Caption := '';
            label6.Caption := '';
            label8.Caption := '';
          end;
      end;
    end;
  end;
end;

procedure TfrmConFaturamento.datainiExit(Sender: TObject);
begin
  if dataini.Text = '  /  /    ' then
  begin
    DataInicial.Clear;
  end;
end;

procedure TfrmConFaturamento.datafiExit(Sender: TObject);
begin
  if datafi.Text = '  /  /    ' then
  begin
    DataFinal.Clear;
  end;
end;

procedure TfrmConFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  table.Close;
  table1.close;
end;

procedure TfrmConFaturamento.FormShow(Sender: TObject);
begin
  DM.TEssencia.Open;
  //ComboBox1.Items := ListaServidor;
end;

procedure TfrmConFaturamento.tipo1Click(Sender: TObject);
begin
  case (Tipo1.ItemIndex) of
    0:
      begin
        Combobox1.Visible := false;
        edit1.Clear;
        combobox1.ClearValue;
      end
  else
    begin

      case (Tipo1.ItemIndex) of
        1:
          begin
            Combobox1.Visible := true;
          end;
      end;
    end;
  end;
end;

procedure TfrmConFaturamento.combobox1Change(Sender: TObject);
begin
  edit1.Text := DM.TEssencia['CODIGO'];
end;

end.

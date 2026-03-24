unit uFrmConSeguro;

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
  Gauges,
  EDBNum,
  EDateEd,
  SSBaseXP,
  CJVBlinkLabel,
  DateUtils,
  RXDBCtrl;

type
  TfrmConSeguro = class(TForm)
    PageControl1: TPageControl;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    Image1: TImage;
    TABLE: TIBTable;
    Label1: TLabel;
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
    GroupBox2: TGroupBox;
    Edit6: TEdit;
    Panel18: TPanel;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    table1: TIBTable;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    IBStringField1: TIBStringField;
    FloatField2: TFloatField;
    IBStringField2: TIBStringField;
    FloatField3: TFloatField;
    IBStringField3: TIBStringField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    FloatField5: TFloatField;
    IBStringField4: TIBStringField;
    FloatField6: TFloatField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    FloatField7: TFloatField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    DateTimeField4: TDateTimeField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IBStringField31: TIBStringField;
    BitBtn13: TBitBtn;
    BitBtn15: TBitBtn;
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
    table1BANCORECEBEDORAPEL: TIBStringField;
    table1BANCORECEBEDORCOD: TIBStringField;
    table1DELITEMVENCCOD: TIBStringField;
    table1DELITEMVENCDATA: TIBStringField;
    table1TIPOLCTOCOD: TIBStringField;
    table1TIPOLCTONOME: TIBStringField;
    table1ITEMMODELO: TIBStringField;
    table1SEGUROTIPOCOD: TIBStringField;
    table1SEGUROTIPONOME: TIBStringField;
    table1STATUSCOD: TIBStringField;
    table1STATUSNOME: TIBStringField;
    table1STATUSOBS: TIBStringField;
    table1ITEMID: TIBStringField;
    TABLEITEMNOMECLASSE: TIBStringField;
    dsplayer: TDataSource;
    Queryplayer: TIBQuery;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cjv: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    det: TBitBtn;
    BitBtn19: TBitBtn;
    Edit1: TEdit;
    Q1: TIBQuery;
    DS1: TDataSource;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    BitBtn9: TBitBtn;
    DBEdit11: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    TABLEVALDESCONTO: TFloatField;
    TABLEVALTOTAL: TFloatField;
    TABLEITEMREFERENCIA: TIBStringField;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
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
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure detClick(Sender: TObject);
    procedure BitBtn15KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConSeguro: TfrmConSeguro;

implementation

uses
  uFrmLctoDoacaoBanco,
  uFrmLctoDoacaoPlayer,
  uFrmConSeguroItem,
  uDM;

{$R *.dfm}

procedure TfrmConSeguro.SpeedButton5Click(Sender: TObject);
begin
  DM.TFornecedor.First;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro.SpeedButton6Click(Sender: TObject);
begin
  DM.TFornecedor.Prior;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro.SpeedButton7Click(Sender: TObject);
begin
  DM.TFornecedor.Next;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro.SpeedButton8Click(Sender: TObject);
begin
  DM.TFornecedor.Last;
  DM.TFornecedor.Edit;
end;

procedure TfrmConSeguro.Edit1Change(Sender: TObject);
begin
  DM.TFornecedor.Locate('NOMEFORNECEDOR', Edit2.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmConSeguro.MaskEdit5Exit(Sender: TObject);
begin
  Application.MessageBox('Inscrição Estadual inválida ou digitada incorretamente, Verefique!', 'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro.MaskEdit4Exit(Sender: TObject);
begin
  Application.MessageBox('CNPJ inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro.BitBtn3Click(Sender: TObject);
begin
  LABEL3.Caption := '';
  TABLE.Cancel;
  table.Filtered := false;
  Close;
end;

procedure TfrmConSeguro.MaskEdit8Enter(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro.MaskEdit8Exit(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Doação';

end;

procedure TfrmConSeguro.TabSheet2Enter(Sender: TObject);
begin
  Label1.Caption := 'Inscrição/Contato';
end;

procedure TfrmConSeguro.EvCheckCPF1Error(Sender: TObject);
begin
  Application.MessageBox('CPF inválido ou digitado incorretamente, Verefique!',
    'Informação', mb_Ok + mb_IconInformation);
end;

procedure TfrmConSeguro.DBLookupComboBox1Enter(Sender: TObject);
begin
  //dblookupcombobox1.DropDown;
end;

procedure TfrmConSeguro.TIPOPESSOAEnter(Sender: TObject);
begin
  //TIPOPESSOA.DropDown;
end;

procedure TfrmConSeguro.FormDestroy(Sender: TObject);
begin
  self.Tag := 0;
  TABLE.Close;
end;

procedure TfrmConSeguro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmConSeguro.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  table.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

procedure TfrmConSeguro.TabSheet3Show(Sender: TObject);
var
  total: Real;
begin
  //TABLE.Cancel;
  //Label1.Caption := 'Pesquisa lançamento';
  Edit2.SetFocus;

end;

procedure TfrmConSeguro.BitBtn9Click(Sender: TObject);
begin
  if edit6.Text = '' then
  begin
    Application.MessageBox('Não há player selecionado, Verifíque!', 'Item', mb_Ok
      + mb_IconInformation);
    bitbtn9.SetFocus;
  end;

  if edit6.Text <> '' then
  begin

    if edit1.Text = '0' then
    begin
      Application.MessageBox('Para o player selecionado não se utiliza filtro por item!', 'Item', mb_Ok + mb_IconInformation);
      bitbtn15.SetFocus;
    end;

    if edit1.Text <> '0' then
    begin
      if edit1.Text = '1' then
      begin
        table.close;
        table.Filtered := false;
        table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text);
        //        TABLE.IndexFieldNames := ('CODLCTO');
        table.Filtered := True;
        table.Open;

        if TABLE.RecordCount = 0 then
        begin
          TABLE.Close;
          table.Filtered := false;
          Application.MessageBox('Não há item cadastrado para o player selecionado, Verifíque!', 'Item', mb_Ok + mb_IconInformation);
        end
        else
        begin
          if TABLE.RecordCount <> 0 then
          begin
            try
              TABLE.Close;
              table.Filtered := false;
              Application.CreateForm(TfrmConSeguroItem,
                frmConSeguroItem);
              frmConSeguroItem.ShowModal;
            finally
              frmConSeguroItem.Free;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn8Click(Sender: TObject);
begin
  self.Tag := 1;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn12Click(Sender: TObject);
begin
  self.Tag := 2;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn10Click(Sender: TObject);
begin
  self.Tag := 1;
  DM.TSUBPRODUTOS.Open;
  if DM.TSUBPRODUTOS.RecordCount = 0 then
  begin
    DM.TSUBPRODUTOS.Close;
    Application.MessageBox('Não hà banco cadastrado!', 'Informação', mb_Ok +
      mb_IconInformation);
  end
  else
  begin
    try
      DM.TSUBPRODUTOS.Close;
      Application.CreateForm(TfrmLctoDoacaoBanco, frmLctoDoacaoBanco);
      frmLctoDoacaoBanco.ShowModal;
    finally
      frmLctoDoacaoBanco.Free;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn19Click(Sender: TObject);
begin
  self.Tag := 4;
  if Queryplayer.RecordCount = 0 then
  begin
    Application.MessageBox('Não há player cadastrado, Verifíque!', 'Item', mb_Ok
      + mb_IconExclamation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmLctoDoacaoPlayer, frmLctoDoacaoPlayer);
      frmLctoDoacaoPlayer.ShowModal;
    finally
      frmLctoDoacaoPlayer.Free;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn13Click(Sender: TObject);
begin
  if bitbtn15.Tag = 1 then
  begin
    table.Filtered := false;
    table.close;

    dbgrid1.Visible := false;
    det.Enabled := false;
    label5.Caption := 'Situação.:';
    cjv.Visible := false;
    label8.Visible := false;
    label7.Visible := false;
    LABEL3.Caption := '';

    edit2.Clear;
    edit6.Clear;
    bitbtn15.Tag := 0;
  end
  else
  begin
    if bitbtn15.Tag = 0 then
    begin

      //showmessage('teste');
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn15Click(Sender: TObject);
var
  DataAtual, DataVencimento: TDate;
  Diff: string;
begin
  bitbtn15.Tag := 1;

  det.Tag := 0;
  det.Caption := 'Detalhar';
  dbgrid1.Visible := false;

  if edit2.Text = '' then
  begin
    Application.MessageBox('Selecione um player para pesquisa!', 'Pesquisa',
      mb_Ok + mb_IconExclamation);
    bitbtn19.SetFocus;
  end;

  if edit1.Text = '0' then

    if edit2.Text <> '' then
    begin
      if Combobox1.ItemIndex = 0 then
      begin

        table.close;
        table.Filtered := false;
        table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text);
        TABLE.IndexFieldNames := ('DTASEGURO');
        table.Filtered := True;
        table.Open;
        table.First;
        table.last;
        label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);

        if table.RecordCount <> 0 then
        begin
          if TABLE['DTASEGURO'] <= DateToStr(date) then
          begin
            det.Enabled := true;
            label8.Visible := true;
            label7.Visible := true;
            cjv.Visible := true;
            cjv.Font.Color := ClRed;
            cjv.Caption := 'Seguro vencido!';
            label8.Caption := table['dtaseguro'];
            label5.Caption := 'Vencido à.:';

            DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
            DataVencimento := StrToDate(table['DTASEGURO']);
            Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
            label7.Caption := Diff + ' dias';

          end
          else
          begin
            if TABLE['DTASEGURO'] >= DateToStr(date) then
            begin
              det.Enabled := true;
              label8.Visible := true;
              label7.Visible := true;
              cjv.Visible := true;
              cjv.Font.Color := ClBlue;
              cjv.Caption := 'Seguro em dia!';
              label8.Caption := table['dtaseguro'];
              label5.Caption := 'Vence em.:';

              DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
              DataVencimento := StrToDate(table['DTASEGURO']);
              Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
              label7.Caption := Diff + ' dias';
            end;
          end;
        end;
        if table.RecordCount = 0 then
        begin
          dbgrid1.Visible := false;
          det.Enabled := false;
          label5.Caption := 'Situação.:';
          cjv.Visible := false;
          label8.Visible := false;
          label7.Visible := false;
          Application.MessageBox('Não há registro lançado para o player selecionado!', 'Informação', mb_Ok + mb_IconInformation);
        end;
      end
      else
      begin
        if Combobox1.ItemIndex = 1 then
        begin
          table.close;
          table.Filtered := false;
          table.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(Edit2.Text);
          table.IndexFieldNames := 'DTASEGURO';
          table.Filtered := True;
          table.Open;
          table.First;
          table.last;
          label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);

          if table.RecordCount <> 0 then
          begin
            if TABLE['DTASEGURO'] <= DateToStr(date) then
            begin
              det.Enabled := true;
              label8.Visible := true;
              label7.Visible := true;
              cjv.Visible := true;
              cjv.Font.Color := ClRed;
              cjv.Caption := 'Seguro vencido!';
              label8.Caption := table['dtaseguro'];
              label5.Caption := 'Vencido à.:';

              DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
              DataVencimento := StrToDate(table['DTASEGURO']);
              Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
              label7.Caption := Diff + ' dias';
            end
            else
            begin
              if TABLE['DTASEGURO'] >= DateToStr(date) then
              begin
                det.Enabled := true;
                label8.Visible := true;
                label7.Visible := true;
                cjv.Visible := true;
                cjv.Font.Color := ClBlue;
                cjv.Caption := 'Seguro em dia!';
                label8.Caption := table['dtaseguro'];
                label5.Caption := 'Vence em.:';

                DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
                DataVencimento := StrToDate(table['DTASEGURO']);
                Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
                label7.Caption := Diff + ' dias';
              end;
            end;
          end;
          if table.RecordCount = 0 then
          begin
            dbgrid1.Visible := false;
            det.Enabled := false;
            label5.Caption := 'Situação.:';
            cjv.Visible := false;
            label8.Visible := false;
            label7.Visible := false;
            Application.MessageBox('Não há registro lançado para o player selecionado!', 'Informação', mb_Ok + mb_IconInformation);
          end;
        end
      end;
    end;
  if edit1.Text = '1' then
  begin
    dbgrid1.Visible := false;
    det.Enabled := false;
    label5.Caption := 'Situação.:';
    cjv.Visible := false;
    label8.Visible := false;
    label7.Visible := false;

    if dbedit11.Text = '' then
    begin
      Application.MessageBox('Para o player selecionado o item deve ser informado!', 'Informação', mb_Ok + mb_IconInformation);
      bitbtn9.SetFocus;
    end
    else
    begin
      if dbedit11.Text <> '' then
      begin
        table.close;
        table.Filtered := false;
        table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text) +
          'and CODITEM = ' + QuotedStr(Edit3.Text);
        TABLE.IndexFieldNames := ('DTASEGURO');
        table.Filtered := True;
        table.Open;
        table.last;

        if TABLE['DTASEGURO'] <= DateToStr(date) then
        begin
          det.Enabled := true;
          label8.Visible := true;
          label7.Visible := true;
          cjv.Visible := true;
          cjv.Font.Color := ClRed;
          cjv.Caption := 'Seguro vencido!';
          label8.Caption := table['dtaseguro'];
          label5.Caption := 'Vencido à.:';

          DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
          DataVencimento := StrToDate(table['DTASEGURO']);
          Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
          label7.Caption := Diff + ' dias';

        end
        else
        begin
          if TABLE['DTASEGURO'] >= DateToStr(date) then
          begin
            det.Enabled := true;
            label8.Visible := true;
            label7.Visible := true;
            cjv.Visible := true;
            cjv.Font.Color := ClBlue;
            cjv.Caption := 'Seguro em dia!';
            label8.Caption := table['dtaseguro'];
            label5.Caption := 'Vence em.:';

            DataAtual := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
            DataVencimento := StrToDate(table['DTASEGURO']);
            Diff := FloatToStr(DaysBetween(DataAtual, DataVencimento));
            label7.Caption := Diff + ' dias';
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmConSeguro.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro.BitBtn15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmConSeguro.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
  else
    Key := '0';
  end;
end;

procedure TfrmConSeguro.FormShow(Sender: TObject);
begin
  //label2.Caption  := DateToStr(Now);
  with Queryplayer do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from PLAYER');
    Open;
  end;
end;

procedure TfrmConSeguro.detClick(Sender: TObject);
begin
  if det.Tag = 0 then
  begin
    det.Tag := 1;
    det.Caption := 'Ocultar';
    dbgrid1.Visible := true;
    checkbox1.Visible := true;
    label9.Visible := true;
  end
  else
  begin
    if det.Tag = 1 then
    begin
      det.Tag := 0;
      det.Caption := 'Detalhar';
      dbgrid1.Visible := false;
      checkbox1.Visible := false;
      label9.Visible := false;
    end;
  end;
end;

procedure TfrmConSeguro.BitBtn15KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmConSeguro.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then
  begin
    if Combobox1.ItemIndex = 0 then
    begin
      table.Filtered := false;
      table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text) +
        'AND TIPOLCTOCOD = ' + '6';
      table.Filtered := True;
      table.First;
      table.Last;
      label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);
    end
    else
    begin
      table.Filtered := false;
      table.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(Edit2.Text) +
        'AND TIPOLCTOCOD = ' + '6';
      table.Filtered := True;
      table.First;
      table.Last;
      label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);

    end;
  end;

  if checkbox1.Checked = false then
  begin
    if Combobox1.ItemIndex = 0 then
    begin
      table.Filtered := false;
      table.Filter := 'NOMECOMPDISCORCOD = ' + QuotedStr(Edit2.Text);
      table.Filtered := True;
      table.First;
      table.Last;
      label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);

    end
    else
    begin
      table.Filtered := false;
      table.Filter := 'REGISTRADOPARACOD = ' + QuotedStr(Edit2.Text);
      table.Filtered := True;
      table.First;
      table.Last;
      label9.Caption := 'Itens listados.: ' + intTostr(table.RecordCount);

    end;
  end;
end;

end.

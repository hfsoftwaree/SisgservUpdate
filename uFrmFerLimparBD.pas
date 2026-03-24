unit uFrmFerLimparBD;

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
  Buttons,
  CJVBlinkLabel,
  ExtCtrls,
  DB,
  ComCtrls,
  Gauges,
  Mask,
  EDateEd,
  IBCustomDataSet,
  IBTable,
  IniFiles;

type
  TfrmFerLimparBD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Panel4: TPanel;
    Gauge1: TGauge;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Panel5: TPanel;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    GroupBox1: TGroupBox;
    DataInicial1: TEvDateEdit;
    DataFinal1: TEvDateEdit;
    DataFinal: TEdit;
    DataInicial: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    TSTATUSENTREGA: TIBTable;
    Label3: TLabel;
    Label4: TLabel;
    tipo: TRadioGroup;
    Label5: TLabel;
    Memo1: TMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure DataInicial1Change(Sender: TObject);
    procedure DataFinal1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tipoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFerLimparBD: TfrmFerLimparBD;

implementation

uses
  uDM;

{$R *.dfm}

function ConverteData(Data: string): string;
begin
  Result := Copy(Data, 4, 3) + Copy(Data, 1, 3) + Copy(Data, 7, 4);
end;

procedure tbDBDeleteAll(const DataSet: TDataSet);
begin
  with DataSet do
    while RecordCount > 0 do
      Delete;
end;

procedure TfrmFerLimparBD.BitBtn2Click(Sender: TObject);
begin
  checkbox1.Checked := false;
  checkbox2.Checked := false;
  checkbox3.Checked := false;
  checkbox4.Checked := false;
  checkbox5.Checked := false;
  checkbox6.Checked := false;
  checkbox7.Checked := false;
  checkbox8.Checked := false;
  checkbox9.Checked := false;
  checkbox10.Checked := false;
  checkbox11.Checked := false;
  checkbox12.Checked := false;
  close;
end;

procedure TfrmFerLimparBD.BitBtn1Click(Sender: TObject);
begin
  case (Tipo.ItemIndex) of
    1:
      begin // Limpeza Parcial

        if DataInicial1.DateText = '00/00/0000' then
        begin
          Application.MessageBox('Período Inicial deve ser informado!',
            'Informação', mb_Ok + mb_IconInformation);
          DataInicial1.SetFocus;
        end
        else
        begin
          if DataFinal1.DateText = '00/00/0000' then
          begin
            Application.MessageBox('Período Final deve ser informado!',
              'Informação', mb_Ok + mb_IconInformation);
            DataFinal1.SetFocus;
          end
          else
          begin
            if (DataInicial1.Text <> '00/00/0000') and (DataFinal1.Text <>
              '00/00/0000') and (DataInicial1.Text <> '  /  /    ') and
              (DataFinal1.Text <> '  /  /    ') then
            begin
              if (checkbox1.Checked = false) and (checkbox2.Checked = false) and
                (checkbox3.Checked = false) and (checkbox4.Checked = false) and
                (checkbox5.Checked = false) and (checkbox6.Checked = false) and
                (checkbox7.Checked = false) and (checkbox8.Checked = false) and
                (checkbox9.Checked = false) and (checkbox10.Checked = false) and
                (checkbox12.Checked = false) and (checkbox13.Checked = false)
                and
                (checkbox14.Checked = false) and (checkbox15.Checked = false)
                and
                (checkbox16.Checked = false) and (checkbox17.Checked = false)
                and
                (checkbox18.Checked = false) and (checkbox19.Checked = false)
                  then
              begin
                Application.MessageBox('Selecione pelo menos uma tabela para executar o processo de limpeza', 'Informação',
                  mb_Ok + mb_ICONINFORMATION);
              end
              else
              begin
                if checkbox1.Checked = true then
                begin
                  if
                    Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Servidor?', 'Confirmação',
                    mb_YesNo + mb_ICONQUESTION) = idYes then
                  begin
                    DM.TEssencia.Open;
                    DM.TEssencia.Last;
                    DM.TEssencia.First;
                    gauge1.Visible := true;
                    gauge1.MaxValue := 0;
                    Gauge1.MaxValue := DM.TEssencia.RecordCount;
                    while not DM.TEssencia.Eof do
                    begin
                      Gauge1.Progress := Gauge1.Progress + 1;
                      DM.TEssencia.Delete;
                    end;
                    Application.MessageBox('Tabela Servidor limpa com Sucesso!',
                      'Informação', mb_Ok + mb_IconInformation);
                    gauge1.Visible := false;
                    gauge1.MaxValue := 0;
                    DM.TEssencia.Close;
                  end;
                end;
              end;

              if checkbox8.Checked = true then
              begin
                if
                  Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Essência?', 'Confirmação',
                  mb_YesNo + mb_ICONQUESTION) = idYes then
                begin
                  DM.TEssencia.Open;
                  DM.TEssencia.Last;
                  DM.TEssencia.First;
                  gauge1.Visible := true;
                  gauge1.MaxValue := 0;
                  Gauge1.MaxValue := DM.TEssencia.RecordCount;
                  while not DM.TEssencia.Eof do
                  begin
                    Gauge1.Progress := Gauge1.Progress + 1;
                    DM.TEssencia.Delete;
                  end;
                  Application.MessageBox('Tabela Essência limpa com Sucesso!',
                    'Informação', mb_Ok + mb_IconInformation);
                  gauge1.Visible := false;
                  gauge1.MaxValue := 0;
                  DM.TEssencia.Close;
                end;
              end;
            end;

            if checkbox9.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Produtos?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TSUBPRODUTOS.Open;
                DM.TSUBPRODUTOS.Last;
                DM.TSUBPRODUTOS.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TSUBPRODUTOS.RecordCount;
                while not DM.TSUBPRODUTOS.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TSUBPRODUTOS.Delete;
                end;
                Application.MessageBox('Tabela Produtos limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TSUBPRODUTOS.Close;
              end;
            end;

            if checkbox10.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Municípios?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TMunicipio.Open;
                DM.TMunicipio.Last;
                DM.TMunicipio.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TMunicipio.RecordCount;
                while not DM.TMunicipio.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TMunicipio.Delete;
                end;
                Application.MessageBox('Tabela Município limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TMunicipio.Close;
              end;
            end;

            if checkbox12.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Vendedor?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.T_VENDEDOR.Open;
                DM.T_VENDEDOR.Last;
                DM.T_VENDEDOR.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.T_VENDEDOR.RecordCount;
                while not DM.T_VENDEDOR.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.T_VENDEDOR.Delete;
                end;
                Application.MessageBox('Tabela Vendedor limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.T_VENDEDOR.Close;
              end;
            end;

            if checkbox13.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Tipo de Fornecedor/Cliente?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TTipopessoa.Open;
                DM.TTipopessoa.Last;
                DM.TTipopessoa.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TTipopessoa.RecordCount;
                while not DM.TTipopessoa.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TTipopessoa.Delete;
                end;
                Application.MessageBox('Tabela Tipo de Fornecedor/Cliente limpa com Sucesso!', 'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TTipopessoa.Close;
              end;
            end;

            if checkbox2.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Fornecedor?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TFornecedor.Open;
                DM.TFornecedor.Last;
                DM.TFornecedor.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TFornecedor.RecordCount;
                while not DM.TFornecedor.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TFornecedor.Delete;
                end;
                Application.MessageBox('Tabela Fornecedor limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TFornecedor.Close;
              end;
            end;

            if checkbox3.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Clientes?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TCredor.Open;
                DM.TCredor.Last;
                DM.TCredor.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TCredor.RecordCount;
                while not DM.TCredor.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TCredor.Delete;
                end;
                Application.MessageBox('Tabela Clientes limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TCredor.Close;
              end;
            end;

            if checkbox4.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Entrada?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TESDISCRIMINACAO.Filter := 'DATALANCAMENTO >= ' +
                  QuotedStr(DataInicial.Text) + ' and DATALANCAMENTO <= ' +
                  QuotedStr(DataFinal.Text);
                DM.TESDISCRIMINACAO.Filtered := True;
                DM.TESDISCRIMINACAO.Open;

                DM.TESDISCRIMINACAO.Last;
                DM.TESDISCRIMINACAO.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TESDISCRIMINACAO.RecordCount;
                while not DM.TESDISCRIMINACAO.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TESDISCRIMINACAO.Delete;
                end;
                Application.MessageBox('Tabela Entrada limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TESDISCRIMINACAO.Filtered := False;
                DM.TESDISCRIMINACAO.Close;
              end;
            end;

            if checkbox5.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Saída e Fechamento?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TSaida_Discriminacao.Filter := 'DATALANCAMENTO >= ' +
                  QuotedStr(DataInicial.Text) + ' and DATALANCAMENTO <= ' +
                  QuotedStr(DataFinal.Text);
                DM.TSaida_Discriminacao.Filtered := True;
                DM.TSaida_Discriminacao.Open;

                DM.TSaida_Discriminacao.Last;
                DM.TSaida_Discriminacao.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TSaida_Discriminacao.RecordCount;
                while not DM.TSaida_Discriminacao.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TSaida_Discriminacao.Delete;
                end;
                Application.MessageBox('Tabela Saída limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TSaida_Discriminacao.Filtered := False;
                DM.TSaida_Discriminacao.Close;

                DM.TSAIDAFECHAMENTO.Filter := 'DATA >= ' +
                  QuotedStr(DataInicial.Text) + ' and DATA <= ' +
                  QuotedStr(DataFinal.Text);
                DM.TSAIDAFECHAMENTO.Filtered := True;
                DM.TSAIDAFECHAMENTO.Open;

                DM.TSAIDAFECHAMENTO.Last;
                DM.TSAIDAFECHAMENTO.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TSAIDAFECHAMENTO.RecordCount;
                while not DM.TSAIDAFECHAMENTO.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TSAIDAFECHAMENTO.Delete;
                end;
                Application.MessageBox('Tabela Fechamento limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TSAIDAFECHAMENTO.Filtered := False;
                DM.TSAIDAFECHAMENTO.Close;
              end;
            end;

            if checkbox7.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Estoque?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TESTOQUE.Open;
                DM.TESTOQUE.Last;
                DM.TESTOQUE.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TESTOQUE.RecordCount;
                while not DM.TESTOQUE.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TESTOQUE.Delete;
                end;
                Application.MessageBox('Tabela Estoque limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TESTOQUE.Close;
              end;
            end;

            if checkbox14.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Ocorrência?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                DM.TOCORRENCIA.Open;
                DM.TOCORRENCIA.Last;
                DM.TOCORRENCIA.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := DM.TOCORRENCIA.RecordCount;
                while not DM.TOCORRENCIA.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  DM.TOCORRENCIA.Delete;
                end;
                Application.MessageBox('Tabela Ocorrência limpa com Sucesso!',
                  'Informação', mb_Ok + mb_IconInformation);
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
                DM.TOCORRENCIA.Close;
              end;
            end;
          end;
        end;
      end;
  end;

  case (Tipo.ItemIndex) of
    0:
      begin // Limpeza Total

        if (checkbox1.Checked = false) and (checkbox2.Checked = false) and
          (checkbox3.Checked = false) and (checkbox4.Checked = false) and
          (checkbox5.Checked = false) and (checkbox6.Checked = false) and
          (checkbox7.Checked = false) and (checkbox8.Checked = false) and
          (checkbox9.Checked = false) and (checkbox10.Checked = false) and
          (checkbox12.Checked = false) and (checkbox13.Checked = false) and
          (checkbox14.Checked = false) and (checkbox15.Checked = false) and
          (checkbox16.Checked = false) and (checkbox17.Checked = false) and
          (checkbox18.Checked = false) and (checkbox19.Checked = false) then
        begin
          Application.MessageBox('Selecione pelo menos uma tabela para executar o processo de limpeza', 'Informação',
            mb_Ok + mb_ICONINFORMATION);
        end
        else
        begin
          if checkbox1.Checked = true then
          begin
            if
              Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Parametros da Empresa?', 'Confirmação',
              mb_YesNo + mb_ICONQUESTION) = idYes then
            begin
              DM.TManutencao.Open;
              DM.TManutencao.Last;
              DM.TManutencao.First;
              gauge1.Visible := true;
              gauge1.MaxValue := 0;
              Gauge1.MaxValue := DM.TManutencao.RecordCount;
              while not DM.TManutencao.Eof do
              begin
                Gauge1.Progress := Gauge1.Progress + 1;
                DM.TManutencao.Delete;
              end;
              Application.MessageBox('Tabela Parametros da empresa limpa com Sucesso!', 'Informação', mb_Ok + mb_IconInformation);
              gauge1.Visible := false;
              gauge1.MaxValue := 0;
              DM.TManutencao.Close;
            end;
          end;
        end;

        if checkbox8.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Essência?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TEssencia.Open;
            DM.TEssencia.Last;
            DM.TEssencia.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TEssencia.RecordCount;
            while not DM.TEssencia.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TEssencia.Delete;
            end;
            Application.MessageBox('Tabela Essência limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TEssencia.Close;
          end;
        end;

        if checkbox9.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Produtos?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSUBPRODUTOS.Open;
            DM.TSUBPRODUTOS.Last;
            DM.TSUBPRODUTOS.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSUBPRODUTOS.RecordCount;
            while not DM.TSUBPRODUTOS.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSUBPRODUTOS.Delete;
            end;
            Application.MessageBox('Tabela Produtos limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSUBPRODUTOS.Close;
          end;
        end;

        if checkbox10.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Municípios?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TMunicipio.Open;
            DM.TMunicipio.Last;
            DM.TMunicipio.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TMunicipio.RecordCount;
            while not DM.TMunicipio.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TMunicipio.Delete;
            end;
            Application.MessageBox('Tabela Município limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TMunicipio.Close;
          end;
        end;

        if checkbox12.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Vendedor?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.T_VENDEDOR.Open;
            DM.T_VENDEDOR.Last;
            DM.T_VENDEDOR.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.T_VENDEDOR.RecordCount;
            while not DM.T_VENDEDOR.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.T_VENDEDOR.Delete;
            end;
            Application.MessageBox('Tabela Vendedor limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.T_VENDEDOR.Close;
          end;
        end;

        if checkbox13.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Tipo de Fornecedor/Cliente?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TTipopessoa.Open;
            DM.TTipopessoa.Last;
            DM.TTipopessoa.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TTipopessoa.RecordCount;
            while not DM.TTipopessoa.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TTipopessoa.Delete;
            end;
            Application.MessageBox('Tabela Tipo de Fornecedor/Cliente limpa com Sucesso!', 'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TTipopessoa.Close;
          end;
        end;

        if checkbox2.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Fornecedor?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TFornecedor.Open;
            DM.TFornecedor.Last;
            DM.TFornecedor.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TFornecedor.RecordCount;
            while not DM.TFornecedor.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TFornecedor.Delete;
            end;
            Application.MessageBox('Tabela Fornecedor limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TFornecedor.Close;
          end;
        end;

        if checkbox3.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Clientes?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TCredor.Open;
            DM.TCredor.Last;
            DM.TCredor.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TCredor.RecordCount;
            while not DM.TCredor.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TCredor.Delete;
            end;
            Application.MessageBox('Tabela Clientes limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TCredor.Close;
          end;
        end;

        if checkbox4.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Entrada?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TESDISCRIMINACAO.Open;
            DM.TESDISCRIMINACAO.Last;
            DM.TESDISCRIMINACAO.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TESDISCRIMINACAO.RecordCount;
            while not DM.TESDISCRIMINACAO.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TESDISCRIMINACAO.Delete;
            end;
            Application.MessageBox('Tabela Entrada limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TESDISCRIMINACAO.Close;
          end;
        end;

        if checkbox5.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Saída e Fechamento?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSaida_Discriminacao.Open;
            DM.TSaida_Discriminacao.Last;
            DM.TSaida_Discriminacao.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSaida_Discriminacao.RecordCount;
            while not DM.TSaida_Discriminacao.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSaida_Discriminacao.Delete;
            end;
            Application.MessageBox('Tabela Saída limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSaida_Discriminacao.Close;

            DM.TSAIDAFECHAMENTO.Open;
            DM.TSAIDAFECHAMENTO.Last;
            DM.TSAIDAFECHAMENTO.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSAIDAFECHAMENTO.RecordCount;
            while not DM.TSAIDAFECHAMENTO.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSAIDAFECHAMENTO.Delete;
            end;
            Application.MessageBox('Tabela Fechamento limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSAIDAFECHAMENTO.Close;
          end;
        end;

        if checkbox7.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Estoque?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TESTOQUE.Open;
            DM.TESTOQUE.Last;
            DM.TESTOQUE.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TESTOQUE.RecordCount;
            while not DM.TESTOQUE.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TESTOQUE.Delete;
            end;
            Application.MessageBox('Tabela Estoque limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TESTOQUE.Close;
          end;
        end;

        if checkbox14.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Ocorrência?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TOCORRENCIA.Open;
            DM.TOCORRENCIA.Last;
            DM.TOCORRENCIA.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TOCORRENCIA.RecordCount;
            while not DM.TOCORRENCIA.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TOCORRENCIA.Delete;
            end;
            Application.MessageBox('Tabela Ocorrência limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TOCORRENCIA.Close;
          end;
        end;

        if checkbox15.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Saída Status?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSTATUS.Open;
            DM.TSTATUS.Last;
            DM.TSTATUS.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSTATUS.RecordCount;
            while not DM.TSTATUS.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSTATUS.Delete;
            end;
            Application.MessageBox('Tabela Saída Status limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSTATUS.Close;
          end;
        end;

        if checkbox16.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Saída Status1?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSTATUS1.Open;
            DM.TSTATUS1.Last;
            DM.TSTATUS1.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSTATUS1.RecordCount;
            while not DM.TSTATUS1.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSTATUS1.Delete;
            end;
            Application.MessageBox('Tabela Saída Status1 limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSTATUS1.Close;
          end;
        end;

        if checkbox17.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Setores?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSETORES.Open;
            DM.TSETORES.Last;
            DM.TSETORES.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TSETORES.RecordCount;
            while not DM.TSETORES.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TSETORES.Delete;
            end;
            Application.MessageBox('Tabela Setores limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TSETORES.Close;
          end;
        end;

        if checkbox18.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da Status Entrega?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            TSTATUSENTREGA.Open;
            TSTATUSENTREGA.Last;
            TSTATUSENTREGA.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := TSTATUSENTREGA.RecordCount;
            while not TSTATUSENTREGA.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              TSTATUSENTREGA.Delete;
            end;
            Application.MessageBox('Tabela Status Entrega limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            TSTATUSENTREGA.Close;
          end;
        end;

        if checkbox19.Checked = true then
        begin
          if
            Application.MessageBox('Ao prosseguir, todos os lançamentos registrados até a presente data serão excluídos. Confirma limpeza da tabela Tipo Contato?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TTIPOCONTATO.Open;
            DM.TTIPOCONTATO.Last;
            DM.TTIPOCONTATO.First;
            gauge1.Visible := true;
            gauge1.MaxValue := 0;
            Gauge1.MaxValue := DM.TTIPOCONTATO.RecordCount;
            while not DM.TTIPOCONTATO.Eof do
            begin
              Gauge1.Progress := Gauge1.Progress + 1;
              DM.TTIPOCONTATO.Delete;
            end;
            Application.MessageBox('Tabela Tipo Contato limpa com Sucesso!',
              'Informação', mb_Ok + mb_IconInformation);
            gauge1.Visible := false;
            gauge1.MaxValue := 0;
            DM.TTIPOCONTATO.Close;
          end;
        end;
      end;
  end;
end;

procedure TfrmFerLimparBD.CheckBox11Click(Sender: TObject);
begin
  if checkbox11.Checked = true then
  begin
    checkbox1.Checked := true;
    checkbox2.Checked := true;
    checkbox3.Checked := true;
    checkbox4.Checked := true;
    checkbox5.Checked := true;
    checkbox6.Checked := true;
    checkbox7.Checked := true;
    checkbox8.Checked := true;
    checkbox9.Checked := true;
    checkbox10.Checked := true;
    checkbox12.Checked := true;
    checkbox13.Checked := true;
    checkbox14.Checked := true;
    checkbox15.Checked := true;
    checkbox16.Checked := true;
    checkbox17.Checked := true;
    checkbox18.Checked := true;
    checkbox19.Checked := true;
  end
  else
  begin
    if checkbox11.Checked = false then
    begin
      checkbox1.Checked := false;
      checkbox2.Checked := false;
      checkbox3.Checked := false;
      checkbox4.Checked := false;
      checkbox5.Checked := false;
      checkbox6.Checked := false;
      checkbox7.Checked := false;
      checkbox8.Checked := false;
      checkbox9.Checked := false;
      checkbox10.Checked := false;
      checkbox12.Checked := false;
      checkbox13.Checked := false;
      checkbox14.Checked := false;
      checkbox15.Checked := false;
      checkbox16.Checked := false;
      checkbox17.Checked := false;
      checkbox18.Checked := false;
      checkbox19.Checked := false;
    end;
  end;
end;

procedure TfrmFerLimparBD.CheckBox5Click(Sender: TObject);
begin
  if checkbox5.Checked = true then
  begin
    checkbox6.Checked := true;
  end
  else
  begin
    checkbox6.Checked := false;
  end;
end;

procedure TfrmFerLimparBD.CheckBox6Click(Sender: TObject);
begin
  if checkbox6.Checked = true then
  begin
    checkbox5.Checked := true;
  end
  else
  begin
    checkbox5.Checked := false;
  end;
end;

procedure TfrmFerLimparBD.CheckBox7Click(Sender: TObject);
begin
  if checkbox7.Checked = true then
  begin
    checkbox4.Checked := true;
    checkbox5.Checked := true;
    checkbox6.Checked := true;
  end
  else
  begin
    checkbox4.Checked := false;
    checkbox5.Checked := false;
    checkbox6.Checked := false;
  end;
end;

procedure TfrmFerLimparBD.DataInicial1Change(Sender: TObject);
begin
  DataInicial.Text := ConverteData(DataInicial1.Text);
end;

procedure TfrmFerLimparBD.DataFinal1Change(Sender: TObject);
begin
  DataFinal.Text := ConverteData(DataFinal1.Text);
end;

procedure TfrmFerLimparBD.FormShow(Sender: TObject);
begin
  data :=
    TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Config\Config.ini');
  //data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini'); //Nome do meu arquivo INI que quero ler
  label5.Caption := data.ReadString('CONEXAO', 'HOST', '');

  if label5.Caption = '127.0.0.1:' then
  begin
    bitbtn1.Enabled := true;
    Checkbox1.Enabled := true;
    Checkbox2.Enabled := true;
    Checkbox3.Enabled := true;
    Checkbox4.Enabled := true;
    Checkbox5.Enabled := true;
    Checkbox6.Enabled := true;
    Checkbox7.Enabled := true;
    Checkbox8.Enabled := true;
    Checkbox9.Enabled := true;
    Checkbox10.Enabled := true;
    Checkbox11.Enabled := true;
    Checkbox12.Enabled := true;
    Checkbox13.Enabled := true;
    Checkbox14.Enabled := true;
    Checkbox15.Enabled := true;
    Checkbox16.Enabled := true;
    Checkbox17.Enabled := true;
    Checkbox18.Enabled := true;
    Checkbox19.Enabled := true;
    label4.Caption := ('') + data.ReadString('CONEXAO', 'CAMINHO', '');
  end
  else
  begin
    bitbtn1.Enabled := false;
    Checkbox1.Enabled := false;
    Checkbox2.Enabled := false;
    Checkbox3.Enabled := false;
    Checkbox4.Enabled := false;
    Checkbox5.Enabled := false;
    Checkbox6.Enabled := false;
    Checkbox7.Enabled := false;
    Checkbox8.Enabled := false;
    Checkbox9.Enabled := false;
    Checkbox10.Enabled := false;
    Checkbox11.Enabled := false;
    Checkbox12.Enabled := false;
    Checkbox13.Enabled := false;
    Checkbox14.Enabled := false;
    Checkbox15.Enabled := false;
    Checkbox16.Enabled := false;
    Checkbox17.Enabled := false;
    Checkbox18.Enabled := false;
    Checkbox19.Enabled := false;
    label4.Caption := ('Rede:') + data.ReadString('CONEXAO', 'CAMINHO', '');
  end;
  data.Free; //Libera a memória
end;

procedure TfrmFerLimparBD.tipoClick(Sender: TObject);
begin
  case (Tipo.ItemIndex) of
    0:
      begin

        datainicial1.Enabled := false;
        datafinal1.Enabled := false;
        groupbox1.Visible := false;
        memo1.Text := '';

      end;

    1:
      begin

        datainicial1.Enabled := true;
        datafinal1.Enabled := true;
        groupbox1.Visible := true;
        memo1.Text :=
          'Somente as tabelas, Entrada, Saída e Fechamento de Venda, serão limpas parcialmente entre o período informado.';
      end;
  end;
end;

end.

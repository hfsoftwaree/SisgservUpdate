unit uFrmLctoDoacaoPlayer;

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
  ExtCtrls,
  StdCtrls,
  Buttons,
  Grids,
  DBGrids,
  DB,
  ADODB,
  IBCustomDataSet,
  IBQuery,
  DBCtrls;

type
  TfrmLctoDoacaoPlayer = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Query1: TIBQuery;
    DBNavigator1: TDBNavigator;
    cb: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoDoacaoPlayer: TfrmLctoDoacaoPlayer;

implementation

uses
  uFrmLctoCompartilhamento,
  uFrmConSeguro,
  uFrmLctoDoacao,
  uFrmLctoContasReceber,
  uFrmLctoCRManutencao,
  uFrmCadPlayer,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoDoacaoPlayer.BitBtn2Click(Sender: TObject);
begin
  bitbtn2.Tag := 1;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    QUERY1.Close;
    Close;
    frmLctoDoacao.edit1.SetFocus;
  end;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 2 then
  begin
    QUERY1.Close;
    Close;
    frmLctoDoacao.edit5.SetFocus;
  end;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 3 then
  begin
    QUERY1.Close;
    Close;
    frmLctoDoacao.Edit2.SetFocus;
  end;

  if frmConSeguro = nil then
  else if frmConSeguro.Tag = 4 then
  begin
    QUERY1.Close;
    Close;
    frmConSeguro.Edit2.SetFocus;
  end;

  if frmLctoContasReceber = nil then
  else if frmLctoContasReceber.Tag = 5 then
  begin
    QUERY1.Close;
    Close;
    frmLctoContasReceber.DBMemo1.SetFocus;
  end;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 12 then
  begin
    DM.QCredor.Close;
    Close;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 13 then
  begin
    DM.QCredor.Close;
    Close;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 4 then
  begin
    DM.QCredor.Close;
    Close;
  end;

  if frmCadPlayer = nil then
  begin
    DM.QCredor.Close;
    Close;
  end;
end;

procedure TfrmLctoDoacaoPlayer.Edit1Change(Sender: TObject);
var
  searchText: string;
begin
  searchText := Trim(Edit1.Text);
  if searchText = '' then
    Exit;

  try
    // Tenta localizar por string
    if not QUERY1.Locate('CODLCTO', searchText, [loPartialKey,
        loCaseInsensitive]) then
      if not QUERY1.Locate('IDDISCORD', searchText, [loPartialKey,
          loCaseInsensitive]) then
        if not QUERY1.Locate('NOMEDISCORD', searchText, [loPartialKey,
            loCaseInsensitive]) then
          if not QUERY1.Locate('NOMEJOGO', searchText, [loPartialKey,
              loCaseInsensitive]) then
            // Tenta localizar por número exato
            try
              QUERY1.Locate('IDSTEAM', StrToInt64(searchText), []);
            except
              // Se não for número, ignora
            end;
  except
    // Trate se necessário
  end;
end;

procedure TfrmLctoDoacaoPlayer.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    //key é uma variavel q armazena os dados da tecla pressionada que no caso foi o ENTER.
    bitBtn1.Click;
  end
  else
  begin
    if key <> #13 then
    begin
    end;
  end;
end;

procedure TfrmLctoDoacaoPlayer.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Edit1.SetFocus;
  Edit1.Clear;
  with QUERY1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from PLAYER');
    SQL.Add('Where STATUSCOD = :codigo');
    SQL.Add('Order by IDDISCORD');
    ParamByName('codigo').Text := '0';
    Open;
    first;
    last;
    first;

  end;
  PaneL2.Caption := 'Player(s) ativo(s): ' + intTostr(QUERY1.RecordCount);
  //query1.Close ;
end;

procedure TfrmLctoDoacaoPlayer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
  self.Tag := 0;

  if bitbtn2.Tag = 1 then
  begin
    bitbtn2.Tag := 0;
  end
  else
  begin
    if bitbtn2.Tag = 0 then
    begin
      if frmLctoDoacao = nil then
      else if frmLctoDoacao.Tag = 1 then
      begin
        if Application.MessageBox('O item será registrado para o comprador?',
          'Confirmação',
          mb_YesNo + mb_ICONQUESTION) = idYes then
        begin
          frmLctoDoacao.TABLE.Edit;
          frmLctoDoacao.dbedit2.Text := frmLctoDoacao.dbedit7.Text;
          frmLctoDoacao.dbedit16.Text := frmLctoDoacao.dbedit12.Text;
          frmLctoDoacao.edit5.Text := frmLctoDoacao.edit1.Text;
          frmLctoDoacao.TABLE['NOMECOMPJOGO'] := QUERY1['NOMEJOGO'];
          frmLctoDoacao.dbedit8.SetFocus;

          if frmLctoDoacao.Edit5.Text = frmLctoDoacao.Edit8.Text then
          begin
            frmLctoDoacao.TABLE['NOMEPAGADOR'] := frmLctoDoacao.Edit7.text;
          end
          else
          begin
            if frmLctoDoacao.Edit5.Text <> frmLctoDoacao.Edit8.Text then
            begin
              frmLctoDoacao.Edit7.Clear;
              frmLctoDoacao.Edit8.Clear;
              frmLctoDoacao.Edit9.Clear;
            end;
          end;

        end
        else
        begin
          frmLctoDoacao.edit5.SetFocus;
        end
      end;
    end;
  end;

  if frmCadPlayer = nil then
  begin
    DM.QCredor.Close;
    Close;
  end;
end;

procedure TfrmLctoDoacaoPlayer.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoDoacaoPlayer.BitBtn1Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    frmLctoDoacao.TABLE.Edit;
    frmLctoDoacao.DBEDIT7.Text := QUERY1['IDDISCORD'];
    frmLctoDoacao.edit1.Text := QUERY1['CODLCTO'];
    frmLctoDoacao.dbedit12.Text := QUERY1['CODLCTO'];
    frmLctoDoacao.TABLE['SEGUROTIPOCOD'] := QUERY1['SEGUROTIPOCOD'];
    frmLctoDoacao.TABLE['SEGUROTIPONOME'] := QUERY1['SEGUROTIPONOME'];

    if QUERY1['SEGUROTIPOCOD'] = 0 then
    begin
      frmLctoDoacao.DBComboBox6.ItemIndex := 0;
      frmLctoDoacao.dbedit15.Text := '0';
      frmLctoDoacao.DBComboBox6.Enabled := false;
    end
    else
    begin
      if QUERY1['SEGUROTIPOCOD'] = 1 then
      begin
        frmLctoDoacao.DBComboBox6.ItemIndex := 1;
        frmLctoDoacao.dbedit15.Text := '1';
        frmLctoDoacao.DBComboBox6.Enabled := false;
      end;
    end;
    frmLctoDoacaoPlayer := nil;
  end;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 2 then
  begin
    frmLctoDoacao.TABLE.Edit;
    frmLctoDoacao.DBEDIT2.Text := QUERY1['IDDISCORD'];
    frmLctoDoacao.edit5.Text := QUERY1['CODLCTO'];
    frmLctoDoacao.dbedit16.Text := QUERY1['CODLCTO'];
    frmLctoDoacao.TABLE['NOMECOMPJOGO'] := QUERY1['NOMEJOGO'];
    frmLctoDoacao.dbedit8.SetFocus;

    if frmLctoDoacao.Edit5.Text = frmLctoDoacao.Edit8.Text then
    begin
      frmLctoDoacao.TABLE['NOMEPAGADOR'] := frmLctoDoacao.Edit7.text;
    end
    else
    begin
      if frmLctoDoacao.Edit5.Text <> frmLctoDoacao.Edit8.Text then
      begin
        frmLctoDoacao.Edit7.Clear;
        frmLctoDoacao.Edit8.Clear;
        frmLctoDoacao.Edit9.Clear;
      end;
    end;
    frmLctoDoacaoPlayer := nil;
  end;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 3 then
  begin
    frmLctoDoacao.EDIT6.Text := QUERY1['IDDISCORD'];
    frmLctoDoacao.edit2.Text := QUERY1['CODLCTO'];
    frmLctoDoacao.bitbtn15.SetFocus;
    frmLctoDoacaoPlayer := nil;
  end;

  if frmConSeguro = nil then
  else if frmConSeguro.Tag = 4 then //form consulta seguro
  begin
    frmConSeguro.EDIT6.Text := QUERY1['IDDISCORD'];
    frmConSeguro.edit2.Text := QUERY1['CODLCTO'];
    frmConSeguro.Edit1.Text := QUERY1['SEGUROTIPOCOD'];
    frmConSeguro.label3.Caption := QUERY1['SEGUROTIPONOME'];
    frmConSeguro.bitbtn15.SetFocus;
    frmConSeguro := nil;
  end;

  if frmLctoContasReceber = nil then
  else if frmLctoContasReceber.Tag = 5 then
  begin
    frmLctoContasReceber.DBEDIT2.Text := QUERY1['IDDISCORD'];
    frmLctoContasReceber.edit1.Text := QUERY1['CODLCTO'];
    frmLctoContasReceber.DBMemo1.SetFocus;
    frmLctoContasReceber := nil;
  end;

  if frmLctoCRManutencao = nil then
  else if frmLctoCRManutencao.Tag = 12 then
  begin

    frmLctoCRManutencao.edit1.Text := QUERY1['CODLCTO'];
    frmLctoCRManutencao.FORNECEDOR.Text := QUERY1['IDDISCORD'];
    frmLctoCRManutencao.Bitbtn7.SetFocus;
    Close;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 13 then
  begin
    frmLctoCompartilhamento.TABLE1.Edit;
    frmLctoCompartilhamento.EDIT4.Text := QUERY1['CODLCTO'];
    frmLctoCompartilhamento.TABLE1['COMPRADORCOD'] := QUERY1['CODLCTO'];
    frmLctoCompartilhamento.TABLE1['COMPRADORNOME'] := QUERY1['IDDISCORD'];
    frmLctoCompartilhamento.Edit3.SetFocus;
    frmLctoDoacaoPlayer := nil;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 4 then
  begin
    frmLctoCompartilhamento.EDIT5.Text := QUERY1['CODLCTO'];
    frmLctoCompartilhamento.TABLE1['COMPARTILHADOCOD'] := QUERY1['CODLCTO'];
    frmLctoCompartilhamento.TABLE1['COMPARTILHADONOME'] := QUERY1['IDDISCORD'];
    frmLctoCompartilhamento.DbMEMO1.SetFocus;
    frmLctoDoacaoPlayer := nil;
  end;
end;

procedure TfrmLctoDoacaoPlayer.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacaoPlayer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmLctoDoacaoPlayer.cbClick(Sender: TObject);
begin
  if cb.Checked = false then
  begin
    with QUERY1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from PLAYER');
      SQL.Add('Where STATUSCOD = :codigo');
      SQL.Add('Order by IDDISCORD');
      ParamByName('codigo').Text := '0';
      Open;
      first;
      last;
      first;
    end;
    PaneL2.Caption := 'Player(s) ativo(s): ' + intTostr(QUERY1.RecordCount);
    edit1.SetFocus;
  end;

  if cb.Checked = true then
  begin
    with QUERY1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from PLAYER');
      SQL.Add('Where STATUSCOD = :codigo');
      SQL.Add('Order by IDDISCORD');
      ParamByName('codigo').Text := '1';
      Open;
      first;
      last;
      first;
    end;
    PaneL2.Caption := 'Player(s) inativos(s): ' + intTostr(QUERY1.RecordCount);
    edit1.SetFocus;
  end;
end;

end.

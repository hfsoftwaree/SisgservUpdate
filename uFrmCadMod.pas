unit uFrmCadMod;

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
  EDBNum,
  Gauges,
  ShellAPI,
  Registry;

type
  TfrmCadMod = class(TForm)
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel17: TPanel;
    ImageList1: TImageList;
    g: TLabel;
    CheckBox2: TCheckBox;
    Gauge1: TGauge;
    BitBtn5: TBitBtn;
    Panel7: TPanel;
    DBEdit5: TDBEdit;
    BitBtn8: TBitBtn;
    table1: TIBTable;
    DataSource1: TDataSource;
    table1CODLCTO: TIntegerField;
    table1NOME: TIBStringField;
    table1LINK: TIBStringField;
    Panel5: TPanel;
    DBMemo1: TDBMemo;
    table1OBS: TIBStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMod: TfrmCadMod;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmCadMod.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    TABLE1.Cancel;
    BitBtn1.Enabled := true;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    TABLE1.Append;
    dbedit2.SetFocus;
  end;
end;

procedure TfrmCadMod.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBEdit2.Text = '' then
    begin
      Application.MessageBox('Mod deve ser informado!', 'Cadastro', mb_Ok +
        mb_IconInformation);
      DBEdit2.SetFocus;
    end
  end;

  if (DBEdit2.Text <> '') then
  begin
    if Application.MessageBox('Confirma a Inclusão/Alteração?', 'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      try
        TABLE1.Post;
        if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
          mb_YesNo + mb_ICONQUESTION) = idYes then
        begin
          TABLE1.Append;
          dbedit2.SetFocus;
        end
        else
        begin
          dbedit2.SetFocus;
          TABLE1.Refresh;
          BitBtn4.Enabled := True;
          BitBtn6.Enabled := True;
          BitBtn3.Enabled := True;
        end;
      except
        Application.MessageBox('Mod já cadastrado!', 'Informação', mb_Ok +
          mb_IconExclamation);
        dbedit2.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadMod.BitBtn2Click(Sender: TObject);
begin
  TABLE1.Cancel;
  TABLE1.Refresh;
  BitBtn4.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
  dbedit2.SetFocus;
end;

procedure TfrmCadMod.BitBtn3Click(Sender: TObject);
begin
  TABLE1.cancel;
  Close;
end;

procedure TfrmCadMod.Edit1Change(Sender: TObject);
begin
  TABLE1.Locate('CODLCTO', Edit1.text, [lopartialkey, locaseinsensitive]);
  TABLE1.Locate('NOME', Edit1.text, [lopartialkey, locaseinsensitive]);
end;

procedure TfrmCadMod.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de mod';
  TABLE1.Close;
  TABLE1.Open;
  TABLE1.IndexFieldNames := ('NOME');
  TABLE1.edit;
end;

procedure TfrmCadMod.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de mod';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  dbedit2.SetFocus;
end;

procedure TfrmCadMod.BitBtn6Click(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa mod';
  PageControl1.ActivePage := TabSheet2;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  //g.Caption := 'Item cadastrado.: ' + intTostr(TABLE1.RecordCount);
end;

procedure TfrmCadMod.TabSheet1Show(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de mod';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  dbedit2.SetFocus;
end;

procedure TfrmCadMod.DBEdit11Exit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmCadMod.TabSheet2Show(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa mod';
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  table1.Last;
  table1.First;
  g.Caption := 'Item cadastrado.: ' + intTostr(TABLE1.RecordCount);
end;

procedure TfrmCadMod.DBEdit2Exit(Sender: TObject);
begin
  BITBTN1.Click;
end;

procedure TfrmCadMod.FormDestroy(Sender: TObject);
begin
  TABLE1.Close;
  TABLE1.Close;
end;

procedure TfrmCadMod.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadMod.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  TABLE1.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];
end;

procedure TfrmCadMod.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.StatusBar1.Panels[1].Text <> ' Usuário: admin' then
    begin
      Application.MessageBox('É preciso estar logado como "admin" para executar esta ação!', 'Informação', mb_Ok + mb_IconInformation);
    end
    else
    begin
      TABLE1.Open;
      if TABLE1.RecordCount = 0 then
      begin
        TABLE1.Close;
        Application.MessageBox('Não hà registro para ser excluído!', 'Exclusão',
          mb_Ok + mb_IconInformation);
      end
      else
      begin
        TABLE1.Open;
        if TABLE1.RecordCount <> 0 then
        begin
          if checkbox2.Checked = false then
          begin
            if
              Application.MessageBox('Confirma exclusão do registro selecionado?',
              'Confirmação',
              mb_YesNo + mb_ICONQUESTION) = idYes then
            begin
              TABLE1.Delete;
              g.Caption := 'Mod cadastrado.: ' + intTostr(TABLE1.RecordCount);
            end;
          end
          else
          begin
            if checkbox2.Checked = true then
            begin
              if
                Application.MessageBox('Ao prosseguir, todos os registros serão excluídos. Continua?', 'Confirmação',
                mb_YesNo + mb_ICONQUESTION) = idYes then
              begin
                TABLE1.Last;
                TABLE1.First;
                gauge1.Visible := true;
                gauge1.MaxValue := 0;
                Gauge1.MaxValue := TABLE1.RecordCount;
                while not TABLE1.Eof do
                begin
                  Gauge1.Progress := Gauge1.Progress + 1;
                  TABLE1.Delete;
                  g.Caption := 'Mod cadastrado.: ' +
                    intTostr(TABLE1.RecordCount);
                end;
                gauge1.Visible := false;
                gauge1.MaxValue := 0;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadMod.BitBtn8Click(Sender: TObject);
var
  Endereco: string;
begin
  if dbedit5.Text <> '' then
  begin
    dbedit5.Text := Trim(dbedit5.Text);
    if (Pos('http://', dbedit5.Text) or
      Pos('https://', dbedit5.Text)) <> 0 then
      Endereco := dbedit5.Text
    else
    begin
      Endereco := 'http://' + dbedit5.Text; // Padrão
      dbedit5.Text := 'http://' + dbedit5.Text;
    end;
    ShellExecute(Handle, 'open', PCHAR(Endereco), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    Application.MessageBox('Não há url cadastrada para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end;
end;

end.

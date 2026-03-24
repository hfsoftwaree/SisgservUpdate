unit uFrmCadTipoLancamento;

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
  DBTables,
  DBXpress,
  FMTBcd,
  DBClient,
  Provider,
  SqlExpr,
  IBCustomDataSet,
  IBTable;

type
  TfrmCadTipoLancamento = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label3: TLabel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    DataSource1: TDataSource;
    table1: TIBTable;
    table1CODLCTO: TIntegerField;
    table1NOME: TIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBEdit2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoLancamento: TfrmCadTipoLancamento;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmCadTipoLancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmCadTipoLancamento.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Label1.Caption := 'Cadastro de tipo de lançamento';
  DBEdit2.SetFocus;
  table1.Open;
  //DM.TEssencia.Refresh;
  table1.IndexFieldNames := ('NOME');
  table1.First;
  table1.Edit;
  //if dbedit1.Text <> '0' then
  //begin
  //bitbtn1.Visible := false;  //gravar
  //bitbtn5.Visible := true;   //excluir
  //end
  //else
  //begin
  //bitbtn1.Visible := true;  //gravar
  //bitbtn5.Visible := false;   //excluir
  //end;
end;

procedure TfrmCadTipoLancamento.Edit1Change(Sender: TObject);
begin
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    table1.Locate('NOME', Edit1.text, [lopartialkey, locaseinsensitive]);
    table1.Locate('CODLCTO', Edit1.text, [lopartialkey, locaseinsensitive]);
  end;
end;

procedure TfrmCadTipoLancamento.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitbtn1.Click;
end;

procedure TfrmCadTipoLancamento.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    Label1.Caption := 'Cadastro de tipo de lançamento';
    Bitbtn7.Visible := False;
    Bitbtn6.Visible := True;
    Label3.Visible := False;
    Edit1.Clear;
    Edit1.Visible := False;
    Label2.Visible := True;
    DBEdit2.Visible := True;

    DBEdit2.SetFocus;
    table1.Cancel;
    table1.Append;

    BitBtn4.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    bitbtn1.Visible := true; //gravar
    bitbtn5.Visible := false; //excluir
  end;
end;

procedure TfrmCadTipoLancamento.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBEDIT2.Text = '' then
    begin
      Application.MessageBox('Tipo de lançamento deve ser informado!',
        'Informação', mb_Ok + mb_IconInformation);
      DBEdit2.SetFocus;
    end;

    if (DBEDIT2.Text <> '') then
    begin
      if Application.MessageBox('Confirma Inclusão?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          table1.Post;
          table1.Refresh;
          if Application.MessageBox('Gostaria de incluir outro registro?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            table1.Append;
            dbedit2.SetFocus;
            BitBtn4.Enabled := False;
            BitBtn6.Enabled := False;
            BitBtn3.Enabled := False;
          end
          else
          begin
            dbedit2.SetFocus;
            BitBtn4.Enabled := true;
            BitBtn6.Enabled := true;
            BitBtn3.Enabled := true;
            bitbtn1.Visible := false; //gravar
            bitbtn5.Visible := true; //excluir
          end;
        except
          Application.MessageBox('Tipo de lançamento já cadastrado!',
            'Informação', mb_Ok + mb_IconExclamation);
          DBEdit2.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadTipoLancamento.BitBtn2Click(Sender: TObject);
begin
  //DBEdit2.SetFocus;
  table1.Cancel;
  BitBtn4.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
  if dbedit1.Text <> '0' then
  begin
    bitbtn1.Visible := false; //gravar
    bitbtn5.Visible := true; //excluir
  end
  else
  begin
    bitbtn1.Visible := true; //gravar
    bitbtn5.Visible := false; //excluir
  end;
end;

procedure TfrmCadTipoLancamento.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de tipo de lançamento';
  Bitbtn7.Visible := False;
  Bitbtn6.Visible := True;
  Label3.Visible := False;
  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  DBEdit2.SetFocus;
end;

procedure TfrmCadTipoLancamento.BitBtn6Click(Sender: TObject);
begin
  if table1.RecordCount <> 0 then
  begin
    Label1.Caption := 'Pesquisa tipo de lançamento';
    Bitbtn6.Visible := False;
    Bitbtn7.Visible := True;
    Label2.Visible := False;
    DBEdit2.Visible := False;
    Label3.Visible := True;
    Edit1.Visible := True;
    Edit1.Clear;
    Edit1.SetFocus;
  end
  else
  begin
    if table1.RecordCount = 0 then
    begin
      Application.MessageBox('Não há registro cadastrado para pesquisa!',
        'Informação', mb_Ok + mb_IconExclamation);
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadTipoLancamento.BitBtn3Click(Sender: TObject);
begin
  table1.Cancel;
  Label1.Caption := 'Cadastro de tipo de lançamento';
  Label3.Visible := False;
  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  Bitbtn7.Visible := False;
  Bitbtn6.Visible := True;
  bitbtn1.Tag := 0;
  Close;
end;

procedure TfrmCadTipoLancamento.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    table1.Open;
    if table1.RecordCount = 0 then
    begin
      table1.Close;
      Application.MessageBox('Não hà registro para ser Excluído!', 'Informação',
        mb_Ok + mb_IconInformation);
    end;
  end;

  table1.Open;
  if table1.RecordCount <> 0 then
  begin
    if Application.MessageBox('Confirma exclusão do registro selecionado?',
      'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      if (table1['CODLCTO'] = '1') then
      begin
        Application.MessageBox('Não é possível excluir esse registro, pois ele é utilizado pelo sistema!', 'Informação', mb_Ok + mb_IconInformation);
      end
      else
      begin
        if (table1['CODLCTO'] = '6') then
        begin
          Application.MessageBox('Não é possível excluir esse registro, pois ele é utilizado pelo sistema!', 'Informação', mb_Ok + mb_IconInformation);
        end
        else
        begin
          if (table1['CODLCTO'] = '9') then
          begin
            Application.MessageBox('Não é possível excluir esse registro, pois ele é utilizado pelo sistema!', 'Informação', mb_Ok + mb_IconInformation);
          end
        end
      end;

      if (table1['CODLCTO'] <> '1') and (table1['CODLCTO'] <> '6') and
        (table1['CODLCTO'] <> '9') then
      begin
        table1.Delete;
        table1.Refresh;
      end;
    end;
  end;
end;

procedure TfrmCadTipoLancamento.FormDestroy(Sender: TObject);
begin
  table1.Close;
end;

procedure TfrmCadTipoLancamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadTipoLancamento.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  mousePt: TGridcoord;
begin
  mousePt := DbGrid1.MouseCoord(x, y);
  if mousePt.y = 0 then
    Screen.Cursor := crHandPoint
  else
    Screen.Cursor := crDefault;

end;

procedure TfrmCadTipoLancamento.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  TABLE1.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

procedure TfrmCadTipoLancamento.DBEdit2Change(Sender: TObject);
begin
  //if dbedit2.Text <> '' then
  //begin
  //bitbtn1.Visible := true;
  //bitbtn5.Visible := false;
  //end;
end;

end.

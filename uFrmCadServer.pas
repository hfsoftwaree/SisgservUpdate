unit uFrmCadServer;

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
  TfrmCadServer = class(TForm)
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
    fechamento: TIBTable;
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadServer: TfrmCadServer;

implementation

uses
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmCadServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmCadServer.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Label1.Caption := 'Cadastro de Servidor';
  DBEdit2.SetFocus;
  DM.TEssencia.Open;
  //DM.TEssencia.Refresh;
  DM.TEssencia.IndexFieldNames := ('ESSENCIA');
  DM.TEssencia.First;
  DM.TEssencia.Edit;
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

procedure TfrmCadServer.Edit1Change(Sender: TObject);
begin
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    DM.TEssencia.Locate('ESSENCIA', Edit1.text, [lopartialkey,
        locaseinsensitive]);
  end
  else
  begin
    if (edit1.Text >= '0') and (edit1.Text <= '9') then
    begin
      DM.TEssencia.Locate('CODIGO', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    end;
  end;
end;

procedure TfrmCadServer.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitbtn1.Click;
end;

procedure TfrmCadServer.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DBEdit2.SetFocus;
    DM.TEssencia.Cancel;
    DM.TEssencia.Append;

    BitBtn4.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    //bitbtn1.Visible := true;  //gravar
    bitbtn5.Enabled := false; //excluir
  end;
end;

procedure TfrmCadServer.BitBtn1Click(Sender: TObject);
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
      Application.MessageBox('Servidor deve ser informado!', 'Informação', mb_Ok
        + mb_IconInformation);
      DBEdit2.SetFocus;
    end;

    if (DBEDIT2.Text <> '') then
    begin
      if Application.MessageBox('Confirma Inclusão?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          DM.TEssencia.Post;
          DM.TEssencia.Refresh;
          if Application.MessageBox('Gostaria de incluir outro servidor?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TEssencia.Append;
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
            //    bitbtn1.Visible := false;  //gravar
            //    bitbtn5.Visible := true;   //excluir
          end;
        except
          Application.MessageBox('Servidor já cadastrado!', 'Informação', mb_Ok
            + mb_IconExclamation);
          DBEdit2.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadServer.BitBtn2Click(Sender: TObject);
begin
  DBEdit2.SetFocus;
  DM.TEssencia.Cancel;
  BitBtn4.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
  //bitbtn1.Visible := true;  //gravar
  bitbtn5.Enabled := true; //excluir

end;

procedure TfrmCadServer.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de servidor';
  Bitbtn7.Visible := False;
  Bitbtn6.Visible := True;
  Label3.Visible := False;
  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  DBEdit2.SetFocus;
end;

procedure TfrmCadServer.BitBtn6Click(Sender: TObject);
begin
  if DM.TEssencia.RecordCount <> 0 then
  begin
    Label1.Caption := 'Pesquisa de servidor';
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
    if DM.TEssencia.RecordCount = 0 then
    begin
      Application.MessageBox('Não há servidor cadastrado para pesquisa!',
        'Informação', mb_Ok + mb_IconExclamation);
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadServer.BitBtn3Click(Sender: TObject);
begin
  DM.TEssencia.Cancel;
  Label1.Caption := 'Cadastro de Servidor';
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

procedure TfrmCadServer.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.excluir.Caption <> 'False' then
    begin
      DM.Tessencia.Open;
      if DM.TEssencia.RecordCount = 0 then
      begin
        DM.TEssencia.Close;
        Application.MessageBox('Não hà servidor para ser Excluído!',
          'Informação', mb_Ok + mb_IconInformation);
      end;
    end;

    DM.TEssencia.Open;
    if DM.TEssencia.RecordCount <> 0 then
    begin
      if Application.MessageBox('Confirma exclusão do registro selecionado?',
        'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        DM.TEssencia.Delete;
        DM.TEssencia.Refresh;
      end;
    end;
  end;
end;

procedure TfrmCadServer.FormDestroy(Sender: TObject);
begin
  DM.TEssencia.Close;
end;

procedure TfrmCadServer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadServer.DBGrid1MouseMove(Sender: TObject;
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

procedure TfrmCadServer.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  dm.TEssencia.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

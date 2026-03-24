unit uFrmCadTipoItem;

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
  SqlExpr;

type
  TfrmCadTipoItem = class(TForm)
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
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoItem: TfrmCadTipoItem;

implementation

uses
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmCadTipoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmCadTipoItem.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  Label1.Caption := 'Cadastro de Item';
  DBEdit2.SetFocus;
  DM.TTIPOCONTATO.Open;
  DM.TTIPOCONTATO.Refresh;

  if dm.TTIPOCONTATO.RecordCount = 0 then
  begin
    dm.TTIPOCONTATO.Append;
    bitbtn4.Enabled := false;
  end
  else
  begin
    if dm.TTIPOCONTATO.RecordCount <> 0 then
    begin
      DM.TTIPOCONTATO.IndexName := ('NOMECONTATO');
      DM.TTIPOCONTATO.First;
      DM.TTIPOCONTATO.Edit;
    end;
  end;
end;

procedure TfrmCadTipoItem.Edit1Change(Sender: TObject);
begin
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    DM.TTIPOCONTATO.Locate('NOMECONTATO', Edit1.text, [lopartialkey,
        locaseinsensitive]);
  end
  else
  begin
    if (edit1.Text >= '0') and (edit1.Text <= '9') then
    begin
      DM.TTIPOCONTATO.Locate('CODIGOCONTATO', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    end;
  end;
end;

procedure TfrmCadTipoItem.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitbtn1.Click;
end;

procedure TfrmCadTipoItem.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DBEdit2.SetFocus;
    DM.TTIPOCONTATO.Cancel;
    DM.TTIPOCONTATO.Append;
    BitBtn4.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
  end;
end;

procedure TfrmCadTipoItem.BitBtn1Click(Sender: TObject);
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
      Application.MessageBox('Item deve ser informado!', 'Inscrições', mb_Ok +
        mb_IconInformation);
      DBEdit2.SetFocus;
    end;
    if (DBEDIT2.Text <> '') then
    begin
      if Application.MessageBox('Confirma Inclusão?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          DM.TTIPOCONTATO.Post;
          DM.TTIPOCONTATO.Refresh;
          if Application.MessageBox('Gostaria de incluir outro item?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TTIPOCONTATO.Append;
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
            DM.TTIPOCONTATO.IndexName := ('NOMECONTATO');
          end;
        except
          Application.MessageBox('Item já Cadastrado!', 'Item', mb_Ok +
            mb_IconExclamation);
          DM.TTIPOCONTATO.Cancel;
          DM.TTIPOCONTATO.First;
          DM.TTIPOCONTATO.Edit;
          BitBtn4.Enabled := true;
          BitBtn6.Enabled := true;
          BitBtn3.Enabled := true;
          //    DBEdit2.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadTipoItem.BitBtn2Click(Sender: TObject);
begin
  DBEdit2.SetFocus;
  DM.TTIPOCONTATO.Cancel;
  BitBtn4.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
end;

procedure TfrmCadTipoItem.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Item';
  bitbtn4.Enabled := true;
  Bitbtn2.Enabled := true;
  bitbtn1.Enabled := true;
  //Bitbtn5.enabled := true;
  Bitbtn1.Visible := True;
  bitbtn7.Visible := false;
  bitbtn6.Visible := true;
  Label3.Visible := False;

  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  DBEdit2.SetFocus;
end;

procedure TfrmCadTipoItem.BitBtn6Click(Sender: TObject);
begin
  if DM.TTIPOCONTATO.RecordCount <> 0 then
  begin
    Label1.Caption := 'Pesquisa item';
    bitbtn4.Enabled := false;
    bitbtn2.Enabled := false;
    bitbtn1.Enabled := false;
    //bitbtn5.enabled  := true;
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
    if DM.TTIPOCONTATO.RecordCount = 0 then
    begin
      Application.MessageBox('Não há item cadastrado para pesquisa!',
        'Informação', mb_Ok + mb_IconExclamation);
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadTipoItem.BitBtn3Click(Sender: TObject);
begin
  DM.TTIPOCONTATO.Cancel;
  Label1.Caption := 'Cadastro de Item';
  Label3.Visible := False;
  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  Bitbtn7.Visible := False;
  Bitbtn6.Visible := True;
  Close;
end;

procedure TfrmCadTipoItem.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DM.TTIPOCONTATO.Open;
    if DM.TTIPOCONTATO.RecordCount = 0 then
    begin
      DM.TTIPOCONTATO.Close;
      Application.MessageBox('Não hà item cadastrado para ser excluído!',
        'Informação', mb_Ok + mb_IconInformation);
    end
    else
    begin
      DM.TTIPOCONTATO.Open;
      if DM.TTIPOCONTATO.RecordCount <> 0 then
      begin
        if Application.MessageBox('Confirma exclusão do registro selecionado?',
          'Confirmação',
          mb_YesNo + mb_ICONQUESTION) = idYes then
        begin
          DM.TTIPOCONTATO.Delete;
          DM.TTIPOCONTATO.Refresh;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadTipoItem.FormDestroy(Sender: TObject);
begin
  DM.TTIPOCONTATO.Close;
end;

procedure TfrmCadTipoItem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadTipoItem.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DM.TTIPOCONTATO.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

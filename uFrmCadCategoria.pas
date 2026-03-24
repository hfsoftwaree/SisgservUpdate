unit uFrmCadCategoria;

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
  TfrmCadCategoria = class(TForm)
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
    categoria: TIBTable;
    categoriaID_CODIGO: TIntegerField;
    categoriaNOME: TIBStringField;
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
  frmCadCategoria: TfrmCadCategoria;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmCadCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
  categoria.Close;
end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;
  DBEdit2.SetFocus;
  categoria.Open;
  categoria.IndexFieldNames := ('NOME');
  categoria.First;
  categoria.Edit;
end;

procedure TfrmCadCategoria.Edit1Change(Sender: TObject);
begin
  if (edit1.Text >= 'A') and (edit1.Text <= 'Z') then
  begin
    categoria.Locate('NOME', Edit1.text, [lopartialkey, locaseinsensitive]);
  end
  else
  begin
    if (edit1.Text >= '0') and (edit1.Text <= '9') then
    begin
      CATEGORIA.Locate('ID_CODIGO', Edit1.text, [lopartialkey,
          locaseinsensitive]);
    end;
  end;
end;

procedure TfrmCadCategoria.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitbtn1.Click;
end;

procedure TfrmCadCategoria.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DBEdit2.SetFocus;
    categoria.Cancel;
    categoria.Append;

    BitBtn4.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
  end;
end;

procedure TfrmCadCategoria.BitBtn1Click(Sender: TObject);
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
      Application.MessageBox('Categoria deve ser informada!', 'Inscrições', mb_Ok
        + mb_IconInformation);
      DBEdit2.SetFocus;
    end;

    if (DBEDIT2.Text <> '') then
    begin
      if Application.MessageBox('Confirma Inclusão?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          categoria.Post;
          categoria.Refresh;
          if Application.MessageBox('Gostaria de incluir outra Categoria?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            categoria.Append;
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
          end;
        except
          Application.MessageBox('Categoria já Cadastrada!', 'Informação', mb_Ok
            + mb_IconExclamation);
          DBEdit2.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadCategoria.BitBtn2Click(Sender: TObject);
begin
  DBEdit2.SetFocus;
  categoria.Cancel;
  BitBtn4.Enabled := true;
  BitBtn6.Enabled := true;
  BitBtn3.Enabled := true;
end;

procedure TfrmCadCategoria.BitBtn7Click(Sender: TObject);
begin
  Bitbtn7.Visible := False;
  Bitbtn6.Visible := True;
  Label3.Visible := False;
  Edit1.Clear;
  Edit1.Visible := False;
  Label2.Visible := True;
  DBEdit2.Visible := True;
  DBEdit2.SetFocus;
end;

procedure TfrmCadCategoria.BitBtn6Click(Sender: TObject);
begin
  if categoria.RecordCount <> 0 then
  begin
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
    if categoria.RecordCount = 0 then
    begin
      Application.MessageBox('Não a categoria cadastrada para pesquisa!',
        'Informação', mb_Ok + mb_IconExclamation);
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadCategoria.BitBtn3Click(Sender: TObject);
begin
  categoria.Cancel;
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

procedure TfrmCadCategoria.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if categoria.RecordCount = 0 then
    begin
      categoria.Close;
      Application.MessageBox('Não hà Categoria para ser Excluída!',
        'Informação', mb_Ok + mb_IconInformation);
    end;
  end;

  categoria.Open;
  if categoria.RecordCount <> 0 then
  begin
    if Application.MessageBox('Confirma Exclusão desta Categoria?',
      'Confirmação',
      mb_YesNo + mb_ICONQUESTION) = idYes then
    begin
      categoria.Delete;
      categoria.Refresh;
    end;
  end;
end;

procedure TfrmCadCategoria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadCategoria.DBGrid1MouseMove(Sender: TObject;
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

procedure TfrmCadCategoria.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  categoria.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

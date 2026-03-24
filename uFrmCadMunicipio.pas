unit uFrmCadMunicipio;

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
  DBCtrls,
  StdCtrls,
  Buttons,
  Grids,
  DBGrids,
  Mask,
  ExtCtrls,
  ComCtrls,
  ToolWin,
  XP_MenuBar,
  EDBZero,
  DB,
  IBCustomDataSet,
  IBTable,
  EChkCPF,
  EChkCNPJ;

type
  TfrmCadMunicipio = class(TForm)
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel17: TPanel;
    Panel5: TPanel;
    DBEdit3: TDBEdit;
    ImageList1: TImageList;
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
  frmCadMunicipio: TfrmCadMunicipio;

implementation

uses
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmCadMunicipio.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DM.TMunicipio.Cancel;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    DM.TMunicipio.Append;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmCadMunicipio.BitBtn1Click(Sender: TObject);
begin
  if frmprincipal.alterar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DBEdit1.Text = '' then
    begin
      Application.MessageBox('Código do Município deve ser informado!',
        'Cadastro', mb_Ok + mb_IconInformation);
      DBEdit1.SetFocus;
    end
    else
    begin
      if DBEdit2.Text = '' then
      begin
        Application.MessageBox('Município deve ser informado!', 'Cadastro', mb_Ok
          + mb_IconInformation);
        DBEdit2.SetFocus;
      end
      else
      begin
        if DBEdit11.Text = '' then
        begin
          Application.MessageBox('UF deve ser informada!', 'Cadastro', mb_Ok +
            mb_IconInformation);
          DBEdit11.SetFocus;
        end
      end;
    end;

    if (DBEdit1.Text <> '') and (DBEDIT2.Text <> '') and (DBEdit11.Text <> '')
      then
    begin
      if Application.MessageBox('Confirma a Inclusão/Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        try
          DM.TMunicipio.Post;
          DM.TMunicipio.Refresh;
          if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
            DM.TMunicipio.Append
        except
          Application.MessageBox('Município já Cadastrado!', 'Município', mb_Ok
            + mb_IconExclamation);
        end;
        DBEdit1.SetFocus;
        BitBtn6.Enabled := True;
      end
      else
        DBEdit1.SetFocus;
    end
  end;
end;

procedure TfrmCadMunicipio.BitBtn2Click(Sender: TObject);
begin
  DM.TMunicipio.Cancel;
  BitBtn4.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
  DBEdit1.SetFocus;
end;

procedure TfrmCadMunicipio.BitBtn3Click(Sender: TObject);
begin
  DM.TMunicipio.cancel;
  Close;
end;

procedure TfrmCadMunicipio.Edit1Change(Sender: TObject);
begin
  DM.TMunicipio.Locate('NOM_MUNIC', Edit1.text, [lopartialkey,
      locaseinsensitive]);
end;

procedure TfrmCadMunicipio.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de Municipio';
  DM.TMunicipio.Close;
  DM.TMunicipio.Open;
  DM.TMunicipio.IndexName := 'IND_MUNICIPIO';
  DBEdit1.SetFocus;
end;

procedure TfrmCadMunicipio.BitBtn7Click(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Município';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBEdit1.SetFocus;
end;

procedure TfrmCadMunicipio.BitBtn6Click(Sender: TObject);
begin
  if DM.TMunicipio.RecordCount = 0 then
  begin
    Application.MessageBox('Não hà Município cadastrados para pesquisa!',
      'Pesquisa', mb_Ok + mb_IconInformation);
    DBEdit1.SetFocus;
  end
  else
  begin
    Label1.Caption := 'Pesquisa de Município';
    PageControl1.ActivePage := TabSheet2;
    BitBtn6.Visible := False;
    BitBtn7.Visible := True;
    Edit1.SetFocus;
  end;
end;

procedure TfrmCadMunicipio.TabSheet1Show(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Municipio';
  DBEdit1.SetFocus;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
end;

procedure TfrmCadMunicipio.DBEdit11Exit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmCadMunicipio.TabSheet2Show(Sender: TObject);
begin
  Label1.Caption := 'Pesquisa de Município';
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
end;

procedure TfrmCadMunicipio.FormDestroy(Sender: TObject);
begin
  DM.TMunicipio.Close;
end;

procedure TfrmCadMunicipio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

end;

procedure TfrmCadMunicipio.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  dm.TMunicipio.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];
end;

end.

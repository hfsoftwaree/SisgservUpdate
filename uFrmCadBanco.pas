unit uFrmCadBanco;

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
  CJVLed,
  Gauges;

type
  TfrmCadBanco = class(TForm)
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
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn5: TBitBtn;
    Panel7: TPanel;
    DBEdit8: TDBEdit;
    Panel10: TPanel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    Gauge1: TGauge;
    g: TLabel;
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

uses
  uFrmPrincipal,
  uDM;

{$R *.dfm}

procedure TfrmCadBanco.BitBtn4Click(Sender: TObject);
begin
  if frmprincipal.incluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    DBEdit7.SetFocus;
    BitBtn4.Enabled := False;
    PageControl1.ActivePage := TabSheet1;
    BitBtn6.Enabled := False;
    BitBtn3.Enabled := False;
    DM.TSUBProdutos.Cancel;
    DM.TSUBProdutos.Append;
    Bitbtn1.visible := true;
    Bitbtn5.Enabled := false;
  end;
end;

procedure TfrmCadBanco.BitBtn1Click(Sender: TObject);
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
      Application.MessageBox('Banco deve ser informado!', 'Cadastro', mb_Ok +
        mb_IconInformation);
      DBEdit2.SetFocus;
    end;

    if (DBEdit2.Text <> '') then
    begin
      if Application.MessageBox('Confirma a Inclusão/Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        //  try
        DM.TSUBProdutos.Post;
        if Application.MessageBox('Continua Cadastramento?', 'Confirmação',
          mb_YesNo + mb_ICONQUESTION) = idYes then
        begin
          DM.TSUBProdutoS.Append;
          DBEdit7.SetFocus;
          BitBtn4.Enabled := True;
          BitBtn6.Enabled := True;
          BitBtn3.Enabled := True;
        end
        else
        begin
          DM.TSUBProdutoS.Refresh;
          DBEdit7.SetFocus;
        end;
        //  except
          //  Application.MessageBox('Banco já Cadastrado!', 'Banco', mb_Ok + mb_IconExclamation);
          //end;
      end;
    end;
  end;
end;

procedure TfrmCadBanco.BitBtn2Click(Sender: TObject);
begin
  DM.TSUBProdutos.Cancel;
  BitBtn4.Enabled := True;
  BitBtn5.Enabled := True;
  BitBtn6.Enabled := True;
  BitBtn3.Enabled := True;
  DBEdit7.SetFocus;
end;

procedure TfrmCadBanco.BitBtn3Click(Sender: TObject);
begin
  DM.TsubProdutos.Cancel;
  Close;
end;

procedure TfrmCadBanco.Edit1Change(Sender: TObject);
begin
  //if edit1.Text = '' then
  //begin
  //DM.TSUBPRODUTOS.First;
  //end
  //else
  //if (edit1.Text>='A') and (edit1.Text<='Z') then
  //begin
  //DM.TSUBProdutoS.Locate('NOMEGRAU',Edit1.text,[lopartialkey,locaseinsensitive]);
  //end
  //else
  //begin
  //if (edit1.Text>='0') and (edit1.Text<='9') then
  //begin
  DM.TSUBProdutoS.Locate('GRAUIND', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  DM.TSUBProdutoS.Locate('COMP', Edit1.text, [lopartialkey, locaseinsensitive]);
  DM.TSUBProdutoS.Locate('NOMEGRAU', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  DM.TSUBProdutoS.Locate('APELIDO', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  DM.TSUBProdutoS.Locate('LARG', Edit1.text, [lopartialkey, locaseinsensitive]);
  DM.TSUBProdutoS.Locate('EXP', Edit1.text, [lopartialkey, locaseinsensitive]);
  DM.TSUBProdutoS.Locate('VINCULONOME', Edit1.text, [lopartialkey,
      locaseinsensitive]);
  //end;
  //end;
end;

procedure TfrmCadBanco.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  Label1.Caption := 'Cadastro de banco(s)';
  DM.TsubProdutos.Close;
  DM.TsubProdutos.Open;
  DM.TsubProdutos.IndexName := ('SUBPRODUTO');
end;

procedure TfrmCadBanco.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de banco(s)';
  PageControl1.ActivePage := TabSheet1;
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBEdit7.SetFocus;
end;

procedure TfrmCadBanco.BitBtn6Click(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa de banco(s)';
  PageControl1.ActivePage := TabSheet2;
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  //g.Caption := 'Banco (s) cadastrado (s).: ' + intTostr(DM.TSUBPRODUTOS.RecordCount);
end;

procedure TfrmCadBanco.TabSheet1Show(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn4.Enabled := True;
  Label1.Caption := 'Cadastro de banco(s)';
  BitBtn7.Visible := False;
  BitBtn6.Visible := True;
  DBEdit7.SetFocus;
end;

procedure TfrmCadBanco.DBEdit11Exit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmCadBanco.TabSheet2Show(Sender: TObject);
begin
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn4.Enabled := False;
  Label1.Caption := 'Pesquisa de banco(s)';
  BitBtn6.Visible := False;
  BitBtn7.Visible := True;
  Edit1.SetFocus;
  DM.TSUBPRODUTOS.Last;
  DM.TSUBPRODUTOS.First;
  g.Caption := 'Banco (s) cadastrado (s).: ' +
    intTostr(DM.TSUBPRODUTOS.RecordCount);
end;

procedure TfrmCadBanco.DBEdit2Exit(Sender: TObject);
begin
  BITBTN1.Click;
end;

procedure TfrmCadBanco.FormDestroy(Sender: TObject);
begin
  DM.TsubProdutos.Close;
  DM.QEssencia.Close;
end;

procedure TfrmCadBanco.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

  if Key = VK_BACK then
    edit1.setfocus;
end;

procedure TfrmCadBanco.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  dm.TSUBPRODUTOS.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];
end;

procedure TfrmCadBanco.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if Column.FieldName = 'INATIVO_CODIGO' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    iCheck := 0;
    if DM.TSUBPRODUTOS.FieldByName('INATIVO_CODIGO').AsString = '1' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGrid1.Canvas.Handle, rRect, DFC_BUTTON, DFCS_BUTTONCHECK
      or iCheck);
  end
end;

procedure TfrmCadBanco.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmCadBanco.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.excluir.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DM.TSUBPRODUTOS.RecordCount = 0 then
    begin
      Application.MessageBox('Não hà registro para ser excluído!', 'Informação',
        mb_Ok + mb_IconInformation);
    end
    else
    begin
      if DM.TSUBPRODUTOS.RecordCount <> 0 then
      begin
        if checkbox2.Checked = false then
        begin
          if Application.MessageBox('Confirma Exclusão deste registro?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TSUBPRODUTOS.Delete;
            DM.TSUBPRODUTOS.Refresh;
            g.Caption := 'Item cadastrado.: ' +
              intTostr(DM.TSUBPRODUTOS.RecordCount);
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
              DM.TSUBPRODUTOS.Last;
              DM.TSUBPRODUTOS.First;
              gauge1.Visible := true;
              gauge1.MaxValue := 0;
              Gauge1.MaxValue := DM.TSUBPRODUTOS.RecordCount;
              while not DM.TSUBPRODUTOS.Eof do
              begin
                Gauge1.Progress := Gauge1.Progress + 1;
                DM.TSUBPRODUTOS.Delete;
                g.Caption := 'Item cadastrado.: ' +
                  intTostr(DM.TSUBPRODUTOS.RecordCount);
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

end.

unit uFrmLctoDoacaoItem1;

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
  DBCtrls;

type
  TfrmLctoDoacaoItem1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    //    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctoDoacaoItem1: TfrmLctoDoacaoItem1;

implementation

uses
  uFrmCadItem,
  uFrmLctoCompartilhamento,
  uFrmConSeguro,
  uFrmLctoDoacao,
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmLctoDoacaoItem1.BitBtn2Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    DM.T_VENDEDOR.Close;
    Close;
    frmLctoDoacao.DBedit6.SetFocus;
    frmLctoDoacao.edit3.SetFocus;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 3 then
  begin
    bitbtn3.Enabled := true;
    DM.T_VENDEDOR.Close;
    Close;
    frmLctoCompartilhamento.edit3.SetFocus;
  end;

end;

procedure TfrmLctoDoacaoItem1.Edit1Change(Sender: TObject);
begin
  //https://www.youtube.com/watch?v=FrJdojIJLR8&t=953s

  if edit1.Text = '' then
  begin
    DM.T_VENDEDOR.Filtered := false;
    DM.T_VENDEDOR.Open;
    DM.T_VENDEDOR.Last;
    Panel2.Caption := 'Itens listados.: ' + intTostr(DM.T_VENDEDOR.RecordCount);
    DM.T_VENDEDOR.First;
  end
  else
  begin
    if edit1.Text <> '' then
    begin
      DM.T_VENDEDOR.Filtered := false;
      DM.T_VENDEDOR.Filter := 'NOMEVENDEDOR like' + QuotedStr('%' + edit1.Text +
        '%');
      DM.T_VENDEDOR.Filtered := True;
      DM.T_VENDEDOR.Open;

      if DM.T_VENDEDOR.RecordCount <> 0 then
      begin
        DM.T_VENDEDOR.Filtered := false;
        DM.T_VENDEDOR.Filter := 'NOMEVENDEDOR like' + QuotedStr('%' + edit1.Text
          + '%');
        DM.T_VENDEDOR.Filtered := True;
        DM.T_VENDEDOR.Open;
        DM.T_VENDEDOR.Last;
        Panel2.Caption := 'Itens listados.: ' +
          intTostr(DM.T_VENDEDOR.RecordCount);
        DM.T_VENDEDOR.First;

      end
      else
      begin
        if DM.T_VENDEDOR.RecordCount = 0 then
        begin
          DM.T_VENDEDOR.Filtered := false;
          DM.T_VENDEDOR.Open;
          DM.T_VENDEDOR.Last;
          Panel2.Caption := '' + intTostr(DM.T_VENDEDOR.RecordCount);
          DM.T_VENDEDOR.First;
        end
      end;
    end;
  end;
end;

procedure TfrmLctoDoacaoItem1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    bitBtn1.Click;
    Key := #0;
  end
  else
  begin
    if key <> #13 then
    begin
    end
  end;
end;

procedure TfrmLctoDoacaoItem1.FormShow(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := False;

  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    DM.T_VENDEDOR.Open;
    Edit1.SetFocus;
    Edit1.Clear;
    DM.T_VENDEDOR.Last;
    Panel2.Caption := 'Itens listados.: ' + intTostr(DM.T_VENDEDOR.RecordCount);
    DM.T_VENDEDOR.First;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 3 then
  begin
    bitbtn3.Enabled := false;

    DM.T_VENDEDOR.Filtered := false;
    DM.T_VENDEDOR.Filter := 'NOMEVENDEDOR like' + QuotedStr('%' + edit1.Text +
      '%');
    DM.T_VENDEDOR.Filtered := True;
    DM.T_VENDEDOR.Open;
    DM.T_VENDEDOR.Last;
    Panel2.Caption := 'Itens listados.: ' + intTostr(DM.T_VENDEDOR.RecordCount);
    DM.T_VENDEDOR.First;
  end;

end;

procedure TfrmLctoDoacaoItem1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
end;

procedure TfrmLctoDoacaoItem1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitBtn1.Click;
end;

procedure TfrmLctoDoacaoItem1.BitBtn1Click(Sender: TObject);
begin
  if frmLctoDoacao = nil then
  else if frmLctoDoacao.Tag = 1 then
  begin
    frmLctoDoacao.TABLE.Edit;
    frmLctoDoacao.DBEDIT11.Text := DM.T_VENDEDOR['NOMEVENDEDOR'];
    frmLctoDoacao.edit3.Text := DM.T_VENDEDOR['CODIGOVENDEDOR'];
    frmLctoDoacao.dbedit10.Text := DM.T_VENDEDOR['CODIGOVENDEDOR'];
    frmLctoDoacao.TABLE['ITEMMODELO'] := DM.T_VENDEDOR['MODELO'];
    frmLctoDoacao.TABLE['ITEMNOMECLASSE'] := DM.T_VENDEDOR['NOMECLASSE'];
    //      frmdonate.dbedit20.Text := DM.T_VENDEDOR['MODELO'];
    frmLctoDoacao.dbedit21.SetFocus;
    Close;
  end;

  if frmConSeguro = nil then
  else if frmConSeguro.Tag = 2 then
  begin
    frmConSeguro.DBEDIT11.Text := DM.T_VENDEDOR['NOMEVENDEDOR'];
    frmConSeguro.edit3.Text := DM.T_VENDEDOR['CODIGOVENDEDOR'];
    frmConSeguro.bitbtn15.SetFocus;
    Close;
  end;

  if frmLctoCompartilhamento = nil then
  else if frmLctoCompartilhamento.Tag = 3 then
  begin
    frmLctoCompartilhamento.TABLE1.Edit;
    frmLctoCompartilhamento.edit3.Text := DM.T_VENDEDOR['CODIGOVENDEDOR'];
    frmLctoCompartilhamento.DBEDIT11.Text := DM.T_VENDEDOR['NOMEVENDEDOR'];
    frmLctoCompartilhamento.TABLE1['ITEMNOME'] := DM.T_VENDEDOR['NOMEVENDEDOR'];
    frmLctoCompartilhamento.TABLE1['ITEMCOD'] :=
      DM.T_VENDEDOR['CODIGOVENDEDOR'];
    frmLctoCompartilhamento.edit4.SetFocus;
    bitbtn3.Enabled := true;
    Close;
  end;
end;

procedure TfrmLctoDoacaoItem1.BitBtn3Click(Sender: TObject);
begin
  try
    self.Tag := 1;
    frmPrincipal.EvKeyNavigator1.Active := true;
    Application.CreateForm(TfrmCadItem, frmCadItem);
    frmCadItem.ShowModal;
  finally
    frmCadItem.Free;
  end;
end;

procedure TfrmLctoDoacaoItem1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    dbgrid1.SetFocus;
end;

procedure TfrmLctoDoacaoItem1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_BACK then
    edit1.SetFocus;
end;

procedure TfrmLctoDoacaoItem1.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DM.T_VENDEDOR.IndexFieldNames := Column.FieldName;
  Column.Title.Font.Style := [fsBold];

end;

end.

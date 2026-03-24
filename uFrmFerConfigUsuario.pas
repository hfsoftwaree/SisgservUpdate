unit uFrmFerConfigUsuario;

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
  ExtCtrls,
  Mask,
  EDBNum,
  DBCtrls,
  Buttons,
  Grids,
  DBGrids,
  DB,
  IBCustomDataSet,
  IBTable,
  SSBaseXP,
  jpeg,
  ComCtrls,
  shellapi;

type
  TfrmFerConfigUsuario = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    ESSENCIA: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel28: TPanel;
    Panel17: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    DBEdit1: TDBEdit;
    S: TDBEdit;
    C: TDBEdit;
    email: TDBEdit;
    setor: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    INCLUIR: TDBCheckBox;
    ALTERAR: TDBCheckBox;
    EXCLUIR: TDBCheckBox;
    CONSULTAR: TDBCheckBox;
    Bevel1: TBevel;
    relatorio: TDBCheckBox;
    Bevel2: TBevel;
    total1: TDBCheckBox;
    edit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    DBEdit16: TDBEdit;
    btn7: TBitBtn;
    regocorrencia: TDBCheckBox;
    DBEdit10: TDBEdit;
    CANCELAFECHAMENTO: TDBCheckBox;
    DBEdit13: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ESSENCIAChange(Sender: TObject);
    procedure TINICIALExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure setorEnter(Sender: TObject);
    procedure setorClick(Sender: TObject);
    procedure setorExit(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure emailChange(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFerConfigUsuario: TfrmFerConfigUsuario;

implementation

uses
  uDM,
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmFerConfigUsuario.BitBtn3Click(Sender: TObject);
begin
  //      frmprincipal.incluir.Caption := DM.TLOGIN['INCLUIR'];
  //      frmprincipal.alterar.Caption := DM.TLOGIN['ALTERAR'];
  //      frmprincipal.editaproduto.Caption := DM.TLOGIN['VENDAEDITAPRODUTO'];
  //      frmprincipal.cancelarfechamento.Caption := DM.TLOGIN['CANCELAFECHAMENTO'];
  //      frmprincipal.excluir.Caption := DM.TLOGIN['EXCLUIR'];
  //      frmprincipal.fechamentovenda.Caption := DM.TLOGIN['FECHAMENTOVENDA'];
  //      frmprincipal.consultar.Caption := DM.TLOGIN['CONSULTAR'];
  //      frmprincipal.relatorio.Caption := DM.TLOGIN['RELATORIO'];
  //      frmprincipal.ocorrencia.Caption := DM.TLOGIN['REGOCORRENCIA'];
  //      frmprincipal.rfv.Caption := DM.TLOGIN['RELATORIOFECHVENDA'];
  //      frmprincipal.ae.Caption := DM.TLOGIN['AJUSTARESTOQUE'];
  //      frmprincipal.total.Caption := DM.TLOGIN['ACESSOTOTAL'];
  ESSENCIA.Clear;
  DM.TLOGIN.Cancel;
  Close;
end;

procedure TfrmFerConfigUsuario.BitBtn1Click(Sender: TObject);
var
  total: Real;
begin
  if frmprincipal.usuario.Caption <> 'admin' then
  begin
    if (c.Text <> s.Text) then
    begin
      Application.MessageBox('Confirmação de Senha diferente da senha, Verífique!', 'Informação', mb_Ok + mb_IconInformation);
      c.SetFocus;
      c.Clear;
    end
    else
    begin
      if Application.MessageBox('Confirma Alteração?', 'Confirmação',
        mb_YesNo + mb_ICONQUESTION) = idYes then
      begin
        PageControl1.ActivePage := TabSheet1;
        DM.TLOGIN.Post;
        DM.TLOGIN.Refresh;
      end
      else
      begin
        PageControl1.ActivePage := TabSheet1;
        email.SetFocus;
        BitBtn4.Enabled := true;
        BitBtn5.Enabled := true;
        BitBtn3.Enabled := true;
      end;
    end;
  end
  else
  begin

    if frmprincipal.usuario.Caption = 'admin' then
    begin
      if dbedit1.Text = '' then
      begin
        Application.MessageBox('Usuário deve ser informado!', 'Informação', mb_Ok
          + mb_IconInformation);
        PageControl1.ActivePage := TabSheet1;
        dbedit1.SetFocus;
      end
      else
      begin
        if s.Text = '' then
        begin
          Application.MessageBox('Senha deve ser informada!', 'Informação', mb_Ok
            + mb_IconInformation);
          PageControl1.ActivePage := TabSheet1;
          s.SetFocus;
        end
        else
        begin
          if c.Text = '' then
          begin
            Application.MessageBox('Confirmação de Senha deve ser informada!',
              'Informação', mb_Ok + mb_IconInformation);
            PageControl1.ActivePage := TabSheet1;
            c.SetFocus;
          end
          else
          begin
            if dbedit16.Text = '' then
            begin
              Application.MessageBox('Dica de Senha deve ser informada!',
                'Informação', mb_Ok + mb_IconInformation);
              PageControl1.ActivePage := TabSheet1;
              dbedit16.SetFocus;
            end
            else
            begin
              if setor.Text = '' then
              begin
                Application.MessageBox('Perfil de usuário deve ser informado!',
                  'Informação', mb_Ok + mb_IconInformation);
                PageControl1.ActivePage := TabSheet1;
                setor.SetFocus;
              end;
            end;
          end;
        end;
      end;

      if (dbedit1.Text <> '') and (s.Text <> '') and (c.Text <> '') and
        (dbedit16.Text <> '') and (setor.Text <> '') then
      begin
        if (c.Text <> s.Text) then
        begin
          Application.MessageBox('Confirmação de Senha diferente da senha, Verífique!', 'Informação', mb_Ok + mb_IconInformation);
          c.SetFocus;
          c.Clear;
        end
        else
        begin
          if incluir.Checked = false then
            dbedit4.Text := 'False';
          if alterar.Checked = false then
            dbedit5.Text := 'False';
          //if alterarvenda.Checked = false then dbedit14.Text := 'False';
          if cancelafechamento.Checked = false then
            dbedit13.Text := 'False'; //utilizado pelo balanço frm principal
          if excluir.Checked = false then
            dbedit6.Text := 'False';
          //if fechamentovenda.Checked = false then dbedit15.Text := 'False';
          if consultar.Checked = false then
            dbedit7.Text := 'False';
          if relatorio.Checked = false then
            dbedit8.Text := 'False';
          if regocorrencia.Checked = false then
            dbedit10.Text := 'False';
          //agora utilizado pelo financeiro frmprincipal
      //if relatoriofv.Checked = false then dbedit11.Text := 'False';
      //if ajustarestoque.Checked = false then dbedit12.Text := 'False';
          if total1.Checked = false then
            dbedit9.Text := 'False';
          if Application.MessageBox('Confirma Manutenção de Usuário?',
            'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            try
              DM.TLOGIN.Post;
              DM.TLOGIN.Refresh;
            except
              Application.MessageBox('Usuário já cadastrado!', 'Informação',
                mb_Ok + mb_IconExclamation);
              PageControl1.ActivePage := TabSheet1;
              DBEdit1.Clear;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.FormShow(Sender: TObject);
var
  total: Real;
begin
  PageControl1.ActivePage := TabSheet1;
  DM.TLOGIN.Open;
  DM.TLOGIN.IndexFieldNames := ('USUARIO');
  dm.TLOGIN.First;
  DM.TLOGIN.Locate('USUARIO', frmprincipal.usuario.Caption, [lopartialkey,
      locaseinsensitive]);
  DM.TLOGIN.Edit;

  DM.TSETORES.Open;
  DM.TSETORES.IndexName := ('NOMESETOR');
  DM.TSETORES.Last;

  if frmprincipal.usuario.Caption <> 'admin' then
  begin
    Dbnavigator1.Enabled := false;
    TabSheet2.Enabled := false;
    TabSheet3.Enabled := false;
    dbedit1.Enabled := false;
    setor.Enabled := false;
    BITBTN4.Enabled := FALSE;
    BITBTN5.Enabled := FALSE;
    email.SetFocus;
  end
  else
  begin
    if frmprincipal.usuario.Caption = 'admin' then
    begin
      Dbnavigator1.Enabled := true;
      TabSheet2.Enabled := true;
      TabSheet3.Enabled := true;
      dbedit1.Enabled := true;
      dbedit1.SetFocus;
      setor.Enabled := true;
      BITBTN4.Enabled := true;
      BITBTN5.Enabled := true;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.ESSENCIAChange(Sender: TObject);
begin
  if essencia.Text = '' then
  begin
    DM.TLOGIN.First;
  end
  else if (essencia.Text >= 'A') and (essencia.Text <= 'Z') then
  begin
    DM.TLOGIN.Locate('USUARIO', ESSENCIA.text, [lopartialkey,
        locaseinsensitive]);
  end
  else
  begin
    if (essencia.Text >= '0') and (essencia.Text <= '9') then
    begin
      DM.TLOGIN.Locate('CODIGO', essencia.text, [lopartialkey,
          locaseinsensitive]);
    end
  end;
end;

procedure TfrmFerConfigUsuario.TINICIALExit(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TfrmFerConfigUsuario.BitBtn4Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  DBEDIT1.SetFocus;
  DM.TLOGIN.Append;
  bitbtn4.Enabled := false;
  bitbtn5.Enabled := false;
  bitbtn3.Enabled := false;
end;

procedure TfrmFerConfigUsuario.BitBtn2Click(Sender: TObject);
begin
  DM.TLOGIN.Cancel;
  bitbtn4.Enabled := true;
  bitbtn5.Enabled := true;
  bitbtn3.Enabled := true;
end;

procedure TfrmFerConfigUsuario.BitBtn5Click(Sender: TObject);
begin
  if frmprincipal.StatusBar1.Panels[1].Text <> ' Usuário: admin' then
  begin
    Application.MessageBox('É preciso estar logado como "admin" para executar esta ação!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if dbedit1.Text = 'admin' then
    begin
      Application.MessageBox('Não é possível excluir esta conta de usuário!',
        'Informação', mb_Ok + mb_IconInformation);
    end
    else
    begin
      if dbedit1.Text <> 'admin' then
      begin
        if DM.TLOGIN.RecordCount = 1 then
        begin
          Application.MessageBox('É necessário pelo menos um usuário cadastrado!', 'Informação', mb_Ok + mb_IconExclamation);
          essencia.SetFocus;
        end
        else
        begin
          if Application.MessageBox('Confirma Exclusão?', 'Confirmação',
            mb_YesNo + mb_ICONQUESTION) = idYes then
          begin
            DM.TLOGIN.Delete;
            dm.TLOGIN.Refresh;
          end
        end
      end;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.setorEnter(Sender: TObject);
begin
  setor.DropDown;
end;

procedure TfrmFerConfigUsuario.setorClick(Sender: TObject);
begin
  DBEDIT2.Text := dm.TSETORES['codigosetor'];
end;

procedure TfrmFerConfigUsuario.setorExit(Sender: TObject);
begin
  DBEDIT2.Text := dm.TSETORES['codigosetor'];
end;

procedure TfrmFerConfigUsuario.TabSheet1Enter(Sender: TObject);
begin
  Label1.Caption := 'Cadastro de Usuário';
end;

procedure TfrmFerConfigUsuario.TabSheet3Enter(Sender: TObject);
begin
  Label1.Caption := 'Pesquisa de Usuário';
end;

procedure TfrmFerConfigUsuario.DBEdit1Exit(Sender: TObject);
begin
  if edit1.Text = '2' then
  begin
    if dbedit1.Text <> 'admin' then
    begin
      Application.MessageBox('Não é possível alterar esta conta de usuário!',
        'Informação', mb_Ok + mb_IconExclamation);
      dm.TLOGIN.Cancel;
    end
    else
    begin
      if dbedit1.Text = 'admin' then
      begin
        exit;
      end
      else
      begin
        if edit1.Text <> '2' then
        begin
          exit;
        end;
      end;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.Edit1Change(Sender: TObject);
begin
  EDIT1.Text := DM.TLOGIN['CODIGO'];
end;

procedure TfrmFerConfigUsuario.FormDestroy(Sender: TObject);
begin
  DM.TLOGIN.Close;
  DM.TSETORES.Close;
end;

procedure TfrmFerConfigUsuario.BitBtn6Click(Sender: TObject);
var
  Mail: string;
begin
  if email.Text <> '' then
  begin
    Mail := 'mailto:' + email.Text;
    ShellExecute(GetDesktopWindow, 'open', pchar(Mail), nil, nil,
      sw_ShowNormal);
  end
  else
  begin
    if email.Text = '' then
    begin
      Application.MessageBox('Não há e-mail cadastrada para executar esta ação!',
        'Informação', mb_Ok + mb_IconInformation);
      email.SetFocus;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.emailChange(Sender: TObject);
begin
  if email.Text <> '' then
  begin
    bitbtn6.Visible := true;
  end
  else
  begin
    if email.Text = '' then
    begin
      bitbtn6.Visible := false;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.btn7Click(Sender: TObject);
begin
  if btn7.Tag = 0 then
  begin
    s.PasswordChar := #0;
    c.PasswordChar := #0;
    btn7.Tag := 1;
  end
  else
  begin
    if btn7.Tag = 1 then
    begin
      s.PasswordChar := '*';
      c.PasswordChar := '*';
      btn7.Tag := 0;
    end;
  end;
end;

procedure TfrmFerConfigUsuario.FormClose(Sender: TObject; var Action:
  TCloseAction);
begin
  if (DM.TLOGIN.locate('USUARIO', frmprincipal.usuario.Caption,
      [LocaseInsensitive])) then
  begin
    //      frmPrincipal.StatusBar1.Panels[1].Text := ' Usuário: ' + edusuario.Text;
    //      frmPrincipal.usuario.Caption := edusuario.Text;
    frmprincipal.incluir.Caption := DM.TLOGIN['INCLUIR'];
    frmprincipal.alterar.Caption := DM.TLOGIN['ALTERAR'];
    frmprincipal.editaproduto.Caption := DM.TLOGIN['VENDAEDITAPRODUTO'];
    frmprincipal.CANCELARFECHAMENTO.Caption := DM.TLOGIN['CANCELAFECHAMENTO'];
    frmprincipal.excluir.Caption := DM.TLOGIN['EXCLUIR'];
    frmprincipal.fechamentovenda.Caption := DM.TLOGIN['FECHAMENTOVENDA'];
    frmprincipal.consultar.Caption := DM.TLOGIN['CONSULTAR'];
    frmprincipal.relatorio.Caption := DM.TLOGIN['RELATORIO'];
    frmprincipal.ocorrencia.Caption := DM.TLOGIN['REGOCORRENCIA'];
    frmprincipal.rfv.Caption := DM.TLOGIN['RELATORIOFECHVENDA'];
    frmprincipal.ae.Caption := DM.TLOGIN['AJUSTARESTOQUE'];
    frmprincipal.total.Caption := DM.TLOGIN['ACESSOTOTAL'];
    DM.TLOGIN.Close;
    close;
  end;
end;

end.

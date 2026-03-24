unit uFrmLogin;

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
  Buttons,
  ExtCtrls,
  jpeg,
  DB,
  IBCustomDataSet,
  IBTable,
  Registry,
  RxGIF,
  Shellapi,
  Mask,
  DBCtrls;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    edusuario: TEdit;
    edsenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uDM,
  uFrmPrincipal;
{$R *.dfm}

type
  { Declara um tipo registro }
  TFicha = record
    Nome: string[40];
    Nome1: string[100];
  end;

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
  if edUsuario.text = '' then
  begin
    Application.MessageBox('Usuário deve ser informado!', 'Login', mb_Ok +
      mb_IconExclamation);
    edusuario.SetFocus;
  end
  else
  begin
    if edsenha.text = '' then
    begin
      Application.MessageBox('Senha deve ser informada!', 'Login', mb_Ok +
        mb_IconExclamation);
      edsenha.SetFocus;
    end
  end;

  if (edusuario.Text <> '') and (edsenha.Text <> '') then
  begin
    DM.TLOGIN.locate('USUARIO', EdUsuario.text, [locaseinsensitive]);
    if not (Edusuario.text = DM.TLOGIN['USUARIO']) then
    begin
      Application.MessageBox('Usuário inválido ou digitado incorretamente, Verífique!', 'Login', mb_Ok + mb_IconError);
      EdUsuario.clear;
      Edusuario.setfocus;
    end
    else
    begin
      if not (EdSenha.text = DM.TLOGIN['SENHA']) then
      begin
        Application.MessageBox('Senha invália ou digitada incorretamente, Verífique!', 'Login', mb_Ok + mb_IconError);
        EdSenha.clear;
        EdSenha.setfocus;
      end;
    end;

    if (DM.TLOGIN.locate('USUARIO', EdUsuario.text, [LocaseInsensitive])) and
      (EdSenha.text = DM.TLOGIN['SENHA']) then
    begin
      frmPrincipal.Enabled := true;
      frmPrincipal.StatusBar1.Panels[1].Text := ' Usuário: ' + edusuario.Text;
      frmPrincipal.usuario.Caption := edusuario.Text;
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
      frmLogin.close;
    end;
  end;
end;

procedure TfrmLogin.BitBtn3Click(Sender: TObject);
begin
  if Application.MessageBox('O Sistema será encerrado, Confirma?', 'Login',
    mb_YesNo + mb_ICONQUESTION) = idYes then
  begin
    DM.TLOGIN.Close;
    Application.Terminate;
  end
  else
  begin
    edusuario.SetFocus;
  end
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  DM.TLOGIN.Open;
  edusuario.SetFocus;
end;

procedure TfrmLogin.Label4Click(Sender: TObject);
var
  v_msg: string;
begin
  if edUsuario.text = '' then
  begin
    Application.MessageBox('Usuário deve ser informado!', 'Login', mb_Ok +
      mb_IconExclamation);
    edusuario.SetFocus;
  end;

  if (edusuario.Text <> '') then
  begin
    DM.TLOGIN.locate('USUARIO', EdUsuario.text, [locaseinsensitive]);
    if not (Edusuario.text = DM.TLOGIN['USUARIO']) then
    begin
      Application.MessageBox('Usuário inválido ou digitado incorretamente, Verífique!', 'Login', mb_Ok + mb_IconError);
      EdUsuario.clear;
      Edusuario.setfocus;
    end;

    if (DM.TLOGIN.locate('USUARIO', EdUsuario.text, [LocaseInsensitive])) then
    begin
      if edit1.Text = '' then
      begin
        Application.MessageBox('Usuário não possui dica de senha cadastrado. Solicite ao administrador do sistema para que altere sua senha!', 'Login', mb_Ok + mb_IconError);
      end
      else
      begin
        if (DM.TLOGIN['SENHADICA']) <> '' then
        begin
          edit1.Text := DM.TLOGIN['SENHADICA'];
          v_msg := 'Sua dica de senha é: ' + Edit1.Text;
          Application.MessageBox(Pchar(v_msg), 'Dica de senha',
            mb_iconExclamation);
        end;
      end;
    end;
  end;
end;

end.

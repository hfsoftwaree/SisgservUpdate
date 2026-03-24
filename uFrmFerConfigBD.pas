unit uFrmFerConfigBD;

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
  Mask,
  ToolEdit,
  jpeg,
  Registry,
  shellapi,
  ComCtrls,
  IniFiles;

type
  TfrmFerConfigBD = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    server: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    bd: TFilenameEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bdChange(Sender: TObject);
    procedure serverExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bdExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFerConfigBD: TfrmFerConfigBD;
  Data: TIniFile;

implementation

uses
  uDM,
  uFrmSplash,
  uFrmPrincipal,
  uFrmLogin;

type
  TChars = set of Char;

function FilterChars(const S: string; const ValidChars: TChars): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ValidChars then
      Result := Result + S[I];
end;

type
  { Declara um tipo registro }
  TFicha = record
    Nome: string[40];
    Nome1: string[100];
  end;

procedure ExecutePrograma(Nome, Parametros: string);
var
  Comando: array[0..1024] of Char;
  Parms: array[0..1024] of Char;
begin
  StrPCopy(Comando, Nome);
  StrPCopy(Parms, Parametros);
  ShellExecute(0, nil, Comando, Parms, nil, SW_ShowNormal);
end;

{$R *.dfm}

procedure TfrmFerConfigBD.BitBtn3Click(Sender: TObject);
begin
  try
    dm.IBDatabase1.Connected := true;
    close;
  except
    frmsplash.Free;
    dm.Free;
    frmprincipal.Free;
    frmFerConfigBD.Free;
    Application.Terminate;
  end;
end;

procedure TfrmFerConfigBD.BitBtn2Click(Sender: TObject);
begin
  data := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'Config\Config.ini');
  try
    data.WriteString('CONEXAO', 'HOST', server.Text);
    data.WriteString('CONEXAO', 'CAMINHO', bd.Text);
  finally
    data.Free;
  end;

  if Application.MessageBox(
    'O Sistema precisa ser reiniciado para que as novas alterações entrem em vigor!',
    'Confirmação', mb_Ok) = idOk then
  begin
    try
      // Fecha este form primeiro
      if frmFerConfigBD <> nil then
        frmFerConfigBD.free;
      Close;

      // Se os outros forms já foram criados, libera cada um
//      if Assigned(frmsplash) then
//      begin
//        frmsplash.Free;
//        frmsplash := nil;
//      end;

//      if Assigned(frmprincipal) then
//      begin
//        frmprincipal.Free;
//        frmprincipal := nil;
//      end;

//      if Assigned(dm) then
//      begin
//        dm.Free;
//        dm := nil;
//      end;

      // Encerra a aplicação de forma apropriada
      if frmprincipal <> nil then
        frmprincipal.Free;

      // Encerra a aplicação de forma apropriada
      if dm <> nil then
        dm.Free;

      // Encerra a aplicação de forma apropriada
      if Application.MainForm <> nil then
        Application.Terminate
      else
        Halt(0);

    except
      on E: Exception do
      begin
        MessageDlg('Erro ao finalizar o sistema: ' + E.Message, mtError, [mbOK],
          0);
        Halt(1);
      end;
    end;
  end;
end;

procedure TfrmFerConfigBD.FormCreate(Sender: TObject);
var
  host, caminho: string;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Config\Config.ini') then
    //  if FileExists('C:\HF_Software\Sisgserv\Config\Config.ini') then
  begin
    data := TIniFile.Create(ExtractFilePath(Application.ExeName) +
      'Config\Config.ini');
    //    data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini');
    try
      host := data.ReadString('CONEXAO', 'HOST', '');
      caminho := data.ReadString('CONEXAO', 'CAMINHO', '');

      if (host = '') or (caminho = '') then
      begin
        ShowMessage('Configuração inválida no arquivo INI.');
        Application.Terminate;
        Exit;
      end;

      DM.IBDatabase1.DatabaseName := host + caminho;

      try
        DM.IBDatabase1.Connected := True;
        frmsplash.Close;
        Application.CreateForm(TfrmLogin, frmLogin);
        frmLogin.ShowModal;
      except
        on E: Exception do
        begin
          //      Application.MessageBox('O sistema não foi capaz se se conectar ao banco de dados!',
          //      'Reinicialização', mb_Ok + mb_ICONERROR);
          //      ShowMessage('Erro ao conectar: ' + E.Message);
          frmsplash.Close;
          frmFerConfigBD.ShowModal;
          frmFerConfigBD.Free;
        end;
      end;

    finally
      data.Free;
    end;
  end
  else
  begin
    Application.MessageBox('Não foi possível localizar o arquivo de configuração do sistema. Por favor atualize o sistema!', 'Informação', MB_OK);
    Application.Terminate;
  end;
end;

procedure TfrmFerConfigBD.bdChange(Sender: TObject);
begin
  bd.Text := FilterChars(bd.Text, ['A'..'Z', 'a'..'z', ':', '\', '-', '.', '_',
      '1'..'9', ' ']);
end;

procedure TfrmFerConfigBD.serverExit(Sender: TObject);
begin
  if server.Text = '' then
    server.Text := '127.0.0.1:'
  else
    exit;
end;

procedure TfrmFerConfigBD.FormShow(Sender: TObject);
begin
  data :=
    TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Config\Config.ini');
  //data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini'); //Nome do aquivo INI que quero ler
  server.Text := data.ReadString('CONEXAO', 'HOST', '');
  bd.Text := data.ReadString('CONEXAO', 'CAMINHO', '');
  data.Free; //Libera a memória
end;

procedure TfrmFerConfigBD.bdExit(Sender: TObject);
var
  nome: string;
begin
  if bd.Text = '' then
  begin
    bd.Text := 'C:\';
  end
  else
  begin
    if bd.Text <> '' then
    begin
      nome := bd.Text;
      nome[1] := 'C';
      bd.Text := (nome);
    end;
  end;
end;

procedure TfrmFerConfigBD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFerConfigBD.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmFerConfigBD.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    bd.Text := 'C:\HF_Software\Sisgserv\BancoDados\bdsisgserv.fdb';
end;

end.

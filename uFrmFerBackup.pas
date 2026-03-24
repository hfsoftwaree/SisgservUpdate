unit uFrmFerBackup;

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
  ToolEdit,
  Mask,
  Buttons,
  IBServices,
  ComCtrls,
  FileCtrl;

type
  TfrmFerBackup = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label6: TLabel;
    deBackup: TDirectoryEdit;
    mmBackup: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBBackupService1: TIBBackupService;
    mskvalor: TMaskEdit;
    febanco: TFilenameEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskvalorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFerBackup: TfrmFerBackup;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmFerBackup.BitBtn1Click(Sender: TObject);
var
  cDiretorio: string;
begin
  if febanco.Text = '' then
  begin
    Application.MessageBox('Banco de dados deve ser informado!', 'Backup', mb_Ok
      + mb_IconError);
    febanco.SetFocus;
    Abort;
  end;
  if debackup.Text = '' then
  begin
    Application.MessageBox('Local do Backup deve ser informado!', 'Backup', mb_Ok
      + mb_IconError);
    deBackup.SetFocus;
    Abort;
  end;
  // cDiretorio:= 'C:\HF_Software\Sisdonate\BackupBanco';//verifica se o diretorio existe e o cria caso nao exista
  // ForceDirectories(cDiretorio);

  with IBBackupService1 do
  begin
    Params.Clear;
    BackupFile.Clear;
    ServerName := 'localhost';
    LoginPrompt := False;
    Params.Add('user_name=SYSDBA');
    Params.Add('password=masterkey');
    Active := True;
    try
      Verbose := True;
      Options := [NonTransportable, IgnoreLimbo];
      DatabaseName := feBanco.Text;
      BackupFile.Add(deBackup.Text + '/' + mskvalor.Text + 'sisgserv.gbk');
      ServiceStart;
      while not Eof do
        mmBackup.Lines.Add(GetNextLine);
    finally
      Active := False;
    end;
  end;
  Application.MessageBox('Backup realizado com sucesso!', 'Backup', mb_Ok +
    mb_IconInformation);
  //    feBanco.Clear;
  //    deBackup.Clear;
  mmBackup.Clear;
end;

procedure TfrmFerBackup.BitBtn2Click(Sender: TObject);
begin
  febanco.Text := '';
  close;
end;

procedure TfrmFerBackup.FormShow(Sender: TObject);
var
  cDiretorio: string;
begin
  DM.IBDatabase1.Connected := False;
  mskvalor.Text := DateToStr(now);

  // Ajuste o caminho para ser relativo ao diretório do executável
  cDiretorio :=
    IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'BackupBanco';

  if not DirectoryExists(cDiretorio) then
  begin
    // Verifica se o diretório não existe e o cria
    ForceDirectories(cDiretorio);
  end
  else
  begin
    // Verifica se o diretório existe
    if DirectoryExists(cDiretorio) then
    begin
      // Diretório já existe
    end;
  end;
end;

procedure TfrmFerBackup.mskvalorChange(Sender: TObject);
var
  count, posi: integer; // contadores gerais
  line, column: integer; // linha e coluna
  Qtd1, Qtd2: integer; // quantidade de pontos e vírgulas (inic./fim)
  s1, s2: string; // string inicial e reformatada
begin

  // inicializa strings
  s1 := MskValor.Text;
  s2 := '';

  // Captura linha e coluna do cursor
  with MskValor do
  begin
    Line := Perform(EM_LINEFROMCHAR, SelStart, 0);
    Column := SelStart - Perform(EM_LINEINDEX, Line, 0);
  end;

  // retira pontos e reformata a string
  Posi := 0;
  for count := Length(s1) downto 1 do
  begin
    if (copy(s1, count, 1) >= '0') and (copy(s1, count, 1) <= '9') then
    begin
      posi := posi + 1;
      if posi = 3 then
        s2 := copy(s1, count, 1) + '' + s2
      else if posi = 6 then
        s2 := copy(s1, count, 1) + '' + s2
      else if posi = 9 then
        s2 := copy(s1, count, 1) + '' + s2
      else
        s2 := copy(s1, count, 1) + s2;
    end;
  end;
  MskValor.Text := s2;

  // Verifica quantidade de pontos antes de reformatar
  Qtd1 := 0;
  for count := Column downto 1 do
  begin
    if (copy(s1, count, 1) = '') or (copy(s1, count, 1) = '') then
      Qtd1 := Qtd1 + 1;
  end;

  // Verifica quantidade de pontos depois de reformatado
  Qtd2 := 0;
  for count := Column downto 1 do
  begin
    if (copy(s2, count, 1) = '') or (copy(s2, count, 1) = '') then
      Qtd2 := Qtd2 + 1;
  end;

  // reposiciona cursor
  if Qtd1 < Qtd2 then
    Column := Column + 1;
  if Qtd1 > Qtd2 then
    Column := Column - 1;
  MskValor.SelStart := column;

end;

end.

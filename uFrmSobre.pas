unit uFrmSobre;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  Controls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  CJVLinkLabel,
  Registry,
  jpeg,
  CJVScrollLabel,
  inifiles;

type
  TfrmAjuSobre = class(TForm)
    Image2: TImage;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    label13: TCJVScrollLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    CJVLinkLabel1: TCJVLinkLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ValidarBasedeDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuSobre: TfrmAjuSobre;
  data: tinifile;

implementation

uses
  uFrmSplash;

type
  { Declara um tipo registro }
  TFicha = record
    Nome: string[40];
    Nome1: string[100];
  end;

{$R *.dfm}

procedure TfrmAjuSobre.FormShow(Sender: TObject);
begin
  MessageBeep(0);
  self.Label10.Caption := frmsplash.Label1.caption + ' de ' +
    frmsplash.Label4.caption;
  data :=
    TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Config\Config.ini');
  //data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini'); //Nome do meu arquivo INI que quero ler
  label13.Caption := data.ReadString('CONEXAO', 'HOST', '') +
    data.ReadString('CONEXAO', 'CAMINHO', '') + '                             ';
  data.Free; //Libera a memória
end;

procedure TfrmAjuSobre.ValidarBasedeDados;
var
  IniFile: TRegIniFile;
  Chave: string;
begin
  IniFile := TRegIniFile.Create('Software\HF Softwares');
  chave := IniFile.ReadString('Siscomad', 'CaminhoDados', chave);
  Label13.Caption := (Chave);
end;

procedure TfrmAjuSobre.Image2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAjuSobre.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAjuSobre.Label14Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAjuSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = (VK_Escape) then
    close;
end;

end.

unit uFrmSplash;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  jpeg,
  ComCtrls,
  EAppProt,
  CJVLinkLabel,
  WinSkinData,
  Registry,
  inifiles;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Image2: TImage;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    servidor: TLabel;
    caminho: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;
  Data: TInifile;

implementation

type
  { Declara um tipo registro }
  TFicha = record
    Nome: string[40];
    Nome1: string[100];
  end;

{$R *.DFM}

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  data :=
    TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Config\Config.ini');
  //data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini'); //Nome do meu arquivo INI que quero ler
  servidor.Caption := data.ReadString('CONEXAO', 'HOST', '');
  data.Free; //Libera a memória
  if servidor.Caption = '127.0.0.1:' then
  begin
    caminho.Caption := 'LOCAL';
  end
  else
  begin
    caminho.Caption := 'REDE';
  end;
end;

end.

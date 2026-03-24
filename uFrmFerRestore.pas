unit uFrmFerRestore;

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
  IBServices;

type
  TfrmFerRestore = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    feRestaurar: TFilenameEdit;
    Label6: TLabel;
    mmRestaurar: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBRestoreService1: TIBRestoreService;
    IBBackupService1: TIBBackupService;
    feRestBanco: TFilenameEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFerRestore: TfrmFerRestore;

implementation

{$R *.dfm}

procedure TfrmFerRestore.BitBtn1Click(Sender: TObject);
begin
  if feRestaurar.FileName = '' then
  begin
    Application.MessageBox('Arquivo de Backup deve ser informado!', 'Restore',
      mb_Ok + mb_IconError);
    feRestaurar.SetFocus;
    Abort;
  end;
  if feRestBanco.Text = '' then
  begin
    Application.MessageBox('Banco de dados deve ser informado!', 'Restore', mb_Ok
      + mb_IconError);
    feRestBanco.SetFocus;
    Abort;
  end;
  with IBRestoreService1 do
  begin
    Params.Clear;
    BackupFile.Clear;
    ServerName := 'localhost';
    LoginPrompt := False;
    Params.Add('user_name=SYSDBA');
    Params.Add('password=masterkey');
    Active := true;
    try
      Verbose := True;
      Options := [Replace, UseAllSpace];
      PageBuffers := 3000;
      PageSize := 4096;
      DatabaseName.Add(feRestBanco.FileName);
      BackupFile.Add(feRestaurar.FileName);
      ServiceStart;
      while not Eof do
        mmRestaurar.Lines.Add(GetNextLine);
    finally
      Active := False;
    end;
  end;
  Application.MessageBox('Restauração realizada com sucesso!', 'Restore', mb_Ok
    + mb_IconInformation);
  //    feRestaurar.Clear;
  //    feRestBanco.Clear;
  mmRestaurar.Clear;
end;

procedure TfrmFerRestore.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.

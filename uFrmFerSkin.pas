unit uFrmFerSkin;

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
  FileCtrl,
  Mask,
  ToolEdit,
  WinSkinData,
  Registry,
  ExtCtrls,
  RXCtrls,
  IniFiles;

type
  TfrmFerSkin = class(TForm)
    ListBox1: TFileListBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }

    procedure CapturarPatch1(FCaption, FolderName: string);

    procedure ValidarBasedeDados1;
  public
    { Public declarations }
  end;

var
  frmFerSkin: TfrmFerSkin;
  Data: TIniFile;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TfrmFerSkin.CapturarPatch1(FCaption, FolderName: string);
var
  NameBuffer: array[0..MAX_PATH] of Char;
  WindowList: Pointer;
  IniFile: TRegIniFile;
  Result: boolean;
begin
  // Função lógica que recebe dois parâmetros um para o rótulo da caixa de seleção de
  // diretório presente na unit ShlObj declarada acima e o outro por referência retorna
  // uma String com o diretório novo e a escreve na chave correspondente no Registro,
  // mas apenas se selecionar OK na caixa de seleção de diretório.

  FolderName := ListBox1.FileName;
  try
    IniFile := TRegIniFile.Create('Software\HF Softwares');
    IniFile.WriteString('Sismad', 'CaminhoSkin1', FolderName);
    //      ValidarBasedeDados;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmFerSkin.ValidarBasedeDados1;
var
  IniFile: TRegIniFile;
  Chave: string;
begin
  IniFile := TRegIniFile.Create('Software\HF Softwares');
  chave := IniFile.ReadString('Sismad', 'CaminhoSkin1', chave);
  ListBox1.FileName := (Chave);
end;

procedure TfrmFerSkin.BitBtn1Click(Sender: TObject);
var
  Patch: string;
begin
  data := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'Config\Config.ini');
  //data := TIniFile.Create('C:\HF_Software\Sisgserv\Config\Config.ini'); //Nome do meu arquivo INI que será criado
  data.WriteString('SKIN', 'NOME', ListBox1.FileName);
  //O conteúdo do Edit1.Text será gravado dentro da chave NOME1 e na subchave NOME2
  data.Free; //Libera a memória

  //CapturarPatch1('',Patch);
  Close;
end;

procedure TfrmFerSkin.ListBox11Click(Sender: TObject);
var
  i: integer;
  CaminhoDasSkins, ss: string;
begin
  i := ListBox1.ItemIndex;
  //  ss := Copy(CaminhoDasSkins,1,Pos('*.skn',CaminhoDasSkins)-2)+'\'+ListBox1.items.strings[i];
  Frmprincipal.SKIN.SkinFile := listbox1.FileName;
  //  if not Form1.SKIN.Active Then Form1.SKIN.Active := True;
end;

procedure TfrmFerSkin.FormShow(Sender: TObject);
begin
  data := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'Config\Config.ini');
  // Substituído: 'C:\HF_Software\Sisgserv\Config\Config.ini'

  ListBox1.FileName := data.ReadString('SKIN', 'NOME', '');

  ListBox1.Directory := ExtractFilePath(Application.ExeName) + 'Skin';
  // Substituído: 'C:\HF_Software\Sisgserv\Skin'

  // ValidarBasedeDados1;
  ListBox1.SetFocus;
  data.Free; // Libera a memória
end;

procedure TfrmFerSkin.FormCreate(Sender: TObject);
var
  Patch: string;
begin
  //listbox1.Directory := 'C:\HF-Software\Sismad\Skin\*.*';
  //directorylistbox1.Directory := (directorylistbox1.Directory) + '\Skin';
  //CapturarPatch('',Patch);
  //CapturarPatch1('',Patch);
  //ValidarBasedeDados;
  //ValidarBasedeDados1;
end;

end.

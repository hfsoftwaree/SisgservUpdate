unit uFrmConLog1;

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
  SHELLAPI,
  Buttons,
  jpeg,
  ExtCtrls,
  IdHTTP,
  IdSSLOpenSSL,
  IdCTypes,
  IdSSLOpenSSLHeaders,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IniFiles,
  Mask,
  ToolEdit,
  CJVLinkLabel;

type
  TfrmConLog1 = class(TForm)
    OpenDialog1: TOpenDialog;
    memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    tipo: TRadioGroup;
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    FindDialog1: TFindDialog;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    DirectoryEdit1: TDirectoryEdit;
    DirectoryEdit2: TDirectoryEdit;
    DirectoryEdit3: TDirectoryEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    CJVLinkLabel1: TCJVLinkLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure tipoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
    FSelPos: integer;

  public
    { Public declarations }
  end;

var
  frmConLog1: TfrmConLog1;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

//ALTERACAO NOME MENU
procedure SalvarNomesServidores(const Lista: TStrings);
var
  Caminho: string;
begin
  Caminho := ExtractFilePath(Application.ExeName) + 'Config\name_server.txt';
  ForceDirectories(ExtractFilePath(Caminho));
  Lista.SaveToFile(Caminho);
end;

procedure CarregarNomesServidores(RadioGroup: TRadioGroup);
var
  Lista: TStringList;
  Caminho: string;
begin
  Caminho := ExtractFilePath(Application.ExeName) + 'Config\name_server.txt';
  if FileExists(Caminho) then
  begin
    Lista := TStringList.Create;
    try
      Lista.LoadFromFile(Caminho);
      while Lista.Count < 3 do
        Lista.Add('Servidor ' + IntToStr(Lista.Count + 1));

      RadioGroup.Items.Assign(Lista);
    finally
      Lista.Free;
    end;
  end;
end;
//END

//LE LOG
procedure ListFileDirectory(aDirectory, aExtensao: string; List: TStrings);
var
  SR: TSearchRec;
  I: Integer;
begin
  List.Clear;

  I := FindFirst(aDirectory + '*.' + aExtensao, faAnyFile, SR);

  while (I = 0) do
  begin
    List.Add(sr.Name);
    I := FindNext(SR);
  end;
end;

// Validacao RadioGroup
function HostIsIP(const AHost: string): Boolean;
var
  Parts: array of string; // array dinâmico
  TempStr: string;
  I, Num, P, Count: Integer;
begin
  Result := False;
  SetLength(Parts, 0);
  Count := 0;
  P := 1;

  for I := 1 to Length(AHost) do
    if AHost[I] = '.' then
    begin
      TempStr := Copy(AHost, P, I - P);
      P := I + 1;
      SetLength(Parts, Count + 1);
      Parts[Count] := TempStr;
      Inc(Count);
    end;

  // Última parte
  TempStr := Copy(AHost, P, Length(AHost) - P + 1);
  SetLength(Parts, Count + 1);
  Parts[Count] := TempStr;
  Inc(Count);

  if Count <> 4 then
    Exit;

  for I := 0 to 3 do
  begin
    if not TryStrToInt(Parts[I], Num) then
      Exit;
    if (Num < 0) or (Num > 255) then
      Exit;
  end;

  Result := True;
end;

procedure TfrmConLog1.tipoClick(Sender: TObject);
var
  S: array[0..255] of Char;
  vFileList: TStringList;
  vFileStream: TFileStream;
  i: Integer;
  DirPath, LatestFile: string;
  SearchRec: TSearchRec;
  LatestTime: TDateTime;
  DebugFiles: TStringList;
  CaminhoUsuario, Unidade, Host: string;
begin
  if Tipo.ItemIndex = 0 then
  begin
    if directoryedit1.Text = '' then
    begin
      Application.MessageBox(PChar('Diretório do ' + tipo.Items[0] +
          ' deve ser informado!'), PChar('Diretórios'), mb_Ok +
            mb_IconInformation);
      directoryedit1.SetFocus;
      tipo.ItemIndex := -1;
      Exit;
    end
  end;

  if Tipo.ItemIndex = 1 then
  begin
    if directoryedit2.Text = '' then
    begin
      Application.MessageBox(PChar('Diretório do ' + tipo.Items[1] +
          ' deve ser informado!'), PChar('Diretórios'), mb_Ok +
            mb_IconInformation);
      directoryedit2.SetFocus;
      tipo.ItemIndex := -1;
      Exit;
    end
  end;

  if Tipo.ItemIndex = 2 then
  begin
    if directoryedit3.Text = '' then
    begin
      Application.MessageBox(PChar('Diretório do ' + tipo.Items[2] +
          ' deve ser informado!'), PChar('Diretórios'), mb_Ok +
            mb_IconInformation);
      directoryedit3.SetFocus;
      tipo.ItemIndex := -1;
      Exit;
    end
  end;

  if (directoryedit1.Text <> '') or (directoryedit2.Text <> '') or
    (directoryedit3.Text <> '') then
  begin
    case (Tipo.ItemIndex) of
      0: CaminhoUsuario := DirectoryEdit1.Text;
      1: CaminhoUsuario := DirectoryEdit2.Text;
      2: CaminhoUsuario := DirectoryEdit3.Text;
    else
      Exit;
    end;

    if (Length(CaminhoUsuario) > 0) and (CaminhoUsuario[Length(CaminhoUsuario)]
      =
      '\') then
      Delete(CaminhoUsuario, Length(CaminhoUsuario), 1);

    Unidade := Copy(CaminhoUsuario, 1, 1); // Ex: "C:"
    Delete(CaminhoUsuario, 1, 3);

    Host := Trim(Edit4.Text); // remove espaços no início/fim

    // Remove ":" final se existir
    if (Length(Host) > 0) and (Host[Length(Host)] = ':') then
      Delete(Host, Length(Host), 1);

    // Validação: se o Host parece ser um IP, exibe aviso e sai
    if (Host <> '') and HostIsIP(Host) then
    begin
      Application.MessageBox(
        PChar('O HOST informado para o caminho do Banco de Dados parece ser um IP.'
          + sLineBreak +
          'Se estiver em rede local, utilize o NOME da máquina servidor, não o IP.' + sLineBreak
            +
          'Se não estiver em rede local, não é possível realizar a consulta do log por motivos de segurança do Windows no servidor.'),
        PChar('Aviso'), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if (Length(Host) > 0) and (Host[Length(Host)] = ':') then
      Delete(Host, Length(Host), 1);

    DirPath := '\\' + Host + '\' + Unidade + '\' + CaminhoUsuario + '\';

    frmConlog1.Caption := 'Log [MCK] ' + DirPath;

    LatestFile := '';
    LatestTime := 0;
    DebugFiles := TStringList.Create; // Para depuração

    if FindFirst(DirPath + '*MCK*.*', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Attr and faDirectory) = 0 then
        begin
          DebugFiles.Add(SearchRec.Name);

          if FileDateToDateTime(SearchRec.Time) > LatestTime then
          begin
            LatestTime := FileDateToDateTime(SearchRec.Time);
            LatestFile := SearchRec.Name;
          end;
        end;
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;

    if LatestFile = '' then
    begin
      ShowMessage('Nenhum arquivo MCK encontrado!');
      DebugFiles.Free;
      Exit;
    end;

    DebugFiles.Free;

    vFileList := TStringList.Create;
    try
      Memo1.Clear;
      vFileStream := TFileStream.Create(DirPath + LatestFile, fmOpenRead or
        fmShareDenyNone);
      try
        vFileList.LoadFromStream(vFileStream);
      finally
        vFileStream.Free;
      end;

      for i := 1 to vFileList.Count - 1 do
        Memo1.Lines.Append(vFileList.Strings[i]);
    finally
      vFileList.Free;
    end;
  end;
end;
// End function RadioGroup

procedure TfrmConLog1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.EvKeyNavigator1.Active := True;
  frmPrincipal.Evfocuscolor1.ChangeColor := true;
end;

procedure TfrmConLog1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmConLog1.FormShow(Sender: TObject);
begin
  frmPrincipal.Evfocuscolor1.ChangeColor := false;
end;

procedure TfrmConLog1.FindDialog1Find(Sender: TObject);
var
  S: string;
  startpos: integer;
begin
  with TFindDialog(Sender) do
  begin
    {If the stored position is 0 this cannot be a find next. }
    if FSelPos = 0 then
      Options := Options - [frFindNext];

    { Figure out where to start the search and get the corresponding
      text from the memo. }
    if frfindNext in Options then
    begin
      { This is a find next, start after the end of the last found word. }
      StartPos := FSelPos + Length(Findtext);
      S := Copy(Memo1.Lines.Text, StartPos, MaxInt);
    end
    else
    begin
      { This is a find first, start at the, well, start. }
      S := Memo1.Lines.Text;
      StartPos := 1;
    end;
    { Perform a global case-sensitive search for FindText in S }
    FSelPos := Pos(FindText, S);
    if FSelPos > 0 then
    begin
      { Found something, correct position for the location of the start
        of search. }
      FSelPos := FSelPos + StartPos - 1;
      Memo1.SelStart := FSelPos - 1;
      Memo1.SelLength := Length(FindText);
      Memo1.SetFocus;
    end
    else
    begin
      { No joy, show a message. }
      if frfindNext in Options then
        S := Concat('There are no further occurences of "', FindText,
          '" in Memo1.')
      else
        S := Concat('Could not find "', FindText, '" in Memo1.');
      MessageDlg(S, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmConLog1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if tipo.ItemIndex = -1 then
  //begin
  //Application.MessageBox('Nenhum servidor foi selecionado. Verifique!', 'Informação', mb_Ok + mb_IconInformation);
  //end
  //else
  //begin
  //if tipo.ItemIndex <> -1 then
  //begin
  //if (ssCtrl in Shift) and (key = 80) then
  if (ssCtrl in Shift) and (Key = Ord('P')) then
  begin
    FSelPos := 0;
    FindDialog1.Execute;
    Key := 0; // <- evita o bip
  end;
  //end;
  //end;
end;

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
procedure TfrmConLog1.FormCreate(Sender: TObject);
var
  Lista: TStringList;
  Caminho: string;
  Ini: TIniFile;
  CaminhoINI: string;
begin
  //nome dos servidores
  CarregarNomesServidores(tipo);
  Label6.Caption := tipo.Items[0] + ' (Local dos arquivos de log)';
  Label7.Caption := tipo.Items[1] + ' (Local dos arquivos de log)';
  Label8.Caption := tipo.Items[2] + ' (Local dos arquivos de log)';

  BitBtn3.Caption := 'Alterar nome:' + '[' + tipo.Items[0] + ']';
  BitBtn4.Caption := 'Alterar nome:' + '[' + tipo.Items[1] + ']';
  BitBtn5.Caption := 'Alterar nome:' + '[' + tipo.Items[2] + ']';

  // Define o caminho do arquivo .INI dentro da pasta Config
  CaminhoINI := ExtractFilePath(ParamStr(0)) + 'Config\config.ini';

  // Verifica se o arquivo .INI existe antes de tentar ler
  if not FileExists(CaminhoINI) then
    Exit;

  // Abre o arquivo .INI para leitura
  Ini := TIniFile.Create(CaminhoINI);
  try
    // Lê os valores do arquivo .INI e preenche os componentes
    Edit4.Text := Ini.ReadString('CONEXAO', 'HOST', '');
    DirectoryEdit1.Text := Ini.ReadString('SERVIDOR1', 'dirmcklog', '');
    DirectoryEdit2.Text := Ini.ReadString('SERVIDOR2', 'dirmcklog', '');
    DirectoryEdit3.Text := Ini.ReadString('SERVIDOR3', 'dirmcklog', '');
  finally
    // Libera a memória
    Ini.Free;
  end;
end;

procedure TfrmConLog1.BitBtn2Click(Sender: TObject);
var
  Ini: TIniFile;
  CaminhoINI, Destino: string;
begin
  // Define o caminho do arquivo .INI dentro da pasta Config do sistema
  CaminhoINI := ExtractFilePath(ParamStr(0)) + 'Config\Config.ini';

  // Garante que a pasta Config existe
  if not DirectoryExists(ExtractFilePath(CaminhoINI)) then
    ForceDirectories(ExtractFilePath(CaminhoINI));

  // Criar ou abrir o arquivo de configuração INI
  Ini := TIniFile.Create(CaminhoINI);
  try
    // Salvar os valores dos componentes no arquivo .INI
    Ini.WriteString('SERVIDOR1', 'dirmcklog', DirectoryEdit1.Text);
    Ini.WriteString('SERVIDOR2', 'dirmcklog', DirectoryEdit2.Text);
    Ini.WriteString('SERVIDOR3', 'dirmcklog', DirectoryEdit3.Text);
  finally
    // Liberar a memória
    Ini.Free;
  end;

  // Exibe uma mensagem de confirmação
  ShowMessage('Configuração salva com sucesso!');

end;

procedure TfrmConLog1.BitBtn3Click(Sender: TObject);
begin
  tipo.Items[0] := InputBox('Alterar Nome', 'Novo nome para Servidor 1:',
    tipo.Items[0]);
  SalvarNomesServidores(tipo.Items);

  Label6.Caption := tipo.Items[0] + ' (Local dos arquivos de log)';
  BitBtn3.Caption := 'Alterar nome:' + '[' + tipo.Items[0] + ']';
end;

procedure TfrmConLog1.BitBtn4Click(Sender: TObject);
begin
  tipo.Items[1] := InputBox('Alterar Nome', 'Novo nome para Servidor 2:',
    tipo.Items[1]);
  SalvarNomesServidores(tipo.Items);

  Label7.Caption := tipo.Items[1] + ' (Local dos arquivos de log)';
  BitBtn4.Caption := 'Alterar nome:' + '[' + tipo.Items[1] + ']';
end;

procedure TfrmConLog1.BitBtn5Click(Sender: TObject);
begin
  tipo.Items[2] := InputBox('Alterar Nome', 'Novo nome para Servidor 3:',
    tipo.Items[2]);
  SalvarNomesServidores(tipo.Items);

  Label8.Caption := tipo.Items[2] + ' (Local dos arquivos de log)';
  BitBtn5.Caption := 'Alterar nome:' + '[' + tipo.Items[2] + ']';
end;

end.

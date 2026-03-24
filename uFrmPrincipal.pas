unit uFrmPrincipal;

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
  ImgList,
  EKeyNav,
  EOneInst,
  EFocCol,
  EHintBal,
  EAppProt,
  StdCtrls,
  Menus,
  ExtCtrls,
  ComCtrls,
  jpeg,
  UrlMon,
  RXShell,
  Shellapi,
  Registry,
  ShlObj,
  CJVScrollLabel,
  RxGIF,
  MSNPopUp,
  WinSkinData,
  dbAleNavegador,
  Buttons,
  xCalcltr,
  XPMenu,
  Mask,
  DBCtrls,
  Sockets,
  UsersCSLite,
  Grids,
  DBGrids,
  EChkCNPJ,
  verslab,
  IniFiles,
  AppEvnts,
  RXCtrls,
  RxCalc,
  DB,
  IBCustomDataSet,
  IBQuery,
  IBDatabase;

type
  TfrmPrincipal = class(TForm)
    EvHintBalloon1: TEvHintBalloon;
    EvFocusColor1: TEvFocusColor;
    EvOneInstance1: TEvOneInstance;
    EvKeyNavigator1: TEvKeyNavigator;
    MainMenu1: TMainMenu;
    Parametros1: TMenuItem;
    Cadastro1: TMenuItem;
    mCadServidor: TMenuItem;
    mCadFornecedor: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Lanamento1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Consulta1: TMenuItem;
    Utilitrio1: TMenuItem;
    OutrasOpes1: TMenuItem;
    CpiadeSegurana1: TMenuItem;
    GravarCpiadeSegurana1: TMenuItem;
    RestaurarCpiadeSegurana1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobreosistema1: TMenuItem;
    N12: TMenuItem;
    Supore1: TMenuItem;
    web1: TMenuItem;
    N5: TMenuItem;
    UltimasAtualizaes1: TMenuItem;
    RxTrayIcon1: TRxTrayIcon;
    EnviaremailparaSuporte1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ConfigurarBancodeDados1: TMenuItem;
    VerificarAtualizaes1: TMenuItem;
    Image1: TImage;
    Timer2: TTimer;
    N18: TMenuItem;
    XPMenu1: TXPMenu;
    SKIN: TSkinData;
    Skin1: TMenuItem;
    N19: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton7: TSpeedButton;
    N14: TMenuItem;
    ManutenodeUsurios1: TMenuItem;
    ImageList1: TImageList;
    EvAppProtect1: TEvAppProtect;
    LINKSMT1: TMenuItem;
    FIEMT1: TMenuItem;
    N23: TMenuItem;
    N25: TMenuItem;
    AcessorpidoaoSISFLORA1: TMenuItem;
    ConfiguraodoSistema1: TMenuItem;
    mCadBanco: TMenuItem;
    LimparBancodeDados1: TMenuItem;
    N4: TMenuItem;
    mCadItem: TMenuItem;
    N6: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    AjustarEstoque1: TMenuItem;
    N7: TMenuItem;
    N13: TMenuItem;
    mCadTipoFornecedor: TMenuItem;
    usuario: TLabel;
    mCadTipoItem: TMenuItem;
    incluir: TLabel;
    alterar: TLabel;
    excluir: TLabel;
    consultar: TLabel;
    relatorio: TLabel;
    total: TLabel;
    ocorrencia: TLabel;
    rfv: TLabel;
    ae: TLabel;
    N29: TMenuItem;
    cancelarfechamento: TLabel;
    editaproduto: TLabel;
    fechamentovenda: TLabel;
    SpeedButton10: TSpeedButton;
    AlternarUsurio1: TMenuItem;
    N11: TMenuItem;
    N28: TMenuItem;
    Dicas1: TMenuItem;
    Edit1: TEdit;
    Financeiro1: TMenuItem;
    N33: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasaReceber1: TMenuItem;
    N40: TMenuItem;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    mCadSubCategoria: TMenuItem;
    mLctoCPManutencao: TMenuItem;
    mLctoCRManutencao: TMenuItem;
    mLctoDoacao: TMenuItem;
    mCadPlayer: TMenuItem;
    mLctoBanimento: TMenuItem;
    mLctoOcorrencia: TMenuItem;
    mPerfilUsuario: TMenuItem;
    N27: TMenuItem;
    mCadMod: TMenuItem;
    mCTipoLancamento: TMenuItem;
    N42: TMenuItem;
    Dayzforuns1: TMenuItem;
    Dayztwiteer1: TMenuItem;
    Situaodoseguro1: TMenuItem;
    N24: TMenuItem;
    IDlog1: TMenuItem;
    N41: TMenuItem;
    mCadCategoria: TMenuItem;
    StatusdoseguroGeral1: TMenuItem;
    DS1: TDataSource;
    Q1: TIBQuery;
    DataSource2: TDataSource;
    contaspagar: TIBQuery;
    contaspagarID_CODIGO: TIntegerField;
    contaspagarDATA_EMISSAO: TDateField;
    contaspagarDATA_VENCIMENTO: TDateField;
    contaspagarID_FORNECEDOR: TIntegerField;
    contaspagarNOME_FORNECEDOR: TIBStringField;
    contaspagarHISTORICO: TIBStringField;
    contaspagarID_CATEGORIA: TIBBCDField;
    contaspagarNOME_CATEGORIA: TIBStringField;
    contaspagarID_SUB_CATEGORIA: TIBBCDField;
    contaspagarNOME_SUB_CATEGORIA: TIBStringField;
    contaspagarDOCUMENTO: TIBStringField;
    contaspagarVALOR: TFloatField;
    contaspagarSELECAO: TIBStringField;
    contaspagarJURO: TFloatField;
    contaspagarMULTA: TFloatField;
    contaspagarVALOR_TOTAL: TFloatField;
    contaspagarDATA_PAGAMENTO: TDateField;
    contaspagarSTATUS_CODIGO: TIBStringField;
    DataSource3: TDataSource;
    contasreceber: TIBQuery;
    Playersinativos1: TMenuItem;
    Balano1: TMenuItem;
    DemonstrativodeResultado1: TMenuItem;
    N43: TMenuItem;
    Faturamento1: TMenuItem;
    mLctoCompartilhamento: TMenuItem;
    N44: TMenuItem;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    N45: TMenuItem;
    Label12: TLabel;
    mCadMunicipio: TMenuItem;
    Calculator1: TCalculator;
    procedure mCadServidorClick(Sender: TObject);
    procedure mCadFornecedorClick(Sender: TObject);
    procedure Skin1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ManutenodeUsurios1Click(Sender: TObject);
    procedure LimparBancodeDados1Click(Sender: TObject);
    procedure AcessorpidoaoSISFLORA1Click(Sender: TObject);
    procedure GravarCpiadeSegurana1Click(Sender: TObject);
    procedure RestaurarCpiadeSegurana1Click(Sender: TObject);
    procedure UltimasAtualizaes1Click(Sender: TObject);
    procedure VerificarAtualizaes1Click(Sender: TObject);
    procedure Sobreosistema1Click(Sender: TObject);
    procedure EnviaremailparaSuporte1Click(Sender: TObject);
    procedure web1Click(Sender: TObject);
    procedure Supore1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mCadItemClick(Sender: TObject);
    procedure mCadTipoFornecedorClick(Sender: TObject);
    procedure mCadTipoItemClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure AlternarUsurio1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mCadSubCategoriaClick(Sender: TObject);
    procedure mLctoCPManutencaoClick(Sender: TObject);
    procedure mCadPlayerClick(Sender: TObject);
    procedure mLctoDoacaoClick(Sender: TObject);
    procedure mPerfilUsuarioClick(Sender: TObject);
    procedure mCadModClick(Sender: TObject);
    procedure mCTipoLancamentoClick(Sender: TObject);
    procedure FIEMT1Click(Sender: TObject);
    procedure Dayzforuns1Click(Sender: TObject);
    procedure Dayztwiteer1Click(Sender: TObject);
    procedure Situaodoseguro1Click(Sender: TObject);
    procedure IDlog1Click(Sender: TObject);
    procedure mCadCategoriaClick(Sender: TObject);
    procedure StatusdoseguroGeral1Click(Sender: TObject);
    procedure mLctoCRManutencaoClick(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Playersinativos1Click(Sender: TObject);
    procedure Faturamento1Click(Sender: TObject);
    procedure mLctoCompartilhamentoClick(Sender: TObject);
    procedure DemonstrativodeResultado1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure ConfigurarBancodeDados1Click(Sender: TObject);
    procedure mCadMunicipioClick(Sender: TObject);
    procedure mCadBancoClick(Sender: TObject);

  private
    //procedure ValidarBasedeDados1;
  public

  end;

var
  frmPrincipal: TfrmPrincipal;
  Data: TInifile;
  Data1: TInifile;
  Info: TIniFile;

implementation

uses
  uFrmConlog,
  uFrmPerfilUsuario,
  uFrmCadServer,
  uFrmCadMod,
  uFrmCadTipoItem,
  uFrmCadItem,
  uFrmCadMunicipio,
  uFrmCadTipoFornecedor,
  uFrmCadFornecedor,
  uFrmCadCategoria,
  uFrmCadSubCategoria,
  uFrmCadBanco,
  uFrmLctoDoacao,
  uFrmLctoCompartilhamento,
  uFrmLctoCPManutencao,
  uFrmLctoCRManutencao,
  uFrmConSeguro,
  uFrmConSeguro1,
  uFrmConPlayerInativo,
  uFrmConLog1,
  uFrmConFaturamento,
  uFrmFerBackup,
  uFrmFerRestore,
  uFrmFerConfigBD,
  uFrmFerConfigUsuario,
  uFrmFerLogof,
  uFrmFerSkin,
  uFrmLctoContasPagar,
  uFrmLctoContasReceber,
  uFrmAjuUltimasInfo,
  uFrmCadTipoLancamento,
  uFrmCadPlayer,
  uDM,
  uFrmSplash;

type
  { Declara um tipo registro }
  TFicha = record
    Nome: string[40];
    Nome1: string[100];
  end;

{$R *.dfm}

procedure AjustaStatusBar(StatusBar: TStatusBar);
const
  BORDA = 10;
var
  temp, i: Integer;
  lmax: array[0..4] of Integer;
begin
  with StatusBar do
  begin
    Canvas.Font := Font;
    for i := 0 to Panels.Count - 1 do
      lmax[i] := Canvas.TextWidth(Panels[i].Text) + BORDA;
    for i := 0 to Panels.Count - 1 do
      if lmax[i] > 0 then
        Panels[i].Width := lmax[i];
  end;
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

procedure TfrmPrincipal.mCadServidorClick(Sender: TObject);
var
  frmCadServer: TfrmCadServer;
begin
  frmCadServer := TfrmCadServer.Create(Self);
  try
    frmCadServer.ShowModal;
  finally
    frmCadServer.Free;
  end;
end;

procedure TfrmPrincipal.mCadFornecedorClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadFornecedor, frmCadFornecedor);
    frmCadFornecedor.ShowModal;
  finally
    frmCadFornecedor.Free;
  end;
end;

procedure TfrmPrincipal.Skin1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmFerSkin, frmFerSkin);
    frmFerSkin.ShowModal;
  finally
    frmFerSkin.free;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var
  Action: TCloseAction);
begin
  if Application.MessageBox('Confirma saida do sistema?', 'Confirmação', mb_YesNo
    +
    MB_ICONQUESTION) = idYes then
  begin
    Application.Terminate;
  end
  else
    Application.Run;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma saida do sistema?', 'Confirmação', mb_YesNo
    +
    MB_ICONQUESTION) = idYes then
  begin
    Application.Terminate;
  end
  else
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma saida do sistema?', 'Confirmação', mb_YesNo
    +
    MB_ICONQUESTION) = idYes then
  begin
    Application.Terminate;
  end
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := DateToStr(now);
  StatusBar1.Panels[4].Text := TimeToStr(now);
end;

procedure TfrmPrincipal.ManutenodeUsurios1Click(Sender: TObject);
begin
  DM.TSETORES.Close;
  DM.TSETORES.Open;
  if DM.TSETORES.RecordCount = 0 then
  begin
    DM.TSETORES.Close;
    Application.MessageBox('Não há perfil de usuário cadastrado. Verifique!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DM.TSETORES.RecordCount <> 0 then
    begin
      try
        dm.TSETORES.Close;
        Application.CreateForm(TfrmFerConfigUsuario, frmFerConfigUsuario);
        frmFerConfigUsuario.showmodal;
      finally
        frmFerConfigUsuario.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.LimparBancodeDados1Click(Sender: TObject);
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
  //if frmprincipal.usuario.Caption <> 'admin' then
  //begin
    //Application.MessageBox('É preciso estar logado como "admin" para executar este Menu!', 'Informação', mb_Ok + mb_IconInformation);
    //end
    //else
    //begin
    //if not fileexists('C:\HF_Software\Sismad\BancoDados\BDSISMAD.FDB') then
    //begin
    //Application.MessageBox('O procedimento de Limpeza de Banco de Dados, só pode ser realizado no Servidor!', 'Informação', mb_Ok + mb_IconInformation);
    //end
    //else
    //begin
      //try
        //Application.CreateForm(TfrmLimparBD, frmLimparBD);
        //frmlimparbd.showmodal;
      //finally
        //frmlimparbd.Free;
      //end;
    //end;
  //end;
end;

procedure TfrmPrincipal.AcessorpidoaoSISFLORA1Click(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://steamcommunity.com/app/221100/workshop/');
end;

procedure TfrmPrincipal.GravarCpiadeSegurana1Click(Sender: TObject);
begin
  if not
    FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))
    +
    'BancoDados\bdsisgserv.fdb') then
  begin
    Application.MessageBox('O procedimento de Backup só pode ser realizado no Servidor!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmFerBackup, frmFerBackup);
      frmFerBackup.showmodal;
    finally
      frmFerBackup.Free;
    end;
  end;
end;

procedure TfrmPrincipal.RestaurarCpiadeSegurana1Click(Sender: TObject);
begin
  if not
    FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))
    +
    'BancoDados\bdsisgserv.fdb') then
  begin
    Application.MessageBox('O procedimento de Restauração de Backup só pode ser realizado no Servidor!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      DM.IBDatabase1.Connected := False;
      Application.CreateForm(TfrmFerRestore, frmFerRestore);
      frmFerRestore.showmodal;
    finally
      frmFerRestore.Free;
    end;
  end;
end;

procedure TfrmPrincipal.UltimasAtualizaes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAjuUltimasInfo, frmAjuUltimasInfo);
    frmAjuUltimasInfo.ShowModal;
  finally
    frmAjuUltimasInfo.Free;
  end;
end;

procedure TfrmPrincipal.VerificarAtualizaes1Click(Sender: TObject);
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
  //if Application.MessageBox('Certifique-se de estar conectado a internet, e clique em OK para continuar!', 'Confirmação',
  //mb_OKCANCEL + mb_ICONINFORMATION) = idOK then
  //begin
    //try
      //Application.CreateForm(TfrmAtualizacao, frmAtualizacao);
      //frmAtualizacao.showmodal;
    //finally
      //frmatualizacao.Free;
  //end;
end;

procedure TfrmPrincipal.Sobreosistema1Click(Sender: TObject);
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
end;

procedure TfrmPrincipal.EnviaremailparaSuporte1Click(Sender: TObject);
var
  Mail: string;
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
  //Mail := 'mailto:hfinformatica@bol.com.br';
  //ShellExecute(GetDesktopWindow,'open',pchar(Mail),nil,nil, sw_ShowNormal);
end;

procedure TfrmPrincipal.web1Click(Sender: TObject);
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
  //if Application.MessageBox('Certifique-se de estar conectado a internet, e clique em OK para continuar!', 'Confirmação',
  //mb_OKCANCEL + mb_ICONINFORMATION) = idOK then
    //begin
      //HlinkNavigateString(nil,'http://www.hfinformatica.net');
    //end
end;

procedure TfrmPrincipal.Supore1Click(Sender: TObject);
begin
  Application.MessageBox('Menu não disponivel nesta versão!', 'Informação', mb_ok
    + mb_iconinformation);
  //try
    //Application.CreateForm(TfrmSobre, frmSobre);
    //frmSobre.ShowModal;
  //finally
    //frmsobre.Free;
  //end;
end;

procedure TfrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
  if not
    FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))
    +
    'BancoDados\bdsisgserv.fdb') then
  begin
    Application.MessageBox('O procedimento de Backup só pode ser realizado no Servidor!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmFerBackup, frmFerBackup);
      frmFerBackup.showmodal;
    finally
      frmFerBackup.free;
    end;
  end;
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
  if not
    FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))
    +
    'BancoDados\bdsisgserv.fdb') then
  begin
    Application.MessageBox('O procedimento de Restauração de Backup só pode ser realizado no Servidor!', 'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      DM.IBDatabase1.Connected := False;
      Application.CreateForm(TfrmFerRestore, frmFerRestore);
      frmFerRestore.showmodal;
    finally
      frmFerRestore.Free;
    end;
  end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadFornecedor, frmCadFornecedor);
    frmCadFornecedor.ShowModal;
  finally
    frmCadFornecedor.Free;
  end
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if frmprincipal.StatusBar1.Panels[1].Text <> ' Usuário: admin' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmCadPlayer, frmCadPlayer);
      frmCadPlayer.ShowModal;
    finally
      frmCadPlayer.Free;
    end;
  end;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmLctoDoacao, frmLctoDoacao);
    frmLctoDoacao.ShowModal;
  finally
    frmLctoDoacao.Free;
  end;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConSeguro, frmConSeguro);
      frmConSeguro.ShowModal;
    finally
      frmConSeguro.Free;
    end;
  end;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConLog, frmConLog);
      frmConLog.ShowModal;
    finally
      frmConLog.Free;
    end;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  SkinPath: string;
  SearchRec: TSearchRec;
  DefaultSkinDir: string;
begin
  self.Caption := 'Sisgserv - Sistema de Gerenciamento de Servidor   V: ' +
    frmsplash.Label1.caption;
  data := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'Config\Config.ini');
  edit1.Text := Data.ReadString('TELADICAS', 'MOSTRA', '');
  frmPrincipal.StatusBar1.Panels[5].Text := data.ReadString('CONEXAO', 'HOST',
    '') + data.ReadString('CONEXAO', 'CAMINHO', '') + '';
  SkinPath := data.ReadString('SKIN', 'NOME', '');

  if SkinPath = '' then
  begin
    DefaultSkinDir := ExtractFilePath(Application.ExeName) + 'Skin\';
    if DirectoryExists(DefaultSkinDir) then
    begin
      // Procura primeira skin (ex: *.ssk ou qualquer extensão que você use)
      if FindFirst(DefaultSkinDir + '*.skn', faAnyFile, SearchRec) = 0 then
      begin
        repeat
          if (SearchRec.Attr and faDirectory) = 0 then
          begin
            SkinPath := DefaultSkinDir + SearchRec.Name;
            Break;
          end;
        until FindNext(SearchRec) <> 0;
        FindClose(SearchRec);
      end;
    end;
    // Salva no INI se encontrou
    if SkinPath <> '' then
      data.WriteString('SKIN', 'NOME', SkinPath);
  end;
  // Aplica a skin se existir
  if FileExists(SkinPath) then
    frmPrincipal.Skin.SkinFile := SkinPath;
  data.Free;
end;

procedure TfrmPrincipal.mCadItemClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadItem, frmCadItem);
    frmCadItem.ShowModal;
  finally
    frmCadItem.Free;
  end;
end;

procedure TfrmPrincipal.mCadTipoFornecedorClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadTipofornecedor, frmCadTipofornecedor);
    frmCadTipofornecedor.ShowModal;
  finally
    frmCadTipofornecedor.Free;
  end;
end;

procedure TfrmPrincipal.mCadTipoItemClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadTipoItem, frmCadTipoItem);
    frmCadTipoItem.ShowModal;
  finally
    frmCadTipoItem.Free;
  end;
end;

procedure TfrmPrincipal.SpeedButton10Click(Sender: TObject);
begin
  Application.CreateForm(TfrmFerLogof, frmFerLogof);
  frmFerLogof.Showmodal;
  frmFerLogof.Free;
end;

procedure TfrmPrincipal.AlternarUsurio1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmFerLogof, frmFerLogof);
    frmFerLogof.Showmodal;
  finally
    frmFerLogof.Free;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  timer2.enabled := true;
  with Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD, MAX(DTASEGURO) as DTASEGURO');
    SQL.Add('FROM DONATE');
    q1.sql.add('where STATUSCOD = :codigo');
    SQL.Add('GROUP BY REGISTRADOPARACOD, REGISTRADOPARA, STATUSCOD');
    SQL.Add('HAVING MAX(DTASEGURO) <= :Hoje');
    // esta clausula se utiliza depois do agrupamento para filtrar apos o agrupamento
    SQL.ADD('ORDER BY DTASEGURO DESC');
    ParamByName('Hoje').AsDate := Date;
    ParamByName('codigo').Text := '0';
    Open;
    q1.First;
    q1.Last;
  end;
  if Q1.RecordCount <> 0 then
  begin
    label9.Caption := 'Há ' + intTostr(Q1.RecordCount) +
      ' seguro(s) vencido(s). Clique aqui para visualizar';
  end
  else
  begin
    if Q1.RecordCount = 0 then
    begin
      label9.Caption := 'Há ' + intTostr(Q1.RecordCount) +
        ' seguro(s) vencido(s). Clique aqui para visualizar';
    end;
  end;

  with contaspagar do
  begin
    close;
    SQL.Clear;
    SQL.Add('Select * from CONTAS_PAGAR');
    SQL.Add('Where STATUS_CODIGO =:codigo');
    SQL.Add('Order by DATA_VENCIMENTO');
    ParamByName('codigo').AsString := '0';
    Open;
    first;
    last;
  end;
  if contaspagar.RecordCount <> 0 then
  begin
    label10.Caption := 'Há ' + intTostr(contaspagar.RecordCount) +
      ' contas a pagar vencida(s). Clique aqui para visualizar';
  end
  else
  begin
    if contaspagar.RecordCount = 0 then
    begin
      label10.Caption := 'Há ' + intTostr(contaspagar.RecordCount) +
        ' contas a pagar vencida(s). Clique aqui para visualizar';
    end;
  end;

  with contasreceber do
  begin
    close;
    SQL.Clear;
    SQL.Add('Select * from CONTAS_RECEBER');
    SQL.Add('Where STATUS_CODIGO =:codigo');
    SQL.Add('Order by DATA_VENCIMENTO');
    ParamByName('codigo').AsString := '0';
    Open;
    first;
    last;
  end;
  if contasreceber.RecordCount <> 0 then
  begin
    label11.Caption := 'Há ' + intTostr(contasreceber.RecordCount) +
      ' contas a receber vencida(s). Clique aqui para visualizar';
  end
  else
  begin
    if contasreceber.RecordCount = 0 then
    begin
      label11.Caption := 'Há ' + intTostr(contasreceber.RecordCount) +
        ' contas a receber vencida(s). Clique aqui para visualizar';
    end;
  end;

  Q1.close;
  contaspagar.close;
  contasreceber.close;
end;

procedure TfrmPrincipal.mCadSubCategoriaClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadSubCategoria, frmCadSubCategoria);
    frmCadSubCategoria.ShowModal;
  finally
    frmCadSubCategoria.Free;
  end;
end;

procedure TfrmPrincipal.mLctoCPManutencaoClick(Sender: TObject);
begin
  if frmprincipal.ocorrencia.caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.ocorrencia.caption <> 'False' then
    begin
      try
        Application.CreateForm(TfrmLctoCPManutencao, frmLctoCPManutencao);
        frmLctoCPManutencao.ShowModal;
      finally
        frmLctoCPManutencao.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.mCadPlayerClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadPlayer, frmCadPlayer);
    frmCadPlayer.ShowModal;
  finally
    frmCadPlayer.Free;
  end;
end;

procedure TfrmPrincipal.mLctoDoacaoClick(Sender: TObject);
begin
  DM.TESSENCIA.Open;
  if DM.TESSENCIA.RecordCount = 0 then
  begin
    Application.MessageBox('Não há servidor cadastrado. Volte ao menu Cadastro!',
      'Informação', mb_Ok + mb_IconInformation);
    DM.TESSENCIA.Close;
  end
  else
  begin
    DM.T_VENDEDOR.Open;
    if DM.T_VENDEDOR.RecordCount = 0 then
    begin
      Application.MessageBox('Não há Item cadastrado. Volte ao menu Cadastro!',
        'Informação', mb_Ok + mb_IconInformation);
      DM.T_VENDEDOR.Close;
      DM.T_VENDEDOR.Open;
    end;
  end;

  if (DM.TESSENCIA.RecordCount <> 0) and (DM.T_VENDEDOR.RecordCount <> 0) then
  begin
    try
      Application.CreateForm(TfrmLctoDoacao, frmLctoDoacao);
      frmLctoDoacao.ShowModal;
    finally
      frmLctoDoacao.Free;
    end;
  end;
end;

procedure TfrmPrincipal.mPerfilUsuarioClick(Sender: TObject);
var
  frmParPerfilUsuario: TfrmParPerfilUsuario;
begin
  if frmprincipal.StatusBar1.Panels[1].Text <> ' Usuário: admin' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    frmParPerfilUsuario := TfrmParPerfilUsuario.Create(Self);
    try
      frmParPerfilUsuario.ShowModal;
    finally
      frmParPerfilUsuario.Free;
    end;
  end;
end;

procedure TfrmPrincipal.mCadModClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadMod, frmCadMod);
    frmCadMod.ShowModal;
  finally
    frmCadMod.Free;
  end;
end;

procedure TfrmPrincipal.mCTipoLancamentoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadTipoLancamento, frmCadTipoLancamento);
    frmCadTipoLancamento.ShowModal;
  finally
    frmCadTipoLancamento.Free;
  end;
end;

procedure TfrmPrincipal.FIEMT1Click(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://www.bohemia.net/games/dayz');
end;

procedure TfrmPrincipal.Dayzforuns1Click(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://forums.dayz.com/');
end;

procedure TfrmPrincipal.Dayztwiteer1Click(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://twitter.com/DayZ');
end;

procedure TfrmPrincipal.Situaodoseguro1Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConSeguro, frmConSeguro);
      frmConSeguro.ShowModal;
    finally
      frmConSeguro.Free;
    end;
  end;
end;

procedure TfrmPrincipal.IDlog1Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConLog, frmConLog);
      frmConLog.ShowModal;
    finally
      frmConLog.Free;
    end;
  end;
end;

procedure TfrmPrincipal.mCadCategoriaClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadCategoria, frmCadCategoria);
    frmCadCategoria.ShowModal;
  finally
    frmCadCategoria.Free;
  end;
end;

procedure TfrmPrincipal.StatusdoseguroGeral1Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConSeguro1, frmConSeguro1);
      frmConSeguro1.ShowModal;
    finally
      frmConSeguro1.Free;
    end;
  end;
end;

procedure TfrmPrincipal.mLctoCRManutencaoClick(Sender: TObject);
begin
  if frmprincipal.ocorrencia.caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.ocorrencia.caption <> 'False' then
    begin
      try
        Application.CreateForm(TfrmLctoCRManutencao, frmLctoCRManutencao);
        frmLctoCRManutencao.ShowModal;
      finally
        frmLctoCRManutencao.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.Label9Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConSeguro1, frmConSeguro1);
      frmConSeguro1.ShowModal;
    finally
      frmConSeguro1.Free;
    end;
  end;
end;

procedure TfrmPrincipal.Label10Click(Sender: TObject);
begin
  if frmprincipal.ocorrencia.caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.ocorrencia.caption <> 'False' then
    begin
      try
        Application.CreateForm(TfrmLctoCPManutencao, frmLctoCPManutencao);
        frmLctoCPManutencao.ShowModal;
      finally
        frmLctoCPManutencao.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.Label11Click(Sender: TObject);
begin
  if frmprincipal.ocorrencia.caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if frmprincipal.ocorrencia.caption <> 'False' then
    begin
      try
        Application.CreateForm(TfrmLctoCRManutencao, frmLctoCRManutencao);
        frmLctoCRManutencao.ShowModal;
      finally
        frmLctoCRManutencao.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.Playersinativos1Click(Sender: TObject);
begin
  if frmprincipal.consultar.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConPlayerInativo, frmConPlayerInativo);
      frmConPlayerInativo.ShowModal;
    finally
      frmConPlayerInativo.Free;
    end;
  end;
end;

procedure TfrmPrincipal.Faturamento1Click(Sender: TObject);
begin
  if frmprincipal.cancelarfechamento.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    try
      Application.CreateForm(TfrmConFaturamento, frmConFaturamento);
      frmConFaturamento.ShowModal;
    finally
      frmConFaturamento.Free;
    end;
  end;
end;

procedure TfrmPrincipal.mLctoCompartilhamentoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmLctoCompartilhamento, frmLctoCompartilhamento);
    frmLctoCompartilhamento.ShowModal;
  finally
    frmLctoCompartilhamento.Free;
  end;
end;

procedure TfrmPrincipal.DemonstrativodeResultado1Click(Sender: TObject);
begin
  if frmprincipal.cancelarfechamento.Caption = 'False' then
  begin
    Application.MessageBox('Você não tem permissão para executar esta ação!',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    Application.MessageBox('Menu não disponivel nesta versão!', 'Informação',
      mb_Ok + mb_IconInformation);
  end;
end;

procedure TfrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
  DM.TSETORES.Close;
  DM.TSETORES.Open;
  if DM.TSETORES.RecordCount = 0 then
  begin
    DM.TSETORES.Close;
    Application.MessageBox('Não há perfil de usuário cadastrado. Verifique',
      'Informação', mb_Ok + mb_IconInformation);
  end
  else
  begin
    if DM.TSETORES.RecordCount <> 0 then
    begin
      try
        dm.TSETORES.Close;
        Application.CreateForm(TfrmFerConfigUsuario, frmFerConfigUsuario);
        frmFerConfigUsuario.showmodal;
      finally
        frmFerConfigUsuario.Free;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.N45Click(Sender: TObject);
begin
  frmPrincipal.EvKeyNavigator1.Active := true;
  try
    Application.CreateForm(TfrmConlog1, frmConlog1);
    frmConlog1.ShowModal;
  finally
    frmConlog1.Free;
  end;
end;

procedure TfrmPrincipal.ConfigurarBancodeDados1Click(Sender: TObject);
var
  Patch: string;
begin
  frmFerConfigBD.ShowModal;
end;

procedure TfrmPrincipal.mCadMunicipioClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadMunicipio, frmCadMunicipio);
    frmCadMunicipio.ShowModal;
  finally
    frmCadMunicipio.Free;
  end;
end;

procedure TfrmPrincipal.mCadBancoClick(Sender: TObject);
var
  frmCadBanco: TfrmCadBanco;
begin
  frmCadBanco := TfrmCadBanco.Create(Self);
  try
    frmCadBanco.ShowModal;
  finally
    frmCadBanco.Free;
  end;
end;

end.

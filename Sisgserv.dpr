program Sisgserv;

uses
  Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmCadServer in 'uFrmCadServer.pas' {frmCadServer},
  uFrmAjuUltimasInfo in 'uFrmAjuUltimasInfo.pas' {frmAjuUltimasInfo},
  uFrmSplash in 'uFrmSplash.pas' {frmSplash},
  uFrmSobre in 'uFrmSobre.pas' {frmAjuSobre},
  uFrmFerBackup in 'uFrmFerBackup.pas' {frmFerBackup},
  uFrmFerRestore in 'uFrmFerRestore.pas' {frmFerRestore},
  uFrmCadPlayer in 'uFrmCadPlayer.pas' {frmCadPlayer},
  uFrmLctoCPPesquisaFor in 'uFrmLctoCPPesquisaFor.pas' {frmLctoCPPesquisaForn},
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  uFrmFerConfigUsuario in 'uFrmFerConfigUsuario.pas' {frmFerConfigUsuario},
  uFrmCadBanco in 'uFrmCadBanco.pas' {frmCadBanco},
  uFrmFerLimparBD in 'uFrmFerLimparBD.pas' {frmFerLimparBD},
  uFrmFerSkin in 'uFrmFerSkin.pas' {frmFerSkin},
  uFrmFerConfigBD in 'uFrmFerConfigBD.pas' {frmFerConfigBD},
  uFrmCadTipoFornecedor in 'uFrmCadTipoFornecedor.pas' {frmCadTipofornecedor},
  uFrmLctoDoacaoItem1 in 'uFrmLctoDoacaoItem1.pas' {frmLctoDoacaoItem1},
  uFrmPerfilUsuario in 'uFrmPerfilUsuario.pas' {frmParPerfilUsuario},
  uFrmCadTipoItem in 'uFrmCadTipoItem.pas' {frmCadTipoItem},
  uFrmFerLogof in 'uFrmFerLogof.pas' {frmFerLogof},
  uFrmLctoContasPagar in 'uFrmLctoContasPagar.pas' {frmLctoContasPagar},
  uFrmConCategoriaPesquisa in 'uFrmConCategoriaPesquisa.pas'
    {frmConCategoriaPesquisa},
  uFrmLctoCPManutencao in 'uFrmLctoCPManutencao.pas' {frmLctoCPManutencao},
  uFrmLctoDoacao in 'uFrmLctoDoacao.pas' {frmLctoDoacao},
  uFrmLctoDoacaoPlayer in 'uFrmLctoDoacaoPlayer.pas' {frmLctoDoacaoPlayer},
  uFrmLctoDoacaoBanco in 'uFrmLctoDoacaoBanco.pas' {frmLctoDoacaoBanco},
  uFrmCadMod in 'uFrmCadMod.pas' {frmCadMod},
  uFrmCadTipoLancamento in 'uFrmCadTipoLancamento.pas' {frmCadTipoLancamento},
  uFrmConSeguro in 'uFrmConSeguro.pas' {frmConSeguro},
  uFrmConSeguroItem in 'uFrmConSeguroItem.pas' {frmConSeguroItem},
  uFrmConLog in 'uFrmConLog.pas' {frmConLog},
  uFrmCadFornecedor in 'uFrmCadFornecedor.pas' {frmCadFornecedor},
  uFrmCadCategoria in 'uFrmCadCategoria.pas' {frmCadCategoria},
  uFrmCadSubCategoria in 'uFrmCadSubCategoria.pas' {frmCadSubCategoria},
  uFrmCadSubCategoriaPesq in 'uFrmCadSubCategoriaPesq.pas'
    {frmCadSubCategoriaPesq},
  uFrmConSeguro1 in 'uFrmConSeguro1.pas' {frmConSeguro1},
  uFrmLctoCRManutencao in 'uFrmLctoCRManutencao.pas' {frmLctoCRManutencao},
  uFrmLctoContasReceber in 'uFrmLctoContasReceber.pas' {frmLctoContasReceber},
  uFrmConPlayerInativo in 'uFrmConPlayerInativo.pas' {frmConPlayerInativo},
  uFrmLctoContasPagarQuitar in 'uFrmLctoContasPagarQuitar.pas'
    {frmLctoContasPagarQuitar},
  uFrmLctoContasReceberQuitar in 'uFrmLctoContasReceberQuitar.pas'
    {frmLctoContasReceberQuitar},
  uFrmConFaturamento in 'uFrmConFaturamento.pas' {frmConFaturamento},
  uFrmLctoCompartilhamento in 'uFrmLctoCompartilhamento.pas'
    {frmLctoCompartilhamento},
  uFrmLctoDoacaoItem in 'uFrmLctoDoacaoItem.pas' {frmLctoDoacaoItem},
  uFrmConLog1 in 'uFrmConLog1.pas' {frmConLog1},
  uFrmCadMunicipio in 'uFrmCadMunicipio.pas' {frmCadMunicipio},
  uFrmCadItem in 'uFrmCadItem.pas' {frmCadItem},
  uFrmLctoCompartilhamentoItem in 'uFrmLctoCompartilhamentoItem.pas'
    {frmLctoCompartilhamentoItem};

{$R *.res}

begin
  Application.Initialize;
  frmsplash := Tfrmsplash.Create(application);
  frmsplash.show;
  frmsplash.Refresh;
  Application.Title := 'Sisgserv';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLctoCompartilhamentoItem,
    frmLctoCompartilhamentoItem);
  frmPrincipal.Enabled := false;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmFerConfigBD, frmFerConfigBD);

  if dm.IBDatabase1.Connected then
    try
      Application.Run;
    except
      Application.Terminate;
    end;
end.

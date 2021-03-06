program RNMAISCREDITO;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Mainm in 'Mainm.pas' {frmPrincipal: TUnimForm},
  UpreCad in 'UpreCad.pas' {FrmPreCad: TUnimForm},
  Uacomp in 'Uacomp.pas' {frmAcomp: TUnimForm},
  Uadmin in 'Uadmin.pas' {frmAdmin: TUnimForm},
  Usolicitacao in 'Usolicitacao.pas' {FrmSolicitacao: TUnimForm},
  UdadosCliente in 'UdadosCliente.pas' {frmDadosCliente: TUnimForm},
  UdadosUsuario in 'UdadosUsuario.pas' {frmDadosUsuario: TUnimForm},
  Uusuarios in 'Uusuarios.pas' {frmUsuarios: TUnimForm},
  Usejuv in 'Usejuv.pas' {frmAdminSejuv: TUnimForm},
  UanexarDoc in 'UanexarDoc.pas' {frmAnexarDoc: TUnimForm},
  UpedirDocs in 'UpedirDocs.pas' {frmPedirDocs: TUnimForm},
  UrecuperarSenha in 'UrecuperarSenha.pas' {frmRecuperarSenha: TUnimForm},
  Umsg in 'Umsg.pas' {frmMsg: TUnimForm},
  UdocsReprovados in 'UdocsReprovados.pas' {frmDocsReprovados: TUnimForm},
  Utermos in 'Utermos.pas' {frmTermo: TUnimForm},
  Upep in 'Upep.pas' {frmPep: TUnimForm},
  UcadSucesso in 'UcadSucesso.pas' {frmCadSucesso: TUnimForm},
  UpesquisaInicialReprovada in 'UpesquisaInicialReprovada.pas' {frmPesqPendencia: TUnimForm},
  UinfImportantes in 'UinfImportantes.pas' {frmInfImportantes: TUnimForm},
  UcnpjClienteFormal in 'UcnpjClienteFormal.pas' {UnimForm1: TUnimForm},
  UexportarCsv in 'UexportarCsv.pas' {frmExportarCsv: TUnimForm},
  Uchat in 'Uchat.pas' {frmChat: TUnimForm},
  UadminMsg in 'UadminMsg.pas' {frmAdminMsg: TUnimForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.

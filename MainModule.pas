unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, IniFiles;

type
  TUniMainModule = class(TUniGUIMainModule)
    FDConnection: TFDConnection;
    tb_usuario: TFDTable;
    dsUsuario: TDataSource;
    FDQuery: TFDQuery;
    tb_cliente: TFDTable;
    dsCliente: TDataSource;
    tb_avalista: TFDTable;
    dsAvalista: TDataSource;
    tb_solicitacao: TFDTable;
    dsSolicitacao: TDataSource;
    tb_grupo: TFDTable;
    dsGrupo: TDataSource;
    tb_acompanhamento: TFDTable;
    dsAcompanhamento: TDataSource;
    view_acompanhamento: TFDTable;
    dsViewAcompanhamento: TDataSource;
    tb_clienteID: TIntegerField;
    tb_clienteNOME: TStringField;
    tb_clienteCPF: TStringField;
    tb_clienteMUNICIPIO: TStringField;
    tb_clienteCLIENTEAGN: TStringField;
    tb_clienteUSUARIO: TIntegerField;
    tb_clienteESTADOCIVIL: TStringField;
    tb_clienteTELEFONE: TStringField;
    tb_clienteEMAIL: TStringField;
    tb_clienteNOMECONJUGE: TStringField;
    tb_clienteCPFCONJUGE: TStringField;
    tb_clienteDATACADASTRO: TDateField;
    tb_clienteDATAATUALIZACAO: TDateField;
    tb_clienteSITUACAO: TStringField;
    tb_usuarioID: TIntegerField;
    tb_usuarioNOME: TStringField;
    tb_usuarioUSUARIO: TStringField;
    tb_usuarioSENHA: TStringField;
    tb_usuarioPERFIL: TIntegerField;
    tb_usuarioDATACADASTRO: TDateField;
    tb_usuarioDATAATUALIZACAO: TDateField;
    tb_usuarioSTATUS: TStringField;
    tb_solicitacaoID: TIntegerField;
    tb_solicitacaoCLIENTE: TIntegerField;
    tb_solicitacaoAVALISTA: TIntegerField;
    tb_solicitacaoLINHACREDITO: TIntegerField;
    tb_solicitacaoGRUPO: TStringField;
    tb_solicitacaoSITUACAO: TIntegerField;
    tb_solicitacaoTIPOFINANCIAMENTO: TStringField;
    tb_solicitacaoDATACADASTRO: TDateField;
    tb_solicitacaoDATAATUALIZACAO: TDateField;
    tb_avalistaID: TIntegerField;
    tb_avalistaNOME: TStringField;
    tb_avalistaCPF: TStringField;
    tb_avalistaTELEFONE: TStringField;
    tb_avalistaEMAIL: TStringField;
    tb_avalistaESTADOCIVIL: TStringField;
    tb_avalistaNOMECONJUGE: TStringField;
    tb_avalistaCPFCONJUGE: TStringField;
    tb_avalistaCLIENTEAGN: TStringField;
    tb_avalistaDATACADASTRO: TDateField;
    tb_avalistaDATAATUALIZACAO: TDateField;
    tb_grupoID: TIntegerField;
    tb_grupoNOME: TStringField;
    tb_grupoCPF: TStringField;
    tb_grupoCADASTRO: TStringField;
    tb_grupoDATACADASTRO: TDateField;
    tb_grupoDATAATUALIZACAO: TDateField;
    tb_grupoCONFIRMAPARTICIPACAO: TStringField;
    tb_acompanhamentoID: TIntegerField;
    tb_acompanhamentoETAPA: TIntegerField;
    tb_acompanhamentoSOLICITACAO: TIntegerField;
    tb_acompanhamentoDATA: TDateField;
    view_acompanhamentoID: TIntegerField;
    view_acompanhamentoSOLICITACAO: TIntegerField;
    view_acompanhamentoID_ETAPA: TIntegerField;
    view_acompanhamentoETAPA: TStringField;
    view_acompanhamentoDATA: TDateField;
    tb_documentos: TFDTable;
    dsDocumentos: TDataSource;
    tb_documentosID: TIntegerField;
    tb_documentosID_CLIENTE: TIntegerField;
    tb_documentosDESCRICAO: TStringField;
    tb_documentosCAMINHO_DOC: TStringField;
    tb_documentosDATACADASTRO: TDateField;
    tb_solicitacaoLINHA: TStringField;
    tb_documentosSITUACAO: TStringField;
    tb_capacitacao: TFDTable;
    dsCapacitacao: TDataSource;
    tb_capacitacaoID: TIntegerField;
    tb_capacitacaoCLIENTE: TIntegerField;
    tb_capacitacaoDATA: TStringField;
    tb_capacitacaoHORARIO: TStringField;
    tb_capacitacaoLOCAL: TStringField;
    tb_solicitacaoATIVIDADE: TStringField;
    tb_solicitacaoOBJETIVO: TStringField;
    tb_solicitacaoTIPONEGOCIO: TStringField;
    tb_solicitacaoCNPJ: TStringField;
    tb_solicitacaoQTDE_SOCIOS: TIntegerField;
    tb_solicitacaoCNPJ_SOCIOS: TStringField;
    tb_solicitacaoGRUPO_AGN: TStringField;
    tb_clienteACEITATERMO: TStringField;
    tb_clientePEP: TStringField;
    tb_documentosOBS: TStringField;
    tb_solicitacaoNOMESOCIO1: TStringField;
    tb_solicitacaoCPFSOCIO1: TStringField;
    tb_solicitacaoNOMESOCIO2: TStringField;
    tb_solicitacaoCPFSOCIO2: TStringField;
    tb_solicitacaoNOMESOCIO3: TStringField;
    tb_solicitacaoCPFSOCIO3: TStringField;
    tb_solicitacaoNOMESOCIO4: TStringField;
    tb_solicitacaoCPFSOCIO4: TStringField;
    tb_solicitacaoNOMESOCIO5: TStringField;
    tb_solicitacaoCPFSOCIO5: TStringField;
    tb_solicitacaoNOMESOCIO6: TStringField;
    tb_solicitacaoCPFSOCIO6: TStringField;
    tb_solicitacaoNOMESOCIO7: TStringField;
    tb_solicitacaoCPFSOCIO7: TStringField;
    tb_solicitacaoNOMESOCIO8: TStringField;
    tb_solicitacaoCPFSOCIO8: TStringField;
    tb_solicitacaoNOMESOCIO9: TStringField;
    tb_solicitacaoCPFSOCIO9: TStringField;
    tb_solicitacaoNOMESOCIO10: TStringField;
    tb_solicitacaoCPFSOCIO10: TStringField;
    tb_solicitacaoVALORPRETENDIDO: TSingleField;
    tb_solicitacaoFATURAMENTOANUAL: TSingleField;
    tb_acompanhamentoOBSERVACAO: TStringField;
    view_acompanhamentoOBSERVACAO: TStringField;
    tb_documentosSOLICITAR: TStringField;
    tb_acompanhamentoOBS: TBlobField;
    view_acompanhamentoOBS: TBlobField;
    tb_solicitacaoMEI: TStringField;
    tb_solicitacaoDATAABERTURAEMPRESA: TDateField;
    dsQuery: TDataSource;
    tb_chat: TFDTable;
    dsChat: TDataSource;
    tb_chatID: TIntegerField;
    tb_chatCLIENTE: TIntegerField;
    tb_chatOPERADOR: TIntegerField;
    tb_chatREMETENTE: TStringField;
    tb_chatMENSAGEM: TStringField;
    tb_chatDATA: TDateField;
    tb_chatHORA: TTimeField;
    tb_chatVISTO: TStringField;
    tb_linhadecredito: TFDTable;
    tb_linhadecreditoID: TIntegerField;
    tb_linhadecreditoNOME: TStringField;
    dsLinhadecredito: TDataSource;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure conectar();
    function msg (texto: string): Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
    var
      textoMsg: string;
      returnMsg: Boolean;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, Umsg;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

function TUniMainModule.msg(texto: string): Boolean;
begin
  textoMsg := texto;
  frmMsg.ShowModal;
  result := returnMsg;
end;

procedure TUniMainModule.conectar();
begin

  with FDConnection do
  begin
    Connected         := False;
    Params.Database   := UniServerModule.StartPath + 'DataBase\DBCREDJOVEM.FDB';
    Params.UserName   := 'SYSDBA';
    Params.Password   := 'masterkey';
    Connected         := True;
  end;

  tb_usuario.Active           := True;
  tb_cliente.Active           := True;
  tb_solicitacao.Active       := True;
  tb_avalista.Active          := True;
  tb_grupo.Active             := True;
  tb_acompanhamento.Active    := True;
  tb_documentos.Active        := True;
  tb_capacitacao.Active       := True;
  tb_chat.Active              := True;
  tb_linhadecredito.Active    := True;

  view_acompanhamento.Active  := True;
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  conectar();
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.

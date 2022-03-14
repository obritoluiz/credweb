unit UdadosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Imaging.pngimage, uniImage, unimImage,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  unimBitBtn, uniBasicGrid, uniDBGrid, unimDBListGrid, uniLabel, unimLabel,
  uniEdit, uniDBEdit, unimDBEdit, uniMultiItem, unimSelect, unimDBSelect,
  unimPanel, unimScrollBox, uniPanel, uniPageControl, unimTabPanel,
  uniGUIBaseClasses, unimButton, unimEdit, uniMemo, uniDBMemo, unimDBMemo,
  unimDBGrid, uniTimer;

type
  TfrmDadosCliente = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgInicio: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    pnlGeral: TUnimPanel;
    pnlDados: TUnimPanel;
    dbsltMunicipio: TUnimDBSelect;
    edtNome: TUnimDBEdit;
    UnimDBEdit1: TUnimDBEdit;
    UnimDBEdit2: TUnimDBEdit;
    UnimDBEdit3: TUnimDBEdit;
    UnimDBSelect1: TUnimDBSelect;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimLabel6: TUnimLabel;
    UnimLabel7: TUnimLabel;
    pnlEstCivil: TUnimPanel;
    UnimLabel5: TUnimLabel;
    UnimDBSelect2: TUnimDBSelect;
    UnimLabel9: TUnimLabel;
    UnimDBEdit4: TUnimDBEdit;
    UnimLabel10: TUnimLabel;
    UnimDBEdit5: TUnimDBEdit;
    pnlGrupo: TUnimPanel;
    UnimLabel11: TUnimLabel;
    UnimDBEdit6: TUnimDBEdit;
    grdGrupo: TUnimDBListGrid;
    UnimPanel2: TUnimPanel;
    UnimBitBtn2: TUnimBitBtn;
    qryGrupo: TFDQuery;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    LabelUsuario: TUnimLabel;
    DsGrupo: TDataSource;
    UnimDBEdit7: TUnimDBEdit;
    pgAvalista: TUnimTabSheet;
    PanelAvalista: TUnimPanel;
    LabelAvalistaCPF: TUnimLabel;
    LabelAvalista: TUnimLabel;
    LabelNomeAvalista: TUnimLabel;
    LabelEstadoCivilAvalista: TUnimLabel;
    LabelTelefoneAvalista: TUnimLabel;
    LabelEmailAvalista: TUnimLabel;
    PanelConjugeAvalista: TUnimPanel;
    LabelNomeAvalistaConjuge: TUnimLabel;
    LabelCpfAvalistaConjuge: TUnimLabel;
    LabelAvalistaConjuge: TUnimLabel;
    EditAvalistaCPF: TUnimEdit;
    EditTelefoneAvalista: TUnimEdit;
    SelectAvalistaClienteAGN: TUnimDBSelect;
    LabelAvalistaAGN: TUnimLabel;
    btnAtualizarAvalista: TUnimButton;
    EditAvalistaNome: TUnimDBEdit;
    EditEmailAvalista: TUnimDBEdit;
    SelectEstadoCivilAvalista: TUnimDBSelect;
    UnimScrollBox1: TUnimScrollBox;
    UnimLabel12: TUnimLabel;
    UnimLabel14: TUnimLabel;
    SelectEtapaProcesso: TUnimSelect;
    UnimLabel13: TUnimLabel;
    cbbLinhas: TUnimDBSelect;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimLabel8: TUnimLabel;
    UnimDBSelect4: TUnimDBSelect;
    UnimDBEdit8: TUnimDBEdit;
    UnimLabel16: TUnimLabel;
    UnimDBSelect5: TUnimDBSelect;
    UnimLabel17: TUnimLabel;
    UnimDBEdit9: TUnimDBEdit;
    UnimLabel18: TUnimLabel;
    UnimLabel19: TUnimLabel;
    btnSocios: TUnimButton;
    ctnSocios: TUnimContainerPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimLabel20: TUnimLabel;
    UnimDBEdit11: TUnimDBEdit;
    UnimDBEdit12: TUnimDBEdit;
    UnimDBEdit13: TUnimDBEdit;
    UnimDBEdit14: TUnimDBEdit;
    UnimDBEdit15: TUnimDBEdit;
    UnimDBEdit16: TUnimDBEdit;
    UnimDBEdit17: TUnimDBEdit;
    UnimDBEdit18: TUnimDBEdit;
    UnimDBEdit19: TUnimDBEdit;
    UnimDBEdit20: TUnimDBEdit;
    UnimLabel21: TUnimLabel;
    lblWpp: TUnimLabel;
    lblTextoPend: TUnimLabel;
    edtFatAnual: TUnimDBNumberEdit;
    edtCredPret: TUnimDBEdit;
    lblDocs: TUnimLabel;
    EditNomeAvalistaConjuge: TUnimDBEdit;
    EditCpfAvalistaConjuge: TUnimDBEdit;
    UnimContainerPanel1: TUnimContainerPanel;
    lblArqPendencias: TUnimLabel;
    ctnArquivosSerasaBacen: TUnimContainerPanel;
    UnimContainerPanel4: TUnimContainerPanel;
    UnimLabel22: TUnimLabel;
    UnimDBGrid1: TUnimDBGrid;
    lblMsg: TUnimLabel;
    UniTimer: TUniTimer;
    ctnNovidade: TUnimContainerPanel;
    UnimContainerPanel5: TUnimContainerPanel;
    UnimLabel15: TUnimLabel;
    UnimLabel23: TUnimLabel;
    UnimLabel24: TUnimLabel;
    procedure UnimFormShow(Sender: TObject);
    procedure UnimBitBtn2Click(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimDBSelect2Change(Sender: TObject);
    procedure UnimDBEdit4Change(Sender: TObject);
    procedure UnimDBEdit5Change(Sender: TObject);
    procedure BtnAtualizarAvalistaClick(Sender: TObject);
    procedure SelectEstadoCivilAvalistaChange(Sender: TObject);
    procedure EditAvalistaNomeChange(Sender: TObject);
    procedure EditAvalistaCPFChange(Sender: TObject);
    procedure EditTelefoneAvalistaChange(Sender: TObject);
    procedure EditEmailAvalistaChange(Sender: TObject);
    procedure SelectAvalistaClienteAGNChange(Sender: TObject);
    procedure EditNomeAvalistaConjugeChange(Sender: TObject);
    procedure EditCpfAvalistaConjugeChange(Sender: TObject);
    procedure UnimLabel20Click(Sender: TObject);
    procedure btnSociosClick(Sender: TObject);
    procedure SelectEtapaProcessoChange(Sender: TObject);
    procedure lblWppClick(Sender: TObject);
    procedure lblTextoPendClick(Sender: TObject);
    procedure lblDocsClick(Sender: TObject);
    procedure lblArqPendenciasClick(Sender: TObject);
    procedure UnimLabel22Click(Sender: TObject);
    procedure grdGrupoDblClick(Sender: TObject);
    procedure lblMsgClick(Sender: TObject);
    procedure UniTimerTimer(Sender: TObject);
    procedure verificarMsgNaoLida();
    procedure UnimLabel24Click(Sender: TObject);
  private
    { Private declarations }
    function validarDados() : boolean;
    function validarDadosAvalista() : boolean;
    function etapaExiste(etapa, solicitacao: Integer) : boolean;
    procedure checarTipoFinanciamento();
    procedure carregarDadosAvalista();
    procedure checarEstadoCivil();
    procedure checarEstadoCivilAvalista();
    procedure atualizarSolicitacao(etapa : Integer);
    procedure salvarEtapa();
    procedure inicializarForm();

    procedure atualizarEtapa(etapa, solicitacao: Integer);

  public
    { Public declarations }
    const
      casado : string = 'CASADO(A)';
  end;

function frmDadosCliente: TfrmDadosCliente;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, Uadmin, Uusuarios, ServerModule, Uacomp,
  UanexarDoc, UdadosUsuario, UpedirDocs, UpreCad, Usejuv, Usolicitacao,
  UdocsReprovados, Umsg, UrecuperarSenha, UcadSucesso, UcnpjClienteFormal, Upep,
  UpesquisaInicialReprovada, Utermos, Uchat, UexportarCsv, UinfImportantes;

function frmDadosCliente: TfrmDadosCliente;
begin
  Result := TfrmDadosCliente(UniMainModule.GetFormInstance(TfrmDadosCliente));
end;

procedure TfrmDadosCLiente.inicializarForm();
var
  grupo : string;
begin
  qryGrupo.Active := False;
  qryGrupo.Active := True;

  checarTipoFinanciamento();
  checarEstadoCivil();

  if UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value = 4 then
  begin
    LabelUsuario.Caption := 'Bem vindo(a), ' + Uusuarios.nomeUsuario + '.';
  end
  else
  begin
    LabelUsuario.Caption := 'Bem vindo(a), ' +
      UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';
  end;

  grupo := UniMainModule.dsSolicitacao.DataSet.FieldByName('GRUPO').Text;

  //SelectLinhaDeCredito.ItemIndex := UniMainModule.dsSolicitacao.DataSet.FieldByName('LINHACREDITO').AsInteger;

  with DsGrupo.DataSet do
  begin
    Filtered := False;
    Filter := 'GRUPO = ' + QuotedStr(grupo);
    Filtered := True;
  end;

  SelectEtapaProcesso.ItemIndex := UniMainModule.dsSolicitacao.DataSet.FieldByName('SITUACAO').Value - 1;

  //Filtra apenas os documentos do cliente logado
  with UniMainModule.dsDocumentos.DataSet do
  begin
    Filtered  := False;
    Filter    := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente);
    Filtered  := True;
  end;

  //Filtra a observação no caso de o cliente está na etapa de "Consulta inicial com pendência"
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tb_acompanhamento where etapa = 3 and ');
    SQL.Add('solicitacao = ' + intToStr(UniMainModule.dsSolicitacao.DataSet.FieldByName('ID').Value));
    Open;

    if FieldByName('OBSERVACAO').IsNull then
      frmPrincipal.msgPesqRep := ''
    else
      frmPrincipal.msgPesqRep := FieldByName('OBSERVACAO').Value;
  end;

  //Filtra a observação no caso de o cliente está na etapa de "Consulta inicial com pendência"
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tb_acompanhamento where etapa = 3 and ');
    SQL.Add('solicitacao = ' + intToStr(UniMainModule.dsSolicitacao.DataSet.FieldByName('ID').Value));
    Open;

    if FieldByName('OBS').IsNull then
      frmPrincipal.msgPesqRep := ''
    else
      frmPrincipal.msgPesqRep := FieldByName('OBS').AsAnsiString;
  end;

  //Carrega os dados do combobox de linhas de crédito com os dados do banco
  cbbLinhas.Items.Clear;
  with UniMainModule.dsLinhadecredito.DataSet do
  begin
    First;
    while not EoF do
    begin
      cbbLinhas.Items.Add(FieldByName('NOME').Value);
      Next;
    end;
    First;
  end;

  if SelectEtapaProcesso.Text = 'PESQUISA INICIAL COM PENDÊNCIAS' then lblTextoPend.Visible := True;
  if (SelectEtapaProcesso.ItemIndex = 4) or (SelectEtapaProcesso.ItemIndex = 5) or (SelectEtapaProcesso.ItemIndex = 6)then lblDocs.Visible := True;
end;

procedure TfrmDadosCliente.atualizarEtapa(etapa, solicitacao: Integer);
var
  data : string;
  filtro : string;
  acompanhamento : Integer;
begin
  data := FormatDateTime('dd/mm/yyyy', Now);

  filtro := 'ETAPA = ' + IntToStr(etapa) + ' AND SOLICITACAO = ' + IntToStr(solicitacao);

  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Filtered  := False;
    filter    := filtro;
    Filtered  := True;
  end;

  acompanhamento := UniMainModule.dsAcompanhamento.DataSet.FieldByName('ID').AsInteger;

  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Edit;
    FieldByName('DATA').Value       := data;
    FieldByName('OBS').Value        := frmPrincipal.msgPesqRep;
    Post;

    Filtered  := False;
  end;

  UniMainModule.dsViewAcompanhamento.DataSet.Refresh;

end;

function TfrmDadosCliente.validarDados() : boolean;
var controle : boolean;
begin
  controle := True;

  if UnimDBSelect2.Text = casado then
  begin
    if UnimDBEdit4.Text = '' then
    begin
      ShowMessage('O nome da(o) cônjuge do cliente não foi preenchido.');
      UnimDBEdit4.Color := clRed;
      controle := False;
    end;
    if frmPrincipal.ValidarCPF(UnimDBEdit5.Text) = False then
    begin
      ShowMessage('Cpf do(a) cônjuge não é válido.');
      UnimDBEdit5.Color := clRed;
      controle := False;
    end;
  end;

  if controle then result := True else result := False;

end;

function TfrmDadosCliente.validarDadosAvalista() : boolean;
var controle : boolean;
begin
  controle := True;

  if EditAvalistaNome.Text = '' then
  begin
    EditAvalistaNome.Color := clRed;
    controle := False;
  end;

  if (Length(EditTelefoneAvalista.Text) < 8) or (Length(EditTelefoneAvalista.Text) > 12) then // or (Length(EditTelefone.Text) > 12)
  begin
    EditTelefoneAvalista.Color := clRed;
    controle := False;
  end;

  if not frmPrincipal.ValidarCPF(EditAvalistaCPF.Text) then
  begin
    ShowMessage('CPF inválido');
    EditAvalistaCPF.Color := clRed;
    controle := false;
  end;

  if Pos('@', EditEmailAvalista.Text) = 0 then //email cliente
  begin
    EditEmailAvalista.Color := clRed;
    controle := False;
  end;

  if (SelectAvalistaClienteAGN.ItemIndex <> 0) and
     (SelectAvalistaClienteAGN.ItemIndex <> 1)  then
  begin
    SelectAvalistaClienteAGN.Color := clRed;
  end;


  if (SelectEstadoCivilAvalista.ItemIndex < 0) or
     (SelectEstadoCivilAvalista.ItemIndex > 4)then
  begin
    SelectEstadoCivilAvalista.Color := clRed;
    controle := False;
  end;

  if UnimDBSelect2.Text = casado then
  begin
    if UnimDBEdit4.Text = '' then
    begin
      ShowMessage('O nome da(o) cônjuge do cliente não foi preenchido.');
      UnimDBEdit4.Color := clRed;
      controle := False;
    end;
    if frmPrincipal.ValidarCPF(UnimDBEdit5.Text) = False then
    begin
      ShowMessage('Cpf do(a) cônjuge não é válido.');
      UnimDBEdit5.Color := clRed;
      controle := False;
    end;
  end;

  if controle then result := True else result := False;

end;

procedure TfrmDadosCliente.atualizarSolicitacao(etapa : Integer);
begin
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Edit;
    FieldByName('SITUACAO').Value := etapa;
    Post;
  end;
end;

procedure TfrmDadosCliente.BtnAtualizarAvalistaClick(Sender: TObject);
var
  dataAtual : string;
begin
  dataAtual := FormatDateTime('dd/mm/yyyy', Now);

  //  Atualizar dados avalista
  if validarDadosAvalista() then
  begin

    if SelectEstadoCivilAvalista.ItemIndex <> 0 then
    begin
      EditNomeAvalistaConjuge.Text := '';
      EditCpfAvalistaConjuge.Text := '';
    end;

    with UniMainModule.dsAvalista.DataSet do
    begin
      Edit;
      FieldByName('CPF').Value              := EditAvalistaCPF.Text;
      FieldByName('TELEFONE').Value         := EditTelefoneAvalista.text;
      //FieldByName('NOMECONJUGE').Value      := EditNomeAvalistaConjuge.Text;
      //FieldByName('CPFCONJUGE').Value       := EditCpfAvalistaConjuge.Text;
      FieldByName('DATAATUALIZACAO').Value  := dataAtual;
      Post;
    end;

    ShowMessage('Dados do avalista atualizados com sucesso!');
  end;

  carregarDadosAvalista();

end;

procedure TfrmDadosCliente.checarEstadoCivil();
begin
  if UnimDBSelect2.Text = casado then
  begin
    UnimDBEdit4.ReadOnly := False;
    UnimDBEdit5.ReadOnly := False;
    pnlEstCivil.Height := 262;
  end
  else
  begin
    UnimDBEdit4.ReadOnly := True;
    UnimDBEdit5.ReadOnly := True;
    pnlEstCivil.Height := 88;
  end;
end;

procedure TfrmDadosCliente.UnimBitBtn1Click(Sender: TObject);
begin
  if (UniMainModule.tb_solicitacao.State in [dsInsert, dsEdit]) then
  begin
    UniMainModule.dsSolicitacao.DataSet.Cancel;
  end;

  if (UniMainModule.tb_cliente.State in [dsInsert, dsEdit]) then
  begin
    UniMainModule.dsCliente.DataSet.Cancel;
  end;

  UniMainModule.dsSolicitacao.DataSet.Filtered := False;
  UniMainModule.dsAcompanhamento.DataSet.Filtered := False;

  frmAdmin.busca();

  Close;
end;

procedure TfrmDadosCliente.UnimBitBtn2Click(Sender: TObject);
begin
  if validarDados then
  begin
    if UniMainModule.msg('Tem certeza que deseja salvar as alterações?') then
    begin
      UniMainModule.dsCliente.DataSet.Edit;
      UniMainModule.dsSolicitacao.DataSet.Edit;

      UniMainModule.dsCliente.DataSet.Post;
      UniMainModule.dsSolicitacao.DataSet.Post;

      salvarEtapa();

      Close;
    end;
  end
  else
  begin
    ShowMessage('Erro ao validar dados.');
  end;

end;

procedure TfrmDadosCliente.btnSociosClick(Sender: TObject);
begin
  if ctnSocios.Visible = True then
    ctnSocios.Visible := False
  else
    ctnSocios.Visible := True;
end;

procedure TfrmDadosCliente.UnimDBEdit4Change(Sender: TObject);
begin
  UnimDBEdit4.Color := clWindow;
end;

procedure TfrmDadosCliente.UnimDBEdit5Change(Sender: TObject);
begin
  UnimDBEdit5.Color := clWindow;
end;

procedure TfrmDadosCliente.grdGrupoDblClick(Sender: TObject);
var
  cliente, nomeCliente : string;
begin

  if dsGrupo.DataSet.FieldByName('CADASTRO').Value = 'NÃO' then
  begin
    ShowMessage('Ainda não existe cadastro para esse registro.');
  end
  else
  begin
    with UniMainModule.dsCliente.DataSet do
    begin
      Filtered := False;
      Filter   := 'CPF = ' + dsGrupo.DataSet.FieldByName('CPF').Value;
      Filtered := True;

      cliente     := FieldByName('ID').AsString;
      nomeCliente := FieldByName('NOME').AsString;
    end;

    frmPrincipal.IDcliente := strToInt(cliente);

    frmAdmin.exibirCliente(cliente);
    inicializarForm();

    ShowMessage('Exibindo dados de <b>' + nomeCliente + '</b>');
  end;
end;

procedure TfrmDadosCliente.UnimDBSelect2Change(Sender: TObject);
begin
  checarEstadoCivil();
end;

procedure TfrmDadosCliente.checarTipoFinanciamento();
var tipoFinanciamento : string;
begin
  tipoFinanciamento := UniMainModule.dsSolicitacao.DataSet.FieldByName('TIPOFINANCIAMENTO').Value;

  if tipoFinanciamento = 'INDIVIDUAL' then
  begin
    pgAvalista.Visible := True;
    carregarDadosAvalista();
  end
  else
  begin
    pgAvalista.Visible := False;
  end;
end;

procedure TfrmDadosCliente.EditAvalistaCPFChange(Sender: TObject);
begin
  EditAvalistaCPF.Color := clWindow;
end;

procedure TfrmDadosCliente.EditAvalistaNomeChange(Sender: TObject);
begin
  EditAvalistaNome.Color := clWindow;
end;

procedure TfrmDadosCliente.EditCpfAvalistaConjugeChange(Sender: TObject);
begin
  EditCpfAvalistaConjuge.Color := clWindow;
end;

procedure TfrmDadosCliente.EditEmailAvalistaChange(Sender: TObject);
begin
  EditEmailAvalista.Color := clWindow;
end;

procedure TfrmDadosCliente.EditNomeAvalistaConjugeChange(Sender: TObject);
begin
  EditNomeAvalistaConjuge.Color := clWindow;
end;

procedure TfrmDadosCliente.EditTelefoneAvalistaChange(Sender: TObject);
begin
  EditTelefoneAvalista.Color := clWindow;
end;

function TfrmDadosCliente.etapaExiste(etapa, solicitacao : Integer): boolean;
var
  count : Integer;
begin
  with UniMainModule.FDQuery do
  begin
  SQL.Clear;
    SQL.Add('SELECT count(*) FROM view_acompanhamento ' +
            'WHERE solicitacao = ' + solicitacao.ToString +
            ' and id_etapa = ' + etapa.ToString + ';'
            );
    Open();

    count := FieldByName('COUNT').ASInteger;

    Close;
  end;

  if count = 1 then result := True else result := False;

end;

procedure TfrmDadosCliente.lblWppClick(Sender: TObject);
var
  fone, link : string;
begin
  fone := UniMainModule.dsCliente.DataSet.FieldByName('TELEFONE').Value;
  link := 'https://wa.me/55' + fone; //+ '&text=RN+Crédito';

  UniSession.AddJS('window.open("' + link + '")');
end;

procedure TfrmDadosCliente.salvarEtapa();
var
  etapa : Integer;
  solicitacao : Integer;
begin
  etapa := SelectEtapaProcesso.ItemIndex + 1;
  solicitacao := UniMainModule.dsSolicitacao.DataSet.FieldByName('ID').value;

  if etapaExiste(etapa, solicitacao) then
  begin
    atualizarEtapa(etapa, solicitacao);
  end
  else
  begin
    frmPrincipal.adicionarEtapa(etapa, solicitacao);
  end;

  atualizarSolicitacao(etapa);

end;

procedure TfrmDadosCliente.carregarDadosAvalista();
begin
  with UniMainModule.dsAvalista.DataSet do
  begin
    Filtered := False;
    Filter := 'ID = ' + IntToStr(UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').value);
    Filtered := True;
  end;

  EditAvalistaCPF.Text := UniMainModule.dsAvalista.DataSet.FieldByName('CPF').Value;
  EditTelefoneAvalista.Text := UniMainModule.dsAvalista.DataSet.FieldByName('TELEFONE').value;

  if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
  begin
    EditNomeAvalistaConjuge.Text := UniMainModule.dsAvalista.DataSet.FieldByName('NOMECONJUGE').Value;
    EditCpfAvalistaConjuge.Text := UniMainModule.dsAvalista.DataSet.FieldByName('CPFCONJUGE').value;
  end;

  checarEstadoCivilAvalista();

end;

procedure TfrmDadosCliente.checarEstadoCivilAvalista();
begin
  if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
  begin
    PanelAvalista.Height := 710;
    PanelConjugeAvalista.Height := 190;
    PanelConjugeAvalista.Visible := True;
  end
  else
  begin
    PanelAvalista.Height := 510;
    PanelConjugeAvalista.Height := 0;
    PanelConjugeAvalista.Visible := False;
  end;
end;

procedure TfrmDadosCliente.SelectAvalistaClienteAGNChange(Sender: TObject);
begin
  SelectAvalistaClienteAGN.Color := clWindow;
end;

procedure TfrmDadosCliente.SelectEstadoCivilAvalistaChange(Sender: TObject);
begin
  SelectEstadoCivilAvalista.Color := clWindow;

  checarEstadoCivilAvalista();

end;

procedure TfrmDadosCliente.SelectEtapaProcessoChange(Sender: TObject);
begin
  if SelectEtapaProcesso.ItemIndex = 2 then
    frmPesqPendencia.ShowModal();

  if (SelectEtapaProcesso.ItemIndex = 4) or
     (SelectEtapaProcesso.ItemIndex = 5) or
     (SelectEtapaProcesso.ItemIndex = 6) then
  begin
    frmPedirDocs.ShowModal();
    lblDocs.Visible := True;
  end
  else
  begin
    lblDocs.Visible := False;
  end;


  if SelectEtapaProcesso.Text = 'PESQUISA INICIAL COM PENDÊNCIAS' then
    lblTextoPend.Visible := True
  else
    lblTextoPend.Visible := False;
end;

procedure TfrmDadosCliente.UnimFormShow(Sender: TObject);
begin
  inicializarForm();
end;

procedure TfrmDadosCliente.UnimLabel20Click(Sender: TObject);
begin
  ctnSocios.Visible := False;
end;

procedure TfrmDadosCliente.UnimLabel22Click(Sender: TObject);
begin
  ctnArquivosSerasaBacen.Visible := False;
end;

procedure TfrmDadosCliente.UnimLabel24Click(Sender: TObject);
begin
  ctnNovidade.Visible := False;
end;

procedure TfrmDadosCliente.UniTimerTimer(Sender: TObject);
begin
  verificarMsgNaoLida();
end;

procedure TfrmDadosCliente.lblArqPendenciasClick(Sender: TObject);
begin
  if ctnArquivosSerasaBacen.Visible = True then
    ctnArquivosSerasaBacen.Visible := False
  else
    ctnArquivosSerasaBacen.Visible := True;
end;

procedure TfrmDadosCliente.lblDocsClick(Sender: TObject);
begin
  frmPedirDocs.ShowModal();
end;

procedure TfrmDadosCliente.lblMsgClick(Sender: TObject);
begin
  frmPrincipal.acessoChat := 'agn';
  frmChat.ShowModal;
end;

procedure TfrmDadosCliente.lblTextoPendClick(Sender: TObject);
begin
  frmPesqPendencia.ShowModal();
end;

procedure TfrmDadosCliente.verificarMsgNaoLida();
var
  qtde : integer;
begin
  with UniMainModule.dsChat.DataSet do
  begin
    Filtered := False;
    Filter   := 'CLIENTE = ' + UniMainModule.dsCliente.DataSet.FieldByName('ID').AsString +
                  ' AND VISTO = ' + QuotedStr('NÃO') + ' AND REMETENTE = ' + QuotedStr('CLIENTE');
    Filtered := True;

    qtde := RecordCount;

    if qtde > 0 then
    begin
      lblMsg.Font.Color := $001D1DCD;
      lblMsg.Caption    := '+' + intToStr(qtde) + ' <i class="fas fa-envelope"></i>';
    end
    else
    begin
      lblMsg.Font.Color := $00838383;
      lblMsg.Caption    := '<i class="fas fa-envelope"></i>';
    end;
  end;
end;

end.

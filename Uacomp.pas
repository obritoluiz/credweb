unit Uacomp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  unimScrollBox, uniLabel, unimLabel, Vcl.Imaging.pngimage, uniImage, unimImage,
  uniGUIBaseClasses, unimPanel, uniButton, unimButton, uniPageControl, unimMenu,
  uniPanel, unimTabPanel, uniBitBtn, unimBitBtn, uniFileUpload, unimFileUpload,
  unimEdit, uniEdit, uniDBEdit, unimDBEdit, uniMultiItem, unimSelect,
  unimDBSelect, DB, StrUtils, uniDateTimePicker, unimDatePicker, uniCheckBox,
  unimCheckBox, uniTimer;

type
  TfrmAcomp = class(TUnimForm)
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    scrlBody: TUnimScrollBox;
    pgMain: TUnimTabPanel;
    pgAcomp: TUnimTabSheet;
    pgDados: TUnimTabSheet;
    UnimPanel1: TUnimPanel;
    LabelUsuario: TUnimLabel;
    UnimScrollBox1: TUnimScrollBox;
    pnlDados: TUnimPanel;
    dbsltMunicipio: TUnimDBSelect;
    edtNome: TUnimDBEdit;
    UnimDBEdit1: TUnimDBEdit;
    UnimDBEdit2: TUnimDBEdit;
    UnimDBEdit3: TUnimDBEdit;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimLabel5: TUnimLabel;
    UnimLabel9: TUnimLabel;
    UnimLabel10: TUnimLabel;
    UnimLabel11: TUnimLabel;
    sltEstadoCivil: TUnimDBSelect;
    LabelSenha: TUnimLabel;
    BtnSalvar: TUnimBitBtn;
    EditSenha: TUnimEdit;
    pgAlterarSenha: TUnimTabSheet;
    UnimPanel2: TUnimPanel;
    EditSenhaConf: TUnimEdit;
    EditSenhaNova: TUnimEdit;
    UnimLabel21: TUnimLabel;
    UnimLabel22: TUnimLabel;
    UnimLabel15: TUnimLabel;
    EditSenhaAtual: TUnimEdit;
    UnimButton1: TUnimButton;
    UnimDBEdit4: TUnimDBEdit;
    edtCPFConjuge: TUnimDBEdit;
    LabelConjugeNome: TUnimLabel;
    LabelConjugeCPF: TUnimLabel;
    UnimPanel3: TUnimPanel;
    pnlTimeLine: TUnimPanel;
    pnl10_ProcessoFinalizado: TUnimPanel;
    pnlIcoProceFin: TUnimPanel;
    dataProcessoFinalizado: TUnimLabel;
    pnl09_AgendaLiberacao: TUnimPanel;
    pnlIcoLibAge: TUnimPanel;
    dataLiberacaoAgendada: TUnimLabel;
    pnl08_AguardarAgendamento: TUnimPanel;
    pnlIcoAguAge: TUnimPanel;
    dataAguardarAgendamento: TUnimLabel;
    pnl01_PreCadadastro: TUnimPanel;
    pnlIcoPreCad: TUnimPanel;
    dataPreCadastro: TUnimLabel;
    pnl02_CadastroAprovado: TUnimPanel;
    pnlIcoCadApr: TUnimPanel;
    dataCadastroAprovado: TUnimLabel;
    pnl03_CadastroReprovado: TUnimPanel;
    pnlIcoCadRep: TUnimPanel;
    dataCadastroReprovado: TUnimLabel;
    pnl04_AgendarCapacitacao: TUnimPanel;
    pnlIcoAgeCap: TUnimPanel;
    dataAgendarCapacitacao: TUnimLabel;
    pnl05_EnviarDocumentacao: TUnimPanel;
    pnlIcoDocPend: TUnimPanel;
    dataEnviarDocumentos: TUnimLabel;
    pnl06_DocumentosAprovados: TUnimPanel;
    pnlIcoDocApr: TUnimPanel;
    dataDocumentosAprovados: TUnimLabel;
    pnl07_DocumentosReprovados: TUnimPanel;
    pnlIcoDocRep: TUnimPanel;
    dataDocumentosReprovados: TUnimLabel;
    pnlDetProceFin: TUnimPanel;
    lblTxtProceFin: TUnimLabel;
    lblTxtProceFin2: TUnimLabel;
    pnlDetLibAge: TUnimPanel;
    lblTxtLibAge: TUnimLabel;
    lblTxtLibAge2: TUnimLabel;
    pnlDetAguAge: TUnimPanel;
    lblTxtAguAge: TUnimLabel;
    lblTxtAguAge2: TUnimLabel;
    pnlDetDocRep: TUnimPanel;
    lblTxtDocRep: TUnimLabel;
    lblTxtDocRep2: TUnimLabel;
    pnlDetPreCad: TUnimPanel;
    lblTxtPreCad: TUnimLabel;
    lblTxtPreCad1: TUnimLabel;
    pnlDetCadApr: TUnimPanel;
    lblTxtCadApr: TUnimLabel;
    lblTxtCadApr2: TUnimLabel;
    pnlDetCadRep: TUnimPanel;
    lblTxtCadRepVerMais: TUnimLabel;
    lblTxtCadRep2: TUnimLabel;
    pnlDetAgeCap: TUnimPanel;
    lblTxtAgeCap: TUnimLabel;
    lblTxtAgeCap2: TUnimLabel;
    pnlDetDocPend: TUnimPanel;
    lblTxtDocPend: TUnimLabel;
    lblTxtDocPend2: TUnimLabel;
    pnlDetDocApr: TUnimPanel;
    lblTxtDocApr: TUnimLabel;
    lblTxtDocApr2: TUnimLabel;
    lblTxtPreCad2: TUnimLabel;
    lblTxtCadApr1: TUnimLabel;
    lblTxtCadRep1: TUnimLabel;
    lblTxtAgeCap1: TUnimLabel;
    lblTxtDocPend1: TUnimLabel;
    lblTxtDocApr1: TUnimLabel;
    lblTxtDocRep1: TUnimLabel;
    lblTxtAguAge1: TUnimLabel;
    lblTxtLibAge1: TUnimLabel;
    lblTxtProceFin1: TUnimLabel;
    lbIcolPreCad: TUnimLabel;
    lbIcoCadApr: TUnimLabel;
    lbIcoCadRep: TUnimLabel;
    lbIcoAgeCap: TUnimLabel;
    lbIcoDocPend: TUnimLabel;
    lbIcoDocApr: TUnimLabel;
    lbIcoDocRep: TUnimLabel;
    lbIcoAguAge: TUnimLabel;
    lbIcoLibAge: TUnimLabel;
    lbIcoProceFin: TUnimLabel;
    UnimLabel1: TUnimLabel;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    ctnMsgPend: TUnimContainerPanel;
    lblTxtCadRepMais: TUnimLabel;
    UnimLabel6: TUnimLabel;
    lblTxtCadRep: TUnimLabel;
    pgMeusDados: TUnimTabPanel;
    pgDadosPessoais: TUnimTabSheet;
    pgSolicitacao: TUnimTabSheet;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimPanel4: TUnimPanel;
    pnl2: TUnimPanel;
    ctnCapInvest: TUnimContainerPanel;
    UnimLabel2: TUnimLabel;
    cntTipoNegocio: TUnimContainerPanel;
    UnimLabel7: TUnimLabel;
    cntLinha: TUnimContainerPanel;
    ctnCNPJ: TUnimContainerPanel;
    btnSocios: TUnimButton;
    edtCnpj: TUnimDBEdit;
    UnimLabel8: TUnimLabel;
    chkMEI: TUnimCheckBox;
    edtDataAbertura: TUnimDatePicker;
    UnimLabel12: TUnimLabel;
    ctnLinha: TUnimContainerPanel;
    lblLinkLinha: TUnimLabel;
    slctLinha: TUnimSelect;
    lblLinha: TUnimLabel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimLabel13: TUnimLabel;
    UnimLabel14: TUnimLabel;
    UnimContainerPanel3: TUnimContainerPanel;
    UnimLabel17: TUnimLabel;
    edtCredPret: TUnimDBEdit;
    UnimContainerPanel4: TUnimContainerPanel;
    UnimLabel18: TUnimLabel;
    edtFatAnual: TUnimDBNumberEdit;
    pnl1: TUnimPanel;
    PanelIndividual: TUnimPanel;
    PanelAvalista: TUnimPanel;
    LabelAvalistaCPF: TUnimLabel;
    LabelAvalista: TUnimLabel;
    LabelNomeAvalista: TUnimLabel;
    LabelEstadoCivilAvalista: TUnimLabel;
    SelectEstadoCivilAvalista: TUnimSelect;
    LabelTelefoneAvalista: TUnimLabel;
    LabelEmailAvalista: TUnimLabel;
    PanelConjugeAvalista: TUnimPanel;
    LabelNomeAvalistaConjuge: TUnimLabel;
    EditNomeAvalistaConjuge: TUnimEdit;
    LabelCpfAvalistaConjuge: TUnimLabel;
    EditCpfAvalistaConjuge: TUnimEdit;
    LabelAvalistaConjuge: TUnimLabel;
    LabelAvalistaAGN: TUnimLabel;
    PanelColetivo: TUnimPanel;
    PanelParticipante2: TUnimPanel;
    LabelParticipante2: TUnimLabel;
    LabelCpfParticipante2: TUnimLabel;
    PanelParticipante3: TUnimPanel;
    LabelParticipante3: TUnimLabel;
    LabelCpfParticipante3: TUnimLabel;
    LabelParticipantesGrupo: TUnimLabel;
    SelectQuantidadePessoas: TUnimSelect;
    btnFinalizar: TUnimButton;
    pnlTipoFin: TUnimPanel;
    LabelTipoFinanc: TUnimLabel;
    lblDescTipoFin: TUnimLabel;
    SelectTipoFinanc: TUnimSelect;
    UnimDBEdit5: TUnimDBEdit;
    sltTipoNegocio: TUnimDBSelect;
    sltObjetivo: TUnimDBSelect;
    EditCpfParticipante2: TUnimEdit;
    EditCpfParticipante3: TUnimEdit;
    EditAvalistaNome: TUnimEdit;
    EditCpfAvalista: TUnimEdit;
    EditTelefoneAvalista: TUnimEdit;
    EditEmailAvalista: TUnimEdit;
    sltAvalistaClienteAgn: TUnimSelect;
    lblMsg: TUnimLabel;
    UniTimer: TUniTimer;
    procedure UnimFormShow(Sender: TObject);
    procedure sltEstadoCivilChange(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimDBEdit2Change(Sender: TObject);
    procedure UnimDBEdit3Change(Sender: TObject);
    procedure lblTxtDocPendClick(Sender: TObject);
    procedure UnimLabel1Click(Sender: TObject);
    procedure lblTxtDocRepClick(Sender: TObject);
    procedure UnimLabel6Click(Sender: TObject);
    procedure lblTxtCadRepVerMaisClick(Sender: TObject);

    function validarDadosSolicitacao() : boolean;
    procedure btnFinalizarClick(Sender: TObject);
    procedure sltTipoNegocioChange(Sender: TObject);
    procedure SelectQuantidadePessoasChange(Sender: TObject);
    procedure SelectTipoFinancChange(Sender: TObject);
    procedure SelectEstadoCivilAvalistaChange(Sender: TObject);
    procedure pgMeusDadosChange(Sender: TObject);
    procedure organizarTelaSolicitacao();
    procedure lblMsgClick(Sender: TObject);
    procedure verificarMsgNaoLida();
    procedure UniTimerTimer(Sender: TObject);

  private
    { Private declarations }
    function validarDados : boolean;
    procedure consultarSolicitacao();
    procedure organizarCards();
    procedure filtrarSolicitacao();
    procedure obterDatas();
    procedure alterarPainelEstadoCivil();
    
  var
    cpfCliente, situacao, linha : string;
    etapaID, solicitacao : Integer;
    datas, obs : array[1..10] of String;
    idGrupoInt : array[0..10] of integer;
    grupo,
    tipoFin : string;
    qtde : integer;

  public
    { Public declarations }
    const casado : string = 'CASADO(A)';

  end;

function frmAcomp: TfrmAcomp;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, Usenha, uniGUIApplication, UanexarDoc, DateUtils,
  ServerModule, Uadmin, UcadSucesso, Uchat, UcnpjClienteFormal, UdadosCliente,
  UdadosUsuario, UdocsReprovados, UexportarCsv, UinfImportantes, Umsg,
  UpedirDocs, Upep, UpesquisaInicialReprovada, UpreCad, UrecuperarSenha, Usejuv,
  Usolicitacao, Utermos, Uusuarios;

function frmAcomp: TfrmAcomp;
begin
  Result := TfrmAcomp(UniMainModule.GetFormInstance(TfrmAcomp));
end;

procedure TfrmAcomp.verificarMsgNaoLida();
var
  qtde : integer;
begin
  with UniMainModule.dsChat.DataSet do
  begin
    Filtered := False;
    Filter   := 'CLIENTE = ' + UniMainModule.dsCliente.DataSet.FieldByName('ID').AsString +
                  ' AND VISTO = ' + QuotedStr('N?O') + ' AND REMETENTE = ' + QuotedStr('AGN');
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

procedure TfrmAcomp.organizarTelaSolicitacao();
var
  I : integer;
begin
  // >> Organizar tela de altera??o de dados de solicita??o
  sltTipoNegocio.ItemIndex := 0;
  slctLinha.Items.Clear;
  slctLinha.Items.Add('INFORMAR TIPO DO NEG?CIO');
  slctLinha.ItemIndex := 0;

  pnl1.Visible := True;

  PanelParticipante2.Height := 117;
  PanelParticipante3.Height := 0;
  PanelColetivo.Height      := 200;
  PanelIndividual.Height    := 0;

  //Esconde dados de empresa. S? exibe se for FORMAL
  sltTipoNegocio.Text := UniMainModule.dsSolicitacao.DataSet.FieldByName('TIPONEGOCIO').Value;

  if sltTipoNegocio.Text = 'FORMAL' then  //Se for FORMAL
  begin
    pnl2.Height           := 890;
    ctnCNPJ.Height        := 260;
    cntTipoNegocio.Height := 450;
    ctnCNPJ.Visible       := True;

    slctLinha.Items.Clear;
    slctLinha.Items.Add('N?O SEI INFORMAR');
    slctLinha.Items.Add('MICROCR?DITO - MEI');
    slctLinha.Items.Add('MICROCR?DITO - TURISMO');
    slctLinha.Items.Add('MICROCR?DITO - ESCOLAR');
    slctLinha.Items.Add('TURISMO - FUNGETUR');
    slctLinha.Items.Add('AGN - MICRO');
    slctLinha.Items.Add('AGN - PR? EMPRESA');
    slctLinha.ItemIndex := 0;

    if UniMainModule.dsSolicitacao.DataSet.FieldByName('MEI').Value = 'SIM' then
      chkMEI.Checked := True
    else
      chkMEI.Checked := False;
  end
  else if sltTipoNegocio.Text = 'INFORMAL' then //Se for INFORMAL
  begin
    pnl2.Height           := 650;
    ctnCNPJ.Height        := 0;
    cntTipoNegocio.Height := 200;
    ctnCNPJ.Visible       := False;

    slctLinha.Items.Clear;
    slctLinha.Items.Add('N?O SEI INFORMAR');
    slctLinha.Items.Add('MICROCR?DITO');
    slctLinha.Items.Add('AGN - AGRO');
    slctLinha.ItemIndex := 0;
  end;

  if UniMainModule.dsSolicitacao.DataSet.FieldByName('LINHACREDITO').Value = null then
    linha := 'N?O SEI INFORMAR'
  else
    linha := UniMainModule.dsSolicitacao.DataSet.FieldByName('LINHACREDITO').Value;

  slctLinha.Text := linha;

  //Tipo Financiamento
  //grupo
  grupo   := UniMainModule.dsSolicitacao.DataSet.FieldByName('GRUPO').Value;
  tipoFin := UniMainModule.dsSolicitacao.DataSet.FieldByName('TIPOFINANCIAMENTO').Value;

  if tipoFin = 'INDIVIDUAL' then  //INDIVIDUAL
  begin
    PanelColetivo.Height      := 0;
    PanelParticipante2.Height := 0;
    PanelParticipante3.Height := 0;
    SelectTipoFinanc.Text     := 'INDIVIDUAL';

    with UniMainModule.dsAvalista.DataSet do
    begin
      Filtered := False;
      Filter   := 'ID = ' + intToStr(UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').Value);
      Filtered := True;

      EditAvalistaNome.Text          := FieldByName('NOME').Value;
      EditCpfAvalista.Text           := FieldByName('CPF').Value;
      EditTelefoneAvalista.Text      := FieldByName('TELEFONE').Value;
      EditEmailAvalista.Text         := FieldByName('EMAIL').Value;
      sltAvalistaClienteAgn.Text     := FieldByName('CLIENTEAGN').Value;
      SelectEstadoCivilAvalista.Text := FieldByName('ESTADOCIVIL').Value;
      if FieldByName('ESTADOCIVIL').Value = 'CASADO(A)' then
      begin
        EditNomeAvalistaConjuge.Text   := FieldByName('NOMECONJUGE').Value;
        EditCpfAvalistaConjuge.Text    := FieldByName('CPFCONJUGE').Value;
      end;

    end;

    if SelectEstadoCivilAvalista.ItemIndex = 0 then
    begin
      //Exibe painel do conjuge do avalista para solicita??o individual
      PanelIndividual.Height := 750;
      PanelAvalista.Height := 750;
      PanelConjugeAvalista.Height := 210;
    end
    else
    begin
      //Exibe painel do avalista para solicita??o individual sem conjuge
      PanelIndividual.Height := 511;
      PanelAvalista.Height := 511;
      PanelConjugeAvalista.Height := 0;
    end;

  end
  else //SOLID?RIO
  begin
    //Exibir pain?l da solicita??o em grupo
    PanelIndividual.Height := 0;
    PanelAvalista.Height := 0;
    PanelColetivo.Height := 100;
    PanelParticipante2.Height := 0;
    PanelParticipante3.Height := 0;

    with UniMainModule.FDQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id, cpf from tb_grupo where nome = ' + QuotedStr(grupo));
      Open;
      Active := True;
    end;

    with UniMainModule.dsQuery.DataSet do
    begin
      qtde := RecordCount;
       //ShowMessage(IntToStr(qtde));

      if qtde = 2 then
      begin
        PanelColetivo.Height := 200;
        PanelParticipante2.Height := 117;
        PanelParticipante3.Height := 0;
      end;

      if qtde = 3 then
      begin
        PanelColetivo.Height := 326;
        PanelParticipante2.Height := 117;
        PanelParticipante3.Height := 117;
      end;

      //Pegar os ID dos integrantes do grupo
      I := 0;
      First;
      while not Eof do
      begin
        case I of
        0:
          begin
            idGrupoInt[0]             := FieldByName('ID').Value;
          end;
        1:
          begin
            idGrupoInt[1]             := FieldByName('ID').Value;
            EditCpfParticipante2.Text := FieldByName('CPF').Value;
          end;
        2:
          begin
            idGrupoInt[2]             := FieldByName('ID').Value;
            EditCpfParticipante3.Text := FieldByName('CPF').Value;
          end;
        end;

        Next;
        I := I + 1;
      end;
      First;

    end;

  end;

end;

function TfrmAcomp.validarDadosSolicitacao() : boolean;
var
  erro :boolean;
  data: string;
begin
  erro := False;

  if sltTipoNegocio.ItemIndex = -1 then
  begin
    ShowMessage('Voc? precisa informar o tipo do neg?cio. Formal ou informal.');
    sltTipoNegocio.SetFocus;
    erro := True;
  end;

  if edtFatAnual.Text = '' then
  begin
    ShowMessage('Voc? precisa informar o seu faturamento anual.');
    edtFatAnual.SetFocus;
    erro := True;
  end;

  if edtCredPret.Text = '' then
  begin
    ShowMessage('Voc? precisa informar o valor do cr?dito pretendido.');
    edtCredPret.SetFocus;
    erro := True;
  end;

  if (SelectTipoFinanc.ItemIndex = -1) then //tipo do financiamento
  begin
    SelectTipoFinanc.Color := clRed;
    erro := True;
  end;

  if sltTipoNegocio.Text = 'FORMAL' then
  begin
    data := IntToStr(DaysBetween(edtDataAbertura.Date, now));
    if strToInt(data) <= 180 then
    begin
      ShowMessage('<b>Para a situa??o de atividade formal(CNPJ), </b> a Pessoa Jur?dica deve ter mais de 180 dias de exist?ncia.'
                    + #13 + 'Sua empresa tem apenas ' + data + ' dia(s) de aberta.');
      edtDataAbertura.SetFocus;
      erro := True;
    end;

    if not FrmPrincipal.validarCnpj(edtCnpj.Text) then
    begin
      ShowMessage('Aten??o, CNPJ <b>inv?lido</b>!');
      edtCnpj.SetFocus;
      erro := True;
    end;
  end;


  //Verifica se financiamento ? individual
  if SelectTipoFinanc.Text = 'INDIVIDUAL' then
  begin
    if EditAvalistaNome.Text = '' then
    begin
      EditAvalistaNome.Color := clRed;
      erro := True;
    end;
    if frmPrincipal.ValidarCPF(EditCpfAvalista.Text) = False then
    begin
      EditCpfAvalista.Color := clRed;
      erro := True;
    end;
    if cpfCliente = EditCpfAvalista.Text then
    begin
      ShowMessage('Voc? n?o pode ser seu pr?prio avalisata, por favor insira outra pessoa como avalista.');
      EditCpfAvalista.Color := clRed;
      erro := True;
    end;

    //verificar estado civil do cliente
    if (SelectEstadoCivilAvalista.Text = 'CASADO(A)') and
       (edtCPFConjuge.Text = EditCpfAvalista.Text) then
    begin
      ShowMessage('Em um financiamento individual o c?njuge n?o pode ser o avalista!');
      EditCpfAvalista.Color := clRed;
      erro := True;
    end;

    //Exige todos os campos do avalista
    if EditTelefoneAvalista.Text = '' then
    begin
      EditTelefoneAvalista.Color := clRed;
      erro := True;
    end;
    if (Length(EditTelefoneAvalista.Text) < 8) or (Length(EditTelefoneAvalista.Text) > 12) then
    begin
      EditTelefoneAvalista.Color := clRed;
      erro := True;
    end;
    if EditEmailAvalista.Text = '' then
    begin
      EditEmailAvalista.Color := clRed;
      erro := True;
    end;
    if Pos('@', EditEmailAvalista.Text) = 0 then
    begin
      EditEmailAvalista.Color := clRed;
      erro := True;
    end;
    if (sltAvalistaClienteAgn.ItemIndex = -1) then
    begin
      sltAvalistaClienteAgn.Color := clRed;
      erro := True;
    end;
    if SelectEstadoCivilAvalista.ItemIndex = -1 then
    begin
      SelectEstadoCivilAvalista.Color := clRed;
      erro := True;
    end;
    if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
    begin
      if EditNomeAvalistaConjuge.Text = '' then
      begin
        EditNomeAvalistaConjuge.Color := clRed;
        erro := True;
      end;
      if frmPrincipal.ValidarCPF(EditCpfAvalistaConjuge.Text) = False then
      begin
        EditCpfAvalistaConjuge.Color := clRed;
        erro := True;
      end;

    end;
  end
  else if SelectTipoFinanc.ItemIndex = 1 then
  begin
    if SelectQuantidadePessoas.ItemIndex = -1 then
    begin
      SelectQuantidadePessoas.Color := clRed;
      erro := True;
    end
    else if cpfCliente = EditCpfParticipante2.Text then
    begin
      ShowMessage('Um grupo n?o pode ter 2 membros com o mesmo cpf!');
      erro := True;
      EditCpfParticipante2.Color := clRed;
    end;
    if sltEstadoCivil.Text = 'CASADO(A)' then
      begin
        if edtCPFConjuge.Text = EditCpfParticipante2.Text then
        begin
          ShowMessage('Um casal n?o pode participar duas vezes do grupo!');
          erro := True;
          EditCpfParticipante2.Color := clRed;
        end;
      end;
    if frmPrincipal.ValidarCPF(EditCpfParticipante2.Text) = False then
    begin
      EditCpfParticipante2.Color := clRed;
      erro := True;
    end;

    if SelectQuantidadePessoas.ItemIndex = 1 then
    begin
      if cpfCliente = EditCpfParticipante3.Text then
      begin
        ShowMessage('Um grupo n?o pode ter 2 membros com o mesmo cpf!');
        erro := True;
        EditCpfParticipante3.Color := clRed;
      end;
      if sltEstadoCivil.Text = 'CASADO(A)' then
      begin
        if edtcpfConjuge.Text = EditCpfParticipante3.Text then
        begin
          ShowMessage('Um casal n?o pode participar duas vezes do grupo!');
          erro := True;
          EditCpfParticipante3.Color := clRed;
        end;
      end;
      if EditCpfParticipante2.Text = EditCpfParticipante3.Text then
      begin
        ShowMessage('Um grupo n?o pode ter 2 membros com o mesmo cpf!');
        erro := True;
        EditCpfParticipante3.Color := clRed;
      end;
      if frmPrincipal.ValidarCPF(EditCpfParticipante3.Text) = False then
      begin
        EditCpfParticipante3.Color := clRed;
        erro := True;
      end;
    end;
  end;

  if erro then result := False else result := True;

end;

function TfrmAcomp.validarDados : boolean;
var controle : boolean;
begin
  controle := True;

  if sltEstadoCivil.Text = casado then
  begin
    if UnimDBEdit4.Text = '' then
    begin
      ShowMessage('O nome da(o) c?njuge do cliente n?o foi preenchido.');
      UnimDBEdit4.Color := clRed;
      controle := False;
    end;
    if frmPrincipal.ValidarCPF(edtCPFConjuge.Text) = False then
    begin
      ShowMessage('Cpf do(a) c?njuge n?o ? v?lido.');
      edtCPFConjuge.Color := clRed;
      controle := False;
    end;
  end;

  if (Length(UnimDBEdit2.Text) < 8) OR (Length(UnimDBEdit2.Text) > 12) then
  begin
    ShowMessage('N?mero de telefone inv?lido.');
    UnimDBEdit2.Color := clRed;
    controle := False;
  end;

  if Pos('@', UnimDBEdit3.Text) = 0 then //email cliente
  begin
    UnimDBEdit3.Color := clRed;
    controle := False;
  end;

  if controle then result := True else result := False;
end;

procedure TfrmAcomp.filtrarSolicitacao();
begin
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter := 'ID = ' + IntToStr(solicitacao) ;
    Filtered := True;
  end;
end;

procedure TfrmAcomp.consultarSolicitacao();
var
  idCliente : Integer;
  count : Integer;
begin
  idCliente := UniMainModule.dsCliente.DataSet.FieldByName('ID').AsInteger;
  cpfCliente := UniMainModule.dsCliente.DataSet.FieldByName('CPF').AsString;

//  ShowMessage('idCliente = ' + idCliente.ToString + '; cpfCliente = ' + cpfCliente);

  with UniMainModule.FDQuery do
  begin
    // Otimizar consulta
    SQL.Clear;
    SQL.Add('SELECT count(*) FROM tb_solicitacao s ' +
            'JOIN tb_cliente c ' +
            'ON c.id = ' + idCliente.ToString + ' and c.id = s.cliente;'
            );
    Open();

    count := FieldByName('count').Value;

//    ShowMessage('Count = ' + count.ToString);
    Close;

    if count > 0 then
    begin
      SQL.Clear;
      SQL.Add('SELECT FIRST 1 a.id, c.nome, c.cpf, s.id solicitacao, s.situacao id_etapa, e.nome etapa, a.data ' +
              'FROM tb_acompanhamento a ' +
              'JOIN tb_etapa e ON a.etapa = e.id ' +
              'JOIN tb_solicitacao s ON a.solicitacao = s.id ' +
              'JOIN tb_cliente c ON s.cliente = c.id ' +
              'WHERE c.cpf = ' + QuotedStr(cpfCliente) + ' and s.situacao = a.etapa ' +
              'ORDER BY a.id DESC;'
              );
      Open();

      etapaID := FieldByName('ID_ETAPA').AsInteger;

//      ShowMessage('Id da etapa = ' + etapaID.ToString);

      situacao := FieldByName('ETAPA').AsString;

//      ShowMessage('Etapa (situacao) = ' + situacao);

      solicitacao := FieldByName('SOLICITACAO').AsInteger;

//      ShowMessage(' ID da solicitacao = ' + solicitacao.ToString);

      Close;

    end
    else
    begin
      // Erro, n?o existem solicita??o em andamento ou existe mas de 1 em aberto
    end;

  end;
end;

procedure TfrmAcomp.obterDatas();
var
  I : Integer;
begin
  with UniMainModule.FDQuery do
  begin


    SQL.Clear;
    SQL.Add('SELECT a.id, a.etapa id_etapa, e.nome etapa, a.obs, a.data ' +
            'FROM tb_acompanhamento a ' +
            'JOIN tb_etapa e ON a.etapa = e.id ' +
            'JOIN tb_solicitacao s ON a.solicitacao = s.id ' +
            'JOIN tb_cliente c ON s.cliente = c.id ' +
            'WHERE c.cpf = ' + QuotedStr(cpfCliente) + ' and ' +
            's.id = ' + IntToStr(solicitacao) + ';'
            );
    Open();



    for I := 1 to etapaID do
    begin
      with UniMainModule.dsViewAcompanhamento.DataSet do
      begin
        Filtered := False;
        Filter := 'SOLICITACAO = ' + IntToStr(solicitacao) + ' AND ' +
                  'ID_ETAPA = ' + IntToStr(I);
        Filtered := True;

        if I = FieldByName('ID_ETAPA').AsInteger then
        begin
          datas[I] := UniMainModule.dsViewAcompanhamento.DataSet.FieldByName('DATA').AsString;
          obs[I]   := UniMainModule.dsViewAcompanhamento.DataSet.FieldByName('OBS').AsString;
        end;
      end;

    end;

    Close();
  end;

end;

procedure TfrmAcomp.organizarCards();
var
  data, local, horario: string;
  situacao: integer;
begin

  dataPreCadastro.Caption           := datas[1];
  dataCadastroAprovado.Caption      := datas[2];
  dataCadastroReprovado.Caption     := datas[3];
  dataAgendarCapacitacao.Caption    := datas[4];
  dataEnviarDocumentos.Caption      := datas[5];
  dataDocumentosAprovados.Caption   := datas[6];
  dataDocumentosReprovados.Caption  := datas[7];
  dataAguardarAgendamento.Caption   := datas[8];
  dataLiberacaoAgendada.Caption     := datas[9];
  dataProcessoFinalizado.Caption    := datas[10];

  lblTxtCadRep.Text                 := Copy(obs[3],1,60) + '...';
  lblTxtCadRepMais.Text             := obs[3];

  with UniMainModule.FDQuery do
  begin
    SQL.Clear;
    SQL.Add('SELECT SITUACAO FROM tb_solicitacao where CLIENTE = ' + UniMainModule.dsCliente.DataSet.FieldByName('ID').AsString);
    Open;

    situacao := FieldByName('SITUACAO').Value;
  end;

  {
  case AnsiIndexStr(situacao, ['PR?-CADASTRO',
                               'PESQUISA INICIAL SEM PEND?NCIAS',
                               'PESQUISA INICIAL COM PEND?NCIAS',
                               'AGENDAR CAPACITA??O',
                               'ENVIAR DOCUMENTOS',
                               'DOCUMENTOS APROVADOS',
                               'DOCUMENTOS REPROVADOS',
                               'AGUARDAR AGENDAMENTO',
                               'AGENDADO',
                               'PROCESSO FINALIZADO',
                               'CAPACITA??O AGENDADA']) of }
    case situacao of
    1 : //Etapa de pr? cadastro
    begin
      pnl01_PreCadadastro.Visible := True;
      dataPreCadastro.Font.Color  := clWhite;
      lbIcolPreCad.Font.Color     := clWhite;
      lblTxtPreCad.Font.Color     := clWhite;
      lblTxtPreCad1.Font.Color    := clWhite;
      lblTxtPreCad2.Font.Color    := clWhite;
      pnlIcoPreCad.Color          := $006C3911;
      pnlDetPreCad.Color          := $007D4313;

    end;
    2 : //Cadastro aprovado
    begin
      pnl01_PreCadadastro.Visible     := True;
      pnl02_CadastroAprovado.Visible  := True;
      dataCadastroAprovado.Font.Color := clWhite;
      lbIcoCadApr.Font.Color          := clWhite;
      lblTxtCadApr.Font.Color         := clWhite;
      lblTxtCadApr1.Font.Color        := clWhite;
      lblTxtCadApr2.Font.Color        := clWhite;
      pnlIcoCadApr.Color              := $006C3911;
      pnlDetCadApr.Color              := $007D4313;
    end;
    3 : //Cadastro reprovado
    begin
      pnl01_PreCadadastro.Visible      := True;
      pnl03_CadastroReprovado.Visible  := True;
      dataCadastroReprovado.Font.Color := clWhite;
      lbIcoCadRep.Font.Color           := clWhite;
      lblTxtCadRep.Font.Color          := clWhite;
      lblTxtCadRep1.Font.Color         := clWhite;
      lblTxtCadRep2.Font.Color         := clWhite;
      pnlIcoCadRep.Color               := $006C3911;
      pnlDetCadRep.Color               := $007D4313;
    end;
    4 : //Agendar capacita??o
    begin
      pnl01_PreCadadastro.Visible       := True;
      pnl02_CadastroAprovado.Visible    := True;
      pnl04_AgendarCapacitacao.Visible  := True;
      dataAgendarCapacitacao.Font.Color := clWhite;
      lbIcoAgeCap.Font.Color            := clWhite;
      lblTxtAgeCap.Font.Color           := clWhite;
      lblTxtAgeCap1.Font.Color          := clWhite;
      lblTxtAgeCap2.Font.Color          := clWhite;
      pnlIcoAgeCap.Color                := $006C3911;
      pnlDetAgeCap.Color                := $007D4313;
    end;
    5 : //Enviar Documentos
    begin
      pnl01_PreCadadastro.Visible       := True;
      pnl02_CadastroAprovado.Visible    := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible  := True;
      pnl05_EnviarDocumentacao.Visible  := True;
      dataEnviarDocumentos.Font.Color   := clWhite;
      lbIcoDocPend.Font.Color           := clWhite;
      lblTxtDocPend.Font.Color          := clWhite;
      lblTxtDocPend1.Font.Color         := clWhite;
      lblTxtDocPend2.Font.Color         := clWhite;
      pnlIcoDocPend.Color               := $006C3911;
      pnlDetDocPend.Color               := $007D4313;
    end;
    6 : //Documentos aprovados
    begin
      pnl01_PreCadadastro.Visible        := True;
      pnl02_CadastroAprovado.Visible     := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible   := True;
      pnl05_EnviarDocumentacao.Visible   := True;
      pnl06_DocumentosAprovados.Visible  := True;
      dataDocumentosAprovados.Font.Color := clWhite;
      lbIcoDocApr.Font.Color             := clWhite;
      lblTxtDocApr.Font.Color            := clWhite;
      lblTxtDocApr1.Font.Color           := clWhite;
      lblTxtDocApr2.Font.Color           := clWhite;
      pnlIcoDocApr.Color                 := $006C3911;
      pnlDetDocApr.Color                 := $007D4313;
    end;
    7 : //Documentos Reprovados
    begin
      pnl01_PreCadadastro.Visible        := True;
      pnl02_CadastroAprovado.Visible     := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible   := True;
      pnl05_EnviarDocumentacao.Visible   := True;
      pnl07_DocumentosReprovados.Visible := True;
      dataDocumentosReprovados.Font.Color := clWhite;
      lbIcoDocRep.Font.Color             := clWhite;
      lblTxtDocRep.Font.Color            := clWhite;
      lblTxtDocRep1.Font.Color           := clWhite;
      lblTxtDocRep2.Font.Color           := clWhite;
      pnlIcoDocRep.Color                 := $006C3911;
      pnlDetDocRep.Color                 := $007D4313;
    end;
    8 : //Aguardar agendamento
    begin
      pnl01_PreCadadastro.Visible        := True;
      pnl02_CadastroAprovado.Visible     := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible   := True;
      pnl05_EnviarDocumentacao.Visible   := True;
      pnl06_DocumentosAprovados.Visible  := True;
      pnl08_AguardarAgendamento.Visible  := True;
      dataAguardarAgendamento.Font.Color := clWhite;
      lbIcoAguAge.Font.Color             := clWhite;
      lblTxtAguAge.Font.Color            := clWhite;
      lblTxtAguAge1.Font.Color           := clWhite;
      lblTxtAguAge2.Font.Color           := clWhite;
      pnlIcoAguAge.Color                 := $006C3911;
      pnlDetAguAge.Color                 := $007D4313;
    end;
    9 : //Agendar libera??o
    begin
      pnl01_PreCadadastro.Visible        := True;
      pnl02_CadastroAprovado.Visible     := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible   := True;
      pnl05_EnviarDocumentacao.Visible   := True;
      pnl06_DocumentosAprovados.Visible  := True;
      pnl08_AguardarAgendamento.Visible  := True;
      pnl09_AgendaLiberacao.Visible      := True;
      dataLiberacaoAgendada.Font.Color   := clWhite;
      lbIcoLibAge.Font.Color             := clWhite;
      lblTxtLibAge.Font.Color            := clWhite;
      lblTxtLibAge1.Font.Color           := clWhite;
      lblTxtLibAge2.Font.Color           := clWhite;
      pnlIcoLibAge.Color                 := $006C3911;
      pnlDetLibAge.Color                 := $007D4313;
    end;
    10 : //Processo finalizado
    begin
      pnl01_PreCadadastro.Visible       := True;
      pnl02_CadastroAprovado.Visible    := True;
      if linha = 'CREDJOVEM' then pnl04_AgendarCapacitacao.Visible  := True;
      pnl05_EnviarDocumentacao.Visible  := True;
      pnl06_DocumentosAprovados.Visible := True;
      pnl08_AguardarAgendamento.Visible := True;
      pnl09_AgendaLiberacao.Visible     := True;
      pnl10_ProcessoFinalizado.Visible  := True;
      dataProcessoFinalizado.Font.Color := clWhite;
      lbIcoProceFin.Font.Color          := clWhite;
      lblTxtProceFin.Font.Color         := clWhite;
      lblTxtProceFin1.Font.Color        := clWhite;
      lblTxtProceFin2.Font.Color        := clWhite;
      pnlIcoProceFin.Color              := $006C3911;
      pnlDetProceFin.Color              := $007D4313;
    end;
     11 : //Capacita??o agendada
    begin
      pnl01_PreCadadastro.Visible       := True;
      pnl02_CadastroAprovado.Visible    := True;
      pnl04_AgendarCapacitacao.Visible  := True;
      dataAgendarCapacitacao.Font.Color := clWhite;
      lbIcoAgeCap.Font.Color            := clWhite;
      lblTxtAgeCap.Font.Color           := clWhite;
      lblTxtAgeCap1.Font.Color          := clWhite;
      lblTxtAgeCap2.Font.Color          := clWhite;
      pnlIcoAgeCap.Color                := $006C3911;
      pnlDetAgeCap.Color                := $007D4313;

      //Verifica se j? foi agendada a capacita??o
      with UniMainModule.FDQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select CLIENTE, HORARIO, DATA, LOCAL from tb_capacitacao where CLIENTE = ' + intToStr(frmPrincipal.IDcliente));
        Open;
      end;
      if UniMainModule.FDQuery.FieldCount > 0 then
      begin
        lblTxtAgeCap1.Caption := 'Capacita??o';
        lblTxtAgeCap2.Caption := 'Agendada';
        data                  := UniMainModule.FDQuery.FieldByName('DATA').Value;
        local                 := UniMainModule.FDQuery.FieldByName('LOCAL').Value;
        horario               := UniMainModule.FDQuery.FieldByName('HORARIO').Value;
        lblTxtAgeCap.Caption  := 'Data: ' + data + ' Hor?rio: ' + horario + ' | ' + local;
      end;

    end;

  end;
end;

procedure TfrmAcomp.pgMeusDadosChange(Sender: TObject);
var
  I : integer;
begin
  if pgMeusDados.ActivePageIndex = 1 then
  begin
    organizarTelaSolicitacao();
  end;
end;

procedure TfrmAcomp.SelectEstadoCivilAvalistaChange(Sender: TObject);
begin
  if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
  begin //Se for casado(a) axibe painel de dados do(a) conjuge
    PanelIndividual.Height := 750;
    PanelAvalista.Height := 750;
    PanelConjugeAvalista.Height := 210;
    PanelConjugeAvalista.Visible := True;
  end
  else
  begin
    PanelIndividual.Height := 511;
    PanelAvalista.Height := 511;
    PanelConjugeAvalista.Height := 0;
    PanelConjugeAvalista.Visible := False;
  end;
end;

procedure TfrmAcomp.SelectQuantidadePessoasChange(Sender: TObject);
begin
  if SelectQuantidadePessoas.ItemIndex = 0 then
  begin
    PanelColetivo.Height := 200;
    PanelParticipante2.Height := 117;
    PanelParticipante3.Height := 0;
  end
  else if SelectQuantidadePessoas.ItemIndex = 1 then
  begin
    PanelColetivo.Height := 326;
    PanelParticipante2.Height := 117;
    PanelParticipante3.Height := 117;
  end;
end;

procedure TfrmAcomp.SelectTipoFinancChange(Sender: TObject);
begin
  if SelectTipoFinanc.ItemIndex = 0 then  //INDIVIDUAL
  begin
    PanelColetivo.Height := 0;
    PanelParticipante2.Height := 0;
    PanelParticipante3.Height := 0;
    SelectQuantidadePessoas.ItemIndex := -1;

    if SelectEstadoCivilAvalista.ItemIndex = 0 then
    begin
      //Exibe painel do conjuge do avalista para solicita??o individual
      PanelIndividual.Height := 750;
      PanelAvalista.Height := 750;
      PanelConjugeAvalista.Height := 210;
    end
    else
    begin
      //Exibe painel do avalista para solicita??o individual sem conjuge
      PanelIndividual.Height := 511;
      PanelAvalista.Height := 511;
      PanelConjugeAvalista.Height := 0;
    end;

  end
  else //SOLID?RIO
  begin
    //Exibir pain?l da solicita??o em grupo
    PanelIndividual.Height := 0;
    PanelAvalista.Height := 0;
    PanelColetivo.Height := 200;
    PanelParticipante2.Height := 117;
    PanelParticipante3.Height := 0;
  end;
end;

procedure TfrmAcomp.alterarPainelEstadoCivil;
begin
  if UniMainModule.dsCliente.DataSet.FieldByName('ESTADOCIVIL').Value = 'CASADO(A)' then
  begin
    UnimPanel3.Height := 145;
    UnimPanel3.Visible := True;
  end
  else
  begin
    UnimPanel3.Height := 0;
    UnimPanel3.Visible := False;
  end;
end;

procedure TfrmAcomp.btnFinalizarClick(Sender: TObject);
var
  idAvalista : integer;
begin

  if tipoFin <> SelectTipoFinanc.Text then
  begin  //Se alterar o tipo do financiamento pergunta se quer salvar essa altera??o
    if UniMainModule.msg('Tem certeza que deseja alterar o tipo de financiamento de <b>' + tipoFin
                        + '</b> para <b>' + SelectTipoFinanc.Text + '</b>?') then
    begin
      //a vari?vel tipoFin armazena o tipo de financiamento atual

      if tipoFin = 'SOLID?RIO' then  //Se o tipo atual ? SOLIDARIO ent?o a atualiza??o ? para INDIVIDUAL
      begin

        //Atualiza tabela grupo
        with UniMainModule.dsGrupo.DataSet do
        begin
          Filtered := False;
          Filter   := 'ID = ' + intToStr(idGrupoInt[1]);
          Filtered := True;
          if RecordCount > 0 then Delete;

          Filtered := False;
          Filter   := 'ID = ' + intToStr(idGrupoInt[2]);
          Filtered := True;
          if RecordCount > 0 then Delete;

        end;

        //Cadastra o avalista
        idAvalista := frmPrincipal.proxID('tb_avalista');
        with UniMainModule.dsAvalista.DataSet do
        begin
          Append;
          FieldByName('ID').Value           := idAvalista;
          FieldByName('NOME').Value         := EditAvalistaNome.Text;
          FieldByName('CPF').Value          := EditCpfAvalista.Text;
          FieldByName('TELEFONE').Value     := EditTelefoneAvalista.text;
          FieldByName('EMAIL').Value        := EditEmailAvalista.Text;
          FieldByName('ESTADOCIVIL').Value  := SelectEstadoCivilAvalista.Text;
          if SelectEstadoCivilAvalista.ItemIndex = 0 then FieldByName('NOMECONJUGE').Value  := EditNomeAvalistaConjuge.Text;
          if SelectEstadoCivilAvalista.ItemIndex = 0 then FieldByName('CPFCONJUGE').Value   := EditCpfAvalistaConjuge.Text;
          FieldByName('CLIENTEAGN').Value   := sltAvalistaClienteAgn.Text;
          FieldByName('DATACADASTRO').Value := now;
          Post;
        end;

        UniMainModule.dsSolicitacao.DataSet.Edit;
        UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').Value := idAvalista;
      end
      else //Se o tipo de financiamento era INDIVIDUAL ent?o a altera??o ? para SOLIDARIO
      begin

        //Atualiza tabela grupo
        with UniMainModule.dsGrupo.DataSet do
        begin
          Append;
          FieldByName('ID').Value           := frmPrincipal.proxID('tb_grupo');
          FieldByName('NOME').Value         := grupo;
          FieldByName('CPF').Value          := EditCpfParticipante2.Text;
          FieldByName('CADASTRO').Value     := 'N?O';
          FieldByName('DATACADASTRO').Value := now;
          post;
        end;

        if SelectQuantidadePessoas.Text = 'TR?S' then
        begin
          with UniMainModule.dsGrupo.Dataset do
          begin
            append;
            FieldByName('ID').Value           := frmPrincipal.proxID('tb_grupo');
            FieldByName('NOME').Value         := grupo;
            FieldByName('CPF').Value          := EditCpfParticipante3.Text;
            FieldByName('CADASTRO').Value     := 'N?O';
            FieldByName('DATACADASTRO').Value := now;
            post;
          end;
        end;

        //Exclui o avalista e desvincula
        with UniMainModule.dsAvalista.DataSet do
        begin
          Filtered := False;
          Filter   := 'ID = ' + UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').AsString;
          Filtered := True;
          Delete;
        end;
        with UniMainModule.dsSolicitacao.DataSet do
        begin
          Edit;
          FieldByName('AVALISTA').Value := null;
        end;

        tipoFin := 'MUDAN?A DE TIPO DE FINANCIAMENTO';
      end;

    end
    else
      Abort;

  end;

  if (validarDadosSolicitacao = True) then
  begin

    //Atualizando a tabela  solicitacao
    with UniMainModule.dsSolicitacao.DataSet do
    begin
      Edit;

      if sltTipoNegocio.Text = 'FORMAL' then //Se for informal
      begin
        if slctLinha.Text = 'MICROCR?DITO' then FieldByName('LINHA').Value := '10014 - AGN/MCEI';
        if slctLinha.Text = 'AGN - AGRO'   then FieldByName('LINHA').Value := '10006 - AGN/AGRO';
      end
      else
      begin //se for formal
        if slctLinha.Text = 'MICROCR?DITO - MEI'     then FieldByName('LINHA').Value := '10015 - AGN/MCMEI';
        if slctLinha.Text = 'MICROCR?DITO - TURISMO' then FieldByName('LINHA').Value := '10020 - AGN/PR?-TURISMO';
        if slctLinha.Text = 'MICROCR?DITO - ESCOLAR' then FieldByName('LINHA').Value := '10021 - AGN/PR?-ESCOLAR';
        if slctLinha.Text = 'TURISMO - FUNGETUR'     then FieldByName('LINHA').Value := '210001 - FUNGETUR (SELIC)';
        if slctLinha.Text = 'AGN - MICRO'            then FieldByName('LINHA').Value := '100010 - AGN MICRO';
        if slctLinha.Text = 'AGN - PR? EMPRESA'      then FieldByName('LINHA').Value := '10003 - AGN PR?-EMPRESA';
      end;

      FieldByName('TIPOFINANCIAMENTO').Value          := SelectTipoFinanc.Text;
      FieldByName('DATAATUALIZACAO').Value            := now;

      if chkMEI.Checked then FieldByName('MEI').Value := 'SIM' else FieldByName('MEI').Value := 'N?O';
      if sltTipoNegocio.ItemIndex = 0 then FieldByName('DATAABERTURAEMPRESA').Value := edtDataAbertura.Date;

      Post;
    end;

    if tipoFin = 'SOLID?RIO' then   //Se for SOLIDARIO atualiza os dados do grupo
    begin
      //Atualiza tabela grupo
      with UniMainModule.dsGrupo.DataSet do
      begin
        Filtered := False;
        Filter   := 'ID = ' + intToStr(idGrupoInt[1]);
        Filtered := True;
        Edit;
        FieldByName('CONFIRMAPARTICIPACAO').Value := 'N?O';
        FieldByName('DATAATUALIZACAO').Value      := now;
        Post;

        if qtde = 3 then
        begin
          Filtered := False;
          Filter   := 'ID = ' + intToStr(idGrupoInt[2]);
          Filtered := True;
          Edit;
          FieldByName('CONFIRMAPARTICIPACAO').Value := 'N?O';
          FieldByName('DATAATUALIZACAO').Value      := now;
          Post;
        end;

      end;
    end
    else if tipoFin = 'INDIVIDUAL' then
    begin //Se for INDIVIDUAL atualiza os dados do avalista
      with UniMainModule.dsAvalista.DataSet do
      begin
        Filtered := False;
        Filter   := 'id = ' + UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').AsString;
        Filtered := True;

        Edit;
        FieldByName('NOME').Value            := EditAvalistaNome.Text;
        FieldByName('CPF').Value             := EditCpfAvalista.Text;
        FieldByName('TELEFONE').Value        := EditTelefoneAvalista.text;
        FieldByName('EMAIL').Value           := EditEmailAvalista.Text;
        FieldByName('ESTADOCIVIL').Value     := SelectEstadoCivilAvalista.Text;

        if SelectEstadoCivilAvalista.ItemIndex = 0 then
          FieldByName('NOMECONJUGE').Value  := EditNomeAvalistaConjuge.Text;

        if SelectEstadoCivilAvalista.ItemIndex = 0 then
          FieldByName('CPFCONJUGE').Value   := EditCpfAvalistaConjuge.Text;

        FieldByName('CLIENTEAGN').Value      := sltAvalistaClienteAgn.Text;
        FieldByName('DATAATUALIZACAO').Value := now;
        Post;
      end;
    end;

    ShowMessage('Dados salvos com <b>sucesso</b>.');
    organizarTelaSolicitacao();
  end;

end;

procedure TfrmAcomp.BtnSalvarClick(Sender: TObject);
var
  senhaDigitada : string;
  senhaSalva    : string;
begin

  senhaDigitada := frmPrincipal.MD5(EditSenha.Text);
  senhaSalva := UniMainModule.dsUsuario.DataSet.FieldByName('senha').Value;
  if ValidarDados then
  begin
    if senhaDigitada = senhaSalva then
    begin
      UniMainModule.dsUsuario.DataSet.Edit;
      UniMainModule.dsCliente.DataSet.Edit;
      UniMainModule.dsSolicitacao.DataSet.Edit;

      UniMainModule.dsUsuario.DataSet.Post;
      UniMainModule.dsCliente.DataSet.Post;
      UniMainModule.dsSolicitacao.DataSet.Post;

      EditSenha.Text := '';
      ShowMessage('Dados Alterados com sucesso');
    end
    else
    begin
      EditSenha.Text := '';
      ShowMessage('Senha inv?lida, por favor digite sua senha novamente');
    end;
  end
  else
  begin
    EditSenha.Text := '';
    //filtrar os dados novamente para desfazer as altera??es do usu?rio?
  end;

end;

procedure TfrmAcomp.UnimButton1Click(Sender: TObject);
var
  senhaAtual    : string;
  senhaAtualMD5 : string;
  senhaSalva    : string;
  senhaNova     : string;
  senhaNovaConf : string;
begin

  senhaSalva    := UniMainModule.dsUsuario.DataSet.FieldByName('senha').Value;
  senhaAtual    := EditSenhaAtual.Text;
  senhaAtualMD5 := frmPrincipal.MD5(senhaAtual);
  senhaNova     := EditSenhaNova.Text;
  senhaNovaConf := EditSenhaConf.Text;

  EditSenhaAtual.Text := '';
  EditSenhaNova.Text  := '';
  EditSenhaConf.text  := '';

  case Usenha.alterarSenha(senhaAtual, senhaAtualMD5, senhaSalva, senhaNova, senhaNovaConf) of
    1:
    begin
      with UniMainModule.dsUsuario.DataSet do
      begin
        edit;
        FieldByName('SENHA').Value := frmPrincipal.MD5(senhaNova);
        post;
      end;
      ShowMessage('Senha alterada com sucesso.');
    end;
    2:
    begin
      ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
    end;
    3:
    begin
      ShowMessage('Erro, a senha nova precisa ser diferente da senha antiga.');
    end;
    4:
    begin
      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
    end;
    5:
    begin
      ShowMessage('Senha atual n?o foi inserida corretamente');
    end
    else
    begin
      ShowMessage('N?o foi poss?vel alterar a senha');
    end;
  end;

end;

procedure TfrmAcomp.UnimDBEdit2Change(Sender: TObject);
begin
  UnimDBEdit2.Color := clWindow;
end;

procedure TfrmAcomp.UnimDBEdit3Change(Sender: TObject);
begin
  UnimDBEdit3.Color := clWindow;
end;

procedure TfrmAcomp.sltEstadoCivilChange(Sender: TObject);
begin
  alterarPainelEstadoCivil();
end;

procedure TfrmAcomp.sltTipoNegocioChange(Sender: TObject);
begin

  if sltTipoNegocio.Text = 'FORMAL' then  //Se for FORMAL
  begin
    pnl2.Height           := 890;
    ctnCNPJ.Height        := 260;
    cntTipoNegocio.Height := 450;
    ctnCNPJ.Visible       := True;

    slctLinha.Items.Clear;
    slctLinha.Items.Add('N?O SEI INFORMAR');
    slctLinha.Items.Add('MICROCR?DITO - MEI');
    slctLinha.Items.Add('MICROCR?DITO - TURISMO');
    slctLinha.Items.Add('MICROCR?DITO - ESCOLAR');
    slctLinha.Items.Add('TURISMO - FUNGETUR');
    slctLinha.Items.Add('AGN - MICRO');
    slctLinha.Items.Add('AGN - PR? EMPRESA');
  end
  else if sltTipoNegocio.Text = 'INFORMAL' then //Se for INFORMAL
  begin
    pnl2.Height           := 650;
    ctnCNPJ.Height        := 0;
    cntTipoNegocio.Height := 200;
    ctnCNPJ.Visible       := False;

    slctLinha.Items.Clear;
    slctLinha.Items.Add('N?O SEI INFORMAR');
    slctLinha.Items.Add('MICROCR?DITO');
    slctLinha.Items.Add('AGN - AGRO');
  end;

  slctLinha.ItemIndex := 0;
end;

procedure TfrmAcomp.UnimFormShow(Sender: TObject);
var
  usuario,
  cliente : string;
  I : integer;
begin

  //Exibe mensagem de boas vindas com nome do usuario logado
  LabelUsuario.Caption := 'Bem vindo(a), ' + UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';

  //Salva o ID do usu?rio em uma vari?vel local
  usuario := UniMainModule.dsUsuario.DataSet.FieldByName('ID').AsString;

  //Filtra o cadastro do cliente
  with UniMainModule.dsCliente.DataSet do
  begin
    Filtered := False;
    Filter := 'USUARIO = ' + QuotedStr(usuario);
    Filtered := True;
  end;

  //Armazena o ID do cliente em uma vari?vel local
  cliente := UniMainModule.dsCliente.DataSet.FieldByName('ID').AsString;

  //Filtra a solicita??o do cliente
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter := 'CLIENTE = ' + QuotedStr(cliente);
    Filtered := True;

    if FieldByName('LINHA').IsNull then
      linha := ''
    else
      linha := FieldByName('LINHA').Value;
  end;

  //Organizar tela "Meus dados" de acordo com estado civil do usuario logado
  alterarPainelEstadoCivil();

  consultarSolicitacao();

  filtrarSolicitacao();

  obterDatas();

  // >> Organizar timeline de acordo com etapa que o cliente est?
  organizarCards();

  // >> S? abilita a aba de edi??o de solicita??o caso o cliente esteja na etapa pr?-cadastro ou com pend?ncias
  if (UniMainModule.dsSolicitacao.DataSet.FieldByName('SITUACAO').Value = 1) or
      (UniMainModule.dsSolicitacao.DataSet.FieldByName('SITUACAO').Value = 3) then
  begin
    pgSolicitacao.Enabled   := True;
    pgDadosPessoais.Enabled := True;
  end
  else
  begin
    pgSolicitacao.Enabled   := False;
    pgDadosPessoais.Enabled := False;
  end;

  verificarMsgNaoLida();
end;

procedure TfrmAcomp.lblMsgClick(Sender: TObject);
begin
  frmPrincipal.acessoChat := 'cliente';
  frmChat.ShowModal;
end;

procedure TfrmAcomp.UnimLabel1Click(Sender: TObject);
begin
  if UniMainModule.msg('Tem certeza que deseja sair?') then Close;
end;

procedure TfrmAcomp.UnimLabel6Click(Sender: TObject);
begin
  ctnMsgPend.Visible := False;
end;

procedure TfrmAcomp.UniTimerTimer(Sender: TObject);
begin
  verificarMsgNaoLida();
end;

procedure TfrmAcomp.lblTxtCadRepVerMaisClick(Sender: TObject);
begin
  ctnMsgPend.Visible := True;
end;

procedure TfrmAcomp.lblTxtDocPendClick(Sender: TObject);
begin
  frmAnexarDoc.ShowModal();
end;

procedure TfrmAcomp.lblTxtDocRepClick(Sender: TObject);
begin
  frmAnexarDoc.ShowModal();
end;

end.

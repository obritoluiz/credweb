unit Usolicitacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, unimDBSelect, uniEdit, unimEdit, uniMultiItem,
  unimSelect, unimScrollBox, uniLabel, unimLabel, Vcl.Imaging.pngimage,
  uniImage, unimImage, uniGUIBaseClasses, unimPanel, DB, uniPanel,
  uniPageControl, unimTabPanel, uniRadioButton, unimRadio, uniCheckBox,
  unimCheckBox, uniDBEdit, unimDBEdit, uniDBCheckBox, unimDBCheckBox,
  uniDateTimePicker, unimDatePicker;

type
  TFrmSolicitacao = class(TUnimForm)
    pnlCabec: TUnimPanel;
    imgBgHeader: TUnimImage;
    UnimScrollBox1: TUnimScrollBox;
    pnl1: TUnimPanel;
    UnimLabel1: TUnimLabel;
    PanelIndividual: TUnimPanel;
    LabelTipoFinanc: TUnimLabel;
    SelectTipoFinanc: TUnimSelect;
    PanelAvalista: TUnimPanel;
    EditAvalistaNome: TUnimEdit;
    LabelAvalistaCPF: TUnimLabel;
    LabelAvalista: TUnimLabel;
    LabelNomeAvalista: TUnimLabel;
    LabelEstadoCivilAvalista: TUnimLabel;
    SelectEstadoCivilAvalista: TUnimSelect;
    LabelTelefoneAvalista: TUnimLabel;
    LabelEmailAvalista: TUnimLabel;
    EditEmailAvalista: TUnimEdit;
    PanelConjugeAvalista: TUnimPanel;
    LabelNomeAvalistaConjuge: TUnimLabel;
    EditNomeAvalistaConjuge: TUnimEdit;
    LabelCpfAvalistaConjuge: TUnimLabel;
    EditCpfAvalistaConjuge: TUnimEdit;
    LabelAvalistaConjuge: TUnimLabel;
    EditCpfAvalista: TUnimEdit;
    EditTelefoneAvalista: TUnimEdit;
    SelectAvalistaClienteAGN: TUnimDBSelect;
    LabelAvalistaAGN: TUnimLabel;
    PanelColetivo: TUnimPanel;
    LabelParticipantesGrupo: TUnimLabel;
    SelectQuantidadePessoas: TUnimSelect;
    PanelParticipante2: TUnimPanel;
    LabelParticipante2: TUnimLabel;
    LabelCpfParticipante2: TUnimLabel;
    EditCpfParticipante2: TUnimEdit;
    PanelParticipante3: TUnimPanel;
    LabelParticipante3: TUnimLabel;
    LabelCpfParticipante3: TUnimLabel;
    EditCpfParticipante3: TUnimEdit;
    ctnCapInvest: TUnimContainerPanel;
    cntTipoNegocio: TUnimContainerPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    btnFinalizar: TUnimButton;
    pnl2: TUnimPanel;
    UnimLabel2: TUnimLabel;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    edtAtivNegocio: TUnimEdit;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    sltObjetivo: TUnimSelect;
    sltTipoNegocio: TUnimSelect;
    lblDescTipoFin: TUnimLabel;
    UnimLabel6: TUnimLabel;
    chkTermo: TUnimCheckBox;
    chkPEP: TUnimCheckBox;
    slctLinha: TUnimSelect;
    lblLinha: TUnimLabel;
    lblLinkLinha: TUnimLabel;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimLabel5: TUnimLabel;
    UnimContainerPanel3: TUnimContainerPanel;
    UnimLabel7: TUnimLabel;
    cntLinha: TUnimContainerPanel;
    edtFatAnual: TUnimDBNumberEdit;
    UnimPanel1: TUnimPanel;
    pnlTipoFin: TUnimPanel;
    edtCnpj: TUnimDBEdit;
    UnimLabel8: TUnimLabel;
    btnSocios: TUnimButton;
    ctnCNPJ: TUnimContainerPanel;
    chkMEI: TUnimCheckBox;
    edtDataAbertura: TUnimDatePicker;
    UnimLabel9: TUnimLabel;
    ctnLinha: TUnimContainerPanel;
    ctnSocios: TUnimContainerPanel;
    UnimContainerPanel4: TUnimContainerPanel;
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
    edtCredPret: TUnimDBNumberEdit;
    procedure SelectTipoFinancChange(Sender: TObject);
    procedure SelectEstadoCivilAvalistaChange(Sender: TObject);
    procedure SelectQuantidadePessoasChange(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure EditCpfParticipante2Change(Sender: TObject);
    procedure EditCpfParticipante3Change(Sender: TObject);
    procedure EditAvalistaNomeChange(Sender: TObject);
    procedure EditCpfAvalistaChange(Sender: TObject);
    procedure EditTelefoneAvalistaChange(Sender: TObject);
    procedure EditEmailAvalistaChange(Sender: TObject);
    procedure EditNomeAvalistaConjugeChange(Sender: TObject);
    procedure EditCpfAvalistaConjugeChange(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure chkTermoClick(Sender: TObject);
    procedure chkPEPClick(Sender: TObject);
    procedure lblLinkLinhaClick(Sender: TObject);
    procedure sltTipoNegocioChange(Sender: TObject);
    procedure btnSociosClick(Sender: TObject);
    procedure UnimLabel20Click(Sender: TObject);
    function validarDadosSolicitacao() : boolean;
    procedure slctLinhaChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    var codigoCliente         : integer;
    var cpfCliente            : string;
    var codigoGrupo           : string;
    var municipio             : string;
    var estadoCivil           : string;
    var cpfConjuge            : string;
    var dataAtual             : string;
    var codigoSolicitacao     : Integer;
  end;

function FrmSolicitacao: TFrmSolicitacao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, UpreCad, UdadosCliente, ServerModule,
  Uacomp, Uadmin, UanexarDoc, UdadosUsuario, Umsg, UpedirDocs, UrecuperarSenha,
  Usejuv, Uusuarios, UdocsReprovados, Utermos, Upep,
  UcadSucesso, DateUtils;

function FrmSolicitacao: TFrmSolicitacao;
begin
  Result := TFrmSolicitacao(UniMainModule.GetFormInstance(TFrmSolicitacao));
end;

procedure TFrmSolicitacao.EditAvalistaNomeChange(Sender: TObject);
begin
  EditAvalistaNome.Color := clWindow;
end;

procedure TFrmSolicitacao.EditCpfAvalistaChange(Sender: TObject);
begin
  EditCpfAvalista.Color := clWindow;
end;

procedure TFrmSolicitacao.EditCpfAvalistaConjugeChange(Sender: TObject);
begin
  EditCpfAvalistaConjuge.Color := clWindow;
end;

procedure TFrmSolicitacao.EditCpfParticipante2Change(Sender: TObject);
begin
  EditCpfParticipante2.Color := clWindow;
end;

procedure TFrmSolicitacao.EditCpfParticipante3Change(Sender: TObject);
begin
  EditCpfParticipante3.Color := clWindow;
end;

procedure TFrmSolicitacao.EditEmailAvalistaChange(Sender: TObject);
begin
  EditEmailAvalista.Color := clWindow;
end;

procedure TFrmSolicitacao.EditNomeAvalistaConjugeChange(Sender: TObject);
begin
  EditNomeAvalistaConjuge.Color := clWindow;
end;

procedure TFrmSolicitacao.EditTelefoneAvalistaChange(Sender: TObject);
begin
  EditTelefoneAvalista.Color := clWindow;
end;

procedure TFrmSolicitacao.SelectEstadoCivilAvalistaChange(Sender: TObject);
begin
  if SelectEstadoCivilAvalista.ItemIndex = 0 then
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

procedure TFrmSolicitacao.SelectQuantidadePessoasChange(Sender: TObject);
begin
  SelectQuantidadePessoas.Color := clWindow;

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

procedure TFrmSolicitacao.SelectTipoFinancChange(Sender: TObject);
begin
  SelectTipoFinanc.Color := clWindow;
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
    PanelColetivo.Height := 100;
    PanelParticipante2.Height := 0;
    PanelParticipante3.Height := 0;
  end;
end;

procedure TFrmSolicitacao.slctLinhaChange(Sender: TObject);
begin
  if slctLinha.Text = 'AGN - AGRO' then
    ShowMessage('<b>ATEN??O</b>' + #13 + #13 +
                'Esta linha de financiamento se enquadra ?s pessoas f?sicas que' +
                'desenvolvam atividades da cadeia produtiva da agricultura familiar' +
                'no Estado do Rio Grande do Norte, vinculados a uma cooperativa,' +
                'associa??o, sindicato rural, ou outra entidade que seja credenciada' +
                'pela Secretaria de Estado do Desenvolvimento Rural e da Agricultura' +
                'Familiar ? SEDRAF e que apresentem DAP ? Declara??o de Aptid?o ao PRONAF');
end;

procedure TFrmSolicitacao.sltTipoNegocioChange(Sender: TObject);
begin
  if sltTipoNegocio.ItemIndex = 1 then  //Se for FORMAL
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
  end
  else if sltTipoNegocio.ItemIndex = 2 then
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

end;

function TFrmSolicitacao.validarDadosSolicitacao() : boolean;
var
  erro :boolean;
  data: string;
begin
  erro := False;

  if (slctLinha.Text = 'MICROCR?DITO - MEI') or
     (slctLinha.Text = 'MICROCR?DITO - TURISMO') or
     (slctLinha.Text = 'MICROCR?DITO - ESCOLAR') then
  begin
    if edtCredPret.Value > 12000  then
    begin
      ShowMessage('<b>N?o ? poss?vel</b> solicitar mais de 12 mil reais para linha ' + slctLinha.Text);
      slctLinha.SetFocus;
      erro := True;
    end;
  end;

  if sltTipoNegocio.ItemIndex = 0 then
  begin
    ShowMessage('Voc? precisa informar o tipo do neg?cio. Formal ou informal.');
    sltTipoNegocio.SetFocus;
    erro := True;
  end;

  if chkTermo.Checked = False then
  begin
    ShowMessage('Voc? precisa ler e aceitar os termos.');
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

  if sltTipoNegocio.itemIndex = 1 then
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

    if (chkMEI.Checked = True) and (edtFatAnual.Value > 81000) then
    begin
      ShowMessage('Se voc? ? MEI <b>seu faturamento n?o pode ser superior a 81 mil reais por ano</b>');
      edtFatAnual.SetFocus;
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
      EditCpfAvalista.SetFocus;
      erro := True;
    end;
    if cpfCliente = EditCpfAvalista.Text then
    begin
      ShowMessage('Voc? n?o pode ser seu pr?prio avalisata, por favor insira outra pessoa como avalista.');
      EditCpfAvalista.Color := clRed;
      erro := True;
    end;

    //verificar estado civil do cliente
    if (estadoCivil = 'CASADO(A)') and
       (cpfConjuge = EditCpfAvalista.Text) then
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
    if (SelectAvalistaClienteAGN.ItemIndex = -1) then
    begin
      SelectAvalistaClienteAGN.Color := clRed;
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
    if estadoCivil = 'CASADO(A)' then
      begin
        if cpfConjuge = EditCpfParticipante2.Text then
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
      if estadoCivil = 'CASADO(A)' then
      begin
        if cpfConjuge = EditCpfParticipante3.Text then
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

procedure TFrmSolicitacao.btnFinalizarClick(Sender: TObject);
var
  codigoAvalista,
  codigoSolicitacao,
  idUsuario,
  idCliente : Integer;
  cidade : string;
begin

  if (frmPrincipal.acesso = 'CREDJOVEM') or (frmPrincipal.acesso = 'CREDTUR') then
  begin
    //
  end;

  if (validarDadosSolicitacao = True) then
  begin

    //Salvando usu?rio e cliente no banco
    //Salva dados na tabela usuario
    idUsuario := frmPrincipal.proxID('tb_usuario');
    if (UniMainModule.tb_usuario.State in [dsInsert]) then
    begin
      UniMainModule.dsUsuario.DataSet.FieldByName('ID').Value := idUsuario;
      UniMainModule.dsUsuario.DataSet.Post;
    end;

    //Salva dados na tabela cliente
    idCliente := frmPrincipal.proxID('tb_cliente');
    if (UniMainModule.tb_cliente.State in [dsInsert]) then
    begin
      with UniMainModule.dsCliente.DataSet do
      begin
        if chkTermo.Checked then
          FieldByName('ACEITATERMO').Value := 'SIM'
        else FieldByName('ACEITATERMO').Value := 'N?O';

        if chkPEP.Checked then
          FieldByName('PEP').Value := 'SIM'
        else FieldByName('PEP').Value := 'N?O';

        FieldByName('ID').Value                := idCliente;
        FieldByName('USUARIO').Value           := idUsuario;
        post;
      end;
    end;

    //Caso seja um cadastro NOVO, inclui o grupo
    //Cliente n?o aceitou fazer parte do grupo ou ? novo
    if (frmPrincipal.ConfirmaParticipacao <> 'SIM') then
    begin
      //Tratando o nome da cidade para gerar nome do grupo
      cidade := StringReplace(frmPrincipal.RemoverAcento(municipio), ' ', '', [rfReplaceAll, rfIgnoreCase]);
      cidade := StringReplace(cidade, '-', '', [rfReplaceAll]);
      cidade := StringReplace(cidade, '''', '', [rfReplaceAll]);

      //Gerar o nome do grupo pra uso interno do sistema
      codigoGrupo := 'APP'+cidade+'#'+frmPrincipal.proxCodGrupo(municipio)+FormatDateTime('yyyy', Now);

      //cadastrando cliente no grupo
      with UniMainModule.dsGrupo.Dataset do
      begin
        append;
        FieldByName('ID').Value                   := frmPrincipal.proxID('tb_grupo');
        FieldByName('NOME').Value                 := codigoGrupo;
        FieldByName('CPF').Value                  := cpfCliente;
        FieldByName('CADASTRO').Value             := 'SIM';
        FieldByName('DATACADASTRO').Value         := dataAtual;
        FieldByName('CONFIRMAPARTICIPACAO').Value := 'SIM';
        post;
      end;

      if SelectTipoFinanc.ItemIndex = 0 then //Financiamento individual
      begin

        //Avalista
        codigoAvalista := frmPrincipal.proxID('tb_avalista');
        UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').Value := codigoAvalista;

        with UniMainModule.dsAvalista.DataSet do
        begin
          Append;
          FieldByName('ID').Value           := codigoAvalista;
          FieldByName('NOME').Value         := EditAvalistaNome.Text;
          FieldByName('CPF').Value          := EditCpfAvalista.Text;
          FieldByName('TELEFONE').Value     := EditTelefoneAvalista.text;
          FieldByName('EMAIL').Value        := EditEmailAvalista.Text;
          FieldByName('ESTADOCIVIL').Value  := SelectEstadoCivilAvalista.Text;
          if SelectEstadoCivilAvalista.ItemIndex = 0 then FieldByName('NOMECONJUGE').Value  := EditNomeAvalistaConjuge.Text;
          if SelectEstadoCivilAvalista.ItemIndex = 0 then FieldByName('CPFCONJUGE').Value   := EditCpfAvalistaConjuge.Text;
          FieldByName('CLIENTEAGN').Value   := 'N?O';
          FieldByName('DATACADASTRO').Value := dataAtual;
          Post;
        end;

      end
      else if SelectTipoFinanc.ItemIndex = 1 then //Financiamento solid?rio
      begin

        //Cadastrar grupo
        with UniMainModule.dsGrupo.Dataset do
        begin
          append;
          FieldByName('ID').Value           := frmPrincipal.proxID('tb_grupo');
          FieldByName('NOME').Value         := codigoGrupo;
          FieldByName('CPF').Value          := EditCpfParticipante2.Text;
          FieldByName('CADASTRO').Value     := 'N?O';
          FieldByName('DATACADASTRO').Value := dataAtual;
          post;
        end;
        if (SelectQuantidadePessoas.Text = 'TR?S') and
          (EditCpfParticipante3.Text <> '')  then
        begin
          with UniMainModule.dsGrupo.Dataset do
          begin
            append;
            FieldByName('ID').Value           := frmPrincipal.proxID('tb_grupo');
            FieldByName('NOME').Value         := codigoGrupo;
            FieldByName('CPF').Value          := EditCpfParticipante3.Text;
            FieldByName('CADASTRO').Value     := 'N?O';
            FieldByName('DATACADASTRO').Value := dataAtual;
            post;
          end;
        end;
      end;

    end;



    //Cadastrando solicitacao
    codigoSolicitacao := frmPrincipal.proxID('tb_solicitacao');
    with UniMainModule.dsSolicitacao.DataSet do
    begin
      FieldByName('ID').Value      := codigoSolicitacao;
      //Salva a linha de cr?dito credjovem quando o cadastro ? feito a partir
      //da tela do credjovem
      if frmPrincipal.acesso = 'credjovem' then
        FieldByName('LINHA').Value := 'CREDJOVEM';

      if sltTipoNegocio.ItemIndex = 2 then //Se for informal
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

      FieldByName('SITUACAO').Value                   := 1;
      FieldByName('DATACADASTRO').Value               := dataAtual;
      FieldByName('ATIVIDADE').Value                  := edtAtivNegocio.Text;
      FieldByName('OBJETIVO').Value                   := sltObjetivo.Text;
      FieldByName('TIPONEGOCIO').Value                := sltTipoNegocio.Text;

      if chkMEI.Checked then FieldByName('MEI').Value := 'SIM' else FieldByName('MEI').Value := 'N?O';
      if sltTipoNegocio.ItemIndex = 1 then FieldByName('DATAABERTURAEMPRESA').Value := edtDataAbertura.Date;


      FieldByName('CLIENTE').Value           := idCliente;

      if (frmPrincipal.ConfirmaParticipacao <> 'SIM') then //Se for cliente novo ou n?o confirma participa??o no grupo
      begin
        FieldByName('GRUPO').Value             := codigoGrupo;
        FieldByName('TIPOFINANCIAMENTO').Value := SelectTipoFinanc.Text;
      end
      else //Caso o cliente tenha aceito participar do grupo previamente cadastrado
      begin
        FieldByName('GRUPO').Value             := frmPrincipal.codigoGrupo;
        FieldByName('TIPOFINANCIAMENTO').Value := 'SOLID?RIO';
      end;

      if sltTipoNegocio.Text = 'INFORMAL' then FieldByName('CNPJ').Value := null;


      Post;
    end;

    frmPrincipal.adicionarEtapa(1, codigoSolicitacao);

    if SelectTipoFinanc.ItemIndex = 1 then
      ShowMessage('<b>Aviso:</b>' + #13 + #13 +
                  'Seu pr? cadastro s? ser? analisado quando todos os integrantes ' +
                  'do seu grupo solid?rio se cadastrarem e confirmarem a participa??o no grupo.' +
                  #13 + 'S? ? permitido grupo solid?rio em que todos os integrantes sejam da mesma cidade');

    frmCadSucesso.ShowModal();
    Close;

  end
  else
  begin
    ShowMessage('Alguns dados n?o foram preenchidos corretamente, por favor, preencha o formul?rio novamente');
  end;
end;


procedure TFrmSolicitacao.UnimButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacao.btnSociosClick(Sender: TObject);
begin
  ctnSocios.Visible := True;
end;

procedure TFrmSolicitacao.chkPEPClick(Sender: TObject);
begin
  frmPEP.ShowModal();
end;

procedure TFrmSolicitacao.chkTermoClick(Sender: TObject);
begin
  frmTermo.ShowModal();
end;

procedure TFrmSolicitacao.UnimFormShow(Sender: TObject);
begin
  dataAtual := FormatDateTime('dd/mm/yyyy', Now);

  sltTipoNegocio.ItemIndex := 0;
  slctLinha.Items.Clear;
  slctLinha.Items.Add('INFORMAR TIPO DO NEG?CIO');
  slctLinha.ItemIndex := 0;

  with UniMainModule.dsCliente.DataSet do
  begin
    //codigoCliente := FieldByName('ID').Value;
    cpfCliente    := FieldByName('CPF').Value;
    municipio     := FieldByName('MUNICIPIO').Value;
    estadoCivil   := FieldByName('ESTADOCIVIL').Value;
    if estadoCivil = 'CASADO(A)' then
    begin
      cpfConjuge  := FieldByName('CPFCONJUGE').Value;
    end;
  end;

  pnl1.Visible := True;

  PanelParticipante2.Height := 117;
  PanelParticipante3.Height := 0;
  PanelColetivo.Height      := 200;
  PanelIndividual.Height    := 0;

  //Esconde dados de empresa. S? exibe se for FORMAL
  pnl2.Height           := 650;
  ctnCNPJ.Height        := 0;
  cntTipoNegocio.Height := 200;
  ctnCNPJ.Visible       := False;

  if (frmPrincipal.ConfirmaParticipacao = 'SIM') then
  begin
    PanelColetivo.Visible    := False;
    PanelIndividual.Visible  := False;
    LabelTipoFinanc.Visible  := False;
    lblDescTipoFin.Visible   := False;
    SelectTipoFinanc.Visible := False;
  end;
end;

procedure TFrmSolicitacao.UnimLabel20Click(Sender: TObject);
begin
  ctnSocios.Visible := False;
end;

procedure TFrmSolicitacao.lblLinkLinhaClick(Sender: TObject);
begin
  UniSession.AddJS('window.open("http://www.agn.rn.gov.br/Conteudo.asp?TRAN=ITEM&TARG=245155&ACT=&PAGE=0&PARM=&LBL=AGN%2FRN")');
end;

end.

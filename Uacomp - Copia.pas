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
  unimDBSelect, DB, StrUtils;

type
  TfrmAcomp = class(TUnimForm)
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimLabel7: TUnimLabel;
    umpFooter: TUnimPanel;
    UnimImage1: TUnimImage;
    UnimLabel8: TUnimLabel;
    scrlBody: TUnimScrollBox;
    pnlTimeLine1: TUnimPanel;
    pgMain: TUnimTabPanel;
    pgAcomp: TUnimTabSheet;
    pgDados: TUnimTabSheet;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
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
    UnimDBSelect2: TUnimDBSelect;
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
    UnimDBEdit5: TUnimDBEdit;
    LabelConjugeNome: TUnimLabel;
    LabelConjugeCPF: TUnimLabel;
    UnimPanel3: TUnimPanel;
    UnimPanel5: TUnimPanel;
    UnimImage2: TUnimImage;
    s: TUnimLabel;
    UnimPanel6: TUnimPanel;
    UnimLabel12: TUnimLabel;
    UnimLabel13: TUnimLabel;
    pnl01_PreCadadastro1: TUnimPanel;
    UnimPanel7: TUnimPanel;
    UnimImage3: TUnimImage;
    dataPreCadastro1: TUnimLabel;
    UnimPanel8: TUnimPanel;
    UnimLabel2: TUnimLabel;
    UnimLabel6: TUnimLabel;
    pnl02_CadastroAprovado1: TUnimPanel;
    UnimPanel13: TUnimPanel;
    UnimImage5: TUnimImage;
    dataCadastroAprovado1: TUnimLabel;
    UnimPanel14: TUnimPanel;
    UnimLabel19: TUnimLabel;
    UnimLabel20: TUnimLabel;
    pnl03_CadastroReprovado1: TUnimPanel;
    UnimPanel10: TUnimPanel;
    UnimImage4: TUnimImage;
    dataCadastroReprovado1: TUnimLabel;
    UnimPanel11: TUnimPanel;
    UnimLabel16: TUnimLabel;
    UnimLabel17: TUnimLabel;
    pnl09_AgendaLiberacao1: TUnimPanel;
    UnimPanel9: TUnimPanel;
    UnimImage6: TUnimImage;
    dataLiberacaoAgendada1: TUnimLabel;
    UnimPanel12: TUnimPanel;
    UnimLabel24: TUnimLabel;
    UnimLabel25: TUnimLabel;
    pnl08_AguardarAgendamento1: TUnimPanel;
    UnimPanel16: TUnimPanel;
    UnimImage7: TUnimImage;
    dataAguardarAgendamento1: TUnimLabel;
    UnimPanel17: TUnimPanel;
    UnimLabel27: TUnimLabel;
    UnimLabel28: TUnimLabel;
    pnl07_DocumentosReprovados1: TUnimPanel;
    UnimPanel19: TUnimPanel;
    UnimImage8: TUnimImage;
    dataDocumentosReprovados1: TUnimLabel;
    UnimPanel20: TUnimPanel;
    UnimLabel30: TUnimLabel;
    UnimLabel31: TUnimLabel;
    pnl06_DocumentosAprovados1: TUnimPanel;
    UnimPanel22: TUnimPanel;
    UnimImage9: TUnimImage;
    dataDocumentosAprovados1: TUnimLabel;
    UnimPanel23: TUnimPanel;
    UnimLabel33: TUnimLabel;
    UnimLabel34: TUnimLabel;
    pnl05_EnviarDocumentacao1: TUnimPanel;
    UnimPanel25: TUnimPanel;
    UnimImage10: TUnimImage;
    dataEnviarDocumentos1: TUnimLabel;
    UnimPanel26: TUnimPanel;
    UnimLabel36: TUnimLabel;
    UnimLabel37: TUnimLabel;
    pnl04_AgendarCapacitacao1: TUnimPanel;
    UnimPanel28: TUnimPanel;
    UnimImage11: TUnimImage;
    dataAgendarCapacitacao1: TUnimLabel;
    UnimPanel29: TUnimPanel;
    UnimLabel39: TUnimLabel;
    UnimLabel40: TUnimLabel;
    pnl10_ProcessoFinalizado1: TUnimPanel;
    pnlTimeLine: TUnimPanel;
    pnl10_ProcessoFinalizado: TUnimPanel;
    UnimPanel18: TUnimPanel;
    UnimImage12: TUnimImage;
    dataProcessoFinalizado: TUnimLabel;
    pnl09_AgendaLiberacao: TUnimPanel;
    UnimPanel27: TUnimPanel;
    UnimImage13: TUnimImage;
    dataLiberacaoAgendada: TUnimLabel;
    pnl08_AguardarAgendamento: TUnimPanel;
    UnimPanel32: TUnimPanel;
    UnimImage14: TUnimImage;
    dataAguardarAgendamento: TUnimLabel;
    pnl01_PreCadadastro: TUnimPanel;
    UnimPanel35: TUnimPanel;
    UnimImage15: TUnimImage;
    dataPreCadastro: TUnimLabel;
    pnl02_CadastroAprovado: TUnimPanel;
    UnimPanel38: TUnimPanel;
    UnimImage16: TUnimImage;
    dataCadastroAprovado: TUnimLabel;
    pnl03_CadastroReprovado: TUnimPanel;
    UnimPanel41: TUnimPanel;
    UnimImage17: TUnimImage;
    dataCadastroReprovado: TUnimLabel;
    pnl04_AgendarCapacitacao: TUnimPanel;
    UnimPanel44: TUnimPanel;
    UnimImage18: TUnimImage;
    dataAgendarCapacitacao: TUnimLabel;
    pnl05_EnviarDocumentacao: TUnimPanel;
    UnimPanel47: TUnimPanel;
    UnimImage19: TUnimImage;
    dataEnviarDocumentos: TUnimLabel;
    pnl06_DocumentosAprovados: TUnimPanel;
    UnimPanel50: TUnimPanel;
    UnimImage20: TUnimImage;
    dataDocumentosAprovados: TUnimLabel;
    pnl07_DocumentosReprovados: TUnimPanel;
    UnimPanel53: TUnimPanel;
    UnimImage21: TUnimImage;
    dataDocumentosReprovados: TUnimLabel;
    UnimPanel21: TUnimPanel;
    UnimLabel14: TUnimLabel;
    UnimLabel18: TUnimLabel;
    UnimPanel30: TUnimPanel;
    UnimLabel26: TUnimLabel;
    UnimLabel29: TUnimLabel;
    UnimPanel33: TUnimPanel;
    UnimLabel35: TUnimLabel;
    UnimLabel38: TUnimLabel;
    UnimPanel36: TUnimPanel;
    UnimLabel42: TUnimLabel;
    UnimLabel43: TUnimLabel;
    UnimPanel51: TUnimPanel;
    UnimLabel57: TUnimLabel;
    UnimLabel58: TUnimLabel;
    UnimPanel48: TUnimPanel;
    UnimLabel54: TUnimLabel;
    UnimLabel55: TUnimLabel;
    UnimPanel45: TUnimPanel;
    UnimLabel51: TUnimLabel;
    UnimLabel52: TUnimLabel;
    UnimPanel54: TUnimPanel;
    UnimLabel60: TUnimLabel;
    UnimLabel61: TUnimLabel;
    UnimPanel42: TUnimPanel;
    UnimLabel48: TUnimLabel;
    UnimLabel49: TUnimLabel;
    UnimPanel39: TUnimPanel;
    UnimLabel45: TUnimLabel;
    UnimLabel46: TUnimLabel;
    UnimLabel62: TUnimLabel;
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimDBSelect2Change(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimDBEdit2Change(Sender: TObject);
    procedure UnimDBEdit3Change(Sender: TObject);
  private
    { Private declarations }
    function validarDados : boolean;
    procedure consultarSolicitacao();
    procedure organizarCards();
    procedure filtrarSolicitacao();
    procedure obterDatas();
    procedure alterarPainelEstadoCivil();
    
  var
    situacao : string;
    solicitacao : Integer;
    cpfCliente : string;
    etapaID : Integer;
    datas : array[1..10] of String;

  public
    { Public declarations }
    const casado : string = 'CASADO(A)';

  end;

function frmAcomp: TfrmAcomp;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, Usenha, uniGUIApplication;

function frmAcomp: TfrmAcomp;
begin
  Result := TfrmAcomp(UniMainModule.GetFormInstance(TfrmAcomp));
end;

function TfrmAcomp.validarDados : boolean;
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

  if (Length(UnimDBEdit2.Text) < 8) OR (Length(UnimDBEdit2.Text) > 12) then
  begin
    ShowMessage('Número de telefone inválido.');
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
      // Erro, não existem solicitação em andamento ou existe mas de 1 em aberto
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
    SQL.Add('SELECT a.id, a.etapa id_etapa, e.nome etapa, a.data ' +
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
        end;
      end;

    end;

    Close();
  end;

end;

procedure TfrmAcomp.organizarCards();
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

  case AnsiIndexStr(situacao, ['PRÉ-CADASTRO',
                               'CADASTRO APROVADO',
                               'CADASTRO REPROVADO',
                               'AGENDAR CAPACITAÇÃO',
                               'ENVIAR DOCUMENTOS',
                               'DOCUMENTOS APROVADOS',
                               'DOCUMENTOS REPROVADOS',
                               'AGUARDAR AGENDAMENTO',
                               'AGENDADO',
                               'PROCESSO FINALIZADO']) of
    0 :
    begin
      pnl01_PreCadadastro.Visible := True;
    end;
    1 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
    end;
    2 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl03_CadastroReprovado.Visible := True;
    end;
    3 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
    end;
    4 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
    end;
    5 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
      pnl06_DocumentosAprovados.Visible := True;
    end;
    6 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
      pnl07_DocumentosReprovados.Visible := True;
    end;
    7 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
      pnl06_DocumentosAprovados.Visible := True;
      pnl08_AguardarAgendamento.Visible := True;
    end;
    8 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
      pnl06_DocumentosAprovados.Visible := True;
      pnl08_AguardarAgendamento.Visible := True;
      pnl09_AgendaLiberacao.Visible := True;
    end;
    9 :
    begin
      pnl01_PreCadadastro.Visible := True;
      pnl02_CadastroAprovado.Visible := True;
      pnl04_AgendarCapacitacao.Visible := True;
      pnl05_EnviarDocumentacao.Visible := True;
      pnl06_DocumentosAprovados.Visible := True;
      pnl08_AguardarAgendamento.Visible := True;
      pnl09_AgendaLiberacao.Visible := True;
      pnl10_ProcessoFinalizado.Visible := True;
    end;

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

      UniMainModule.dsUsuario.DataSet.Post;
      UniMainModule.dsCliente.DataSet.Post;

      EditSenha.Text := '';
      ShowMessage('Dados Alterados com sucesso');
    end
    else
    begin
      EditSenha.Text := '';
      ShowMessage('Senha inválida, por favor digite sua senha novamente');
    end;
  end
  else
  begin
    EditSenha.Text := '';
    //filtrar os dados novamente para desfazer as alterações do usuário?
  end;

end;

procedure TfrmAcomp.UnimBitBtn1Click(Sender: TObject);
begin
  Close;
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
      ShowMessage('Senha inválida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
    end;
    3:
    begin
      ShowMessage('Erro, a senha nova precisa ser diferente da senha antiga.');
    end;
    4:
    begin
      ShowMessage('As senhas não coincidem, por favor certifique-se que as duas senhas sejam iguais.');
    end;
    5:
    begin
      ShowMessage('Senha atual não foi inserida corretamente');
    end
    else
    begin
      ShowMessage('Não foi possível alterar a senha');
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

procedure TfrmAcomp.UnimDBSelect2Change(Sender: TObject);
begin
  alterarPainelEstadoCivil();
end;

procedure TfrmAcomp.UnimFormShow(Sender: TObject);
var
  usuario : string;
  cliente : string;
begin
  LabelUsuario.Caption := 'Bem vindo(a), ' + UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';

  usuario := UniMainModule.dsUsuario.DataSet.FieldByName('ID').AsString;
  with UniMainModule.dsCliente.DataSet do
  begin
    Filtered := False;
    Filter := 'USUARIO = ' + QuotedStr(usuario);
    Filtered := True;
  end;

  cliente := UniMainModule.dsCliente.DataSet.FieldByName('ID').AsString;
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter := 'CLIENTE = ' + QuotedStr(cliente);
    Filtered := True;
  end;

  alterarPainelEstadoCivil();

  consultarSolicitacao();

  filtrarSolicitacao();

  obterDatas();

  organizarCards();

end;

end.

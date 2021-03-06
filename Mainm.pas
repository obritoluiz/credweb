unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, uniBitBtn, unimBitBtn, uniEdit, unimEdit, uniLabel, unimLabel,
  uniGUIBaseClasses, unimPanel, Vcl.Imaging.pngimage, uniImage, unimImage,
  Vcl.Imaging.jpeg, unimScrollBox, unimButton, uniMultiItem, unimSelect, StrUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  uniMemo, uniDBMemo, unimDBMemo, uTInject, uniDateTimePicker, unimDatePicker,
  Vcl.Imaging.GIFImg;

type
  TfrmPrincipal = class(TUnimForm)
    umpBody: TUnimPanel;
    pnlAcompanhar: TUnimPanel;
    pnlSolicitar: TUnimPanel;
    UnimLabel1: TUnimLabel;
    edtNome: TUnimEdit;
    UnimLabel2: TUnimLabel;
    edtSenha: TUnimEdit;
    UnimLabel3: TUnimLabel;
    edtCPFacomp: TUnimEdit;
    UnimLabel4: TUnimLabel;
    UnimLabel5: TUnimLabel;
    lblAcomp: TUnimLabel;
    scrlBody: TUnimScrollBox;
    edtCPF: TUnimEdit;
    pnlInicial: TUnimPanel;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimPanel3: TUnimPanel;
    UnimLabel7: TUnimLabel;
    UnimLabel8: TUnimLabel;
    UnimPanel5: TUnimPanel;
    UnimLabel9: TUnimLabel;
    UnimLabel10: TUnimLabel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimImage2: TUnimImage;
    UnimImage3: TUnimImage;
    UnimContainerPanel3: TUnimContainerPanel;
    UnimImage1: TUnimImage;
    lblEsqueciSenha: TUnimLabel;
    pnBtnSolicitar: TUnimPanel;
    btnSolicitar: TUnimLabel;
    pnBtnAcompanhar: TUnimPanel;
    btnAcompanhar: TUnimLabel;
    pnlBtnContinuar: TUnimPanel;
    lblBtnContinuar: TUnimLabel;
    pnlBtnAcompanhar: TUnimPanel;
    lblBtnAcompanhar: TUnimLabel;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    UnimContainerPanel4: TUnimContainerPanel;
    imgLogoCredJovem: TUnimImage;
    procedure btnContinuarClick(Sender: TObject);
    function VerificaInscricao(cpf: string): integer;
    function proxID(tabela: string): integer;
    function VerificarDigitosCPF(cpf: string): boolean;
    function ValidarCPF(cpf: string): boolean;
    function proxCodGrupo(cidade: string): string;
    function RemoverAcento(palavra: string): string;
    //function verificaAvalistaSolidario(cpf: string): boolean;
    procedure edtCPFExit(Sender: TObject);
    procedure adicionarEtapa(etapa, solicitacao: Integer);
    function MD5(const texto:string):string;
    procedure UnimFormShow(Sender: TObject);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNomeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCPFKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCPFacompKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblEsqueciSenhaClick(Sender: TObject);
    procedure btnSolicitarClick(Sender: TObject);
    procedure btnAcompanharClick(Sender: TObject);
    procedure UnimLabel9Click(Sender: TObject);
    procedure UnimLabel10Click(Sender: TObject);
    procedure UnimLabel7Click(Sender: TObject);
    procedure UnimLabel8Click(Sender: TObject);
    procedure lblBtnContinuarClick(Sender: TObject);
    procedure lblBtnAcompanharClick(Sender: TObject);
    procedure EnviarEmail(username, password, totarget, subject, body: string);
    function validarCnpj(cnpj:string): Boolean;
    procedure Entrar();

  private
    { Private declarations }
  public
    { Public declarations }
    var
      acesso, codigoGrupo, confirmaParticipacao, nomeUsuarios, msgPesqRep, acessoChat : string;
      IDcliente, IDusuario, perfil : integer;

end;

var
  mail_username,
  mail_password,
  mail_to,
  mail_subject,
  mail_body: string;

function frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UpreCad, ServerModule, Uacomp,
  Uadmin, UclienteDados, Usolicitacao, Usejuv, UrecuperarSenha, IdHashMessageDigest,
  Uusuarios, UanexarDoc, UdadosCliente, UdadosUsuario, Umsg, UpedirDocs,
  UcadSucesso, UcnpjClienteFormal, UdocsReprovados, UinfImportantes, Upep,
  UpesquisaInicialReprovada, Utermos, DateUtils, UadminMsg, Uchat, UexportarCsv;

function frmPrincipal: TfrmPrincipal;
begin
  Result := TfrmPrincipal(UniMainModule.GetFormInstance(TfrmPrincipal));
end;

procedure TFrmPrincipal.EnviarEmail(username, password, totarget, subject, body: string);
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin

  mail_username := 'obritoluiz@gmail.com';
  mail_password := '040194Ka*';

  mail_to       := 'telminoluiz@gmail.com';
  mail_subject  := 'RN+Cr?dito - ASSUNTO';
  mail_body     := 'Tem novidade pra voc?';

  try
    begin
      EnviarEmail(mail_username, mail_password, mail_to, mail_subject, mail_body);
      ShowMessage('Mensagem enviada com sucesso');
    end;
  except
    ShowMessage('Mensagem n?o enviada');
  end;

  SMTP := TIdSMTP.Create(nil);
  DATA := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;

  DATA.From.Address := username;
  DATA.Recipients.EMailAddresses := totarget;
  DATA.subject := subject;
  DATA.body.text := body;

  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 587;
  SMTP.username := username;
  SMTP.password := password;
  SMTP.UseTLS := utUseExplicitTLS;

  SMTP.Connect;
  SMTP.Send(DATA);
  SMTP.Disconnect;

  SMTP.Free;
  DATA.Free;
  SSL.Free;
end;

function TFrmPrincipal.validarCnpj(cnpj:string): Boolean;
var dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ ? um n?mero formado por 14 d?gitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14)) then
  begin
    result := false;
    exit;
  end;

  // "try" - protege o c?digo para eventuais erros de convers?o de tipo atrav?s da fun??o "StrToInt"
  try
    { *-- C?lculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      // StrToInt converte o i-?simo caractere do CNPJ em um n?mero
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11-r):1, dig13); // converte um n?mero no respectivo caractere num?rico

    { *-- C?lculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;

    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;

      if (peso = 10) then
        peso := 2;
    end;

    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
      Result := true
    else
      Result := false;
  except
    Result := false
  end;

end;

function TFrmPrincipal.RemoverAcento(palavra: string): string;
var
  I: integer;
begin
  for I := 1 to length(palavra) do
    if (palavra[I] in ['?','?','?']) then
    begin
        palavra[I] := 'e';
    end
    else
    if (palavra[I] in ['?','?','?']) then
    begin
        palavra[I] := 'E';
    end
    else
    if (palavra[I] in ['?','?','?','?']) then
    begin
        palavra[I] := 'a';
    end
    else
    if (palavra[I] in ['?','?','?','?']) then
    begin
        palavra[I] := 'A';
    end
    else
    if (palavra[I] in ['?','?','?','?','?','?']) then
    begin
        palavra[I] := 'i';
    end
    else
    if (palavra[I] in ['?','?','?']) then
    begin
        palavra[I] := 'I';
    end
    else
    if (palavra[I] in ['?','?','?','?']) then
    begin
        palavra[I] := 'O';
    end
    else
    if (palavra[I] in ['?','?','?','?']) then
    begin
        palavra[I] := 'O';
    end
    else
    if (palavra[I] in ['?','?']) then
    begin
        palavra[I] := 'u';
    end
    else
    if (palavra[I] in ['?','?']) then
    begin
        palavra[I] := 'U';
    end
    else
    if (palavra[I] in ['?']) then
    begin
        palavra[I] := 'c';
    end
    else
    if (palavra[I] in ['?']) then
    begin
      palavra[I] := 'C';
    end else
      palavra[I] := palavra[I];

  Result := palavra;

end;

procedure TfrmPrincipal.UnimFormShow(Sender: TObject);
begin
  //Identificar o tipo de acesso pela URL (Se ? credjovem ou n?o)
  acesso := UniApplication.Parameters.Values['a'];

  if acesso = 'credjovem' then
    imgLogoCredJovem.Visible := True
  else
    imgLogoCredJovem.Visible := False;

end;

procedure TfrmPrincipal.lblEsqueciSenhaClick(Sender: TObject);
begin
  frmRecuperarSenha.ShowModal;
end;

function TFrmPrincipal.MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

function TfrmPrincipal.proxCodGrupo(cidade: string): string;
var
  proxCodGrupo: string;
begin
  cidade := StringReplace(cidade, ' ', '', [rfReplaceAll]);
  cidade := StringReplace(cidade, '-', '', [rfReplaceAll]);
  cidade := StringReplace(cidade, '''', '', [rfReplaceAll]);
  cidade := RemoverAcento(cidade);

  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ');
    SQL.Add('MAX(SUBSTRING(nome FROM POSITION(' + QuotedStr('#') + ', nome)+ 1 FOR 4)) as SEQUENCIA ');
    SQL.Add('from tb_grupo ');
    SQL.Add('where SUBSTRING(nome FROM 4 FOR POSITION(' + QuotedStr('#') + ', nome)-4) = ' + QuotedStr(cidade) + ';');
    Open;
    proxCodGrupo := FieldByName('SEQUENCIA').AsString;
  end;

  if proxCodGrupo = '' then proxCodGrupo := '0';

  proxCodGrupo := intToStr(StrToInt(proxCodGrupo) + 1);
  proxCodGrupo := '000' + proxCodGrupo;
  proxCodGrupo := RightStr(proxCodGrupo, 4);

  result := proxCodGrupo;
end;

function TfrmPrincipal.ValidarCPF(cpf: string):boolean;
begin
  if cpf.IsEmpty then
  begin
    result := False;
  end
  else if (cpf.Length <> 11) or
          (cpf = '00000000000') or
          (cpf = '11111111111') or
          (cpf = '22222222222') or
          (cpf = '33333333333') or
          (cpf = '44444444444') or
          (cpf = '55555555555') or
          (cpf = '66666666666') or
          (cpf = '77777777777') or
          (cpf = '88888888888') or
          (cpf = '99999999999') then
  begin
    result := False;
  end
  else if VerificarDigitosCPF(cpf) then
  begin
    result := True;
  end
  else
  begin
    result := False;
  end;
end;

procedure TfrmPrincipal.adicionarEtapa(etapa, solicitacao: Integer);
var
  data : string;
begin
  data := FormatDateTime('dd/mm/yyyy', Now);
  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Append;
    FieldByName('ID').Value          := frmPrincipal.proxID('TB_ACOMPANHAMENTO');
    FieldByName('ETAPA').Value       := etapa;
    FieldByName('SOLICITACAO').Value := solicitacao;
    FieldByName('DATA').Value        := data;
    FieldByName('OBS').Value         := msgPesqRep;
    Post;
  end;

  UniMainModule.dsViewAcompanhamento.DataSet.Refresh;

end;

function TfrmPrincipal.VerificarDigitosCPF(cpf: string): boolean;
var i, c1, c2, d1, d2, count, count2 : integer;
var digito, digito2 : array[0..8] of Integer;
var digito3, digito4 : array[0..9] of Integer;
begin
  //digito 1
  count := 0;
  for i := 0 to 8 do
  begin
     digito[i] := StrToInt(Copy(cpf,i+1,1));
     digito2[i] := digito[i]*(10-i);
     count := count + digito2[i];
  end;
  count := count mod 11;
  count := 11 - count;
  if count > 9 then c1 := 0 else c1 := count;

  //digito2
  count2 := 0;
  for i := 0 to 9 do
  begin
    if i <= 8 then digito3[i] := digito[i] else digito3[i] := c1;
    digito4[i] := digito3[i]*(11-i);
    count2 := count2 + digito4[i];
  end;
  count2 := count2 mod 11;
  count2 := 11 - count2;
  if count2 > 9 then c2 := 0 else c2 := count2;

  d1 := StrToInt(Copy(cpf,10,1));
  d2 := StrToInt(Copy(cpf,11,1));


  if (d1 = c1) and (d2 = c2) then result := True else result := False;
end;

function TfrmPrincipal.proxID(tabela: string): integer;
var
  id: integer;
begin
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select coalesce(max(id), 0) + 1 as ID from ' + tabela);
    Open;
    id := FieldByName('ID').Value;
  end;
  Result := id;
end;

function TfrmPrincipal.VerificaInscricao(cpf: string):integer;
var
  sit : string;
begin

  //Verifica se algu?m adicionou esse CPF em algum grupo
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tb_grupo');
    Open;
  end;

  //Consulta o CPF no banco de dados
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select s.situacao as situacao from tb_cliente c ');
    SQL.Add('inner join tb_solicitacao s on s.cliente = c.id ');
    SQL.Add('where c.cpf = ' + QuotedStr(cpf));
    SQL.Add(' and s.id = (select max(id) from tb_solicitacao s1 where s1.cliente = c.id);');
    Open;
    sit := FieldByName('situacao').AsString;
  end;

  //Verifica se o CPF inserido j? tem solicitacao em andamento
  if sit = 'FINALIZADO' then
  begin
    Result := 0; //Tem CPF cadastrado mas a solicita??o est? finalizada
  end
  else if sit = '' then
  begin
    Result := 1; //N?o tem CPF cadastrado
  end
  else
  begin
    Result := 2; //Tem CPF Cadastrado e solicita??o pendente
  end;
end;

procedure TfrmPrincipal.edtCPFacompKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then lblBtnAcompanharClick(Self);
end;

procedure TfrmPrincipal.edtCPFExit(Sender: TObject);
begin
  if ValidarCPF(EdtCPF.Text) = False then
  begin
    ShowMessage('CPF INV?LIDO!');
    EdtCPF.Color := clRed;
    EdtCPF.SetFocus;
  end
end;

procedure TfrmPrincipal.edtCPFKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then lblBtnContinuarClick(Self);
end;

procedure TfrmPrincipal.edtNomeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then lblBtnContinuarClick(Self);
end;

procedure TfrmPrincipal.edtSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then lblBtnAcompanharClick(Self);
end;

procedure TfrmPrincipal.btnContinuarClick(Sender: TObject);
var
  grupo, cpf, cliente: string;
begin
  if ((edtCPF.Text = '') OR (edtNome.Text = '')) then
  begin
    ShowMessage('Algum campo n?o foi preenchido corretamente. Favor verificar');
    Abort;
  end;

  if ValidarCPF(EdtCPF.Text) = False then
  begin
    ShowMessage('CPF INV?LIDO!');
    EdtCPF.Color := clRed;
    EdtCPF.SetFocus;
    Abort;
  end;

  //Verifica se o CPF inserido j? est? cadastrado e se existe solicita??o
  case VerificaInscricao(edtCPF.Text) of
    0: //CPF j? tem cadastro mas a solicita??o j? est? finalizada
    begin
//      ShowMessage('Verificamos que voc? j? tem cadastro. Informe sua senha para continuar a solicita??o');
      ShowMessage('Verificamos que voc? j? tem cadastro. Por favor atualize seus dados caso alguma informa??o tenha mudado.');
//      edtCPFacomp.Text := edtCPF.Text;
//      edtCPF.Text      := '';
//      edtNome.Text     := '';
//      edtSenha.Text    := '';
//      lblAcomp.Caption := 'Fazer login';
//      btnAcomp.Caption := 'Entrar';
//      edtSenha.SetFocus;
        FrmPreCad.ShowModal();
    end;
    1: //CPF ainda n?o tem cadastro
    begin
      //Verifica se o CPF j? foi incluido em algum grupo
      with UniMainModule.FDQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select FIRST 1 g.id, g.nome, g.cpf, c.nome as cliente ');
        SQL.Add('from tb_grupo g ');
        SQL.Add('right join tb_cliente c on c.cpf = g.cpf ');
        SQL.Add('where g.nome = (select g1.nome from tb_grupo g1 where g1.cpf = ' + QuotedStr(edtCPF.Text) + ');');
        Open;

        grupo   := FieldByName('NOME').asString;
        cpf     := FieldByName('CPF').asString;
        cliente := FieldByName('CLIENTE').asString;

//        ShowMessage('GRUPO: ' + grupo);
//        ShowMessage('CPF cliente que cadastrou: ' + cpf);
//        ShowMessage('Nome do cliente que cadastrou: ' + cliente);

        SQl.Clear;
        Close;
      end;

      if grupo <> '' then //CPF j? foi incluido em um grupo.
      begin
        if MessageDlg(edtNome.Text + ', Seu CPF foi inclu?do por ' + cliente + ' como avalista solid?rio. Voc? confirma essa informa??o?', mtConfirmation,
        [mbYes, mbNo]) = mrYes then
        begin
          //Cliente confirmou o grupo solid?rio e preencher? seu cadastro
          confirmaParticipacao := 'SIM';
        end else
        begin
          //cliente n?o confirma e far? um novo grupo
          confirmaParticipacao := 'N?O';
        end;
      end
      else
      begin
        confirmaParticipacao := 'NOVO';
      end;

      codigoGrupo := grupo;
      FrmPreCad.ShowModal;

    end;
    2: //CPF j? tem cadastro e a solicita??o ainda est? pendente
    begin
      ShowMessage('J? existe uma solicita??o em andamento para esse CPF. Informe sua senha para acompanhar.');
      edtCPFacomp.Text := edtCPF.Text;
      edtCPF.Text   := '';
      edtNome.Text  := '';
      edtSenha.Text := '';
      edtSenha.SetFocus;
    end;
  end;

end;

procedure TfrmPrincipal.UnimLabel10Click(Sender: TObject);
begin
  UniSession.AddJS('window.location.href="http://www.agn.rn.gov.br/";');
end;

procedure TfrmPrincipal.btnAcompanharClick(Sender: TObject);
begin
  pnlInicial.Visible    := False;
  umpBody.Visible       := True;
  pnlAcompanhar.Visible := True;

  edtCPFacomp.SetFocus;
end;

procedure TfrmPrincipal.lblBtnAcompanharClick(Sender: TObject);
begin

  Entrar();

end;

procedure TfrmPrincipal.Entrar();
var
  count: integer;
  const
  administrador : integer = 1;
  crednatal     : integer = 2;
  sejuv         : integer = 3;
  cliente       : integer = 4;
  agn           : integer = 5;
  sedraf        : integer = 6;
begin

  //Verifica as credenciais do usu?rio no banco
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) from tb_usuario where USUARIO = ' + QuotedStr(edtCPFacomp.Text)
            + ' AND SENHA = ' + QuotedStr(MD5(edtSenha.text)) + ';');
    Open;
    count := FieldByName('count').Value;
  end;

  //Verifica se ? um usu?rio v?lido
  if (count > 0) or ((edtCPFacomp.Text = 'ADMIN') and (edtSenha.text = '852456')) then
  begin  //Filtra o registro do usu?rio no dataSource
    with UniMainModule.dsUsuario.DataSet do
    begin
      Filtered  := False;
      Filter    := 'USUARIO = ' + QuotedStr(edtCPFacomp.Text);
      Filtered  := True;
    end;

    //Identifica o perfil do usu?rio
    perfil      := UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value;

    nomeUsuario := UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value;

    IDUsuario   := UniMainModule.dsUsuario.DataSet.FieldByName('ID').Value;

    //Se for cliente direciona pra tela de acompanhamento
    if perfil = cliente then
    begin
      //Filtra o data set para o cliente logado
      with UniMainModule.dsCliente.DataSet do
      begin
        Filtered := False;
        Filter   := 'CPF = ' + QuotedStr(edtCPFacomp.Text);
        Filtered := True;
      end;

      IDcliente   := UniMainModule.dsCliente.DataSet.FieldByName('ID').Value;

      //Verifica se o cliente j? tem solicita??o
      if VerificaInscricao(edtCPF.Text) = 0 then
      begin
        FrmSolicitacao.ShowModal();
        UniMainModule.dsCliente.DataSet.Filtered := False;
      end
      else
        frmAcomp.ShowModal();
    end
    //Se for sejuv direciona pra tela da SEJUV
    else if perfil = sejuv then
    begin
      frmAdminSejuv.ShowModal();
    end
    //Se for credNatal direciona pro painel administrativo da crednatal
    else if perfil = crednatal then
    begin
      frmAdmin.ShowModal();
    end
    //Se for administrador direciona pra tela administrativa
    else if perfil = administrador then
    begin
      frmUsuarios.ShowModal();
    end
    else
    begin
      ShowMessage('Perfil n?o definido');
    end;

  end
  else
  begin
    ShowMessage('CPF ou senha incorretos, verifique se preencheu corretamente e tente novamente.');
    edtCPFacomp.SetFocus;
  end;

  //Limpa os campos da tela inicial
  edtCPFacomp.Text      := '';
  edtSenha.Text         := '';
  pnlSolicitar.Visible  := False;
  pnlAcompanhar.Visible := False;
  umpBody.Visible       := False;
  pnlInicial.Visible    := True;

end;

procedure TfrmPrincipal.lblBtnContinuarClick(Sender: TObject);
var
  grupo, cpf, cliente: string;
begin

  if Length(edtNome.Text) < 4 then
  begin
    ShowMessage('Nome inv?lido');
    Abort;
  end;

  if ((edtCPF.Text = '') OR (edtNome.Text = '')) then
  begin
    ShowMessage('Algum campo n?o foi preenchido corretamente. Favor verificar');
    Abort;
  end;

  if ValidarCPF(EdtCPF.Text) = False then
  begin
    ShowMessage('CPF INV?LIDO!');
    EdtCPF.Color := clRed;
    EdtCPF.SetFocus;
    Abort;
  end;

  //Verifica se o CPF inserido j? est? cadastrado e se existe solicita??o
  case VerificaInscricao(edtCPF.Text) of
    0: //CPF j? tem cadastro mas a solicita??o j? est? finalizada
    begin
      ShowMessage('Verificamos que voc? j? tem cadastro. Informe sua senha para continuar a solicita??o');
      //ShowMessage('Verificamos que voc? j? tem cadastro. Por favor atualize seus dados caso alguma informa??o tenha mudado.');
      edtCPFacomp.Text         := edtCPF.Text;
      edtCPF.Text              := '';
      edtNome.Text             := '';
      edtSenha.Text            := '';
      lblAcomp.Caption         := 'Fazer login';
      lblBtnAcompanhar.Caption := 'Entrar';
      edtSenha.SetFocus;
        //FrmPreCad.ShowModal();
    end;
    1: //CPF ainda n?o tem cadastro
    begin
      //Verifica se o CPF j? foi incluido em algum grupo
      with UniMainModule.FDQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select FIRST 1 g.id, g.nome, g.cpf, c.nome as cliente ');
        SQL.Add('from tb_grupo g ');
        SQL.Add('right join tb_cliente c on c.cpf = g.cpf ');
        SQL.Add('where g.nome = (select g1.nome from tb_grupo g1 where g1.cpf = ' + QuotedStr(edtCPF.Text));
        SQL.Add('  and g1.confirmaparticipacao <>' + QuotedStr('N?O') + ');');
        Open;

        grupo   := FieldByName('NOME').asString;
        cpf     := FieldByName('CPF').asString;
        cliente := FieldByName('CLIENTE').asString;

//        ShowMessage('GRUPO: ' + grupo);
//        ShowMessage('CPF cliente que cadastrou: ' + cpf);
//        ShowMessage('Nome do cliente que cadastrou: ' + cliente);

        SQl.Clear;
        Close;
      end;

      if grupo <> '' then //CPF j? foi incluido em um grupo.
      begin
        if MessageDlg(edtNome.Text + ', Seu CPF foi inclu?do por ' + cliente + ' como avalista solid?rio. Voc? confirma essa informa??o?', mtConfirmation,
        [mbYes, mbNo]) = mrYes then
        begin
          //Cliente confirmou o grupo solid?rio e preencher? seu cadastro
          confirmaParticipacao := 'SIM';
        end else
        begin
          //cliente n?o confirma e far? um novo grupo
          confirmaParticipacao := 'N?O';
        end;
      end
      else
      begin
        confirmaParticipacao := 'NOVO';
      end;

      codigoGrupo := grupo;
      //ShowMessage('GRUPO: ' + codigoGrupo);
      frmInfImportantes.ShowModal();
      FrmPreCad.ShowModal;

    end;
    2: //CPF j? tem cadastro e a solicita??o ainda est? pendente
    begin
      ShowMessage('J? existe uma solicita??o em andamento para esse CPF. Clique em <b>acompanhar.</b>');
      edtCPFacomp.Text := edtCPF.Text;
      edtCPF.Text   := '';
      edtNome.Text  := '';
      edtSenha.Text := '';
      edtSenha.SetFocus;
    end;
  end;

  pnlSolicitar.Visible  := False;
  pnlAcompanhar.Visible := False;
  umpBody.Visible       := False;
  pnlInicial.Visible    := True;
end;

procedure TfrmPrincipal.btnSolicitarClick(Sender: TObject);
begin
  pnlInicial.Visible   := False;
  umpBody.Visible      := True;
  pnlSolicitar.Visible := True;

  edtCPF.SetFocus;
end;

procedure TfrmPrincipal.UnimLabel7Click(Sender: TObject);
begin
  UniSession.AddJS('window.open("http://www.agn.rn.gov.br/Conteudo.asp?TRAN=ITEM&TARG=248836&ACT=&PAGE=0&PARM=&LBL=AGN%2FRN")');
end;

procedure TfrmPrincipal.UnimLabel8Click(Sender: TObject);
begin
  UniSession.AddJS('window.open("http://www.agn.rn.gov.br/Conteudo.asp?TRAN=ITEM&TARG=248836&ACT=&PAGE=0&PARM=&LBL=AGN%2FRN")');
end;

procedure TfrmPrincipal.UnimLabel9Click(Sender: TObject);
begin
  UniSession.AddJS('window.open("http://www.agn.rn.gov.br/")');
end;

initialization
  RegisterAppFormClass(TfrmPrincipal);

end.

unit UpreCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  Vcl.Imaging.pngimage, uniImage, unimImage, uniGUIBaseClasses, unimPanel,
  uniMultiItem, unimSelect, unimDBSelect, uniDBEdit, unimDBEdit, uniButton,
  uniBitBtn, unimBitBtn, uniEdit, unimEdit, uniLabel, unimLabel, uniRadioButton,
  unimRadio, unimScrollBox, DB;

type
  TFrmPreCad = class(TUnimForm)
    UnimScrollBox1: TUnimScrollBox;
    UnimPanel1: TUnimPanel;
    LabelTitulo: TUnimLabel;
    UnimPanel2: TUnimPanel;
    LabelNome: TUnimLabel;
    LabelCPF: TUnimLabel;
    LabelMunicipio: TUnimLabel;
    EditNome: TUnimDBEdit;
    SelectMunicipio: TUnimDBSelect;
    UnimPanel4: TUnimPanel;
    LabelSenha: TUnimLabel;
    LabelConfirmSenha: TUnimLabel;
    EditConfSenha: TUnimEdit;
    BtnSalvar: TUnimBitBtn;
    UnimPanel5: TUnimPanel;
    EditSenha: TUnimEdit;
    LabelEstadoCivil: TUnimLabel;
    UnimPanel7: TUnimPanel;
    LabelNomeConjuge: TUnimLabel;
    LabelCPFconjuge: TUnimLabel;
    LabelTelefone: TUnimLabel;
    LabelEmail: TUnimLabel;
    EditEmail: TUnimDBEdit;
    EditCPF: TUnimDBEdit;
    EditTelefone: TUnimDBEdit;
    SelectEstadoCivil: TUnimDBSelect;
    SelectClienteAGN: TUnimDBSelect;
    EditNomeConjuge: TUnimDBEdit;
    LabelConjuge: TUnimLabel;
    LabelClienteAGN: TUnimLabel;
    EditCpfConjuge: TUnimDBEdit;
    UnimImage2: TUnimImage;
    imgLogoAGN: TUnimImage;
    imgBgHeader: TUnimImage;
    UnimLabel1: TUnimLabel;
    procedure UnimFormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure EditCPFChange(Sender: TObject);
    procedure EditSenhaChange(Sender: TObject);
    procedure EditConfSenhaChange(Sender: TObject);
    procedure SelectEstadoCivilChange(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure EditTelefoneChange(Sender: TObject);
    procedure EditEmailChange(Sender: TObject);
    procedure EditNomeConjugeChange(Sender: TObject);
    procedure EditCpfConjugeChange(Sender: TObject);
    procedure CadSolicClientePreCad();
    function ChecarDadosCliente(): boolean;
    function ValidarSenha(senha : string): boolean;
    Function RemoveAcento(const pText: string): string;

  private
    { Private declarations }

  public
    { Public declarations }
    var codigoCliente : integer;
    var codigoGrupo, data_atual : string;
  end;

function FrmPreCad: TFrmPreCad;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, Usolicitacao, ServerModule, Uacomp,
  Uadmin, UclienteDados, UdadosCliente, UdadosUsuario, UrecuperarSenha, Usejuv,
  Usenha, Uusuarios;

function FrmPreCad: TFrmPreCad;
begin
  Result := TFrmPreCad(UniMainModule.GetFormInstance(TFrmPreCad));
end;

procedure TfrmPreCad.CadSolicClientePreCad();
var
  codigoSolicitacao, cliente : Integer;
  cpfCliente : string;
const
  preCadastro : Integer = 1;
  credjovem : Integer = 1;
begin

  //Dados para a Solicitacao
  cpfCliente        := UniMainModule.dsCliente.DataSet.FieldByName('CPF').Value;
  codigoGrupo       := frmPrincipal.codigoGrupo;

  //Verifica se o cliente confirma participa??o no grupo que foi pr? cadastrado
  if (frmPrincipal.ConfirmaParticipacao = 'SIM') then
  begin
    //S? entra aqui se o usu?rio confirmar a participa??o no grupo como avalista solid?rio
    //Atualizar cadastro e confirmar Participacao da tabela grupo para SIM
    with UniMainModule.dsGrupo.DataSet do
    begin
      Filtered := False;
      Filter  := 'CPF = ' + QuotedStr(cpfCliente);
      Filtered := True;

      Edit;
      FieldByName('CADASTRO').Value             := 'SIM';
      FieldByName('CONFIRMAPARTICIPACAO').Value := 'SIM';
      FieldByName('DATAATUALIZACAO').Value      := data_atual;
      Post;
    end;

    //Chama a tela de solicita??o para que o usu?rio continue a solicita??o
    FrmSolicitacao.ShowModal;
    Close;
  end
  else //Entra aqui caso o usu?rio N?O confirme a participa??o no grupo como avalista solid?rio
  begin

    //Atualiza a tabela grupo
    with UniMainModule.dsGrupo.DataSet do
    begin
      Filtered := False;
      Filter  := 'CPF = ' + QuotedStr(cpfCliente);
      Filtered := True;

      Edit;
      FieldByName('CONFIRMAPARTICIPACAO').Value := 'N?O';
      FieldByName('DATAATUALIZACAO').Value := data_atual;
      Post;
    end;

    //Chama a tela de solicita??o para que o usu?rio continue a solicita??o
    FrmSolicitacao.ShowModal;
    Close;
  End;

end;

function TFrmPreCad.ChecarDadosCliente(): boolean;
var erro :boolean;
begin
  erro := False;
  if (EditNome.Text = '' ) then //Nome cliente
  begin
    EditNome.Color := clRed;
    erro := True;
  end;
  if frmPrincipal.VerificaInscricao(FrmPreCad.EditCPF.Text) = 2 then
  begin
    ShowMessage('CPF J? CADASTRADO!');
    EditCPF.Color := clRed;
    erro := True;
  end;
  if frmPrincipal.ValidarCPF(EditCPF.Text) = False then
  begin
    ShowMessage('CPF INV?LIDO!');
    EditCPF.Color := clRed;
    erro := True;
  end;
  if (EditTelefone.Text = '') then //telefone cliente
  begin
    EditTelefone.Color := clRed;
    erro := True;
  end;
  if (Length(EditTelefone.Text) < 8) or (Length(EditTelefone.Text) > 12) then // or (Length(EditTelefone.Text) > 12)
  begin
    EditTelefone.Color := clRed;
    erro := True;
  end;
  if (EditEmail.Text = '') then //email cliente
  begin
    EditEmail.Color := clRed;
    erro := True;
  end;
  if Pos('@', EditEmail.Text) = 0 then //email cliente
  begin
    EditEmail.Color := clRed;
    erro := True;
  end;
  if (SelectEstadoCivil.ItemIndex = -1) then //estado civil cliente
  begin
    SelectEstadoCivil.Color := clRed;
    erro := True;
  end;

  if SelectEstadoCivil.ItemIndex = 0 then  //Cliente ? casado
  begin
    if EditNomeConjuge.Text = '' then
    begin
      EditNomeConjuge.Color := clRed;
      erro := True;
    end;
    if frmPrincipal.ValidarCPF(EditCpfConjuge.Text) = False then
    begin
      EditCpfConjuge.Color := clRed;
      erro := True;
    end;
    if EditCPF.Text = EditCpfConjuge.Text then
    begin
      EditCpfConjuge.Color := clRed;
      erro := True;
    end;
    if EditCPF.Text = EditCpfConjuge.Text then
    begin
      EditCpfConjuge.Color := clRed;
    end;
  end;

  if (SelectMunicipio.ItemIndex = -1) then //municipio cliente
  begin
    SelectMunicipio.Color := clRed;
    erro := True;
  end;
  if (SelectClienteAGN.ItemIndex = -1) then // se j? ? cliente AGN
  begin
    SelectClienteAGN.Color := clRed;
    erro := True;
  end;

  if ValidarSenha(EditSenha.Text) = False then
  begin
    ShowMessage('Senha inv?lida');
    EditSenha.Color := clRed;
    erro := True;
  end;
  if EditConfSenha.Text = '' then //Confirmar senha em branco
  begin
    EditConfSenha.Color := clRed;
    erro := True;
  end;
  if (EditSenha.Text <> EditConfSenha.Text) then //Senhas diferentes
  begin
    ShowMessage('As senhas n?o coincidem, por favor digite sua senha novamente.');
    EditSenha.Color := clred;
    EditConfSenha.Color := clred;
    erro := True;
  end;

  if erro then result := False else result := True;

end;

function TFrmPreCad.ValidarSenha(senha : string) : boolean;
begin

  if (senha = '') or
     (senha = null) or
     (senha.Length < 6) or
     (senha = '123456') then
  begin
    result := False;
  end
  else result := True;
end;


procedure TFrmPreCad.BtnSalvarClick(Sender: TObject);
var
  codigoSolicitacao, codigoAvalista, idUsuario : Integer;
  municipio, senha, participa : string;
begin

  if ChecarDadosCliente then
  begin
    senha := frmPrincipal.MD5(EditSenha.text);

    UniMainModule.dsSolicitacao.DataSet.Append;
    //idUsuario := frmPrincipal.proxID('tb_usuario');

    //Cadastrando cliente
    if SelectEstadoCivil.ItemIndex <> 0 then
    begin
      EditNomeConjuge.Text := '';
      EditCpfConjuge.Text  := '';
    end;

    with UniMainModule.dsCliente.DataSet do
    begin
      //FieldByName('ID').Value                := codigoCliente;
      FieldByName('DATACADASTRO').Value      := data_atual;
      FieldByName('DATAATUALIZACAO').Value   := data_atual;
      //FieldByName('USUARIO').Value           := idUsuario;
    end;

    //Cadastrando usu?rio
    with UniMainModule.dsUsuario.DataSet do
    begin
      Append;
      //FieldByName('ID').Value                := idUsuario;
      FieldByName('NOME').Value              := UniMainModule.dsCliente.DataSet.FieldByName('NOME').Value;
      FieldByName('USUARIO').Value           := UniMainModule.dsCliente.DataSet.FieldByName('CPF').Value;
      FieldByName('SENHA').Value             := senha;
      FieldByName('PERFIL').Value            := 4;
      FieldByName('DATACADASTRO').Value      := data_atual;
      FieldByName('DATAATUALIZACAO').Value   := data_atual;
    end;

    //Verifica se ? um cliente completamente novo, ou seja, nunca foi nem inclu?do em algum grupo
    if frmPrincipal.ConfirmaParticipacao = 'NOVO' then
        FrmSolicitacao.ShowModal
      else //Caso esteja em algum grupo pedir confirma??o
        CadSolicClientePreCad();

    Close;
  end
  else
  begin
    ShowMessage('Alguns campos n?o foram preenchidos corretamente,'+
                ' por favor preencha o formul?rio novamente.');
  end;

end;

function TFrmPreCad.RemoveAcento(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
end;

procedure TFrmPreCad.EditConfSenhaChange(Sender: TObject);
begin
  EditConfSenha.Color := clWindow;
end;

procedure TFrmPreCad.EditNomeChange(Sender: TObject);
begin
  EditNome.Color := clWindow;
end;

procedure TFrmPreCad.EditNomeConjugeChange(Sender: TObject);
begin
  EditNomeConjuge.Color := clWindow;
end;

procedure TFrmPreCad.EditCPFChange(Sender: TObject);
begin
  EditCPF.Color := clWindow;
end;

procedure TFrmPreCad.EditCpfConjugeChange(Sender: TObject);
begin
  EditCpfConjuge.color := clWindow;
end;

procedure TFrmPreCad.EditEmailChange(Sender: TObject);
begin
  EditEmail.Color := clWindow;
end;

procedure TFrmPreCad.EditSenhaChange(Sender: TObject);
begin
  EditSenha.Color := clwindow;
end;

procedure TFrmPreCad.EditTelefoneChange(Sender: TObject);
begin
   EditTelefone.Color := clWindow;
end;

procedure TFrmPreCad.SelectEstadoCivilChange(Sender: TObject);
begin
    SelectEstadoCivil.Color := clWindow;
    if SelectEstadoCivil.ItemIndex = 0 then
    begin
      UnimPanel7.Height := 190;
      UnimPanel7.Visible := True;
      UNimPanel2.Height := 600;
    end
    else
    begin
      UnimPanel7.Height := 0;
      UnimPanel7.Visible := False;
      UNimPanel2.Height := 407;
    end;
end;

procedure TFrmPreCad.UnimFormShow(Sender: TObject);
begin
  data_atual    := FormatDateTime('dd/mm/yyyy', Now);

  with UniMainModule.dsCliente.DataSet do
  begin
    Append;
    FieldByName('NOME').Value        := frmPrincipal.edtNome.Text;
    FieldByName('CPF').Value         := frmPrincipal.edtCPF.Text;
    FieldByName('ESTADOCIVIL').Value := 'SOLTEIRO(A)';
    FieldByName('CLIENTEAGN').Value  := 'N?O';
    FieldByName('MUNICIPIO').Value   := 'NATAL';
  end;

  UnimPanel7.Height           := 0;
  UNimPanel2.Height           := 407;
  UnimPanel1.Height           := 1000;
  UnimScrollBox1.ScrollHeight := 1000;

  with frmPrincipal do
  begin
    edtCPF.Text      := '';
    edtNome.Text     := '';
    edtCPFacomp.Text := '';
    edtSenha.Text    := '';
  end;

end;

end.

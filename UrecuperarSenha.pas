unit UrecuperarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, uniBitBtn, unimBitBtn, uniMemo, unimMemo, uniEdit, unimEdit,
  uniLabel, unimLabel, Vcl.Imaging.pngimage, uniImage, unimImage, unimPanel,
  uniGUIBaseClasses, unimScrollBox, unimButton, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdBaseComponent, IdMessage;



type
  TfrmRecuperarSenha = class(TUnimForm)
    scrlBody: TUnimScrollBox;
    umpBody: TUnimPanel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimPanel1: TUnimPanel;
    LabelCPF: TUnimLabel;
    EditCPF: TUnimEdit;
    LabelTelefone: TUnimLabel;
    EditTelefone: TUnimEdit;
    LabelEmail: TUnimLabel;
    EditEmail: TUnimEdit;
    BtnEnviar: TUnimButton;
    UnimPanel2: TUnimPanel;
    LabelNovaSenha: TUnimLabel;
    EditNovaSenha: TUnimEdit;
    LabelConfirmarSenha: TUnimLabel;
    EditConfirmarSenha: TUnimEdit;
    UnimButton1: TUnimButton;
    procedure BtnEnviarClick(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cpf : string;
  telefone : string;
  email : string;
  senha : string;

function frmRecuperarSenha: TfrmRecuperarSenha;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, uniGUIApplication, Usenha;

function frmRecuperarSenha: TfrmRecuperarSenha;
begin
  Result := TfrmRecuperarSenha(UniMainModule.GetFormInstance(TfrmRecuperarSenha));
end;




procedure TfrmRecuperarSenha.BtnEnviarClick(Sender: TObject);
var
  nome : string;
  emailSalvo : string;
  telefoneSalvo : string;
begin
  cpf := EditCPF.Text;
  telefone := EditTelefone.Text;
  email := EditEmail.Text;

  if (Length(cpf) = 0) OR (Length(telefone) = 0) OR (Length(email) = 0) then
  begin
    ShowMessage('Voc? n?o preencheu todos os campos, por favor digite as informa??es novamente.');
  end
  else
  begin
    with UniMainModule.dsUsuario.DataSet do
    begin
      Filtered := False;
      Filter   := 'usuario = ' + QuotedStr(cpf);
      Filtered := True;
    end;

    if UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value <> NULL then
    begin
      nome := UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value;
      ShowMessage('Seu nome ?: ' + nome);
      with UniMainModule.dsCliente.DataSet do
      begin
        Filtered := False;
        Filter   := 'cpf = ' + QuotedStr(cpf);
        Filtered := True;
      end;
      emailSalvo := UniMainModule.dsCliente.DataSet.FieldByName('EMAIL').Value;
      telefoneSalvo := UniMainModule.dsCliente.DataSet.FieldByName('TELEFONE').Value;
      if (email <> emailSalvo) OR (telefone <> telefoneSalvo) then
      begin
        ShowMessage('Dados incorretos.');
      end
      else
      begin
        UnimPanel1.Visible := False;
        UnimPanel1.Height := 0;
        UnimPanel2.Visible := True;
      end;

    end
    else
    begin
      ShowMessage('N?o existe usu?rio cadastrado para esse CPF!');
    end;

  end;


end;

procedure TfrmRecuperarSenha.UnimButton1Click(Sender: TObject);
var
  senha : string;
  senhaNova  : string;
  senhaConf  : string;
begin
  senha := UniMainModule.dsUsuario.DataSet.FieldByName('SENHA').Value;
  senhaNova := EditNovaSenha.Text;
  senhaConf := EditConfirmarSenha.Text;

  case Usenha.recuperarSenha(senha, senhaNova, senhaConf) of
    1:
    begin
      with UniMainModule.dsUsuario.DataSet do
      begin
        edit;
        FieldByName('SENHA').Value := frmPrincipal.MD5(senhaNova);
        post;
      end;
      ShowMessage('Senha alterada com sucesso.');
      close;
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
    end
    else
    begin
      ShowMessage('N?o foi poss?vel alterar a senha');
    end;
  end;

end;

end.

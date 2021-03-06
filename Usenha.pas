unit Usenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm;

type
  TFunctionSenha = class(TUnimForm)

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FunctionSenha: TFunctionSenha;
function alterarSenha(senhaAtual : string; senhaAtualMD5 : string; senhaSalva : string; senhaNova : string; senhaNovaConf : string): Integer;
function recuperarSenha(senhaSalva : string; senhaNova : string; senhaNovaConf : string): Integer;
function validarSenha(senhaNova : string; senhaNovaConf : string): Integer;

implementation

{$R *.dfm}

uses
  MainModule, Mainm, uniGUIApplication;

function FunctionSenha: TFunctionSenha;
begin
  Result := TFunctionSenha(UniMainModule.GetFormInstance(TFunctionSenha));
end;

function alterarSenha(senhaAtual : string; senhaAtualMD5 : string; senhaSalva : string; senhaNova : string; senhaNovaConf : string): Integer;
var
  senhaNovaMD5 :string;
begin
  if senhaAtualMD5 = senhaSalva then
  begin
    if senhaNova = senhaNovaConf then
    begin
      senhaNovaMD5 := frmPrincipal.MD5(senhaNova);

      if (senhaNova = '') or
         (senhaNova = NULL) or
         (senhaNova.Length < 6) or
         (senhaNova = '123456') then
      begin
//        ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
        result := 2;
      end
      else if senhaAtual = senhaNovaMD5 then
      begin
//        ShowMessage('Erro, a senha nova precisa ser diferente da senha antiga.');
        result := 3;
      end
      else
      begin
//        with UniMainModule.dsUsuario.DataSet do
//        begin
//          edit;
//          FieldByName('SENHA').Value := senhaNovaMD5;
//          post;
//        end;
//        ShowMessage('Senha alterada com sucesso.');
        result := 1;
      end;
    end
    else
    begin
//      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
      result := 4;
    end;
  end
  else
  begin
//    ShowMessage('Senha atual n?o foi inserida corretamente');
    result := 5;
  end;
end;



function recuperarSenha(senhaSalva : string; senhaNova : string; senhaNovaConf : string): Integer;
var
  senhaNovaMD5 :string;
begin
  if senhaNova = senhaNovaConf then
  begin
    senhaNovaMD5 := frmPrincipal.MD5(senhaNova);

    if (senhaNova = '') or
       (senhaNova = NULL) or
       (senhaNova.Length < 6) or
       (senhaNova = '123456') then
    begin
//        ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
      result := 2;
    end
    else if senhaSalva = senhaNovaMD5 then
    begin
//        ShowMessage('Erro, a senha nova precisa ser diferente da senha antiga.');
      result := 3;
    end
    else
    begin
//        with UniMainModule.dsUsuario.DataSet do
//        begin
//          edit;
//          FieldByName('SENHA').Value := senhaNovaMD5;
//          post;
//        end;
//        ShowMessage('Senha alterada com sucesso.');
      result := 1;
    end;
  end
  else
  begin
//      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
    result := 4;
  end;

end;

function validarSenha(senhaNova : string; senhaNovaConf : string): Integer;
begin
  if senhaNova = senhaNovaConf then
  begin
    if (senhaNova = '') or
       (senhaNova = NULL) or
       (senhaNova.Length < 6) or
       (senhaNova = '123456') then
    begin
//        ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
      result := 2;
    end
    else
    begin
//        with UniMainModule.dsUsuario.DataSet do
//        begin
//          edit;
//          FieldByName('SENHA').Value := senhaNovaMD5;
//          post;
//        end;
//        ShowMessage('Senha alterada com sucesso.');
      result := 1;
    end;
  end
  else
  begin
//      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
    result := 3;
  end;

end;

end.

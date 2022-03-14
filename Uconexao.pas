unit Uconexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniEdit, unimEdit, uniGUIBaseClasses, uniLabel, unimLabel, uniButton,
  unimButton;

type
  TfrmConexao = class(TUnimForm)
    umeServidor: TUnimEdit;
    umeUsusario: TUnimEdit;
    umeSenha: TUnimEdit;
    umbConectar: TUnimButton;
    procedure umbConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmConexao: TfrmConexao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UdadosCliente, UdadosUsuario, UpreCad, Usejuv, Usolicitacao,
  Uusuarios;

function frmConexao: TfrmConexao;
begin
  Result := TfrmConexao(UniMainModule.GetFormInstance(TfrmConexao));
end;

procedure TfrmConexao.umbConectarClick(Sender: TObject);
var
  server, user, pass : string;
begin
  server := umeServidor.Text;
  user   := umeUsusario.Text;
  pass   := umeSenha.Text;


  try
    with UniMainModule.FDConnection do
    begin
      Params.Database := server;
      Params.UserName := user;
      Params.Password := pass;

      Connected := true;
    end;
  finally

  end;

end;

end.

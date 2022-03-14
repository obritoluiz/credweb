unit UpesquisaInicialReprovada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniMemo, uniDBMemo, unimDBMemo, uniButton, unimButton, uniLabel, unimLabel,
  uniGUIBaseClasses, unimMemo;

type
  TfrmPesqPendencia = class(TUnimForm)
    UnimContainerPanel1: TUnimContainerPanel;
    UnimLabel1: TUnimLabel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimButton1: TUnimButton;
    UnimContainerPanel3: TUnimContainerPanel;
    lblCaracRest: TUnimLabel;
    mmMsg: TUnimMemo;
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure mmMsgChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPesqPendencia: TfrmPesqPendencia;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UcadSucesso, UcnpjClienteFormal, UdadosCliente, UdadosUsuario,
  UdocsReprovados, Umsg, UpedirDocs, Upep, UpreCad, UrecuperarSenha, Usejuv,
  Usolicitacao, Utermos, Uusuarios;

function frmPesqPendencia: TfrmPesqPendencia;
begin
  Result := TfrmPesqPendencia(UniMainModule.GetFormInstance(TfrmPesqPendencia));
end;

procedure TfrmPesqPendencia.mmMsgChange(Sender: TObject);
var
  caracteres, restantes, limite : integer;
begin
  limite     := 2000;
  caracteres := Length(mmMsg.Text);
  restantes  := limite - caracteres;

  lblCaracRest.Text := 'Carácteres restantes: ' + IntToStr(restantes);

  if Length(mmMsg.Text) > limite then
    lblCaracRest.Color := $000D33A6
  else
    lblCaracRest.Color := clBlack;

end;

procedure TfrmPesqPendencia.UnimButton1Click(Sender: TObject);
begin
  //Verifica se não passou o limite de caracteres
  if Length(mmMsg.Text) > 2000 then
  begin
    ShowMessage('Limite de caractéres ultrapassado. Máximo 2000 caractéres.');
    mmMsg.SetFocus;
    Abort;
  end;

  //Salva o texto do memo na variável global e fecha a tela
  frmPrincipal.msgPesqRep := mmMsg.Text;
  Close;
end;

procedure TfrmPesqPendencia.UnimFormShow(Sender: TObject);
begin
  //Carrega o texto para o memo
  mmMsg.Text := frmPrincipal.msgPesqRep;
  mmMsg.SetFocus;

  //Atualiza o contador de caracteres
  lblCaracRest.Text := 'Carácteres restantes: ' + IntToStr(2000 - Length(mmMsg.Text));
end;

end.

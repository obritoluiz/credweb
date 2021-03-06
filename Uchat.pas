unit Uchat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, uniMemo, unimMemo, unimScrollBox, uniGUIBaseClasses,
  unimPanel, uniLabel, unimLabel, uniEdit, unimEdit, uniTimer, uniScrollBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmChat = class(TUnimForm)
    pnlRodape: TUnimPanel;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    btnEnviar: TUnimButton;
    lblSair: TUnimLabel;
    lblMsg: TUnimEdit;
    lblCabecalho: TUnimLabel;
    UniTimer: TUniTimer;
    scrMensagens: TUnimScrollBox;
    UnimLabel1: TUnimLabel;
    qryMsg: TFDQuery;
    dsMsg: TDataSource;
    procedure btnEnviarClick(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure CriarBalaoDialogo(id: integer);
    procedure UnimFormShow(Sender: TObject);
    procedure carregarChat();
    procedure UniTimerTimer(Sender: TObject);
    procedure VerMsg();

  private
    { Private declarations }
  public
  var
    ctnChat : TUnimContainerPanel;
    I, cliente : integer;
    acesso : string;
  end;

function frmChat: TfrmChat;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UcadSucesso, UcnpjClienteFormal, UdadosCliente, UdadosUsuario,
  UdocsReprovados, UexportarCsv, UinfImportantes, Umsg, UpedirDocs, Upep,
  UpesquisaInicialReprovada, UpreCad, UrecuperarSenha, Usejuv, Usolicitacao,
  Utermos, Uusuarios;

function frmChat: TfrmChat;
begin
  Result := TfrmChat(UniMainModule.GetFormInstance(TfrmChat));
end;

procedure TfrmChat.VerMsg();
begin

  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tb_chat set VISTO = ' + QuotedStr('SIM') +
              ' where cliente = ' + intToStr(cliente) + ' and remetente = ');
    if acesso = 'cliente' then SQL.Add(QuotedStr('AGN')) else SQL.Add(QuotedStr('CLIENTE'));
    ExecSQL;

    SQL.Clear;
    SQl.Add('commit;');
    ExecSQL;
  end;
  //UniMainModule.conectar;

end;

procedure TfrmChat.carregarChat();
var
  id, cliente: integer;
begin

  //Criando Container do CHAT de mensagem
  ctnChat.Free;
  ctnChat        := TUnimContainerPanel.Create(scrMensagens);
  ctnChat.Top    := 5;
  ctnChat.Height := 5000;
  ctnChat.Width  := 295;
  ctnChat.Parent := scrMensagens;
  //Application.ProcessMessages;

  cliente := UniMainModule.dsCliente.DataSet.FieldByName('ID').Value;

  with qryMsg do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id from tb_chat where cliente = ' + IntToStr(cliente));
    SQL.Add(' order by id');
    Open;
    Active := True;
  end;

  with dsMsg.DataSet do
  begin
    I := 0;
    First;
    while not eof do
    begin
      id := FieldByName('ID').Value;
      CriarBalaoDialogo(id);
      I := I + 1;
      Next;
    end;

    First;

  end;

end;

procedure TfrmChat.CriarBalaoDialogo(id: integer);
var
  ctn : TUnimContainerPanel;
  User, msg, data : TunimLabel;
  remetente, nomeOperador : string;
  operador : integer;
begin
  //Filtrando a mensagem no banco
  with UniMainModule.dsChat.DataSet do
  begin
    Filtered := False;
    Filter   := 'ID = ' + intToStr(id);
    Filtered := True;

    remetente := FieldByName('REMETENTE').Value;
    operador  := FieldByName('OPERADOR').Value;
  end;

  //Pega o nome do operador da AGN que enviou a mensagem no banco
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tb_usuario where ID = ' + intToStr(operador));
    Open;
    nomeOperador := FieldByName('NOME').Value;
  end;

  //Criando bal?o de mensagem
  ctn := TUnimContainerPanel.Create(ctnChat);

  if acesso = 'agn' then  //acessando como operador da AGN
  begin
    if remetente = 'AGN' then   //mensagem da agn
    begin
     ctn.Margins.Left     := 35;
     ctn.Margins.Right    := 10;
     ctn.Color            := $00D7FFD7;  //verde
    end
    else    //mensagem do cliente
    begin
      ctn.Margins.Left     := 10;
      ctn.Margins.Right    := 35;
      ctn.Color            := $00FDE8CC; //azul
    end;
  end
  else  //acessando como cliente
  begin
    if remetente = 'AGN' then   //mensagem da agn
    begin
     ctn.Margins.Left     := 10;
     ctn.Margins.Right    := 35;
     ctn.Color            := $00FDE8CC;  //azul
    end
    else    //mensagem do cliente
    begin
      ctn.Margins.Left     := 35;
      ctn.Margins.Right    := 10;
      ctn.Color            := $00D7FFD7; //verde
    end;
  end;

  ctn.Height           := 85;
  ctn.Top              := ctnChat.Height;
  ctn.Align            := alBottom;
  ctn.AlignWithMargins := True;
  ctn.Parent           := ctnChat;

  //Criando label de usu?rio
  user := TUnimLabel.Create(ctn);

  user.Align             := alTop;
  user.AlignWithMargins  := True;

  if remetente = 'AGN' then   //mensagem da agn
  begin
    user.Caption           := 'Op. AGN - ' + nomeOperador;
  end
  else //mensagem do cliente
  begin
    if acesso = 'agn' then
    begin
      user.Caption         := 'Cliente - ' + Copy(UniMainModule.dsCliente.DataSet.FieldByName('NOME').Value,1,20) + '.'
    end
    else
    begin
      user.Caption         := 'Eu - ' + Copy(UniMainModule.dsCliente.DataSet.FieldByName('NOME').Value,1,20) + '.';
    end;
  end;

  user.Font.Size         := 10;
  user.Height            := 13;
  user.Font.Style        := [fsBold];
  user.Parent            := ctn;

  //Criando label da mensagem
  msg := TUnimLabel.Create(ctn);

  msg.Align             := alClient;
  msg.AlignWithMargins  := True;
  msg.Caption           := UniMainModule.dsChat.DataSet.FieldByName('MENSAGEM').Value;
  msg.Font.Size         := 10;
  msg.Parent            := ctn;

  //Criando label de data e hora
  data := TUnimLabel.Create(ctn);

  data.Align             := alBottom;
  data.AlignWithMargins  := True;
  data.Alignment         := taRightJustify;
  data.Caption           := UniMainModule.dsChat.DataSet.FieldByName('DATA').AsString + ' ?s ' + UniMainModule.dsChat.DataSet.FieldByName('HORA').AsString;
  data.Font.Size         := 7;
  data.Height            := 8;
  data.Parent            := ctn;

  //ctnChat.Height         := 90 * I;
end;

procedure TfrmChat.btnEnviarClick(Sender: TObject);
var
  cliente, operador, id : integer;
begin
  if lblMsg.Text = '' then Abort;

  id       := frmPrincipal.proxID('tb_chat');
  cliente  := UniMainModule.dsCliente.DataSet.FieldByName('ID').Value;
  operador := UniMainModule.dsUsuario.DataSet.FieldByName('ID').Value;

  with UniMainModule.dsChat.DataSet do
  begin
    Append;
    FieldByName('ID').Value        := id;
    FieldByName('CLIENTE').Value   := cliente;
    FieldByName('OPERADOR').Value  := operador;

    if acesso = 'agn'     then FieldByName('REMETENTE').Value := 'AGN';
    if acesso = 'cliente' then FieldByName('REMETENTE').Value := 'CLIENTE';

    FieldByName('MENSAGEM').Value  := lblMsg.Text;
    FieldByName('DATA').Value      := now;
    FieldByName('HORA').Value      := time;
    FieldByName('VISTO').Value     := 'N?O';
    Post;
  end;

  lblMsg.Text := '';
  lblMsg.SetFocus;

end;

procedure TfrmChat.lblSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmChat.UnimFormShow(Sender: TObject);
begin
  acesso := frmPrincipal.acessoChat;

  if acesso = 'cliente' then lblCabecalho.Caption := 'Suporte AGN';

  cliente := UniMainModule.dsCliente.DataSet.FieldByName('ID').Value;

  carregarChat();
  VerMsg();

  lblMsg.SetFocus;
end;

procedure TfrmChat.UniTimerTimer(Sender: TObject);
begin
  //Atualiza o CHAT a cada 1 segundo
  carregarChat();
  VerMsg();

end;

end.

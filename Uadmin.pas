unit Uadmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, uniLabel, unimLabel,
  Vcl.Imaging.pngimage, uniImage, unimImage, unimPanel, unimScrollBox, uniPanel,
  uniPageControl, unimTabPanel, uniGUIBaseClasses, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  unimBitBtn, unimButton, uniEdit, unimEdit, uniMultiItem, unimSelect,
  uniImageList, Vcl.Menus, uniMainMenu, uniTreeView, uniTreeMenu, unimTreeMenu,
  uniDateTimePicker, unimDatePicker, comobj, ActiveX, SHELLAPI, uniTimer,
  unimTimer, uniCheckBox, unimCheckBox, uniMemo, unimMemo;

type
  TfrmAdmin = class(TUnimForm)
    scrlBody: TUnimScrollBox;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    dsCliente: TDataSource;
    umpFiltros: TUnimPanel;
    lblTextoBemVinde: TUnimLabel;
    UnimPanel2: TUnimPanel;
    EditSenhaConf: TUnimEdit;
    EditSenhaNova: TUnimEdit;
    UnimLabel21: TUnimLabel;
    UnimLabel22: TUnimLabel;
    UnimLabel15: TUnimLabel;
    EditSenhaAtual: TUnimEdit;
    UnimButton1: TUnimButton;
    UnimPanel3: TUnimPanel;
    SelectTipoBusca: TUnimSelect;
    EditBusca: TUnimEdit;
    btnBusca: TUnimButton;
    qryCliente: TFDQuery;
    UnimPanel4: TUnimPanel;
    SelectMunicipio: TUnimSelect;
    SelectSituacao: TUnimSelect;
    umcLateral: TUnimContainerPanel;
    umcBody: TUnimContainerPanel;
    UnimPanel1: TUnimPanel;
    lblmenu: TUnimLabel;
    mmenuitens: TUniMenuItems;
    mtmenu: TUnimTreeMenu;
    Clientes1: TUniMenuItem;
    Perfil1: TUniMenuItem;
    Sair1: TUniMenuItem;
    NativeImageList: TUniNativeImageList;
    tpPrincipal: TUnimTabPanel;
    pgClientes: TUnimTabSheet;
    pgPerfil: TUnimTabSheet;
    UnimLabel3: TUnimLabel;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    edtData1: TUnimEdit;
    edtData2: TUnimEdit;
    UnimLabel1: TUnimLabel;
    UnimPanel5: TUnimPanel;
    edtSolicitacoes: TUnimEdit;
    edtPretendido: TUnimEdit;
    dbGridDados: TUnimDBGrid;
    lblExcel: TUnimLabel;
    lblMsgs: TUnimLabel;
    UnimTimer: TUnimTimer;
    dsMsg: TDataSource;
    qryMsg: TFDQuery;
    chkUmDoc: TUnimCheckBox;
    mmSQL: TUnimMemo;
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure lblmenuClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Perfil1Click(Sender: TObject);
    procedure busca();
    procedure dbGridDadosDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure lblExcelClick(Sender: TObject);
    procedure exibirCliente(cliente: string);
    procedure lblMsgsClick(Sender: TObject);
    procedure UnimTimerTimer(Sender: TObject);
    procedure SelectSituacaoChange(Sender: TObject);
    procedure VerificarMsgsNaoLidas();

  private
    { Private declarations }
    var ConsultaSQLcliente: string;
  public
    { Public declarations }
  end;

function frmAdmin: TfrmAdmin;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, UpreCad, UdadosCliente, Usenha,
  UanexarDoc, UcadSucesso, UcnpjClienteFormal, UdadosUsuario, UdocsReprovados,
  UexportarCsv, UinfImportantes, Umsg, UpedirDocs, Upep,
  UpesquisaInicialReprovada, UrecuperarSenha, Usejuv, Usolicitacao, Utermos,
  Uusuarios, UadminMsg, Uchat;

function frmAdmin: TfrmAdmin;
begin
  Result := TfrmAdmin(UniMainModule.GetFormInstance(TfrmAdmin));
end;

procedure TfrmAdmin.VerificarMsgsNaoLidas();
var
  qtdeMsg : integer;
begin
  //$00FF8000 Ativo
  //$00FFDBB7 Desativado
  qryMsg.Refresh;
  qtdeMsg := dsMsg.DataSet.RecordCount;

  if qtdeMsg > 0 then
  begin
    lblMsgs.Font.Color := $00FF8000;
    lblMsgs.Caption    := '+' + intToStr(qtdeMsg) + '<i class="fas fa-comment-dots"></i>'
  end
  else
  begin
    lblMsgs.Font.Color := $00FFDBB7;
    lblMsgs.Caption    := '<i class="fas fa-comment-dots"></i>'
  end;
end;

procedure TfrmAdmin.exibirCliente (cliente: string);
begin
  with UniMainModule.dsCliente.DataSet do
  begin
    Filtered := False;
    Filter   := 'ID = ' + cliente;
    Filtered := True;
  end;

  frmPrincipal.IDcliente   := UniMainModule.dsCliente.DataSet.FieldByName('ID').Value;

  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter   := 'CLIENTE = ' + cliente;
    Filtered := True;
  end;

end;

procedure TfrmAdmin.Clientes1Click(Sender: TObject);
begin
  tpPrincipal.Pages[0].Visible := True;
  tpPrincipal.Pages[1].Visible := False;
end;

procedure TfrmAdmin.Perfil1Click(Sender: TObject);
begin
  tpPrincipal.Pages[0].Visible := False;
  tpPrincipal.Pages[1].Visible := True;
end;

procedure TfrmAdmin.Sair1Click(Sender: TObject);
begin
  if UniMainModule.msg('Tem certeza que deseja sair?') then Close;
end;

procedure TfrmAdmin.SelectSituacaoChange(Sender: TObject);
begin
  if (SelectSituacao.Text = 'ENVIAR DOCUMENTOS') or
     (SelectSituacao.Text = 'DOCUMENTOS DEFERIDOS') or
     (SelectSituacao.Text = 'DOCUMENTOS INDEFERIDOS') then
  begin
    chkUmDoc.Visible := True;
    chkUmDoc.Checked := False;
  end
  else
  begin
    chkUmDoc.Visible := False;
    chkUmDoc.Checked := False;
  end;
end;

procedure TfrmAdmin.busca();
begin
  with qryCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ConsultaSQLcliente);
    if SelectMunicipio.ItemIndex <> 0 then SQL.Add(' and c.municipio = ' + QuotedStr(SelectMunicipio.Text));
    if SelectSituacao.ItemIndex <> 0 then SQL.Add(' and e.nome = ' + QuotedStr(SelectSituacao.Text));
    if EditBusca.Text <> '' then
    begin
      if SelectTipoBusca.ItemIndex = 0 then SQL.Add(' and c.cpf = ' + QuotedStr(EditBusca.Text));
      if SelectTipoBusca.ItemIndex = 1 then SQL.Add(' and c.nome like ' + QuotedStr('%' + EditBusca.Text + '%'));
    end;
    if (edtData1.Text = '') OR (edtData2.Text = '') then
    begin
      edtData1.Text := '';
      edtData2.Text := '';
    end
    else
      SQL.Add(' and s.datacadastro between ' + QuotedStr(edtData1.Text) + ' and ' + QuotedStr(edtData2.Text));

    if chkUmDoc.Checked = True then SQL.Add(' and d.env > 0');


    SQL.Add(' order by a.data desc');
    //ShowMessage(SQL.Text);
    Open;
  end;

  edtSolicitacoes.Text := intToStr(dsCliente.DataSet.RecordCount);
end;

procedure TfrmAdmin.btnBuscaClick(Sender: TObject);
begin
  busca();
  mmSQL.Lines.Add(qryCliente.Text);
end;

procedure TfrmAdmin.dbGridDadosDblClick(Sender: TObject);
var
  cliente : string;
begin
  cliente := dsCliente.DataSet.FieldByName('IDCLIENTE').AsString;
  frmPrincipal.IDcliente := strToInt(cliente);

  exibirCliente(cliente);

  frmDadosCliente.ShowModal();

  qryCliente.Refresh;

end;

procedure TfrmAdmin.dbGridDadosDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if UniMainModule.dsSolicitacao.DataSet.FieldByName('TIPOFINANCIAMENTO').Value = 'SOLID?RIO' then
    dbGridDados.Font.Color := clFuchsia;

end;

procedure TfrmAdmin.UnimButton1Click(Sender: TObject);
var
  senhaAtual    : string;
  senhaAtualMD5 : string;
  senhaSalva    : string;
  senhaNova     : string;
  senhaNovaConf : string;
  senhaNovaMD5  : string;
begin
  senhaSalva    := UniMainModule.dsUsuario.DataSet.FieldByName('senha').Value;
  senhaAtual    := EditSenhaAtual.Text;
  senhaAtualMD5 := frmPrincipal.MD5(senhaAtual);
  senhaNova     := EditSenhaNova.Text;
  senhaNovaConf := EditSenhaConf.Text;
  senhaNovaMd5  := frmPrincipal.MD5(senhaNova);

  EditSenhaAtual.Text := '';
  EditSenhaNova.Text  := '';
  EditSenhaConf.text  := '';

  case Usenha.alterarSenha(senhaAtual, senhaAtualMD5, senhaSalva, senhaNova, senhaNovaConf) of
    1:
    begin
      with UniMainModule.dsUsuario.DataSet do
      begin
        edit;
        FieldByName('SENHA').Value := senhaNovaMD5;
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

procedure TfrmAdmin.UnimFormShow(Sender: TObject);
begin
  tpPrincipal.Pages[0].Visible := True;
  tpPrincipal.Pages[1].Visible := False;

  with qryCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ');
    SQL.Add('c.id as idcliente, coalesce(d.env, 0), c.nome, c.cpf, s.grupo, ');
    SQL.Add('s.tipofinanciamento, c.clienteagn, ');
    SQL.Add('c.municipio, s.datacadastro, a.data as atualizacao, s.linha linhacredito, ');

    SQL.Add('iif (e.nome =  ' + QuotedStr('ENVIAR DOCUMENTOS') + ', ' + QuotedStr('ENVIANDO DOCS ') + ' || ');
    SQL.Add('(select count(*) from tb_documentos where solicitar = ' + QuotedStr('SIM') + ' and id_cliente = c.id and situacao = ' + QuotedStr('ENVIADO') + ')');
    SQl.Add(' || ' + QuotedStr('/') + ' ||');
    SQL.Add('(select count(*) from tb_documentos where solicitar = ' + QuotedStr('SIM') + ' and  id_cliente = c.id), e.nome) as situacao');

    SQL.Add('from tb_cliente c ');
    SQL.Add('inner join tb_solicitacao s on s.cliente = c.id ');
    SQL.Add('inner join tb_etapa e on e.id = s.situacao ');
    SQL.Add('inner join tb_acompanhamento a on a.solicitacao = s.id ');
    SQL.Add('and a.id = (select max(id) as id from tb_acompanhamento a1 where a1.solicitacao = s.id) ');
    SQL.Add('left join (select count(*) as env, id_cliente from tb_documentos d ');
    SQL.Add('where d.solicitar = ' + QuotedStr('SIM') + ' and d.situacao = ' + QuotedStr('ENVIADO') + ' ');
    SQL.Add('group by id_cliente) d on d.id_cliente = c.id ');

    SQL.Add('where 1 = 1');
    //ShowMessage(qryCliente.SQL.Text);
    Open;
  end;

  ConsultaSQLcliente   := qryCliente.SQL.Text;
  qryCliente.Active    := True;

  busca();

  qryMsg.Active        := True;
  VerificarMsgsNaoLidas();

  lblTextoBemVinde.Caption := 'Bem vindo(a), ' + UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';
end;

procedure TfrmAdmin.UnimTimerTimer(Sender: TObject);
begin
  VerificarMsgsNaoLidas();
end;

procedure TfrmAdmin.lblExcelClick(Sender: TObject);

begin

  frmExportarCsv.ShowModal;

end;

procedure TfrmAdmin.lblmenuClick(Sender: TObject);
begin
  mtmenu.Micro := not mtmenu.Micro;

  if mtmenu.Micro then
  begin
    umcLateral.Width := 44;
    lblTextoBemVinde.Text      := '<i class="fa fa-user-circle" aria-hidden="true"></i>';
    lblTextoBemVinde.Alignment := taCenter;
    lblTextoBemVinde.Font.Size := 18;
  end
  else
  begin
    umcLateral.Width := 220;
    lblTextoBemVinde.Text := 'Bem vindo(a), ' + UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';
    lblTextoBemVinde.Alignment := taLeftJustify;
    lblTextoBemVinde.Font.Size := 10;
  end;
end;

procedure TfrmAdmin.lblMsgsClick(Sender: TObject);
begin
  if dsMsg.DataSet.RecordCount > 0 then
    frmAdminMsg.ShowModal
  else
    ShowMessage('<b>N?o existem mensagens</b> n?o lidas ;)');
end;

initialization
CoInitialize(nil);

finalization
CoUnInitialize;

end.


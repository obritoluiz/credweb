unit Usejuv;

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
  unimBitBtn, Vcl.Menus, uniMainMenu, uniImageList, uniTreeView, uniTreeMenu,
  unimTreeMenu, unimButton, uniEdit, unimEdit, uniMultiItem, unimSelect,
  unimDBTimePicker, uniDBEdit, unimDBEdit, uniDateTimePicker,
  uniDBDateTimePicker, unimDBDatePicker, unimTimePicker, unimDatePicker;

type
  TfrmAdminSejuv = class(TUnimForm)
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    pgMain: TUnimTabPanel;
    pgInicio: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    dbGridDados: TUnimDBListGrid;
    umcLateral: TUnimContainerPanel;
    UnimPanel1: TUnimPanel;
    lblmenu: TUnimLabel;
    mtmenu: TUnimTreeMenu;
    NativeImageList: TUniNativeImageList;
    mmenuitens: TUniMenuItems;
    Sair1: TUniMenuItem;
    lblTextoBemVinde: TUnimLabel;
    umcCorpo: TUnimContainerPanel;
    pgAgeCap: TUnimTabSheet;
    Data: TUnimLabel;
    lblHorario: TUnimLabel;
    lblLocal: TUnimLabel;
    btnConfirmar: TUnimButton;
    lblTituloPaginaCapacitacao: TUnimLabel;
    Alterarsenha1: TUniMenuItem;
    pgAlterarSenha: TUnimTabSheet;
    UnimPanel2: TUnimPanel;
    EditSenhaConf: TUnimEdit;
    EditSenhaNova: TUnimEdit;
    UnimLabel21: TUnimLabel;
    UnimLabel22: TUnimLabel;
    UnimLabel15: TUnimLabel;
    EditSenhaAtual: TUnimEdit;
    UnimButton1: TUnimButton;
    umpFiltros: TUnimPanel;
    UnimPanel3: TUnimPanel;
    LabelFiltro: TUnimLabel;
    SelectTipoBusca: TUnimSelect;
    EditBusca: TUnimEdit;
    UnimPanel4: TUnimPanel;
    LabelCidade: TUnimLabel;
    SelectMunicipio: TUnimSelect;
    UnimLabel2: TUnimLabel;
    SelectSituacao: TUnimSelect;
    ButtonBuscar: TUnimButton;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    edtData: TUnimDatePicker;
    edtHorario: TUnimTimePicker;
    edtlocal: TUnimEdit;
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Alterarsenha1Click(Sender: TObject);
    procedure UnimButton1Click(Sender: TObject);
    procedure lblmenuClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);

  private
    { Private declarations }
    var ConsultaSQLcliente: string;
  public
    { Public declarations }
  end;

function frmAdminSejuv: TfrmAdminSejuv;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, UpreCad, Uadmin,
  UanexarDoc, UdadosCliente, UdadosUsuario, Umsg, UpedirDocs, UrecuperarSenha,
  Usolicitacao, Uusuarios, Usenha;

function frmAdminSejuv: TfrmAdminSejuv;
begin
  Result := TfrmAdminSejuv(UniMainModule.GetFormInstance(TfrmAdminSejuv));
end;


procedure TfrmAdminSejuv.Alterarsenha1Click(Sender: TObject);
begin
  pgMain.Pages[0].Visible := False;
  pgMain.Pages[1].Visible := False;
  pgMain.Pages[2].Visible := True;
end;

procedure TfrmAdminSejuv.btnConfirmarClick(Sender: TObject);
begin
  if btnConfirmar.Caption = 'Salvar' then
  begin
    //Abre a tabela pra adi??o de registro
    with UniMainModule.dsCapacitacao.DataSet do
    begin
      Append;
      FieldByName('ID').Value      := frmPrincipal.proxID('tb_capacitacao');
      FieldByName('CLIENTE').Value := qryCliente.FieldByName('idcliente').Value;
      FieldByName('DATA').Value    := edtData.Text;
      FieldByName('HORARIO').Value := edtHorario.Text;
      FieldByName('LOCAL').Value   := edtLocal.Text;
      Post;
    end;

    frmPrincipal.adicionarEtapa(11, qryCliente.FieldByName('idsolicitacao').Value);

    with UniMainModule.FDQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update tb_solicitacao set situacao = 11 where cliente = ' + intToStr(qryCliente.FieldByName('idcliente').Value));
      ExecSQL;
    end;

  end
  else
  begin
    If UniMainModule.dsCapacitacao.DataSet.State in [ dsInsert, dsEdit ] then
      UniMainModule.dsCapacitacao.DataSet.Post;
  end;

  qryCliente.Active := False;
  qryCliente.Active := True;

  pgMain.Pages[0].Visible := True;
  pgMain.Pages[1].Visible := False;
  pgMain.Pages[2].Visible := False;
end;

procedure TfrmAdminSejuv.ButtonBuscarClick(Sender: TObject);
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
    Open;
  end;
end;

procedure TfrmAdminSejuv.dbGridDadosDblClick(Sender: TObject);
var cliente : string;
begin

  cliente := dsCliente.DataSet.FieldByName('IDCLIENTE').AsString;

  with UniMainModule.dsCliente.DataSet do
  begin
    Filtered := False;
    Filter   := 'ID = ' + cliente;
    Filtered := True;
  end;

  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter   := 'CLIENTE = ' + cliente;
    Filtered := True;
  end;

  if qryCliente.FieldByName('SITUACAO').Value = 'AGENDAR CAPACITA??O' then
  begin
    //Altera o t?tulo da p?gina de agentar capacita??o
    lblTituloPaginaCapacitacao.Caption := 'Agendar capacita??o para ' + qryCliente.FieldByName('NOME').Value;

    btnConfirmar.Caption := 'Salvar';

    pgMain.Pages[0].Visible := False;
    pgMain.Pages[1].Visible := True;
    pgMain.Pages[2].Visible := False;
  end;

  if qryCliente.FieldByName('SITUACAO').Value = 'CAPACITA??O AGENDADA' then
  begin
    btnConfirmar.Caption := 'Atualizar';

    pgMain.Pages[0].Visible := False;
    pgMain.Pages[1].Visible := True;
    pgMain.Pages[2].Visible := False;
  end;


end;

procedure TfrmAdminSejuv.Sair1Click(Sender: TObject);
begin
  if UniMainModule.msg('Tem certeza que deseja sair?') then Close;
end;

procedure TfrmAdminSejuv.UnimButton1Click(Sender: TObject);
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

  pgMain.Pages[0].Visible := True;
  pgMain.Pages[1].Visible := False;
  pgMain.Pages[2].Visible := False;

end;

procedure TfrmAdminSejuv.UnimFormShow(Sender: TObject);
begin
  ConsultaSQLcliente   := qryCliente.SQL.Text;

  //Ativa a consulta de clientes
  qryCliente.Active := True;
  UniMainModule.tb_capacitacao.Active := True;

  pgMain.Pages[0].Visible := True;
  pgMain.Pages[1].Visible := False;
  pgMain.Pages[2].Visible := False;

  lblTextoBemVinde.Caption := 'Bem vindo(a), ' + UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';
end;

procedure TfrmAdminSejuv.lblmenuClick(Sender: TObject);
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

end.

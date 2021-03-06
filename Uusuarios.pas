unit Uusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, uniButton, uniBitBtn, unimBitBtn,
  uniLabel, unimLabel, Vcl.Imaging.pngimage, uniImage, unimImage, unimPanel,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid,
  unimDBListGrid, unimScrollBox, uniPanel, uniPageControl, unimTabPanel,
  uniGUIBaseClasses, unimButton, uniMultiItem, unimSelect, uniEdit, unimEdit,
  Vcl.Menus, uniMainMenu, uniImageList, uniTreeView, uniTreeMenu, unimTreeMenu;

type
  TfrmUsuarios = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgClientes: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    dbGridDadosClientes: TUnimDBListGrid;
    pgSejuv: TUnimTabSheet;
    pgCrednatal: TUnimTabSheet;
    qryCliente: TFDQuery;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    dsCliente: TDataSource;
    UnimScrollBox1: TUnimScrollBox;
    dbGridDadosSejuv: TUnimDBListGrid;
    UnimScrollBox2: TUnimScrollBox;
    dbGridDadosCrednatal: TUnimDBListGrid;
    pgAdministradores: TUnimTabSheet;
    UnimScrollBox3: TUnimScrollBox;
    dbGridDadosAdmin: TUnimDBListGrid;
    pgCadastroUsuario: TUnimTabSheet;
    UnimScrollBox4: TUnimScrollBox;
    UnimPanel2: TUnimPanel;
    labelNome: TUnimLabel;
    EditNome: TUnimEdit;
    labelCPF: TUnimLabel;
    EditCPF: TUnimEdit;
    labelSenha: TUnimLabel;
    EditSenha: TUnimEdit;
    labelPerfil: TUnimLabel;
    SelectPerfil: TUnimSelect;
    btnCadastrarUsuario: TUnimButton;
    labelSenhaConf: TUnimLabel;
    EditSenhaConf: TUnimEdit;
    LabelTituloCadastrao: TUnimLabel;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    umcLateral: TUnimContainerPanel;
    UnimPanel3: TUnimPanel;
    lblmenu: TUnimLabel;
    mtmenu: TUnimTreeMenu;
    lblTextoBemVinde: TUnimLabel;
    NativeImageList: TUniNativeImageList;
    mmenuitens: TUniMenuItems;
    Sair2: TUniMenuItem;
    umpFiltros: TUnimPanel;
    UnimPanel4: TUnimPanel;
    SelectTipoBusca: TUnimSelect;
    EditBusca: TUnimEdit;
    ButtonBuscar: TUnimButton;
    function ChecarDados(): Boolean;
    procedure filtrarPesquisa();
    procedure buscar(tipoBusca, texto, pagina : string);
    procedure UnimFormShow(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure filtrarPerfil(perfil: string);
    procedure dbGridDadosClientesDblClick(Sender: TObject);
    procedure MostrarDadosUsuario(cpf : string);
    procedure dbGridDadosSejuvDblClick(Sender: TObject);
    procedure dbGridDadosCrednatalDblClick(Sender: TObject);
    procedure dbGridDadosAdminDblClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure UnimLabel1Click(Sender: TObject);
    procedure lblmenuClick(Sender: TObject);
    procedure mostrarTela(tela: integer);
    procedure Clientes1Click(Sender: TObject);
    procedure Perfil1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Admins1Click(Sender: TObject);
    procedure NovoUsurio1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  administradores : string = '1';
  crednatal       : string = '2';
  sejuv           : string = '3';
  cliente         : string = '4';
var
  nomeUsuario : string;

function frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, uniGUIApplication, Usenha, UdadosUsuario;

function frmUsuarios: TfrmUsuarios;
begin
  Result := TfrmUsuarios(UniMainModule.GetFormInstance(TfrmUsuarios));
end;

procedure TfrmUsuarios.mostrarTela(tela: integer);
var
  I: integer;
begin                                 {
  for I := 0 to pgMain.PageCount - 1 do
  begin
    pgMain.Pages[I].Visible := False;
  end;                               }
  pgMain.ActivePageIndex := I;

end;

procedure TfrmUsuarios.NovoUsurio1Click(Sender: TObject);
begin
  mostrarTela(4);
end;

procedure TfrmUsuarios.Perfil1Click(Sender: TObject);
begin
  mostrarTela(1);
end;

function TfrmUsuarios.ChecarDados(): boolean;
var
  senha: string;
  senhaConf: string;
  cpf : string;
  resultado : Integer;
begin
  resultado := 0;
  senha := EditSenha.Text;
  senhaConf := EditSenhaConf.Text;

  case Usenha.validarSenha(senha, senhaConf) of
    1:
    begin
      resultado := resultado + 1;
    end;
    2:
    begin
      ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
      result := False;
    end;
    3:
    begin
      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
      result := False;
    end;
  end;

  {
  cpf := EditCPF.Text;
  if frmPrincipal.ValidarCPF(cpf) then
  begin
    resultado := resultado + 1;
  end
  else
  begin
    result := False;
    ShowMessage('CPF inv?lido!');
  end;
   }

  if resultado = 1 then result := True else result := False;

end;

procedure TfrmUsuarios.Clientes1Click(Sender: TObject);
begin
  mostrarTela(0);
end;

procedure TfrmUsuarios.MostrarDadosUsuario(cpf: string);
var
  cpf1 : string;
begin
  cpf1 := dsUsuario.DataSet.FieldByName('CPF').Value;
  with UniMainModule.dsUsuario.DataSet do
  begin
    Filtered := False;
    Filter   := 'USUARIO = ' + QuotedStr(cpf);
    Filtered := True;
  end;

  frmDadosUsuario.ShowModal();
end;

procedure TfrmUsuarios.dbGridDadosClientesDblClick(Sender: TObject);
begin
  //clientes
  MostrarDadosUsuario(dsCliente.DataSet.FieldByName('CPF').Value);
end;

procedure TfrmUsuarios.dbGridDadosCrednatalDblClick(Sender: TObject);
begin
  //CREDNATAL
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('CPF').Value);
end;

procedure TfrmUsuarios.dbGridDadosSejuvDblClick(Sender: TObject);
begin
  // SEJUV
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('CPF').Value);
end;

procedure TfrmUsuarios.dbGridDadosAdminDblClick(Sender: TObject);
begin
  //Administradores
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('CPF').Value);
end;

procedure TfrmUsuarios.pgMainChange(Sender: TObject);
begin
  if pgMain.ActivePage = pgSejuv then
  begin
    filtrarPerfil(sejuv);
  end
  else if pgMain.ActivePage = pgCrednatal then
  begin
    filtrarPerfil(crednatal);
  end
  else if pgMain.ActivePage = pgAdministradores then
  begin
    filtrarPerfil(administradores);
  end;

end;

procedure TfrmUsuarios.Sair1Click(Sender: TObject);
begin
  mostrarTela(2);
end;

procedure TfrmUsuarios.Sair2Click(Sender: TObject);
begin
  if UniMainModule.msg('Tem certeza que deseja sair?') then Close;
end;

procedure TfrmUsuarios.UnimFormShow(Sender: TObject);
begin


  qryCliente.Active := True;
  qryUsuario.Active := True;

  filtrarPesquisa();

  nomeUsuario := UniMainModule.dsUsuario.DataSet.FieldByName('NOME').value;

  lblTextoBemVinde.Caption := 'Bem vindo(a), ' + nomeUsuario + '.';
end;

procedure TfrmUsuarios.UnimLabel1Click(Sender: TObject);
begin
  if UniMainModule.msg('Tem certeza que deseja sair?') then Close;
end;

procedure TfrmUsuarios.Admins1Click(Sender: TObject);
begin
  mostrarTela(3);
end;

procedure TfrmUsuarios.btnCadastrarUsuarioClick(Sender: TObject);
var
  id : Integer;
  nome : string;
  cpf : string;
  senha : string;
  perfil : Integer;
begin
  id := frmPrincipal.proxID('tb_usuario');
  nome := EditNome.Text;
  cpf := EditCPF.Text;
  senha := frmPrincipal.MD5(EditSenha.Text);

  if checarDados then
  begin
    if SelectPerfil.Text = 'CLIENTE' then perfil := StrToInt(cliente)
    else if SelectPerfil.Text = 'SEJUV' then perfil := StrToInt(sejuv)
    else if SelectPerfil.Text = 'CREDNATAL' then perfil := StrToInt(crednatal)
    else if SelectPerfil.Text = 'ADMINISTRADOR' then perfil := StrToInt(administradores);

    with UniMainModule.dsUsuario.DataSet do
    begin
      Append;
      FieldByName('ID').Value := id;
      FieldByName('NOME').Value := nome;
      FieldByName('USUARIO').Value := cpf;
      FieldByName('SENHA').Value := senha;
      FieldByName('PERFIL').Value := perfil;
      FieldByName('DATACADASTRO').AsCurrency;
      Post;
    end;

    EditNome.Text := '';
    EditCPF.Text := '';
    EditSenha.Text := '';
    EditSenhaConf.Text := '';
    SelectPerfil.ItemIndex := -1;
    ShowMessage('Usu?rio inserido com sucesso!');

    UniMainModule.dsUsuario.DataSet.Filtered := False;
    qryUsuario.Refresh;

  end
  else
  ShowMessage('Erro ao cadastrar novo usu?rio');

end;

procedure tfrmUsuarios.buscar(tipoBusca, texto, pagina : string);
begin
  if pagina = 'CLIENTE' then
  begin
      if tipoBusca = 'NOME' then tipoBusca := 'u.nome';
      //filtrarPesquisa();
  end
  else
  begin
      filtrarPesquisa();
  end;
end;

procedure TfrmUsuarios.ButtonBuscarClick(Sender: TObject);
begin
  with dsCliente.DataSet do
  begin
    Filtered := False;
    Filter   := SelectTipoBusca.Text + ' like ' + QuotedStr('%' + EditBusca.Text + '%');
    Filtered := True;
  end;
end;

procedure TfrmUsuarios.filtrarPesquisa();
begin
  if pgMain.ActivePage = pgSejuv then
  begin
    filtrarPerfil(sejuv);
  end
  else if pgMain.ActivePage = pgCrednatal then
  begin
    filtrarPerfil(crednatal);
  end
  else if pgMain.ActivePage = pgAdministradores then
  begin
    filtrarPerfil(administradores);
  end;
end;

procedure TfrmUsuarios.lblmenuClick(Sender: TObject);
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

procedure TfrmUsuarios.filtrarPerfil(perfil: string);
begin
    with dsUsuario.DataSet do
    begin
      Filtered := False;
      Filter   := 'p = ' + QuotedStr(perfil);
      Filtered := True;
    end;
end;

end.

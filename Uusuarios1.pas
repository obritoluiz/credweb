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
  uniGUIBaseClasses, unimButton, uniMultiItem, unimSelect, uniEdit, unimEdit;

type
  TfrmUsuarios = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgClientes: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    dbGridDadosClientes: TUnimDBListGrid;
    pgSejuv: TUnimTabSheet;
    pgCrednatal: TUnimTabSheet;
    qryUsuario: TFDQuery;
    umpFooter: TUnimPanel;
    UnimImage1: TUnimImage;
    UnimLabel8: TUnimLabel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    LabelUsuario: TUnimLabel;
    dsUsuario: TDataSource;
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
    ButtonBuscar: TUnimButton;
    EditBusca: TUnimEdit;
    qryUsuarioBusca: TFDQuery;
    LabelBusca: TUnimLabel;
    SelectTipoBusca: TUnimSelect;
    LabelTipoBusca: TUnimLabel;
    function ChecarDados(): Boolean;
    procedure filtrarPesquisa();
    procedure buscarUsuarios();
    procedure UnimFormShow(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure filtrarPerfil(perfil: string);
    procedure dbGridDadosClientesDblClick(Sender: TObject);
    procedure MostrarDadosUsuario(cpf : string);
    procedure dbGridDadosSejuvDblClick(Sender: TObject);
    procedure dbGridDadosCrednatalDblClick(Sender: TObject);
    procedure dbGridDadosAdminDblClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure EditBuscaEnter(Sender: TObject);
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

function frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, uniGUIApplication, Usenha, UdadosUsuario;

function frmUsuarios: TfrmUsuarios;
begin
  Result := TfrmUsuarios(UniMainModule.GetFormInstance(TfrmUsuarios));
end;

procedure TfrmUsuarios.ButtonBuscarClick(Sender: TObject);
begin
  buscarUsuarios();
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
      ShowMessage('Senha inválida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
      result := False;
    end;
    3:
    begin
      ShowMessage('As senhas não coincidem, por favor certifique-se que as duas senhas sejam iguais.');
      result := False;
    end;
  end;

  cpf := EditCPF.Text;
  if frmPrincipal.ValidarCPF(cpf) then
  begin
    resultado := resultado + 1;
  end
  else
  begin
    result := False;
    ShowMessage('CPF inválido!');
  end;

  if resultado = 2 then result := True else result := False;

end;

procedure TfrmUsuarios.MostrarDadosUsuario(cpf : string);
begin
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
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('USUARIO').Value);
end;

procedure TfrmUsuarios.dbGridDadosCrednatalDblClick(Sender: TObject);
begin
  //CREDNATAL
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('USUARIO').Value);
end;

procedure TfrmUsuarios.dbGridDadosSejuvDblClick(Sender: TObject);
begin
  // SEJUV
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('USUARIO').Value);
end;

procedure TfrmUsuarios.dbGridDadosAdminDblClick(Sender: TObject);
begin
  //Administradores
  MostrarDadosUsuario(dsUsuario.DataSet.FieldByName('USUARIO').Value);
end;

procedure TfrmUsuarios.EditBuscaEnter(Sender: TObject);
begin
  //buscar
  buscarUsuarios();
end;

procedure tfrmUsuarios.buscarUsuarios();
var tipoBusca: string;
begin
  if (SelectTipoBusca.Text = '') then
  begin
    dsUsuario.DataSet := qryUsuario;
  end
  else
  begin
      if SelectTipoBusca.Text = 'CPF'
      then tipoBusca := 'USUARIO'
      else tipoBusca := SelectTipoBusca.Text;

      qryUsuarioBusca.SQL.Clear;
      qryUsuarioBusca.SQL.Add(
        'select id, nome, usuario, perfil, status ' +
        'from tb_usuario ' +
        'where ' + tipoBusca + ' like ''%' + EditBusca.Text + '%'' ' +
        'order by nome;'
      );
      qryUsuarioBusca.Open();
      dsUsuario.DataSet := qryUsuarioBusca;

      filtrarPesquisa();
  end;

end;

procedure TfrmUsuarios.pgMainChange(Sender: TObject);
begin
  filtrarPesquisa();
end;

procedure TfrmUsuarios.UnimBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarios.UnimFormShow(Sender: TObject);
begin
  filtrarPerfil(cliente);
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
    ShowMessage('Usuário inserido com sucesso!');

    qryUsuario.Refresh;
  end
  else
  begin
    ShowMessage('Erro, não foi possível cadastrar novo usuário');
  end;

end;

procedure TfrmUsuarios.filtrarPesquisa();
begin
  if pgMain.ActivePage = pgClientes then
  begin
    filtrarPerfil(cliente);
  end
  else if pgMain.ActivePage = pgSejuv then
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

procedure TfrmUsuarios.filtrarPerfil(perfil: string);
begin
  with dsUsuario.DataSet do
  begin
    Filtered := False;
    Filter   := 'perfil = ' + QuotedStr(perfil);
    Filtered := True;
  end;
end;

end.

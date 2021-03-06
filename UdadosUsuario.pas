unit UdadosUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  unimButton, uniMultiItem, unimSelect, uniEdit, unimEdit, uniButton, uniBitBtn,
  unimBitBtn, uniLabel, unimLabel, Vcl.Imaging.pngimage, uniImage, unimImage,
  unimPanel, unimScrollBox, uniPanel, uniPageControl, unimTabPanel,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, unimDBListGrid, uniDBEdit,
  unimDBEdit, unimDBSelect;

type
  TfrmDadosUsuario = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgInicio: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    pnlGeral: TUnimPanel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    lblTextoBemVinde: TUnimLabel;
    labelNome: TUnimLabel;
    EditNome: TUnimEdit;
    labelCPF: TUnimLabel;
    EditCPF: TUnimEdit;
    labelPerfil: TUnimLabel;
    SelectPerfil: TUnimSelect;
    pgDadosCliente: TUnimTabSheet;
    pgSolicitacoes: TUnimTabSheet;
    UnimScrollBox1: TUnimScrollBox;
    dbGridSolicitacoesCliente: TUnimDBListGrid;
    qrySolicitacao: TFDQuery;
    dsSolicitacoes: TDataSource;
    pgSenha: TUnimTabSheet;
    BtnAtualizarUsuario: TUnimButton;
    UnimScrollBox2: TUnimScrollBox;
    pnlDados: TUnimPanel;
    dbsltMunicipio: TUnimDBSelect;
    DBEditNome: TUnimDBEdit;
    DBEditCPF: TUnimDBEdit;
    DBEditTelefone: TUnimDBEdit;
    DBEditEmail: TUnimDBEdit;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimLabel5: TUnimLabel;
    UnimLabel9: TUnimLabel;
    UnimLabel10: TUnimLabel;
    BtnAtualizarCiente: TUnimBitBtn;
    UnimLabel11: TUnimLabel;
    SelectEstadoCivil: TUnimDBSelect;
    Panelconjuge: TUnimPanel;
    LabelConjugeNome: TUnimLabel;
    DBEditNomeConjuge: TUnimDBEdit;
    LabelConjugeCPF: TUnimLabel;
    DBEditCpfConjuge: TUnimDBEdit;
    UnimPanel2: TUnimPanel;
    EditSenhaConf: TUnimEdit;
    EditSenha: TUnimEdit;
    labelSenhaConf: TUnimLabel;
    labelSenha: TUnimLabel;
    btnAlterarSenha: TUnimButton;
    function validarSenha(): boolean;
    function validarDadosCliente(): boolean;
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure dbGridSolicitacoesClienteDblClick(Sender: TObject);
    procedure BtnAtualizarCienteClick(Sender: TObject);
    procedure BtnAtualizarUsuarioClick(Sender: TObject);
    procedure SelectEstadoCivilChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  senha : string;
  senhaConf : string;
  senhaMD5 : string;

function frmDadosUsuario: TfrmDadosUsuario;

implementation

{$R *.dfm}

uses
  Mainm, MainModule, uniGUIApplication, Usenha, Uusuarios, UdadosCliente;

function frmDadosUsuario: TfrmDadosUsuario;
begin
  Result := TfrmDadosUsuario(UniMainModule.GetFormInstance(TfrmDadosUsuario));
end;

function TfrmDadosUsuario.validarDadosCliente(): boolean;
var erro :boolean;
begin
  erro := False;
  if (DBEditNome.Text = '' ) then //Nome cliente
  begin
    DBEditNome.Color := clRed;
    erro := True;
  end;
  if frmPrincipal.ValidarCPF(DBEditCPF.Text) = False then
  begin
    ShowMessage('CPF INV?LIDO!');
    EditCPF.Color := clRed;
    erro := True;
  end;
  if (DBEditTelefone.Text = '') or
     ( (Length(DBEditTelefone.Text) < 8) or
     (Length(DBEditTelefone.Text) > 12) ) then //telefone cliente
  begin
    DBEditTelefone.Color := clRed;
    erro := True;
  end;
  if (DBEditEmail.Text = '') then //email cliente
  begin
    DBEditEmail.Color := clRed;
    erro := True;
  end;
  if Pos('@', DBEditEmail.Text) = 0 then //email cliente
  begin
    DBEditEmail.Color := clRed;
    erro := True;
  end;
  if (SelectEstadoCivil.ItemIndex = -1) then //estado civil cliente
  begin
    SelectEstadoCivil.Color := clRed;
    erro := True;
  end;

  if SelectEstadoCivil.ItemIndex = 0 then  //Cliente ? casado
  begin
    if DBEditNomeConjuge.Text = '' then
    begin
      DBEditNomeConjuge.Color := clRed;
      erro := True;
    end;
    if frmPrincipal.ValidarCPF(DBEditCpfConjuge.Text) = False then
    begin
      DBEditCpfConjuge.Color := clRed;
      erro := True;
    end;
    if EditCPF.Text = DBEditCpfConjuge.Text then
    begin
      DBEditCpfConjuge.Color := clRed;
      erro := True;
    end;
    if EditCPF.Text = DBEditCpfConjuge.Text then
    begin
      DBEditCpfConjuge.Color := clRed;
    end;
  end;

  if (dbsltMunicipio.ItemIndex = -1) then //municipio cliente
  begin
    dbsltMunicipio.Color := clRed;
    erro := True;
  end;

  if erro then result := False else result := True;

end;

procedure TfrmDadosUsuario.BtnAtualizarUsuarioClick(Sender: TObject);
var
  perfil : integer;
begin
  perfil := UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value;

  //Atualizar os dados do usu?rio

  //Se for cliente valida o CPF
  if perfil = 4 then
  begin
    if not frmPrincipal.ValidarCPF(EditCPF.Text) then
    begin
      ShowMessage('CPF inv?lido');
      editCPF.SetFocus;
      Abort;
    end;
  end;

  with UniMainModule.dsUsuario.DataSet do
  begin
    Edit;
    FieldByName('NOME').Value := EditNome.Text;
    FieldByName('USUARIO').Value := EditCPF.Text;
    FieldByName('DATAATUALIZACAO').AsCurrency;
    Post;
  end;
  ShowMessage('Dados do usu?rio foram atualizados com sucesso.');
  frmUsuarios.qryUsuario.Refresh;

  Close;
end;

procedure TfrmDadosUsuario.BtnAtualizarCienteClick(Sender: TObject);
begin
  //Atualizar os dados do cliente
  if validarDadosCliente() then

  with UniMainModule.dsUsuario.DataSet do
  begin
    Edit;
    FieldByName('NOME').Value := DBEditNome.Text;
    FieldByName('DATAATUALIZACAO').AsCurrency;
    Post;
  end;

  with UniMainModule.dsCliente.DataSet do
  begin
    Edit;
    FieldByName('DATAATUALIZACAO').AsCurrency;
    Post;
  end;

  ShowMessage('Dados alterados com sucesso');
  frmUsuarios.qryUsuario.Refresh;

end;

procedure TfrmDadosUsuario.dbGridSolicitacoesClienteDblClick(Sender: TObject);
var
  cliente : string;
begin
  cliente := dsSolicitacoes.DataSet.FieldByName('CLIENTE').AsString;
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Filtered := False;
    Filter   := 'CLIENTE = ' + cliente;
    Filtered := True;
  end;

  with UniMainModule.dsCliente.DataSet do
  begin
    Filtered := False;
    Filter   := 'ID = ' + cliente;
    Filtered := True;
  end;

  frmDadosCliente.ShowModal();

  //checar se o usu?rio atualizou os dados
  qrySolicitacao.Refresh;
end;

procedure TfrmDadosUsuario.pgMainChange(Sender: TObject);
begin
  if pgMain.ActivePage = pgSolicitacoes then
  begin
    with dsSolicitacoes.DataSet do
    begin
      Filtered := False;
      Filter := 'CLIENTE = ' + QuotedStr(UniMainModule.dsCliente.DataSet.FieldByName('ID').Value);
      Filtered := True;
    end;
  end;

end;

procedure TfrmDadosUsuario.UnimBitBtn1Click(Sender: TObject);
begin
  UniMainModule.dsUsuario.DataSet.Filtered := False;
  UniMainModule.dsCliente.DataSet.Filtered := False;
  Close;
end;

procedure TfrmDadosUsuario.SelectEstadoCivilChange(Sender: TObject);
begin
  if SelectEstadoCivil.Text = 'CASADO(A)' then
  begin
    Panelconjuge.Height := 163;
  end
  else
  begin
    Panelconjuge.Height := 0;
  end;

end;

procedure TfrmDadosUsuario.UnimFormShow(Sender: TObject);
begin

  lblTextoBemVinde.Caption := frmUsuarios.lblTextoBemVinde.Caption;

  //Alterar editNome parareceber o nome do dsCliente
  EditNome.Text := UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value;
  EditCPF.Text := UniMainModule.dsUsuario.DataSet.FieldByName('USUARIO').Value;
  SelectPerfil.ItemIndex := UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value - 1;

  if UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value = 4 then
  begin
    pgSolicitacoes.Visible := True;
    pgDadosCliente.Visible := True;
    with UniMainModule.dsCliente.DataSet do
    begin
      Filtered := False;
      Filter := 'CPF = ' + QuotedStr(UniMainModule.dsUsuario.DataSet.FieldByName('USUARIO').Value);
      Filtered := True;
    end;

    with dsSolicitacoes.DataSet do
    begin
      Filtered := False;
      Filter := 'CLIENTE = ' + QuotedStr(UniMainModule.dsCliente.DataSet.FieldByName('ID').Value);
      Filtered := True;
    end;
  end
  else
  begin
    pgSolicitacoes.Visible := False;
    pgDadosCliente.Visible := False;
  end;

  //refatorar
  if SelectEstadoCivil.Text = 'CASADO(A)' then
  begin
    Panelconjuge.Height := 163;
  end
  else
  begin
    Panelconjuge.Height := 0;
  end;

end;

function TfrmDadosUsuario.validarSenha() : boolean;
begin
  senha := EditSenha.Text;
  senhaConf := EditSenhaConf.Text;

  case Usenha.validarSenha(senha, senhaConf) of
    1:
    begin
      senhaMD5 := frmPrincipal.MD5(senha);
      Result := True;
    end;
    2:
    begin
      ShowMessage('Senha inv?lida, por favor digite uma senha que tenha pelo menos 6 caracteres.');
      EditSenha.Text := '';
      EditSenhaConf.Text := '';
      result := False;
    end;
    3:
    begin
      ShowMessage('As senhas n?o coincidem, por favor certifique-se que as duas senhas sejam iguais.');
      EditSenha.Text := '';
      EditSenhaConf.Text := '';
      result := False;
    end;
    else result := False;
  end;
end;

procedure TfrmDadosUsuario.btnAlterarSenhaClick(Sender: TObject);
begin

  if validarSenha then
  begin
    with UniMainModule.dsUsuario.DataSet do
    begin
      edit;
      FieldByName('SENHA').Value := senhaMD5;
      post;
    end;
    ShowMessage('Senha alterada com sucesso.');
  end
  else
  ShowMessage('Erro, n?o foi poss?vel alterar a senha');

  EditSenha.Text := '';
  EditSenhaConf.Text := '';

end;

end.

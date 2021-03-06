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
    umpFooter: TUnimPanel;
    UnimImage1: TUnimImage;
    UnimLabel8: TUnimLabel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    LabelUsuario: TUnimLabel;
    labelNome: TUnimLabel;
    EditNome: TUnimEdit;
    labelCPF: TUnimLabel;
    EditCPF: TUnimEdit;
    labelPerfil: TUnimLabel;
    SelectPerfil: TUnimSelect;
    pgSenha: TUnimTabSheet;
    pgSolicitacoes: TUnimTabSheet;
    UnimScrollBox1: TUnimScrollBox;
    dbGridSolicitacoesCliente: TUnimDBListGrid;
    qrySolicitacao: TFDQuery;
    dsSolicitacoes: TDataSource;
    pgDadosClienteOld: TUnimTabSheet;
    UnimScrollBox2: TUnimScrollBox;
    BtnAtualizarUsuario: TUnimButton;
    UnimTabSheet1: TUnimTabSheet;
    UnimPanel2: TUnimPanel;
    EditSenhaConf: TUnimEdit;
    EditSenha: TUnimEdit;
    labelSenhaConf: TUnimLabel;
    labelSenha: TUnimLabel;
    btnAlterarSenha: TUnimButton;
    UnimScrollBox3: TUnimScrollBox;
    pnlDados: TUnimPanel;
    dbsltMunicipio: TUnimDBSelect;
    edtNome: TUnimDBEdit;
    UnimDBEdit1: TUnimDBEdit;
    UnimDBEdit2: TUnimDBEdit;
    UnimDBEdit3: TUnimDBEdit;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimLabel5: TUnimLabel;
    UnimLabel9: TUnimLabel;
    UnimLabel10: TUnimLabel;
    BtnSalvar: TUnimBitBtn;
    UnimLabel11: TUnimLabel;
    UnimDBSelect2: TUnimDBSelect;
    UnimPanel3: TUnimPanel;
    LabelConjugeNome: TUnimLabel;
    UnimDBEdit4: TUnimDBEdit;
    LabelConjugeCPF: TUnimLabel;
    UnimDBEdit5: TUnimDBEdit;
    UnimPanel4: TUnimPanel;
    UnimDBSelect1: TUnimDBSelect;
    UnimDBEdit6: TUnimDBEdit;
    UnimDBEdit7: TUnimDBEdit;
    UnimDBEdit8: TUnimDBEdit;
    UnimDBEdit9: TUnimDBEdit;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimLabel6: TUnimLabel;
    UnimLabel7: TUnimLabel;
    UnimLabel12: TUnimLabel;
    UnimBitBtn2: TUnimBitBtn;
    UnimLabel13: TUnimLabel;
    UnimDBSelect3: TUnimDBSelect;
    UnimPanel5: TUnimPanel;
    UnimLabel14: TUnimLabel;
    UnimDBEdit10: TUnimDBEdit;
    UnimLabel15: TUnimLabel;
    UnimDBEdit11: TUnimDBEdit;
    function validarSenha() : boolean;
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure dbGridSolicitacoesClienteDblClick(Sender: TObject);
    procedure BtnAtualizarDadosClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnAtualizarUsuarioClick(Sender: TObject);
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

procedure TfrmDadosUsuario.BtnAtualizarDadosClick(Sender: TObject);
begin
//  if validarDados then
//  begin
//    with UniMainModule.dsCliente.DataSet do
//    begin
//      Edit;
//      FieldByName('DATATATUALIZACAO').AsCurrency;
//      Post;
//    end;
//    ShowMessage('Dados do cliente foram alterados');
//  end;
  ShowMessage('Tentando entender que bot?o ? esse');
end;

procedure TfrmDadosUsuario.BtnAtualizarUsuarioClick(Sender: TObject);
begin
  //Atualizar os dados do usu?rio
  //validar dados
  with UniMainModule.dsUsuario.DataSet do
  begin
    Edit;
    FieldByName('NOME').Value := EditNome.Text;
    FieldByName('CPF').Value := EditCPF.Text;
    FieldByName('DATATATUALIZACAO').AsCurrency;
    Post;
  end;
  ShowMessage('Dados do usu?rio foram atualizados com sucesso.');
end;

procedure TfrmDadosUsuario.BtnSalvarClick(Sender: TObject);
begin
  //Atualizar os dados do cliente
  //Validar dados
  UniMainModule.dsUsuario.DataSet.Post;
  UniMainModule.dsCliente.DataSet.Post;

  ShowMessage('Dados alterados com sucesso');

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

end;

procedure TfrmDadosUsuario.pgMainChange(Sender: TObject);
begin
  if pgMain.ActivePage = pgSolicitacoes then
  begin
//    with dsSolicitacoes.DataSet do
//    begin
//      Filtered := False;
//      Filter := 'CLIENTE = ' + QuotedStr(UniMainModule.dsCliente.DataSet.FieldByName('ID').Value);
//      Filtered := True;
//    end;
  end;

end;

procedure TfrmDadosUsuario.UnimBitBtn1Click(Sender: TObject);
begin
  UniMainModule.dsUsuario.DataSet.Filtered := False;
  UniMainModule.dsCliente.DataSet.Filtered := False;
  Close;
end;

procedure TfrmDadosUsuario.UnimFormShow(Sender: TObject);
begin
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

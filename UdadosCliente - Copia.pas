unit UdadosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Imaging.pngimage, uniImage, unimImage,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  unimBitBtn, uniBasicGrid, uniDBGrid, unimDBListGrid, uniLabel, unimLabel,
  uniEdit, uniDBEdit, unimDBEdit, uniMultiItem, unimSelect, unimDBSelect,
  unimPanel, unimScrollBox, uniPanel, uniPageControl, unimTabPanel,
  uniGUIBaseClasses, unimButton, unimEdit;

type
  TfrmDadosCliente = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgInicio: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    pnlGeral: TUnimPanel;
    pnlDados: TUnimPanel;
    dbsltMunicipio: TUnimDBSelect;
    edtNome: TUnimDBEdit;
    UnimDBEdit1: TUnimDBEdit;
    UnimDBEdit2: TUnimDBEdit;
    UnimDBEdit3: TUnimDBEdit;
    UnimDBSelect1: TUnimDBSelect;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimLabel6: TUnimLabel;
    UnimLabel7: TUnimLabel;
    pnlEstCivil: TUnimPanel;
    UnimLabel5: TUnimLabel;
    UnimDBSelect2: TUnimDBSelect;
    UnimLabel9: TUnimLabel;
    UnimDBEdit4: TUnimDBEdit;
    UnimLabel10: TUnimLabel;
    UnimDBEdit5: TUnimDBEdit;
    pnlGrupo: TUnimPanel;
    UnimLabel11: TUnimLabel;
    UnimDBEdit6: TUnimDBEdit;
    UnimDBListGrid1: TUnimDBListGrid;
    UnimPanel2: TUnimPanel;
    UnimDBSelect3: TUnimDBSelect;
    UnimBitBtn2: TUnimBitBtn;
    qryGrupo: TFDQuery;
    umpFooter: TUnimPanel;
    UnimImage1: TUnimImage;
    UnimLabel8: TUnimLabel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    LabelUsuario: TUnimLabel;
    DsGrupo: TDataSource;
    UnimDBEdit7: TUnimDBEdit;
    pgAvalista: TUnimTabSheet;
    PanelAvalista: TUnimPanel;
    LabelAvalistaCPF: TUnimLabel;
    LabelAvalista: TUnimLabel;
    LabelNomeAvalista: TUnimLabel;
    LabelEstadoCivilAvalista: TUnimLabel;
    LabelTelefoneAvalista: TUnimLabel;
    LabelEmailAvalista: TUnimLabel;
    PanelConjugeAvalista: TUnimPanel;
    LabelNomeAvalistaConjuge: TUnimLabel;
    EditNomeAvalistaConjuge: TUnimEdit;
    LabelCpfAvalistaConjuge: TUnimLabel;
    EditCpfAvalistaConjuge: TUnimEdit;
    LabelAvalistaConjuge: TUnimLabel;
    EditAvalistaCPF: TUnimEdit;
    EditTelefoneAvalista: TUnimEdit;
    SelectAvalistaClienteAGN: TUnimDBSelect;
    LabelAvalistaAGN: TUnimLabel;
    btnAtualizarAvalista: TUnimButton;
    EditAvalistaNome: TUnimDBEdit;
    EditEmailAvalista: TUnimDBEdit;
    SelectEstadoCivilAvalista: TUnimDBSelect;
    UnimScrollBox1: TUnimScrollBox;
    UnimLabel12: TUnimLabel;
    pgSolicitacao: TUnimTabSheet;
    SelectEtapaProcesso: TUnimSelect;
    UnimLabel13: TUnimLabel;
    ButtonSolicitacao: TUnimButton;
    UnimLabel14: TUnimLabel;
    SelectLinhaDeCredito: TUnimSelect;
    procedure UnimFormShow(Sender: TObject);
    procedure UnimBitBtn2Click(Sender: TObject);
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimDBSelect2Change(Sender: TObject);
    procedure UnimDBEdit4Change(Sender: TObject);
    procedure UnimDBEdit5Change(Sender: TObject);
    procedure BtnAtualizarAvalistaClick(Sender: TObject);
    procedure SelectEstadoCivilAvalistaChange(Sender: TObject);
    procedure EditAvalistaNomeChange(Sender: TObject);
    procedure EditAvalistaCPFChange(Sender: TObject);
    procedure EditTelefoneAvalistaChange(Sender: TObject);
    procedure EditEmailAvalistaChange(Sender: TObject);
    procedure SelectAvalistaClienteAGNChange(Sender: TObject);
    procedure EditNomeAvalistaConjugeChange(Sender: TObject);
    procedure EditCpfAvalistaConjugeChange(Sender: TObject);
    procedure ButtonSolicitacaoClick(Sender: TObject);
  private
    { Private declarations }
    function validarDados() : boolean;
    function validarDadosAvalista() : boolean;
    function etapaExiste(etapa, solicitacao: Integer) : boolean;
    procedure checarTipoFinanciamento();
    procedure carregarDadosAvalista();
    procedure checarEstadoCivil();
    procedure checarEstadoCivilAvalista();
    procedure atualizarSolicitacao(etapa : Integer);

    procedure atualizarEtapa(etapa, solicitacao: Integer);

  public
    { Public declarations }
    const
      casado : string = 'CASADO(A)';
  end;

function frmDadosCliente: TfrmDadosCliente;
procedure adicionarEtapa(etapa, solicitacao: Integer);
//procedure atualizarEtapa(etapa, solicitacao: Integer);

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, Uadmin, Uusuarios;

function frmDadosCliente: TfrmDadosCliente;
begin
  Result := TfrmDadosCliente(UniMainModule.GetFormInstance(TfrmDadosCliente));
end;

procedure adicionarEtapa(etapa, solicitacao: Integer);
var
  data : string;
begin
  data := FormatDateTime('dd/mm/yyyy', Now);
  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Append;
    FieldByName('ID').Value := frmPrincipal.proxID('TB_ACOMPANHAMENTO');
    FieldByName('ETAPA').Value := etapa;
    FieldByName('SOLICITACAO').Value := solicitacao;
    FieldByName('DATA').Value := data;
    Post;
  end;

  UniMainModule.dsViewAcompanhamento.DataSet.Refresh;

end;

procedure TfrmDadosCliente.atualizarEtapa(etapa, solicitacao: Integer);
var
  data : string;
  filtro : string;
  acompanhamento : Integer;
begin
  data := FormatDateTime('dd/mm/yyyy', Now);

  filtro := 'ETAPA = ' + IntToStr(etapa) + ' AND SOLICITACAO = ' + IntToStr(solicitacao);
  ShowMessage(filtro);

  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Filtered  := False;
    filter    := filtro;
    Filtered  := True;
  end;

  acompanhamento := UniMainModule.dsAcompanhamento.DataSet.FieldByName('ID').AsInteger;
  ShowMessage('Acompanhamhamento = ' + acompanhamento.ToString);

  with UniMainModule.dsAcompanhamento.DataSet do
  begin
    Edit;
    FieldByName('DATA').Value := data;
    Post;

    Filtered  := False;
  end;

  UniMainModule.dsViewAcompanhamento.DataSet.Refresh;

end;

function TfrmDadosCliente.validarDados() : boolean;
var controle : boolean;
begin
  controle := True;

  if UnimDBSelect2.Text = casado then
  begin
    if UnimDBEdit4.Text = '' then
    begin
      ShowMessage('O nome da(o) cônjuge do cliente não foi preenchido.');
      UnimDBEdit4.Color := clRed;
      controle := False;
    end;
    if frmPrincipal.ValidarCPF(UnimDBEdit5.Text) = False then
    begin
      ShowMessage('Cpf do(a) cônjuge não é válido.');
      UnimDBEdit5.Color := clRed;
      controle := False;
    end;
  end;

  if controle then result := True else result := False;

end;

function TfrmDadosCliente.validarDadosAvalista() : boolean;
var controle : boolean;
begin
  controle := True;

  if EditAvalistaNome.Text = '' then
  begin
    EditAvalistaNome.Color := clRed;
    controle := False;
  end;

  if (Length(EditTelefoneAvalista.Text) < 8) or (Length(EditTelefoneAvalista.Text) > 12) then // or (Length(EditTelefone.Text) > 12)
  begin
    EditTelefoneAvalista.Color := clRed;
    controle := False;
  end;

  if not frmPrincipal.ValidarCPF(EditAvalistaCPF.Text) then
  begin
    ShowMessage('CPF inválido');
    EditAvalistaCPF.Color := clRed;
    controle := false;
  end;

  if Pos('@', EditEmailAvalista.Text) = 0 then //email cliente
  begin
    EditEmailAvalista.Color := clRed;
    controle := False;
  end;

  if (SelectAvalistaClienteAGN.ItemIndex <> 0) and
     (SelectAvalistaClienteAGN.ItemIndex <> 1)  then
  begin
    SelectAvalistaClienteAGN.Color := clRed;
  end;


  if (SelectEstadoCivilAvalista.ItemIndex < 0) or
     (SelectEstadoCivilAvalista.ItemIndex > 4)then
  begin
    SelectEstadoCivilAvalista.Color := clRed;
    controle := False;
  end;

  if UnimDBSelect2.Text = casado then
  begin
    if UnimDBEdit4.Text = '' then
    begin
      ShowMessage('O nome da(o) cônjuge do cliente não foi preenchido.');
      UnimDBEdit4.Color := clRed;
      controle := False;
    end;
    if frmPrincipal.ValidarCPF(UnimDBEdit5.Text) = False then
    begin
      ShowMessage('Cpf do(a) cônjuge não é válido.');
      UnimDBEdit5.Color := clRed;
      controle := False;
    end;
  end;

  if controle then result := True else result := False;

end;

procedure TfrmDadosCliente.atualizarSolicitacao(etapa : Integer);
begin
  with UniMainModule.dsSolicitacao.DataSet do
  begin
    Edit;
    FieldByName('SITUACAO').Value := etapa;
    Post;
  end;
end;

procedure TfrmDadosCliente.BtnAtualizarAvalistaClick(Sender: TObject);
var
  dataAtual : string;
begin
  dataAtual := FormatDateTime('dd/mm/yyyy', Now);
//  Atualizar dados avalista

  if validarDadosAvalista() then
  begin

    if SelectEstadoCivilAvalista.ItemIndex = 0 then
    begin
      EditNomeAvalistaConjuge.Text := '';
      EditCpfAvalistaConjuge.Text := '';
    end;

    with UniMainModule.dsAvalista.DataSet do
    begin
      Edit;
      FieldByName('CPF').Value              := EditAvalistaCPF.Text;
      FieldByName('TELEFONE').Value         := EditTelefoneAvalista.text;
      FieldByName('NOMECONJUGE').Value      := EditNomeAvalistaConjuge.Text;
      FieldByName('CPFCONJUGE').Value       := EditCpfAvalistaConjuge.Text;
      FieldByName('DATAATUALIZACAO').Value  := dataAtual;
      Post;
    end;

    ShowMessage('Dados do avalista atualizados com sucesso!');
  end;

  carregarDadosAvalista();

end;

procedure TfrmDadosCliente.checarEstadoCivil();
begin
  if UnimDBSelect2.Text = casado then
  begin
    UnimDBEdit4.ReadOnly := False;
    UnimDBEdit5.ReadOnly := False;
    pnlEstCivil.Height := 262;
  end
  else
  begin
    UnimDBEdit4.ReadOnly := True;
    UnimDBEdit5.ReadOnly := True;
    pnlEstCivil.Height := 88;
  end;
end;

procedure TfrmDadosCliente.UnimBitBtn1Click(Sender: TObject);
begin
  if (UniMainModule.tb_solicitacao.State in [dsInsert, dsEdit]) then
  begin
    UniMainModule.dsSolicitacao.DataSet.Cancel;
  end;

  if (UniMainModule.tb_cliente.State in [dsInsert, dsEdit]) then
  begin
    UniMainModule.dsCliente.DataSet.Cancel;
  end;

  UniMainModule.dsSolicitacao.DataSet.Filtered := False;
  UniMainModule.dsAcompanhamento.DataSet.Filtered := False;

  Close;
end;

procedure TfrmDadosCliente.UnimBitBtn2Click(Sender: TObject);
begin
  if validarDados then
  begin
    if MessageDlg('Tem certeza que deseja confirmar as alterações realizadas?', mtConfirmation,
    [mbYes, mbNo]) = mrYes then
    begin
      UniMainModule.dsCliente.DataSet.Edit;
      UniMainModule.dsSolicitacao.DataSet.Edit;

      UniMainModule.dsCliente.DataSet.Post;
      UniMainModule.dsSolicitacao.DataSet.Post;

      ShowMessage('Dados salvos com sucesso.');

      Close;
    end;
  end
  else
  begin
    ShowMessage('Erro ao validar dados.');
  end;

end;

procedure TfrmDadosCliente.UnimDBEdit4Change(Sender: TObject);
begin
  UnimDBEdit4.Color := clWindow;
end;

procedure TfrmDadosCliente.UnimDBEdit5Change(Sender: TObject);
begin
  UnimDBEdit5.Color := clWindow;
end;

procedure TfrmDadosCliente.UnimDBSelect2Change(Sender: TObject);
begin
  checarEstadoCivil();
end;

procedure TfrmDadosCliente.checarTipoFinanciamento();
var tipoFinanciamento : string;
begin
  tipoFinanciamento :=
  UniMainModule.dsSolicitacao.DataSet.FieldByName('TIPOFINANCIAMENTO').Value;

  if tipoFinanciamento = 'INDIVIDUAL' then
  begin
    pgAvalista.Visible := True;
    carregarDadosAvalista();
  end
  else
  begin
    pgAvalista.Visible := False;
  end;
end;

procedure TfrmDadosCliente.EditAvalistaCPFChange(Sender: TObject);
begin
  EditAvalistaCPF.Color := clWindow;
end;

procedure TfrmDadosCliente.EditAvalistaNomeChange(Sender: TObject);
begin
  EditAvalistaNome.Color := clWindow;
end;

procedure TfrmDadosCliente.EditCpfAvalistaConjugeChange(Sender: TObject);
begin
  EditCpfAvalistaConjuge.Color := clWindow;
end;

procedure TfrmDadosCliente.EditEmailAvalistaChange(Sender: TObject);
begin
  EditEmailAvalista.Color := clWindow;
end;

procedure TfrmDadosCliente.EditNomeAvalistaConjugeChange(Sender: TObject);
begin
  EditNomeAvalistaConjuge.Color := clWindow;
end;

procedure TfrmDadosCliente.EditTelefoneAvalistaChange(Sender: TObject);
begin
  EditTelefoneAvalista.Color := clWindow;
end;

function TfrmDadosCliente.etapaExiste(etapa, solicitacao : Integer): boolean;
var
  count : Integer;
begin
  with UniMainModule.FDQuery do
  begin
  SQL.Clear;
    SQL.Add('SELECT count(*) FROM view_acompanhamento ' +
            'WHERE solicitacao = ' + solicitacao.ToString +
            ' and id_etapa = ' + etapa.ToString + ';'
            );
    Open();

    count := FieldByName('COUNT').ASInteger;

    Close;
  end;

  if count = 1 then result := True else result := False;

end;

procedure TfrmDadosCliente.ButtonSolicitacaoClick(Sender: TObject);
var
  etapa : Integer;
  solicitacao : Integer;
begin
  etapa := SelectEtapaProcesso.ItemIndex + 1;
  solicitacao := UniMainModule.dsSolicitacao.DataSet.FieldByName('ID').value;

  if etapaExiste(etapa, solicitacao) then
  begin
    ShowMessage('Atualizando Etapa');
    atualizarEtapa(etapa, solicitacao);
    atualizarSolicitacao(etapa);
  end
  else
  begin
    ShowMessage('Cadastrando nova etapa');
    adicionarEtapa(etapa, solicitacao);
    atualizarSolicitacao(etapa);
  end;

  ShowMessage('Etapa da solicitação foi alterada com sucesso!');
end;

procedure TfrmDadosCliente.carregarDadosAvalista();
begin
  with UniMainModule.dsAvalista.DataSet do
  begin
    Filtered := False;
    Filter := 'ID = ' + IntToStr(UniMainModule.dsSolicitacao.DataSet.FieldByName('AVALISTA').value);
    Filtered := True;
  end;

  EditAvalistaCPF.Text := UniMainModule.dsAvalista.DataSet.FieldByName('CPF').Value;
  EditTelefoneAvalista.Text := UniMainModule.dsAvalista.DataSet.FieldByName('TELEFONE').value;

  if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
  begin
    EditNomeAvalistaConjuge.Text := UniMainModule.dsAvalista.DataSet.FieldByName('NOMECONJUGE').Value;
    EditCpfAvalistaConjuge.Text := UniMainModule.dsAvalista.DataSet.FieldByName('CPFCONJUGE').value;
  end;

  checarEstadoCivilAvalista();

end;

procedure TfrmDadosCliente.checarEstadoCivilAvalista();
begin
  if SelectEstadoCivilAvalista.Text = 'CASADO(A)' then
  begin
    PanelAvalista.Height := 710;
    PanelConjugeAvalista.Height := 190;
    PanelConjugeAvalista.Visible := True;
  end
  else
  begin
    PanelAvalista.Height := 510;
    PanelConjugeAvalista.Height := 0;
    PanelConjugeAvalista.Visible := False;
  end;
end;

procedure TfrmDadosCliente.SelectAvalistaClienteAGNChange(Sender: TObject);
begin
  SelectAvalistaClienteAGN.Color := clWindow;
end;

procedure TfrmDadosCliente.SelectEstadoCivilAvalistaChange(Sender: TObject);
begin
  SelectEstadoCivilAvalista.Color := clWindow;

  checarEstadoCivilAvalista();

end;

procedure TfrmDadosCliente.UnimFormShow(Sender: TObject);
var
  grupo : string;
begin

  checarTipoFinanciamento();
  checarEstadoCivil();

  if UniMainModule.dsUsuario.DataSet.FieldByName('PERFIL').Value = 4 then
  begin
    LabelUsuario.Caption := 'Bem vindo(a), ' + Uusuarios.nomeUsuario + '.';
  end
  else
  begin
    LabelUsuario.Caption := 'Bem vindo(a), ' +
      UniMainModule.dsUsuario.DataSet.FieldByName('NOME').Value + '.';
  end;

  grupo := UniMainModule.dsSolicitacao.DataSet.FieldByName('GRUPO').Text;

  SelectLinhaDeCredito.ItemIndex := UniMainModule.dsSolicitacao.DataSet.FieldByName('LINHACREDITO').AsInteger;

  with DsGrupo.DataSet do
  begin
    Filtered := False;
    Filter := 'GRUPO = ' + QuotedStr(grupo);
    Filtered := True;
  end;


  SelectEtapaProcesso.ItemIndex := UniMainModule.dsSolicitacao.DataSet.FieldByName('SITUACAO').Value - 1;

end;

end.

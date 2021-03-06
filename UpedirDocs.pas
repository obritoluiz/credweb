unit UpedirDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  unimScrollBox, uniLabel, unimLabel, uniButton, uniBitBtn, unimBitBtn,
  Vcl.Imaging.pngimage, uniImage, unimImage, uniGUIBaseClasses, unimPanel,
  uniCheckBox, unimCheckBox, unimButton, uniBasicGrid, uniDBGrid,
  unimDBListGrid, uniPanel, uniPageControl, unimTabPanel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMemo, unimMemo,
  uniEdit, unimEdit;

type
  TfrmPedirDocs = class(TUnimForm)
    scrlBody: TUnimScrollBox;
    umpDocumentos: TUnimPanel;
    umlDocumentos: TUnimLabel;
    btnFechar: TUnimButton;
    pgPrincipal: TUnimTabPanel;
    pgDocumentos: TUnimTabSheet;
    pgIndeferir: TUnimTabSheet;
    pnlDocumentos: TUnimPanel;
    grdDocs1: TUnimDBListGrid;
    grdDocs2: TUnimDBListGrid;
    UnimLabel1: TUnimLabel;
    qrySilicitarDocs: TFDQuery;
    dsSolicitarDocs: TDataSource;
    pgSolicitar: TUnimTabSheet;
    UnimPanel3: TUnimPanel;
    grdDocs3: TUnimDBListGrid;
    pnlMotivo: TUnimPanel;
    UnimLabel3: TUnimLabel;
    btnVoltar: TUnimButton;
    UnimLabel2: TUnimLabel;
    qryIndeferirDocs: TFDQuery;
    dsIndeferirDocs: TDataSource;
    edtMotivo: TUnimMemo;
    UnimContainerPanel1: TUnimContainerPanel;
    btnIndApr: TUnimButton;
    btnSalvar: TUnimButton;
    procedure popularTabela();
    procedure UnimFormShow(Sender: TObject);
    procedure grdDocs1DblClick(Sender: TObject);
    procedure grdDocs2DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure filtrarDocs();
    procedure grdDocs3DblClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnIndAprClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      id : integer;
      sit : string;

  end;

function frmPedirDocs: TfrmPedirDocs;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UdadosCliente, UdadosUsuario, UpreCad, Usejuv, Usolicitacao,
  Uusuarios;

function frmPedirDocs: TfrmPedirDocs;
begin
  Result := TfrmPedirDocs(UniMainModule.GetFormInstance(TfrmPedirDocs));
end;

procedure TfrmPedirDocs.filtrarDocs();
begin
  //Filtra apenas os documentos do cliente logado
  with dsSolicitarDocs.DataSet do
  begin
    Filtered := False;
    Filter   := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente);
    Filtered := True;
  end;

  //Filtra apenas os documentos do cliente logado para indeferimento
  with dsIndeferirDocs.DataSet do
  begin
    Filtered  := False;
    Filter    := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente);
    Filtered  := True;
  end;

  //Filtra apenas os documentos do cliente logado e que forem marcados para solicitar
  with UniMainModule.dsDocumentos.DataSet do
  begin
    Filtered  := False;
    Filter    := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente) + ' AND SOLICITAR = ' + QuotedStr('SIM');
    Filtered  := True;
  end;
end;

procedure TfrmPedirDocs.popularTabela();
var
  TabelaPopulada: Boolean;
begin

  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT count(*) as qtd FROM tb_documentos where id_cliente = ');
    SQL.Add(IntToStr(UniMainModule.dsCliente.DataSet.FieldByName('ID').Value));
    Open;

    if FieldByName('qtd').Value > 0 then TabelaPopulada := True else TabelaPopulada := False;
  end;

  if not TabelaPopulada then
  begin
    with UniMainModule.dsDocumentos.DataSet do
    begin
      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'RG';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CRMN (EXTRANGEIRO)';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CPF';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CERT. EST. CIVIL';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'COMP. REDID?NCIA';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'FOTO EMPREENDIMENTO';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CART?O CNPJ';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CERTIFICADO EMPRESA';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'CERTID?O NEGATIVA CNPJ';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'FICHA PR?-CADASTRO';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'FICHA AVALISTA';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;

      Append;
      FieldByName('ID').Value             := frmPrincipal.proxID('tb_documentos');
      FieldByName('ID_CLIENTE').Value     := frmPrincipal.IDcliente;
      FieldByName('DESCRICAO').Value      := 'ANEXAR DOCUMENTOS';
      FieldByName('SITUACAO').Value       := 'PENDENTE';
      FieldByName('SOLICITAR').Value      := 'N?O';
      Post;
    end;
  end;

end;

procedure TfrmPedirDocs.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedirDocs.grdDocs1DblClick(Sender: TObject);
var
  arquivo: ansiString;
begin
  //Pega o caminho do arquivo no bando de dados
  arquivo := UniMainModule.dsDocumentos.DataSet.FieldByName('CAMINHO_DOC').AsString;

  //Faz o download do arquivo
  if arquivo <> '' then UniSession.SendFile(arquivo);
end;

procedure TfrmPedirDocs.grdDocs2DblClick(Sender: TObject);
var
  id : integer;
  solicitar : string;
begin
  if dsSolicitarDocs.DataSet.FieldByName('SOLICITAR').Value = null then
    solicitar := 'N?O'
  else
    solicitar := dsSolicitarDocs.DataSet.FieldByName('SOLICITAR').Value;

  id  := dsSolicitarDocs.DataSet.FieldByName('ID').Value;
  //ShowMessage(IntToStr(id));

  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tb_documentos set SOLICITAR = ');
    if solicitar = 'N?O' then  SQL.Add(QuotedStr('SIM')) else SQL.Add(QuotedStr('N?O'));
    SQL.Add(' WHERE ID = ' + IntToStr(id));
    //ShowMessage(SQL.Text);
    ExecSQL;
  end;

  filtrarDocs();

  qrySilicitarDocs.Refresh;
  qryIndeferirDocs.Refresh;
  grdDocs1.Refresh;
  grdDocs2.Refresh;
  grdDocs3.Refresh;

end;

procedure TfrmPedirDocs.grdDocs3DblClick(Sender: TObject);
begin
  id  := dsIndeferirDocs.DataSet.FieldByName('ID').Value;
  sit := dsIndeferirDocs.DataSet.FieldByName('SITUACAO').Value;

  pnlMotivo.Visible := True;

  if sit = 'INDEFERIDO' then
  begin
    btnIndApr.Caption := 'APROVAR';
    btnSalvar.Visible := True;
    edtMotivo.Text    := dsIndeferirDocs.DataSet.FieldByName('OBS').Value;
  end
  else
  begin
    btnSalvar.Visible := False;
    btnIndApr.Caption := 'INDEFERIR';
  end;
end;

procedure TfrmPedirDocs.btnIndAprClick(Sender: TObject);
begin
  if sit = 'INDEFERIDO' then
  begin
    with UniMainModule.FDQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update tb_documentos set SITUACAO = ' + QuotedStr('ENVIADO') + ', OBS = ' + QuotedStr(''));
      SQL.Add(' WHERE ID = ' + IntToStr(id));
      ExecSQL;
    end;
  end
  else
  begin
    with UniMainModule.FDQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update tb_documentos set SITUACAO = ' + QuotedStr('INDEFERIDO') + ', OBS = ' + QuotedStr(edtMotivo.Text));
      SQL.Add(' WHERE ID = ' + IntToStr(id));
      ExecSQL;
    end;
  end;

  filtrarDocs();

  qrySilicitarDocs.Refresh;
  qryIndeferirDocs.Refresh;
  grdDocs1.Refresh;
  grdDocs2.Refresh;
  grdDocs3.Refresh;

  pnlMotivo.Visible := False;
end;

procedure TfrmPedirDocs.btnVoltarClick(Sender: TObject);
begin
  pnlMotivo.Visible := False;
end;

procedure TfrmPedirDocs.btnSalvarClick(Sender: TObject);
begin
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tb_documentos set SITUACAO = ' + QuotedStr('INDEFERIDO') + ', OBS = ' + QuotedStr(edtMotivo.Text));
    SQL.Add(' WHERE ID = ' + IntToStr(id));
    ExecSQL;
  end;

  filtrarDocs();

  qrySilicitarDocs.Refresh;
  qryIndeferirDocs.Refresh;
  grdDocs1.Refresh;
  grdDocs2.Refresh;
  grdDocs3.Refresh;

  pnlMotivo.Visible := False;
end;

procedure TfrmPedirDocs.UnimFormShow(Sender: TObject);
begin
  //Popular tabela com todos os documentos a solicitar caso n?o esteja populada
  popularTabela();

  //Ativar consultas de documentos
  qrySilicitarDocs.Active;
  qrySilicitarDocs.Open();
  qryIndeferirDocs.Active;
  qryIndeferirDocs.Open();

  filtrarDocs();
end;

end.

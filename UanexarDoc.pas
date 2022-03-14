unit UanexarDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniFileUpload, uniEdit, uniLabel, uniGUIBaseClasses, unimScrollBox, uniPanel,
  uniPageControl, unimTabPanel, unimLabel, uniButton, uniBitBtn, unimBitBtn,
  Vcl.Imaging.pngimage, uniImage, unimImage, unimPanel, unimFileUpload,
  unimButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, unimDBListGrid, DateUtils, StrUtils,
  uniMemo, unimMemo ;

type
  TfrmAnexarDoc = class(TUnimForm)
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    umpNaveg: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    pgMain: TUnimTabPanel;
    pgDocumentos: TUnimTabSheet;
    UnimScrollBox1: TUnimScrollBox;
    UnimFileUpload1: TUnimFileUpload;
    UnimLabel1: TUnimLabel;
    grdDocs: TUnimDBListGrid;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    lblDescricao: TUnimLabel;
    lblTitulo: TUnimLabel;
    lblFichaPreCad: TUnimLabel;
    lblFichaAvalista: TUnimLabel;
    lblTituloLista: TUnimLabel;
    UnimLabel3: TUnimLabel;
    UnimContainerPanel1: TUnimContainerPanel;
    ctnDadosImportantes: TUnimContainerPanel;
    ctnFormsDownload: TUnimContainerPanel;
    ctnListaDocs: TUnimContainerPanel;
    UnimLabel4: TUnimLabel;
    UnimLabel5: TUnimLabel;
    UnimLabel6: TUnimLabel;
    UnimLabel7: TUnimLabel;
    ctnDocsEmpresa: TUnimContainerPanel;
    UnimLabel8: TUnimLabel;
    UnimLabel9: TUnimLabel;
    UnimLabel10: TUnimLabel;
    UnimLabel11: TUnimLabel;
    UnimPanel1: TUnimPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimLabel12: TUnimLabel;
    ctnDocsAvalista: TUnimContainerPanel;
    UnimLabel17: TUnimLabel;
    UnimLabel13: TUnimLabel;
    UnimLabel2: TUnimLabel;
    UnimLabel14: TUnimLabel;
    UnimLabel15: TUnimLabel;
    UnimLabel16: TUnimLabel;
    UnimLabel18: TUnimLabel;
    UnimLabel19: TUnimLabel;
    UnimLabel20: TUnimLabel;
    procedure UnimFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure anexar ();
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure grdDocsDblClick(Sender: TObject);
    procedure filtrarDocs();
    procedure verificaDocUnico();
    procedure lblFichaPreCadClick(Sender: TObject);
    procedure lblFichaAvalistaClick(Sender: TObject);
    procedure UnimLabel11Click(Sender: TObject);
  private
    caminhoDoc : string;
    { Private declarations }
  public

    { Public declarations }
  end;

function frmAnexarDoc: TfrmAnexarDoc;

implementation

{$R *.dfm}

uses
  uniGUIUtils, jpeg, MainModule, uniGUIApplication, ServerModule, Mainm, Uacomp,
  Uadmin, UdadosCliente, UdadosUsuario, UpreCad, Usejuv, Usolicitacao,
  Uusuarios;

function frmAnexarDoc: TfrmAnexarDoc;
begin
  Result := TfrmAnexarDoc(UniMainModule.GetFormInstance(TfrmAnexarDoc));
end;

procedure TfrmAnexarDoc.anexar ();
begin
  UnimFileUpload1.Execute;
end;

procedure TfrmAnexarDoc.UnimBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnexarDoc.grdDocsDblClick(Sender: TObject);
var id: integer;
begin
  anexar();

  //Salva caminho do arquivo (no servidor) no banco de dados
  id := UniMainModule.dsDocumentos.DataSet.FieldByName('ID').Value;
  if caminhoDoc <> '' then
  begin

    with UniMainModule.FDQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update tb_documentos set SITUACAO = ' + QuotedStr('ENVIADO'));
      SQL.Add(', CAMINHO_DOC = ' + QuotedStr(caminhoDoc));
      SQL.Add(', OBS = ' + QuotedStr(''));
      SQL.Add(', DATACADASTRO = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Now)));
      SQL.Add(' WHERE ID = ' + IntToStr(id));
      ExecSQL;
    end;
  end;

  grdDocs.Refresh;
  UniMainModule.conectar();

  ShowMessage('Documento enviado com sucesso.');
end;

procedure TfrmAnexarDoc.lblFichaAvalistaClick(Sender: TObject);
begin
  UniSession.SendFile(UniServerModule.StartPath + 'arquivos\Fichas\2. FICHA DE CADASTRO.docx');
end;

procedure TfrmAnexarDoc.lblFichaPreCadClick(Sender: TObject);
begin
  UniSession.SendFile(UniServerModule.StartPath + 'arquivos\Fichas\3. AVALISTA.docx');
end;

procedure TfrmAnexarDoc.UnimFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  DestNome  : string;
  DestPasta : string;
begin

  DestPasta           := UniServerModule.StartPath + 'arquivos\';


  DestNome            := DestPasta
                          + IntToStr(UniMainModule.dsDocumentos.DataSet.FieldByName('ID').Value) + '-'
                          + UniMainModule.dsCliente.DataSet.FieldByName('CPF').Value
                          + '#' + FormatDateTime('dd_mm_yyyy-hh_MM_ss', Now) + '-'
                          + '#' + RightStr(ExtractFileName(UnimFileUpload1.FileName), 5);

  //Copia aruivo para o servidor
  CopyFile(PChar(AStream.FileName), PChar(DestNome), False);
  caminhoDoc := DestNome;
end;

procedure TfrmAnexarDoc.filtrarDocs;
begin
  //Filtra apenas os documentos do cliente logado
  with UniMainModule.dsDocumentos.DataSet do
  begin
    Filtered  := False;
    Filter    := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente) + ' AND SOLICITAR = ' + QuotedStr('SIM');
    Filtered  := True;
  end;

end;

procedure TfrmAnexarDoc.verificaDocUnico();
var
  qtde : integer;
  desc, tipoNeg, tipoFin : string;
begin
  //Consulta a quantidade de documentos solicitados
  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) as qtde from tb_documentos ');
    SQL.Add('where solicitar = ' + QuotedStr('SIM') + ' and id_cliente = ' + IntToStr(frmPrincipal.IDcliente));
    Open;

    qtde := FieldByName('qtde').Value;
  end;

  //Se a quantidade for 1, verifica se é a opção Anexar Documentos
  if qtde = 1 then
  begin
    with UniMainModule.FDQuery do
    begin
      //Pegar a descrição do documento solicitado ao cliente
      Close;
      SQL.Clear;
      SQL.Add('select descricao from tb_documentos ');
      SQL.Add('where solicitar = ' + QuotedStr('SIM') + ' and id_cliente = ' + IntToStr(frmPrincipal.IDcliente));
      Open;
      desc := FieldByName('descricao').Value;

      //Saber se o cliente é formal ou informal
      Close;
      SQL.Clear;
      SQL.Add('select TIPONEGOCIO from tb_solicitacao ');
      SQL.Add('where cliente = ' + IntToStr(frmPrincipal.IDcliente));
      Open;
      tipoNeg := FieldByName('TIPONEGOCIO').Value;

      //Saber se a solicitação é em grupo ou solidária
      Close;
      SQL.Clear;
      SQL.Add('select TIPOFINANCIAMENTO from tb_solicitacao ');
      SQL.Add('where cliente = ' + IntToStr(frmPrincipal.IDcliente));
      Open;
      tipoFin := FieldByName('TIPOFINANCIAMENTO').Value;
    end;
  end;

  if desc = 'ANEXAR DOCUMENTOS' then
  begin
    lblDescricao.Text := 'É necessário que você anexe todos os seus documentos em um único arquivo.'
                          + ' Para anexar o arquivo dê um clique duplo em ANEXAR DOCUMENTOS logo abaixo.';

    ctnListaDocs.Visible := True;

    if tipoFin = 'INDIVIDUAL' then
    begin
      ctnDocsAvalista.Visible := True;
    end;

    if tipoNeg = 'FORMAL' then
    begin
      ctnDocsEmpresa.Visible := True;
    end;

    if ctnDocsEmpresa.Visible and ctnDocsAvalista.Visible then
      ctnDadosImportantes.Height := 575
    else
      ctnDadosImportantes.Height := 300

  end;
end;

procedure TfrmAnexarDoc.UnimFormShow(Sender: TObject);
begin
  ctnDadosImportantes.Height := 0;
  verificaDocUnico();
  filtrarDocs();

  grdDocs.Hint := UniMainModule.dsDocumentos.DataSet.FieldByName('OBS').Value;
end;

procedure TfrmAnexarDoc.UnimLabel11Click(Sender: TObject);
begin
  UniSession.AddJS('window.open("https://servicos.receita.fazenda.gov.br/servicos/certidao/CndConjuntaIinter/InformaNICertidao.asp?Tipo=1")');
end;

end.

unit UdocsReprovados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  Vcl.Imaging.pngimage, uniImage, unimImage, uniGUIBaseClasses, unimPanel,
  uniBasicGrid, uniDBGrid, unimDBListGrid, uniLabel, unimLabel, uniButton,
  unimButton, uniEdit, unimEdit;

type
  TfrmDocsReprovados = class(TUnimForm)
    UnimPanel3: TUnimPanel;
    UnimLabel15: TUnimLabel;
    grdDocs: TUnimDBListGrid;
    UnimLabel1: TUnimLabel;
    UnimPanel1: TUnimPanel;
    btnFinalizar: TUnimButton;
    pnlMotivo: TUnimPanel;
    UnimLabel2: TUnimLabel;
    edtMotivo: TUnimEdit;
    btnOK: TUnimButton;
    procedure UnimFormShow(Sender: TObject);
    procedure grdDocsDblClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      id: integer;
      sit: string;

  end;

function frmDocsReprovados: TfrmDocsReprovados;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UdadosCliente, UdadosUsuario, Umsg, UpedirDocs, UpreCad,
  UrecuperarSenha, Usejuv, Usolicitacao, Uusuarios;

function frmDocsReprovados: TfrmDocsReprovados;
begin
  Result := TfrmDocsReprovados(UniMainModule.GetFormInstance(TfrmDocsReprovados));
end;

procedure TfrmDocsReprovados.btnFinalizarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDocsReprovados.btnOKClick(Sender: TObject);
begin

  with UniMainModule.FDQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tb_documentos set SITUACAO = ' + QuotedStr('INDEFERIDO') + ', OBS = ' + QuotedStr(edtMotivo.Text));
    SQL.Add(' WHERE ID = ' + IntToStr(id));
    ExecSQL;
  end;

  grdDocs.Refresh;
  pnlMotivo.Visible := False;
end;

procedure TfrmDocsReprovados.grdDocsDblClick(Sender: TObject);
begin
  id  := UniMainModule.dsDocumentos.DataSet.FieldByName('ID').Value;
  sit := UniMainModule.dsDocumentos.DataSet.FieldByName('SITUACAO').Value;

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

    grdDocs.Refresh;
  end
  else
  begin
    pnlMotivo.Visible := True;
  end;

end;

procedure TfrmDocsReprovados.UnimFormShow(Sender: TObject);
begin
  //Filtra apenas os documentos do cliente logado
  with UniMainModule.dsDocumentos.DataSet do
  begin
    Filtered  := False;
    Filter    := 'ID_CLIENTE = ' + IntToStr(frmPrincipal.IDcliente) + 'AND SITUACAO <> ' + QuotedStr('PENDENTE');
    Filtered  := True;
  end;
end;

end.

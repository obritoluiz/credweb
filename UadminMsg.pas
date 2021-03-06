unit UadminMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, unimDBListGrid, unimPanel,
  uniPanel, uniPageControl, unimTabPanel, uniGUIBaseClasses, uniLabel, unimLabel;

type
  TfrmAdminMsg = class(TUnimForm)
    pgPrincipal: TUnimTabPanel;
    pgMensagens: TUnimTabSheet;
    pnlGrd: TUnimPanel;
    grdDocs1: TUnimDBListGrid;
    dsMsg: TDataSource;
    qryMsg: TFDQuery;
    lblClose: TUnimLabel;
    UnimContainerPanel1: TUnimContainerPanel;
    procedure UnimFormShow(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure grdDocs1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmAdminMsg: TfrmAdminMsg;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UcadSucesso, Uchat, UcnpjClienteFormal, UdadosCliente,
  UdadosUsuario, UdocsReprovados, UexportarCsv, UinfImportantes, Umsg,
  UpedirDocs, Upep, UpesquisaInicialReprovada, UpreCad, UrecuperarSenha, Usejuv,
  Usolicitacao, Utermos, Uusuarios;

function frmAdminMsg: TfrmAdminMsg;
begin
  Result := TfrmAdminMsg(UniMainModule.GetFormInstance(TfrmAdminMsg));
end;

procedure TfrmAdminMsg.grdDocs1DblClick(Sender: TObject);
var
  cliente : string;
begin

  cliente := dsMsg.DataSet.FieldByName('ID').AsString;
  frmPrincipal.IDcliente := strToInt(cliente);

  frmAdmin.exibirCliente(cliente);

  frmPrincipal.acessoChat := 'agn';
  frmChat.ShowModal;

  frmAdmin.qryCliente.Refresh;
  qryMsg.Refresh;
end;

procedure TfrmAdminMsg.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdminMsg.UnimFormShow(Sender: TObject);
begin
  qryMsg.Active := True;
end;

end.

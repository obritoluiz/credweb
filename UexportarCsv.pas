unit UexportarCsv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  System.Sensors, System.Sensors.Components, uniButton, unimButton,
  uniGUIBaseClasses, Vcl.Imaging.pngimage, uniImage, unimImage, unimPanel;

type
  TfrmExportarCsv = class(TUnimForm)
    UnimContainerPanel1: TUnimContainerPanel;
    btnDownload: TUnimButton;
    umpHeader: TUnimPanel;
    UnimImage1: TUnimImage;
    imgLogoAGN: TUnimImage;
    btnVoltar: TUnimButton;
    procedure btnDownloadClick(Sender: TObject);
    procedure ExportarCsv();
    procedure btnVoltarClick(Sender: TObject);
    procedure UnimFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmExportarCsv: TfrmExportarCsv;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin,
  UanexarDoc, UcadSucesso, UcnpjClienteFormal, UdadosCliente, UdadosUsuario,
  UdocsReprovados, UinfImportantes, Umsg, UpedirDocs, Upep,
  UpesquisaInicialReprovada, UpreCad, UrecuperarSenha, Usejuv, Usolicitacao,
  Utermos, Uusuarios;

function frmExportarCsv: TfrmExportarCsv;
begin
  Result := TfrmExportarCsv(UniMainModule.GetFormInstance(TfrmExportarCsv));
end;


procedure TfrmExportarCsv.ExportarCsv();
var Arquivo: TextFile;
    caminho: string;
    nX, nY: SmallInt;
    Cabecalho: TStringLIst;
    LinhaDados: String;

begin
  Cabecalho := TStringList.Create;
  //caminho   := UniServerModule.StartPath + 'temp\clientes.csv';

  caminho   := 'c:\clientes'  + FormatDateTime('dd-mm-yyyy-hh-mm-ss', now) + '.csv';
  showmessage(caminho);

  AssignFile(Arquivo, caminho);
  ReWrite(Arquivo);

  Cabecalho := frmAdmin.dsCliente.dataset.FieldList;
  nY := Cabecalho.Count - 1;

  LinhaDados := '';
  For nX := 0 to nY do
  begin
    LinhaDados := LinhaDados + Cabecalho.Strings[nX] + ';';
  end;

  WriteLn(Arquivo, LinhaDados);
  nY := frmAdmin.dsCliente.dataset.FieldCount - 1;

  while not frmAdmin.dsCliente.dataset.Eof do
  begin

    LinhaDados := '';
    For nX := 0 to nY do
    begin
      LinhaDados := LinhaDados + frmAdmin.dsCliente.dataset.FieldByName(Cabecalho.Strings[nX]).AsString + ';';
    end;
    WriteLn(Arquivo, LinhaDados);

    frmAdmin.dsCliente.dataset.Next;
  end;

  Cabecalho.Free;
  CloseFile(Arquivo);

  UniSession.SendFile(caminho);
end;

procedure TfrmExportarCsv.UnimFormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := CaFree;
end;

procedure TfrmExportarCsv.btnDownloadClick(Sender: TObject);
begin
  ExportarCsv();
  Close;
end;

procedure TfrmExportarCsv.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

end.

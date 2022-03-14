unit UclienteDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniEdit, uniDBEdit, unimDBEdit, uniLabel, unimLabel, Vcl.Imaging.pngimage,
  uniImage, unimImage, unimPanel, unimScrollBox, uniPanel, uniPageControl,
  unimTabPanel, uniGUIBaseClasses, uniButton, uniBitBtn, unimBitBtn,
  uniMultiItem, unimSelect, unimDBSelect, uniBasicGrid, uniDBGrid,
  unimDBListGrid, unimDBGrid;

type
  TfrmClienteDados = class(TUnimForm)
    pgMain: TUnimTabPanel;
    pgInicio: TUnimTabSheet;
    scrlBody: TUnimScrollBox;
    umpFooter: TUnimPanel;
    UnimImage1: TUnimImage;
    UnimLabel8: TUnimLabel;
    umpHeader: TUnimPanel;
    imgBgHeader: TUnimImage;
    imgLogoAGN: TUnimImage;
    edtNome: TUnimDBEdit;
    UnimLabel1: TUnimLabel;
    UnimDBEdit1: TUnimDBEdit;
    UnimLabel2: TUnimLabel;
    UnimLabel3: TUnimLabel;
    dbsltMunicipio: TUnimDBSelect;
    UnimPanel1: TUnimPanel;
    UnimBitBtn1: TUnimBitBtn;
    UnimDBSelect1: TUnimDBSelect;
    UnimLabel4: TUnimLabel;
    UnimDBEdit2: TUnimDBEdit;
    UnimLabel6: TUnimLabel;
    UnimDBEdit3: TUnimDBEdit;
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
    pnlDados: TUnimPanel;
    pnlGeral: TUnimPanel;
    UnimPanel2: TUnimPanel;
    UnimDBSelect3: TUnimDBSelect;
    UnimBitBtn2: TUnimBitBtn;
    UnimDBListGrid1: TUnimDBListGrid;
    procedure UnimBitBtn1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmClienteDados: TfrmClienteDados;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Mainm, ServerModule, Uacomp, Uadmin, UpreCad;

function frmClienteDados: TfrmClienteDados;
begin
  Result := TfrmClienteDados(UniMainModule.GetFormInstance(TfrmClienteDados));
end;

procedure TfrmClienteDados.UnimBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmClienteDados.UnimFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UniMainModule.dsCliente.DataSet.Post;
  UniMainModule.dsCliente.DataSet.Filtered := False;
  UniMainModule.dsCliente.DataSet.Filter   := '';
end;

procedure TfrmClienteDados.UnimFormShow(Sender: TObject);
begin
  UniMainModule.dsCliente.DataSet.Edit;
end;

end.

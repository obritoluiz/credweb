unit UinfImportantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniMemo, unimMemo, uniCheckBox, unimCheckBox, uniLabel, unimLabel,
  unimScrollBox, uniButton, unimButton, uniGUIBaseClasses, unimPanel;

type
  TfrmInfImportantes = class(TUnimForm)
    pnlPrincipal: TUnimPanel;
    ctnRodap?: TUnimContainerPanel;
    btnConfirmar: TUnimButton;
    scrlPrincipal: TUnimScrollBox;
    ctnItens: TUnimContainerPanel;
    ctnTitulo: TUnimContainerPanel;
    UnimLabel1: TUnimLabel;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimContainerPanel3: TUnimContainerPanel;
    chk3: TUnimCheckBox;
    lblFichaAvalista: TUnimLabel;
    UnimContainerPanel4: TUnimContainerPanel;
    UnimContainerPanel5: TUnimContainerPanel;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    UnimContainerPanel6: TUnimContainerPanel;
    chk1: TUnimCheckBox;
    UnimContainerPanel7: TUnimContainerPanel;
    UnimContainerPanel8: TUnimContainerPanel;
    UnimLabel2: TUnimLabel;
    UnimContainerPanel9: TUnimContainerPanel;
    chk2: TUnimCheckBox;
    UnimLabel5: TUnimLabel;
    UnimContainerPanel10: TUnimContainerPanel;
    UnimContainerPanel11: TUnimContainerPanel;
    UnimLabel6: TUnimLabel;
    UnimContainerPanel12: TUnimContainerPanel;
    chk6: TUnimCheckBox;
    UnimContainerPanel13: TUnimContainerPanel;
    UnimContainerPanel14: TUnimContainerPanel;
    UnimLabel7: TUnimLabel;
    UnimContainerPanel15: TUnimContainerPanel;
    chk4: TUnimCheckBox;
    UnimContainerPanel16: TUnimContainerPanel;
    UnimContainerPanel17: TUnimContainerPanel;
    UnimLabel8: TUnimLabel;
    UnimContainerPanel18: TUnimContainerPanel;
    chk5: TUnimCheckBox;
    UnimLabel9: TUnimLabel;
    UnimContainerPanel19: TUnimContainerPanel;
    UnimContainerPanel20: TUnimContainerPanel;
    UnimLabel10: TUnimLabel;
    UnimContainerPanel21: TUnimContainerPanel;
    UnimCheckBox1: TUnimCheckBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure UnimLabel9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmInfImportantes: TfrmInfImportantes;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmInfImportantes: TfrmInfImportantes;
begin
  Result := TfrmInfImportantes(UniMainModule.GetFormInstance(TfrmInfImportantes));
end;

procedure TfrmInfImportantes.btnConfirmarClick(Sender: TObject);
begin
  if chk1.Checked and chk2.Checked and chk3.Checked and
     chk4.Checked and chk5.Checked and chk6.Checked then
  begin
    Close;
  end
  else
  begin
    ShowMessage('? necess?rio ler e marcar TODAS as o??es para continuar.');
    Abort;
  end;
end;

procedure TfrmInfImportantes.UnimLabel9Click(Sender: TObject);
begin
  UniSession.AddJS('window.open("http://www.agn.rn.gov.br/")');
end;

end.

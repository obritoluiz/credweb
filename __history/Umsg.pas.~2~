unit Umsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniButton, unimButton, uniLabel, unimLabel;

type
  TfrmMsg = class(TUnimForm)
    btnSim: TUnimButton;
    btnNao: TUnimButton;
    cRodape: TUnimContainerPanel;
    cCorpo: TUnimContainerPanel;
    cTopo: TUnimContainerPanel;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    lblTexto: TUnimLabel;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmMsg: TfrmMsg;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmMsg: TfrmMsg;
begin
  Result := TfrmMsg(UniMainModule.GetFormInstance(TfrmMsg));
end;

procedure TfrmMsg.btnNaoClick(Sender: TObject);
begin
  UniMainModule.returnMsg := False;
  Close;
end;

procedure TfrmMsg.btnSimClick(Sender: TObject);
begin
  UniMainModule.returnMsg := True;
  Close;
end;

procedure TfrmMsg.UnimFormShow(Sender: TObject);
begin
  lblTexto.Caption := UniMainModule.textoMsg;
end;

end.

unit UcadSucesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  unimImage;

type
  TfrmCadSucesso = class(TUnimForm)
    img: TUnimImage;
    ctn1: TUnimContainerPanel;
    btnConcluir: TUnimButton;
    procedure btnConcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCadSucesso: TfrmCadSucesso;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmCadSucesso: TfrmCadSucesso;
begin
  Result := TfrmCadSucesso(UniMainModule.GetFormInstance(TfrmCadSucesso));
end;

procedure TfrmCadSucesso.btnConcluirClick(Sender: TObject);
begin
  Close;
end;

end.

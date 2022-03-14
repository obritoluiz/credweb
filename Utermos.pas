unit Utermos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniMemo, unimMemo;

type
  TfrmTermo = class(TUnimForm)
    mmTermo: TUnimMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmTermo: TfrmTermo;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmTermo: TfrmTermo;
begin
  Result := TfrmTermo(UniMainModule.GetFormInstance(TfrmTermo));
end;

end.

unit Upep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniMemo, unimMemo;

type
  TfrmPep = class(TUnimForm)
    mmTermo: TUnimMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPep: TfrmPep;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmPep: TfrmPep;
begin
  Result := TfrmPep(UniMainModule.GetFormInstance(TfrmPep));
end;

end.

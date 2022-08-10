unit LibClang.Ext.llvm.ADT.APSIntW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.llvm.ADT.APSIntH,
  LibClang.Ext.llvm.ADT.APSIntU,
  LibClang.Ext.llvm.ADT.APIntW;

type

  { TAPSIntW }

  TAPSIntW = object(TAPIntW)
  public
    class function Create(iAPSInt: APSInt; out oAPSInt: TAPSIntW): Boolean; static;
    procedure Dispose;
  public
    function isNegative: Boolean;
    function isNonNegative: Boolean;
    function isStrictlyPositive: Boolean;
    function isSigned: Boolean;
    function isUnsigned: Boolean;
    function toString(Radix: Cardinal = 10): string;
    function getExtValue: Int64;
  end;
  PAPSIntW = ^TAPSIntW;

  { APSIntHelper }

  APSIntHelper = type helper for APSInt
    function Wrap(out a: TAPSIntW): Boolean;
  end;

implementation

{ APSIntHelper }

function APSIntHelper.Wrap(out a: TAPSIntW): Boolean;
begin
  Result := TAPSIntW.Create(Self, a);
end;

{ TAPSIntW }

class function TAPSIntW.Create(iAPSInt: APSInt; out oAPSInt: TAPSIntW): Boolean;
begin
  Result := False;
  oAPSInt := Default(TAPSIntW);
  if not Assigned(iAPSInt) then
    Exit;
  oAPSInt.A := iAPSInt;
  Result := True;
end;

procedure TAPSIntW.Dispose;
begin
  clangExt_APSInt_Dispose(Self.A);
  Self.A := nil;
end;

function TAPSIntW.isNegative: Boolean;
begin
  Result := clangExt_APSInt_isNegative(Self.A);
end;

function TAPSIntW.isNonNegative: Boolean;
begin
  Result := clangExt_APSInt_isNonNegative(Self.A);
end;

function TAPSIntW.isStrictlyPositive: Boolean;
begin
  Result := clangExt_APSInt_isStrictlyPositive(Self.A);
end;

function TAPSIntW.isSigned: Boolean;
begin
  Result := clangExt_APSInt_isSigned(Self.A);
end;

function TAPSIntW.isUnsigned: Boolean;
begin
  Result := clangExt_APSInt_isUnsigned(Self.A);
end;

function TAPSIntW.toString(Radix: Cardinal): string;
begin
  Result := clangExt_APSInt_toString(Self.A, Radix).ToString;
end;

function TAPSIntW.getExtValue: Int64;
begin
  Result := clangExt_APSInt_getExtValue(Self.A);
end;

end.

